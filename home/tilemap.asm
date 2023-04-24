ClearBGPalettes::
	call ClearPalettes
WaitBGMap::
; Tell VBlank to update BG Map
	ld a, 1 ; BG Map 0 tiles
	ldh [hBGMapMode], a
; Wait for it to do its magic
	ld c, 3
	jp DelayFrames

WaitBGMap2::
	ld a, 2
	ldh [hBGMapMode], a
	ld c, 3
	call DelayFrames
	ld a, 1
	ldh [hBGMapMode], a
	ld c, 3
	jp DelayFrames

IsCGB:: ; unused
	ldh a, [hCGB]
	and a
	ret

ApplyTilemap::
	ld a, [wSpriteUpdatesEnabled]
	and a
	jr z, .dmg

	ld a, 1
	ldh [hBGMapMode], a
	jr CopyTilemapAtOnce

.dmg
; WaitBGMap
	ld a, 1
	ldh [hBGMapMode], a
	ld c, 3
	jp DelayFrames

CGBOnly_CopyTilemapAtOnce:: ; unused
	ldh a, [hCGB]
	and a
	jr z, WaitBGMap

CopyTilemapAtOnce::
	ldh a, [hBGMapMode]
	push af
	xor a
	ldh [hBGMapMode], a

	ldh a, [hMapAnims]
	push af
	xor a
	ldh [hMapAnims], a

.wait
	ldh a, [rLY]
	cp $7f
	jr c, .wait

	di
	ld a, BANK(vTiles3)
	ldh [rVBK], a
	hlcoord 0, 0, wAttrmap
	call CopyBGMapViaStack
	xor a ; BANK(vTiles0)
	ldh [rVBK], a
	hlcoord 0, 0
	call CopyBGMapViaStack

.wait2
	ldh a, [rLY]
	cp $7f
	jr c, .wait2
	ei

	pop af
	ldh [hMapAnims], a
	pop af
	ldh [hBGMapMode], a
	ret

CopyBGMapViaStack::
; Copy all tiles to vBGMap
	ld [hSPBuffer], sp
	ld sp, hl
	ldh a, [hBGMapAddress + 1]
	ld h, a
	ld l, 0
	ld a, SCREEN_HEIGHT
	ldh [hTilesPerCycle], a
	lb bc, 1 << 1, LOW(rSTAT) ; not in v/hblank

.loop
rept SCREEN_WIDTH / 2
	pop de
; if in v/hblank, wait until not in v/hblank
.loop\@
	ldh a, [c]
	and b
	jr nz, .loop\@
; load vBGMap
	ld [hl], e
	inc l
	ld [hl], d
	inc l
endr

	ld de, BG_MAP_WIDTH - SCREEN_WIDTH
	add hl, de
	ldh a, [hTilesPerCycle]
	dec a
	ldh [hTilesPerCycle], a
	jr nz, .loop

	ldh a, [hSPBuffer]
	ld l, a
	ldh a, [hSPBuffer + 1]
	ld h, a
	ld sp, hl
	ret

SetPalettes::
; Inits the Palettes
; depending on the system the monochromes palettes or color palettes
	push de
	ld a, %11100100
	call DmgToCgbBGPals
	lb de, %11100100, %11100100
	call DmgToCgbObjPals
	pop de
	ret

ClearPalettes::
; Make all palettes white
	ldh a, [rSVBK]
	push af

	ld a, BANK(wBGPals2)
	ldh [rSVBK], a

; Fill wBGPals2 and wOBPals2 with $ffff (white)
	ld hl, wBGPals2
	ld bc, 16 palettes
	ld a, $ff
	call ByteFill

	pop af
	ldh [rSVBK], a

; Request palette update
	ld a, 1
	ldh [hCGBPalUpdate], a
	ret

GetMemSGBLayout::
	ld b, SCGB_RAM
GetSGBLayout::
; load sgb packets unless dmg
	predef_jump LoadSGBLayoutCGB

SetHPPal::
; Set palette for hp bar pixel length e at hl.
	call GetHPPal
	ld [hl], d
	ret

GetHPPal::
; Get palette for hp bar pixel length e in d.
	ld d, HP_GREEN
	ld a, e
	cp (HP_BAR_LENGTH_PX * 50 / 100) ; 24
	ret nc
	inc d ; HP_YELLOW
	cp (HP_BAR_LENGTH_PX * 21 / 100) ; 10
	ret nc
	inc d ; HP_RED
	ret
