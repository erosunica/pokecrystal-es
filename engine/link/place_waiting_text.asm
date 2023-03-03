PlaceWaitingText::
	hlcoord 4, 10
	ld b, 1
	ld c, 10

	ld a, [wBattleMode]
	and a
	jr z, .notinbattle

	call Textbox
	jr .proceed

.notinbattle
	predef LinkTextboxAtHL

.proceed
	hlcoord 5, 11
	ld de, .Waiting
	call PlaceString
	ld c, 50
	jp DelayFrames

.Waiting:
	db "¡ESPERA.…!@"
