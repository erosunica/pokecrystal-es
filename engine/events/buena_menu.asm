AskRememberPassword:
	lb bc, 15, 7
	push bc
	ld hl, YesNoMenuHeader
	call CopyMenuHeader
	pop bc
	ld a, b
	ld [wMenuBorderLeftCoord], a
	add $4
	ld [wMenuBorderRightCoord], a
	ld a, c
	ld [wMenuBorderTopCoord], a
	add $4
	ld [wMenuBorderBottomCoord], a
	call PushWindow
	call VerticalMenu
	push af
	ld c, 15
	call DelayFrames
	call Buena_ExitMenu
	pop af
	jr c, .refused
	ld a, [wMenuCursorY]
	cp $2
	jr z, .refused
	ld a, TRUE
	ld [wScriptVar], a
	ret

.refused
	ld a, $2
	ld [wMenuCursorY], a
	xor a ; FALSE
	ld [wScriptVar], a
	ret

Buena_ExitMenu:
	ldh a, [hOAMUpdate]
	push af
	call ExitMenu
	call UpdateSprites
	xor a
	ldh [hOAMUpdate], a
	call DelayFrame
	ld a, $1
	ldh [hOAMUpdate], a
	call ApplyTilemap
	pop af
	ldh [hOAMUpdate], a
	ret
