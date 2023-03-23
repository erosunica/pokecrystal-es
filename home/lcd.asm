; LCD handling

Unreferenced_Function547::
	ldh a, [hLCDCPointer]
	cp LOW(rSCX)
	ret nz
	ld c, a
	ld a, [wLYOverrides]
	ldh [c], a
	ret

LCD::
; It's assumed we're in BANK(wLYOverrides)
	push af
	push bc
	ldh a, [rLY]
	ld c, a
	ld b, HIGH(wLYOverrides)
	ld a, [bc]
	ld b, a

	ldh a, [hLCDCPointer]
; Check if we actually had a pointer, if not we may be in the wrong ram
; bank, but WRAM reads have no side effects so a rouge read is harmless
	and a
	jr z, .clear

	ld c, a
	ld a, b
	ldh [c], a
	pop bc
	pop af
	reti

.clear
; Interrupting on every HBlank takes a substantial chunk of CPU time
; So clear the interrupt, VBlank will enable it
	ldh a, [rIE]
	res LCD_STAT, a
	ldh [rIE], a
	pop bc
	pop af
	reti

DisableLCD::
; Turn the LCD off

; Don't need to do anything if the LCD is already off
	ldh a, [rLCDC]
	bit rLCDC_ENABLE, a
	ret z

	xor a
	ldh [rIF], a
	ldh a, [rIE]
	ld b, a

; Disable VBlank
	res VBLANK, a
	ldh [rIE], a

.wait
; Wait until VBlank would normally happen
	ldh a, [rLY]
	cp LY_VBLANK + 1
	jr nz, .wait

	ldh a, [rLCDC]
	and $ff ^ (1 << rLCDC_ENABLE)
	ldh [rLCDC], a

	xor a
	ldh [rIF], a
	ld a, b
	ldh [rIE], a
	ret

EnableLCD::
	ldh a, [rLCDC]
	set rLCDC_ENABLE, a
	ldh [rLCDC], a
	ret
