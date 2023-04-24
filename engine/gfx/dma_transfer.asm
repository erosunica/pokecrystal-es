HDMATransferAttrmapAndTilemapToWRAMBank3:: ; unused
	ld hl, .Function
	jp CallInSafeGFXMode

.Function:
	decoord 0, 0, wAttrmap
	ld hl, wScratchAttrmap
	call PadAttrmapForHDMATransfer
	decoord 0, 0
	ld hl, wScratchTilemap
	call PadTilemapForHDMATransfer
	xor a
	ldh [rVBK], a
	ld hl, wScratchTilemap
	call HDMATransferToWRAMBank3
	ld a, $1
	ldh [rVBK], a
	ld hl, wScratchAttrmap
	jp HDMATransferToWRAMBank3

HDMATransferTilemapToWRAMBank3::
	call CallInSafeGFXMode

.Function:
	decoord 0, 0
	ld hl, wScratchTilemap
	call PadTilemapForHDMATransfer
	xor a
	ldh [rVBK], a
	ld hl, wScratchTilemap
	jp HDMATransferToWRAMBank3

HDMATransferAttrmapToWRAMBank3:
	call CallInSafeGFXMode

.Function:
	decoord 0, 0, wAttrmap
	ld hl, wScratchAttrmap
	call PadAttrmapForHDMATransfer
	ld a, $1
	ldh [rVBK], a
	ld hl, wScratchAttrmap
	jp HDMATransferToWRAMBank3

ReloadMapPart::
	call CallInSafeGFXMode

.Function:
	decoord 0, 0, wAttrmap
	ld hl, wScratchAttrmap
	call PadAttrmapForHDMATransfer
	decoord 0, 0
	ld hl, wScratchTilemap
	call PadTilemapForHDMATransfer
	call DelayFrame ; really needed?

	di
	ldh a, [rVBK]
	push af
	ld a, $1
	ldh [rVBK], a
	ld hl, wScratchAttrmap
	call HDMATransfer_Wait127Scanlines_toBGMap
	xor a
	ldh [rVBK], a
	ld hl, wScratchTilemap
	call HDMATransfer_Wait127Scanlines_toBGMap
	pop af
	ldh [rVBK], a
	reti

Mobile_ReloadMapPart:
	ld hl, ReloadMapPart ; useless
	ld hl, .Function
	jp CallInSafeGFXMode

.Function:
	decoord 0, 0, wAttrmap
	ld hl, wScratchAttrmap
	call PadAttrmapForHDMATransfer
	decoord 0, 0
	ld hl, wScratchTilemap
	call PadTilemapForHDMATransfer
	call DelayFrame

	di
	ldh a, [rVBK]
	push af
	ld a, $1
	ldh [rVBK], a
	ld hl, wScratchAttrmap
	xor a
	ldh [rVBK], a
	ld hl, wScratchTilemap
	pop af
	ldh [rVBK], a
	reti

; unused
	ld hl, .unreferenced_1040da
	jp CallInSafeGFXMode

.unreferenced_1040da
	ld a, $1
	ldh [rVBK], a
	ld a, BANK(w3_d800)
	ldh [rSVBK], a
	ld de, w3_d800
	ldh a, [hBGMapAddress + 1]
	ldh [rHDMA1], a
	ldh a, [hBGMapAddress]
	ldh [rHDMA2], a
	ld a, d
	ldh [rHDMA3], a
	ld a, e
	ldh [rHDMA4], a
	ld a, $23
	ldh [hDMATransfer], a
	jp WaitDMATransfer

; unused
	ld hl, .unreferenced_104101
	jp CallInSafeGFXMode

.unreferenced_104101
	ld a, $1
	ldh [rVBK], a
	ld a, BANK(w3_d800)
	ldh [rSVBK], a
	ld hl, w3_d800
	jp HDMATransferToWRAMBank3

OpenAndCloseMenu_HDMATransferTilemapAndAttrmap::
; OpenText
	call CallInSafeGFXMode

.Function:
	; Transfer wAttrmap and Tilemap to BGMap
	; Fill vBGAttrs with $00
	; Fill vBGTiles with " "
	decoord 0, 0, wAttrmap
	ld hl, wScratchAttrmap
	call PadAttrmapForHDMATransfer
	decoord 0, 0
	ld hl, wScratchTilemap
	call PadTilemapForHDMATransfer
	call DelayFrame

	di
	ldh a, [rVBK]
	push af
	ld a, $1
	ldh [rVBK], a
	ld hl, wScratchAttrmap
	call HDMATransfer_Wait123Scanlines_toBGMap
	xor a
	ldh [rVBK], a
	ld hl, wScratchTilemap
	call HDMATransfer_Wait123Scanlines_toBGMap
	pop af
	ldh [rVBK], a
	reti

Mobile_OpenAndCloseMenu_HDMATransferTilemapAndAttrmap:
	ld hl, .Function
	jp CallInSafeGFXMode

.Function:
	; Transfer wAttrmap and Tilemap to BGMap
	; Fill vBGAttrs with $00
	; Fill vBGTiles with $ff
	decoord 0, 0, wAttrmap
	ld hl, wScratchAttrmap
	call PadAttrmapForHDMATransfer
	ld c, $ff
	decoord 0, 0
	ld hl, wScratchTilemap
	call PadMapForHDMATransfer

	ld a, $1
	ldh [rVBK], a
	ld hl, wScratchAttrmap
	call HDMATransfer_Wait127Scanlines_toBGMap
	xor a
	ldh [rVBK], a
	ld hl, wScratchTilemap
	jp HDMATransfer_Wait127Scanlines_toBGMap

CallInSafeGFXMode:
	pop hl

	ldh a, [hBGMapMode]
	push af
	ldh a, [hMapAnims]
	push af
	xor a
	ldh [hBGMapMode], a
	ldh [hMapAnims], a
	ldh a, [rSVBK]
	push af
	ld a, BANK(wScratchTilemap)
	ldh [rSVBK], a
	ldh a, [rVBK]
	push af

	call ._hl_

	pop af
	ldh [rVBK], a
	pop af
	ldh [rSVBK], a
	pop af
	ldh [hMapAnims], a
	pop af
	ldh [hBGMapMode], a
	ret

._hl_
	jp hl

HDMATransferToWRAMBank3:
	call _LoadHDMAParameters
	ld a, $23
	ldh [hDMATransfer], a

WaitDMATransfer:
.loop
	call DelayFrame
	ldh a, [hDMATransfer]
	and a
	jr nz, .loop
	ret

HDMATransfer_Wait127Scanlines_toBGMap:
; HDMA transfer from hl to [hBGMapAddress]
; hBGMapAddress -> de
; 2 * SCREEN_HEIGHT -> c
	ldh a, [hBGMapAddress + 1]
	ld d, a
	ldh a, [hBGMapAddress]
	ld e, a
	ld c, 2 * SCREEN_HEIGHT
	jr HDMATransfer_Wait127Scanlines

HDMATransfer_Wait123Scanlines_toBGMap:
; HDMA transfer from hl to [hBGMapAddress]
; hBGMapAddress -> de
; 2 * SCREEN_HEIGHT -> c
; $7b --> b
	ldh a, [hBGMapAddress + 1]
	ld d, a
	ldh a, [hBGMapAddress]
	ld e, a
	lb bc, $7b, 2 * SCREEN_HEIGHT
	jr _continue_HDMATransfer

HDMATransfer_Wait127Scanlines:
	ld b, $7f
_continue_HDMATransfer:
; a lot of waiting around for hardware registers
	; [rHDMA1, rHDMA2] = hl & $fff0
	ld a, h
	ldh [rHDMA1], a
	ld a, l
	and $f0 ; high nybble
	ldh [rHDMA2], a
	; [rHDMA3, rHDMA4] = de & $1ff0
	ld a, d
	and $1f ; lower 5 bits
	ldh [rHDMA3], a
	ld a, e
	and $f0 ; high nybble
	ldh [rHDMA4], a
	; e = c | %10000000
	ld a, c
	dec c
	or $80
	ld e, a
	; d = b - c + 1
	ld a, b
	sub c
	ld d, a
	; while [rLY] >= d: pass
.ly_loop
	ldh a, [rLY]
	cp d
	jr nc, .ly_loop

	di
	; while [rSTAT] & 3: pass
.rstat_loop_1
	ldh a, [rSTAT]
	and $3
	jr nz, .rstat_loop_1
	; while not [rSTAT] & 3: pass
.rstat_loop_2
	ldh a, [rSTAT]
	and $3
	jr z, .rstat_loop_2
	; load the 5th byte of HDMA
	ld a, e
	ldh [rHDMA5], a
	; wait until rLY advances (c + 1) times
	ldh a, [rLY]
	inc c
	ld hl, rLY
.final_ly_loop
	cp [hl]
	jr z, .final_ly_loop
	ld a, [hl]
	dec c
	jr nz, .final_ly_loop
	ld hl, rHDMA5
	res 7, [hl]
	reti

_LoadHDMAParameters:
	ld a, h
	ldh [rHDMA1], a
	ld a, l
	ldh [rHDMA2], a
	ldh a, [hBGMapAddress + 1]
	and $1f
	ldh [rHDMA3], a
	ldh a, [hBGMapAddress]
	ldh [rHDMA4], a
	ret

PadTilemapForHDMATransfer:
	ld c, " "
	jr PadMapForHDMATransfer

PadAttrmapForHDMATransfer:
	ld c, $0

PadMapForHDMATransfer:
; pad a 20x18 map to 32x18 for HDMA transfer
; back up the padding value in c to hMapObjectIndexBuffer
	ldh a, [hMapObjectIndexBuffer]
	push af
	ld a, c
	ldh [hMapObjectIndexBuffer], a

; for each row on the screen
	ld c, SCREEN_HEIGHT
.loop1
; for each tile in the row
	ld b, SCREEN_WIDTH
.loop2
; copy from de to hl
	ld a, [de]
	inc de
	ld [hli], a
	dec b
	jr nz, .loop2

; load the original padding value of c into hl for 32 - 20 = 12 rows
	ldh a, [hMapObjectIndexBuffer]
	ld b, BG_MAP_WIDTH - SCREEN_WIDTH
.loop3
	ld [hli], a
	dec b
	jr nz, .loop3

	dec c
	jr nz, .loop1

; restore the original value of hMapObjectIndexBuffer
	pop af
	ldh [hMapObjectIndexBuffer], a
	ret

_Get2bpp::
	; 2bpp when [rLCDC] & $80
	; switch to WRAM bank 6
	ldh a, [rSVBK]
	push af
	ld a, BANK(wScratchTilemap)
	ldh [rSVBK], a

	push bc
	push hl

	; Copy c tiles of the 2bpp from b:de to wScratchTilemap
	ld a, b ; bank
	ld l, c ; number of tiles
	ld h, $0
	; multiply by 16 (16 bytes of a 2bpp = 8 x 8 tile)
	add hl, hl
	add hl, hl
	add hl, hl
	add hl, hl
	ld b, h
	ld c, l
	ld h, d ; address
	ld l, e
	ld de, wScratchTilemap
	call FarCopyBytes

	pop hl
	pop bc

	push bc
	call DelayFrame
	pop bc

	ld d, h
	ld e, l
	ld hl, wScratchTilemap
	call HDMATransfer_Wait127Scanlines

	; restore the previous bank
	pop af
	ldh [rSVBK], a
	ret

_Get1bpp::
	; 1bpp when [rLCDC] & $80
.loop
	ld a, c
	cp $10
	jp c, .bankswitch
	jp z, .bankswitch
	push bc
	push hl
	push de
	ld c, $10
	call .bankswitch
	pop de
	ld hl, $80
	add hl, de
	ld d, h
	ld e, l
	pop hl
	lb bc, 1, 0
	add hl, bc
	pop bc
	ld a, c
	sub $10
	ld c, a
	jr .loop

.bankswitch
	ldh a, [rSVBK]
	push af
	ld a, BANK(wScratchTilemap)
	ldh [rSVBK], a

	push bc
	push hl

	ld a, b
	ld l, c
	ld h, $0
	add hl, hl ; multiply by 8
	add hl, hl ; multiply by 8
	add hl, hl ; multiply by 8
	ld c, l
	ld b, h
	ld h, d
	ld l, e
	ld de, wScratchTilemap
	call FarCopyBytesDouble_DoubleBankSwitch

	pop hl
	pop bc

	push bc
	call DelayFrame
	pop bc

	ld d, h
	ld e, l
	ld hl, wScratchTilemap
	call HDMATransfer_Wait127Scanlines

	pop af
	ldh [rSVBK], a
	ret

HDMATransfer_OnlyTopFourRows:
	call CallInSafeGFXMode

.Function:
	ld hl, wScratchTilemap
	decoord 0, 0
	call .Copy
	ld hl, wScratchTilemap + $80
	decoord 0, 0, wAttrmap
	call .Copy
	ld a, $1
	ldh [rVBK], a
	ld c, $8
	ld hl, wScratchTilemap + $80
	debgcoord 0, 0, vBGMap1
	call HDMATransfer_Wait127Scanlines
	xor a
	ldh [rVBK], a
	ld c, $8
	ld hl, wScratchTilemap
	debgcoord 0, 0, vBGMap1
	jp HDMATransfer_Wait127Scanlines

.Copy:
	ld b, 4
.outer_loop
	ld c, SCREEN_WIDTH
.inner_loop
	ld a, [de]
	ld [hli], a
	inc de
	dec c
	jr nz, .inner_loop
	ld a, BG_MAP_WIDTH - SCREEN_WIDTH
	add l
	ld l, a
	adc h
	sub l
	ld h, a
	dec b
	jr nz, .outer_loop
	ret
