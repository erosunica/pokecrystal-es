; Functions to copy data from ROM.

Get2bpp_2::
	ldh a, [rLCDC]
	bit rLCDC_ENABLE, a
	jp z, Copy2bpp

	homecall _Get2bpp

	ret

Get1bpp_2::
	ldh a, [rLCDC]
	bit rLCDC_ENABLE, a
	jp z, Copy1bpp

	homecall _Get1bpp

	ret

FarCopyBytesDouble_DoubleBankSwitch::
	ldh [hBuffer], a
	ldh a, [hROMBank]
	push af
	ldh a, [hBuffer]
	rst Bankswitch

	call FarCopyBytesDouble

	pop af
	rst Bankswitch
	ret

OldDMATransfer:
	dec c
	ldh a, [hBGMapMode]
	push af
	xor a
	ldh [hBGMapMode], a
	ldh a, [hROMBank]
	push af
	ld a, b
	rst Bankswitch

.loop
; load the source and target MSB and LSB
	ld a, d
	ldh [rHDMA1], a ; source MSB
	ld a, e
	and $f0
	ldh [rHDMA2], a ; source LSB
	ld a, h
	and $1f
	ldh [rHDMA3], a ; target MSB
	ld a, l
	and $f0
	ldh [rHDMA4], a ; target LSB
; stop when c < 8
	ld a, c
	cp $8
	jr c, .done
; decrease c by 8
	sub $8
	ld c, a
; DMA transfer state
	ld a, $f
	ldh [hDMATransfer], a
	call DelayFrame
; add $100 to hl and de
	ld a, l
	add LOW($100)
	ld l, a
	ld a, h
	adc HIGH($100)
	ld h, a
	ld a, e
	add LOW($100)
	ld e, a
	ld a, d
	adc HIGH($100)
	ld d, a
	jr .loop

.done
	ld a, c
	and $7f ; pretty silly, considering at most bits 0-2 would be set
	ldh [hDMATransfer], a
	call DelayFrame
	pop af
	rst Bankswitch

	pop af
	ldh [hBGMapMode], a
	ret

ReplaceKrisSprite::
	farcall _ReplaceKrisSprite
	ret

LoadStandardFont::
	farcall _LoadStandardFont
	ret

LoadFontsBattleExtra::
	farcall _LoadFontsBattleExtra
	ret

LoadFontsExtra::
	farcall _LoadFontsExtra1
	ret

DecompressRequest2bpp::
	push de
	ld a, BANK(sScratch)
	call GetSRAMBank
	push bc

	ld de, sScratch
	ld a, b
	call FarDecompress

	pop bc
	pop hl

	ld de, sScratch
	call Get2bpp
	jp CloseSRAM

FarCopyBytes::
; copy bc bytes from a:hl to de

	ldh [hBuffer], a
	ldh a, [hROMBank]
	push af
	ldh a, [hBuffer]
	rst Bankswitch

	call CopyBytes

	pop af
	rst Bankswitch
	ret

FarCopyBytesDouble:
; Copy bc bytes from a:hl to bc*2 bytes at de,
; doubling each byte in the process.

	ldh [hBuffer], a
	ldh a, [hROMBank]
	push af
	ldh a, [hBuffer]
	rst Bankswitch

; switcheroo, de <> hl
	ld a, h
	ld h, d
	ld d, a
	ld a, l
	ld l, e
	ld e, a

	inc b
	inc c
	jr .dec

.loop
	ld a, [de]
	inc de
	ld [hli], a
	ld [hli], a
.dec
	dec c
	jr nz, .loop
	dec b
	jr nz, .loop

	pop af
	rst Bankswitch
	ret

LY_REQUEST EQU $88
TILES_PER_BLANK EQU 16

Request2bpp::
; Load 2bpp at b:de to occupy c tiles of hl.
	ldh a, [hBGMapMode]
	push af
	xor a
	ldh [hBGMapMode], a

	ldh a, [hROMBank]
	push af
	ld a, b
	rst Bankswitch

	call WriteVCopyRegistersToHRAM

	ldh a, [rLY]
	cp LY_REQUEST
	jr c, .handleLoop
.loop
	ldh a, [hTilesPerCycle]
	sub TILES_PER_BLANK
	ldh [hTilesPerCycle], a
	jr c, .copyRemainingTilesAndExit
	jr nz, .copyEightTilesAndContinue
.copyRemainingTilesAndExit
	add TILES_PER_BLANK
	ldh [hRequested2bpp], a
	xor a
	ldh [hTilesPerCycle], a
	call DelayFrame
	ldh a, [hRequested2bpp]
	and a
	jr nz, .addUncopiedTilesToCount
	xor a
	ldh [hTilesPerCycle], a
	jr .done

.addUncopiedTilesToCount
	ld b, a
	ldh a, [hTilesPerCycle]
	add b
	ldh [hTilesPerCycle], a
	xor a
	ldh [hRequested2bpp], a
	jr .handleLoop

.copyEightTilesAndContinue
	ld a, TILES_PER_BLANK
	ldh [hRequested2bpp], a
	call DelayFrame
	ldh a, [hRequested2bpp]
	and a
	jr nz, .addUncopiedTilesToCount
.handleLoop
	call HBlankCopy2bpp
	jr c, .loop
.done

	pop af
	rst Bankswitch

	pop af
	ldh [hBGMapMode], a
	ret

Request1bpp::
; Load 1bpp at b:de to occupy c tiles of hl.
	ldh a, [hBGMapMode]
	push af
	xor a
	ldh [hBGMapMode], a

	ldh a, [hROMBank]
	push af
	ld a, b
	rst Bankswitch

	call WriteVCopyRegistersToHRAM

	ldh a, [rLY]
	cp LY_REQUEST
	jr c, .handleLoop
.loop
	ldh a, [hTilesPerCycle]
	sub TILES_PER_BLANK
	ldh [hTilesPerCycle], a
	jr c, .copyRemainingTilesAndExit
	jr nz, .copyEightTilesAndContinue
.copyRemainingTilesAndExit
	add TILES_PER_BLANK
	ldh [hRequested1bpp], a
	xor a
	ldh [hTilesPerCycle], a
	call DelayFrame
	ldh a, [hRequested1bpp]
	and a
	jr nz, .addUncopiedTilesToCount
	xor a
	ldh [hTilesPerCycle], a
	jr .done

.addUncopiedTilesToCount
	ld b, a
	ldh a, [hTilesPerCycle]
	add b
	ldh [hTilesPerCycle], a
	xor a
	ldh [hRequested1bpp], a
	jr .handleLoop

.copyEightTilesAndContinue
	ld a, TILES_PER_BLANK
	ldh [hRequested1bpp], a
	call DelayFrame
	ldh a, [hRequested1bpp]
	and a
	jr nz, .addUncopiedTilesToCount
.handleLoop
	call HBlankCopy1bpp
	jr c, .loop
.done
	pop af
	rst Bankswitch

	pop af
	ldh [hBGMapMode], a
	ret

WriteVCopyRegistersToHRAM:
	ld a, c
	ldh [hTilesPerCycle], a
	ld a, e
	ldh [hRequestedVTileSource], a
	ld a, d
	ldh [hRequestedVTileSource + 1], a
	ld a, l
	ldh [hRequestedVTileDest], a
	ld a, h
	ldh [hRequestedVTileDest + 1], a
	ret

Get2bpp::
	ldh a, [rLCDC]
	bit rLCDC_ENABLE, a
	jp nz, Request2bpp

Copy2bpp:
; copy c 2bpp tiles from b:de to hl

	push hl
	ld h, d
	ld l, e
	pop de

; bank
	ld a, b

; bc = c * $10
	push af
	swap c
	ld a, $f
	and c
	ld b, a
	ld a, $f0
	and c
	ld c, a
	pop af

	jp FarCopyBytes

Get1bpp::
	ldh a, [rLCDC]
	bit rLCDC_ENABLE, a
	jp nz, Request1bpp

Copy1bpp::
; copy c 1bpp tiles from b:de to hl

	push de
	ld d, h
	ld e, l

; bank
	ld a, b

; bc = c * $10 / 2
	push af
	ld h, 0
	ld l, c
	add hl, hl
	add hl, hl
	add hl, hl
	ld b, h
	ld c, l
	pop af

	pop hl
	jp FarCopyBytesDouble

HBlankCopy1bpp:
	di
	ld [hSPBuffer], sp

; Source
	ld hl, hRequestedVTileSource
	ld sp, hl
	pop hl
	ld sp, hl

; Destination
	ld hl, hRequestedVTileDest
	ld a, [hli]
	ld h, [hl]
	ld l, a

	jr .innerLoop

.outerLoop
	ldh a, [rLY]
	cp LY_REQUEST
	jr nc, ContinueHBlankCopy
.innerLoop
	pop bc
	pop de
.waitNoHBlank
	ldh a, [rSTAT]
	and %11
	jr z, .waitNoHBlank
.waitHBlank
	ldh a, [rSTAT]
	and %11
	jr nz, .waitHBlank
	ld a, c
	ld [hli], a
	ld [hli], a
	ld a, b
	ld [hli], a
	ld [hli], a
	ld a, e
	ld [hli], a
	ld [hli], a
	ld a, d
	ld [hli], a
	ld [hli], a
rept 2
	pop de
	ld a, e
	ld [hli], a
	ld [hli], a
	ld a, d
	ld [hli], a
	ld [hli], a
endr
	ldh a, [hTilesPerCycle]
	dec a
	ldh [hTilesPerCycle], a
	jr nz, .outerLoop
	jr DoneHBlankCopy

ContinueHBlankCopy:
	ld [hRequestedVTileSource], sp
	ld sp, hl
	ld [hRequestedVTileDest], sp
	scf
DoneHBlankCopy:
	ld sp, hSPBuffer
	pop hl
	ld sp, hl
	reti

HBlankCopy2bpp::
	di
	ld [hSPBuffer], sp

; Source
	ld hl, hRequestedVTileSource
	ld sp, hl
	pop hl
	ld sp, hl

; Destination
	ld hl, hRequestedVTileDest + 1
	ld a, [hld]
	ld l, [hl]
	ld h, a

	sub HIGH(VRAM_Begin)
	cp HIGH(VRAM_End) - HIGH(VRAM_Begin)
	jr nc, .innerLoop

; VRAM to VRAM copy
	lb bc, %11, rSTAT & $ff
	jr .waitNoHBlank2
.outerLoop2
	ldh a, [rLY]
	cp LY_REQUEST
	jr nc, ContinueHBlankCopy
.waitNoHBlank2
	ldh a, [c]
	and b
	jr z, .waitNoHBlank2
.waitHBlank2
	ldh a, [c]
	and b
	jr nz, .waitHBlank2
rept 8
	pop de
	ld a, e
	ld [hli], a
	ld a, d
	ld [hli], a
endr
	ld a, l
	and $f
	jr nz, .waitNoHBlank2
	ldh a, [hTilesPerCycle]
	dec a
	ldh [hTilesPerCycle], a
	jr nz, .outerLoop2
	jr DoneHBlankCopy

.outerLoop
	ldh a, [rLY]
	cp LY_REQUEST
	jr nc, ContinueHBlankCopy
.innerLoop
	pop bc
	pop de
.waitNoHBlank
	ldh a, [rSTAT]
	and %11
	jr z, .waitNoHBlank
.waitHBlank
	ldh a, [rSTAT]
	and %11
	jr nz, .waitHBlank
	ld a, c
	ld [hli], a
	ld a, b
	ld [hli], a
	ld a, e
	ld [hli], a
	ld a, d
	ld [hli], a
rept 6
	pop de
	ld a, e
	ld [hli], a
	ld a, d
	ld [hli], a
endr
	ldh a, [hTilesPerCycle]
	dec a
	ldh [hTilesPerCycle], a
	jr nz, .outerLoop
	jp DoneHBlankCopy

Get1or2bppDMG::
	ld b, a
	ldh a, [hBGMapMode]
	push af
	xor a
	ldh [hBGMapMode], a

	ldh a, [hROMBank]
	push af
	ld a, b
	rst Bankswitch

	ldh a, [hVBlank]
	push af
	ld a, 6
	ldh [hVBlank], a
	call WriteVCopyRegistersToHRAM
	ld c, b
.loop
	ldh a, [hTilesPerCycle]
	sub 8
	ldh [hTilesPerCycle], a
	jr c, .copyRemainingTilesAndExit
	jr nz, .copyEightTilesAndContinue
.copyRemainingTilesAndExit
	add 8
	ldh [c], a
	xor a
	ldh [hTilesPerCycle], a
	call DelayFrame
	ldh a, [c]
	and a
	jr z, .clearTileCountAndFinish
.addUncopiedTilesToCount
	ld b, a
	ldh a, [hTilesPerCycle]
	add b
	ldh [hTilesPerCycle], a
	jr .loop
.clearTileCountAndFinish
	xor a
	ldh [hTilesPerCycle], a
	jr .done
.copyEightTilesAndContinue
	ld a, 8
	ldh [c], a
	call DelayFrame
	ldh a, [c]
	and a
	jr nz, .addUncopiedTilesToCount
	jr .loop
.done
	pop af
	ldh [hVBlank], a
	pop af
	rst Bankswitch
	pop af
	ldh [hBGMapMode], a
	ret
