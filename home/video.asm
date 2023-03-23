; Functions dealing with VRAM.

DMATransfer::
; Return carry if the transfer is completed.

	ldh a, [hDMATransfer]
	and a
	ret z

; Start transfer
	ldh [rHDMA5], a

; Execution is halted until the transfer is complete.

	xor a
	ldh [hDMATransfer], a
	scf
	ret

UpdateBGMapBuffer::
; Copy [hBGMapTileCount] 16x8 tiles from wBGMapBuffer
; to bg map addresses in wBGMapBufferPtrs.

; [hBGMapTileCount] must be even since this is done in pairs.

; Return carry on success.

	ldh a, [hBGMapUpdate]
	and a
	ret z

	ldh a, [rVBK]
	push af
	ld [hSPBuffer], sp

	ld hl, wBGMapBufferPtrs
	ld sp, hl

; We can now pop the addresses of affected spots on the BG Map

	ld bc, wBGMapPalBuffer
	ld de, wBGMapBuffer

.next
; Copy a pair of 16x8 blocks (one 16x16 block)

rept 2
; Get our BG Map address
	pop hl

; Palettes
	ld a, 1
	ldh [rVBK], a

	ld a, [bc]
	ld [hli], a
	inc c
	ld a, [bc]
	ld [hld], a
	inc c

; Tiles
	xor a
	ldh [rVBK], a

	ld a, [de]
	ld [hli], a
	inc e
	ld a, [de]
	ld [hl], a
	inc e
endr

; We've done 2 16x8 blocks
	ldh a, [hBGMapTileCount]
	dec a
	dec a
	ldh [hBGMapTileCount], a

	jr nz, .next

	ldh a, [hSPBuffer]
	ld l, a
	ldh a, [hSPBuffer + 1]
	ld h, a
	ld sp, hl

	pop af
	ldh [rVBK], a

	xor a
	ldh [hBGMapUpdate], a
	scf
	ret

WaitTop::
; Wait until the top third of the BG Map is being updated.

	ldh a, [hBGMapMode]
	and a
	ret z

	ldh a, [hBGMapThird]
	and a
	jr z, .done

	call DelayFrame
	jr WaitTop

.done
	xor a
	ldh [hBGMapMode], a
	ret

UpdateBGMap::
; Update the BG Map, in thirds, from wTilemap and wAttrmap.

	ldh a, [hBGMapMode]
	and a
	ret z

	dec a ; 1-4 -> 0-3
	      ; bit 0 = tile/attr
	      ; bit 1 = map 0/1
	bit 1, a
	ld d, a
	jr nz, .map_1

; BG Map 0 (hBGMapAddress)
	ldh a, [hBGMapAddress]
	ld c, a
	ldh a, [hBGMapAddress + 1]
	ld b, a
	jr .next

; BG Map 1
.map_1
	ld bc, vBGMap1

.next
	rrc d
	jr nc, .Tiles

.Attr:
	ld a, 1
	ldh [rVBK], a

	hlcoord 0, 0, wAttrmap
	call .update

	ld a, 0
	ldh [rVBK], a
	ret

.Tiles:
	hlcoord 0, 0

; hl -> wTilemap/wAttrmap
; bc -> bg map
.update
	ld [hSPBuffer], sp
	ld sp, hl

; Which third?
	ldh a, [hBGMapThird]
	cp 1
	jr c, .top
	jr z, .middle

THIRD_HEIGHT EQU SCREEN_HEIGHT / 3

; bottom
; 2 * height * width = $F0, but add sp is a signed addition
; so do it in halves
	add sp, THIRD_HEIGHT * SCREEN_WIDTH
	add sp, THIRD_HEIGHT * SCREEN_WIDTH

	ld hl, 2 * THIRD_HEIGHT * BG_MAP_WIDTH
	add hl, bc

; Next time: top third
	xor a
	jr .start

.middle
	add sp, THIRD_HEIGHT * SCREEN_WIDTH

	ld hl, 1 * THIRD_HEIGHT * BG_MAP_WIDTH
	add hl, bc

; Next time: bottom third
	inc a
	jr .start

.top
	ld h, b
	ld l, c

; Next time: middle third
	inc a

.start
; Which third to update next time
	ldh [hBGMapThird], a

; Rows of tiles in a third
	ld a, SCREEN_HEIGHT / 3

; Discrepancy between wTilemap and BGMap
	ld bc, BG_MAP_WIDTH - (SCREEN_WIDTH - 1)

.row
; Copy a row of 20 tiles
rept SCREEN_WIDTH / 2 - 1
	pop de
	ld [hl], e
	inc l
	ld [hl], d
	inc l
endr
	pop de
	ld [hl], e
	inc l
	ld [hl], d

	add hl, bc
	dec a
	jr nz, .row

	ldh a, [hSPBuffer]
	ld l, a
	ldh a, [hSPBuffer + 1]
	ld h, a
	ld sp, hl
	ret

Serve1bppRequest::
; Only call during the first fifth of VBlank

	ld a, [wRequested1bpp]
	and a
	ret z

; Back out if we're too far into VBlank
	ldh a, [rLY]
	sub LY_VBLANK
	cp 2
	ret nc

; Copy [wRequested1bpp] 1bpp tiles from [wRequested1bppSource] to [wRequested1bppDest]

	ld [hSPBuffer], sp

; Source
	ld hl, wRequested1bppSource
	ld a, [hli]
	ld h, [hl]
	ld l, a
	ld sp, hl

; Destination
	ld hl, wRequested1bppDest
	ld a, [hli]
	ld h, [hl]
	ld l, a

; # tiles to copy
	ld a, [wRequested1bpp]
	ld b, a

	xor a
	ld [wRequested1bpp], a

.next

rept 3
	pop de
	ld [hl], e
	inc l
	ld [hl], e
	inc l
	ld [hl], d
	inc l
	ld [hl], d
	inc l
endr
	pop de
	ld [hl], e
	inc l
	ld [hl], e
	inc l
	ld [hl], d
	inc l
	ld [hl], d

	inc hl
	dec b
	jr nz, .next

	ld a, l
	ld [wRequested1bppDest], a
	ld a, h
	ld [wRequested1bppDest + 1], a

	ld [wRequested1bppSource], sp

	ldh a, [hSPBuffer]
	ld l, a
	ldh a, [hSPBuffer + 1]
	ld h, a
	ld sp, hl
	ret

Serve2bppRequest::
; Only call during the first fifth of VBlank

	ld a, [wRequested2bpp]
	and a
	ret z

; Back out if we're too far into VBlank
	ldh a, [rLY]
	sub LY_VBLANK
	cp 2
	ret nc
	jr _Serve2bppRequest

Serve2bppRequest_VBlank::
	ld a, [wRequested2bpp]
	and a
	ret z

_Serve2bppRequest::
; Copy [wRequested2bpp] 2bpp tiles from [wRequested2bppSource] to [wRequested2bppDest]

	ld [hSPBuffer], sp

; Source
	ld hl, wRequested2bppSource
	ld a, [hli]
	ld h, [hl]
	ld l, a
	ld sp, hl

; Destination
	ld hl, wRequested2bppDest
	ld a, [hli]
	ld h, [hl]
	ld l, a

; # tiles to copy
	ld a, [wRequested2bpp]
	ld b, a

	xor a
	ld [wRequested2bpp], a

.next

rept 7
	pop de
	ld [hl], e
	inc l
	ld [hl], d
	inc l
endr
	pop de
	ld [hl], e
	inc l
	ld [hl], d

	inc hl
	dec b
	jr nz, .next

	ld a, l
	ld [wRequested2bppDest], a
	ld a, h
	ld [wRequested2bppDest + 1], a

	ld [wRequested2bppSource], sp

	ldh a, [hSPBuffer]
	ld l, a
	ldh a, [hSPBuffer + 1]
	ld h, a
	ld sp, hl
	ret

AnimateTileset::
; Only call during the first fifth of VBlank

	ldh a, [hMapAnims]
	and a
	ret z

; Back out if we're too far into VBlank
	ldh a, [rLY]
	sub LY_VBLANK
	cp 7
	ret nc

	ldh a, [hROMBank]
	push af
	ld a, BANK(_AnimateTileset)
	rst Bankswitch

	ldh a, [rSVBK]
	push af
	ld a, BANK(wTilesetAnim)
	ldh [rSVBK], a

	ldh a, [rVBK]
	push af
	ld a, 0
	ldh [rVBK], a

	call _AnimateTileset

	pop af
	ldh [rVBK], a
	pop af
	ldh [rSVBK], a
	pop af
	rst Bankswitch
	ret
