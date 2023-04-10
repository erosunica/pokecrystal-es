_HandlePlayerStep::
	ld a, [wPlayerStepFlags]
	add a ; PLAYERSTEP_START_F
	jr c, .update_overworld_map
	add a ; PLAYERSTEP_STOP_F
	jr c, .update_player_coords
	add a ; PLAYERSTEP_CONTINUE_F
	jr c, .finish
	ret

.update_overworld_map
	ld a, 4
	ld [wHandlePlayerStep], a
	call UpdateOverworldMap
	jr .finish

.update_player_coords
	call UpdatePlayerCoords
	; fallthrough

.finish
	call HandlePlayerStep
	ld a, [wPlayerStepVectorX]
	ld d, a
	ld a, [wPlayerStepVectorY]
	ld e, a
	ld a, [wPlayerBGMapOffsetX]
	sub d
	ld [wPlayerBGMapOffsetX], a
	ld a, [wPlayerBGMapOffsetY]
	sub e
	ld [wPlayerBGMapOffsetY], a
	ret

ScrollScreen::
	ld a, [wPlayerStepVectorX]
	ld d, a
	ld a, [wPlayerStepVectorY]
	ld e, a
	ldh a, [hSCX]
	add d
	ldh [hSCX], a
	ldh a, [hSCY]
	add e
	ldh [hSCY], a
	ret

HandlePlayerStep:
	ld hl, wHandlePlayerStep
	ld a, [hl]
	and a
	ret z
	dec [hl]
	ld a, [hl]
	ld hl, .Jumptable
	rst JumpTable
	ret

.Jumptable:
	dw GetMovementPermissions
	dw BufferScreen
	dw .mobile
	dw .fail2
; The rest are never used.  Ever.
	dw .fail1
	dw .fail1
	dw .fail1
	dw .fail1
	dw .fail1
	dw .fail1
	dw .fail1

.fail1
	ret

.mobile
	ret

.fail2
	ret

UpdatePlayerCoords:
	ld hl, wYCoord
	ld a, [wPlayerStepDirection]
	and a
	jr z, .incrementCoord
	dec a
	jr z, .decrementCoord
	inc hl
	dec a
	jr z, .decrementCoord
	dec a
	ret nz
.incrementCoord
	inc [hl]
	ret
.decrementCoord
	dec [hl]
	ret

UpdateOverworldMap:
	ld a, [wPlayerStepDirection]
	and a
	jr z, .step_down
	dec a
	jr z, .step_up
	dec a
	jr z, .step_left
	dec a
	ret nz
;step_right
	call .ScrollOverworldMapRight
	call LoadMapPart
	jp ScrollMapRight
.step_down
	call .ScrollOverworldMapDown
	call LoadMapPart
	jp ScrollMapDown
.step_up
	call .ScrollOverworldMapUp
	call LoadMapPart
	jp ScrollMapUp
.step_left
	call .ScrollOverworldMapLeft
	call LoadMapPart
	jp ScrollMapLeft

.ScrollOverworldMapDown:
	ld a, [wBGMapAnchor]
	add 2 * BG_MAP_WIDTH
	ld [wBGMapAnchor], a
	jr nc, .not_overflowed
	ld a, [wBGMapAnchor + 1]
	inc a
	and %11
	or HIGH(vBGMap0)
	ld [wBGMapAnchor + 1], a
.not_overflowed
	ld hl, wMetatileStandingY
	inc [hl]
	ld a, [hl]
	cp 2 ; was 1
	ret nz
	ld [hl], 0
	ld hl, wOverworldMapAnchor
	ld a, [wMapWidth]
	add 3 * 2 ; surrounding tiles
	add [hl]
	ld [hli], a
	ret nc
	inc [hl]
	ret

.ScrollOverworldMapUp:
	ld a, [wBGMapAnchor]
	sub 2 * BG_MAP_WIDTH
	ld [wBGMapAnchor], a
	jr nc, .not_underflowed
	ld a, [wBGMapAnchor + 1]
	dec a
	and %11
	or HIGH(vBGMap0)
	ld [wBGMapAnchor + 1], a
.not_underflowed
	ld hl, wMetatileStandingY
	dec [hl]
	ld a, [hl]
	cp -1 ; was 0
	ret nz
	ld [hl], $1
	ld hl, wOverworldMapAnchor
	ld a, [wMapWidth]
	add 3 * 2 ; surrounding tiles
	ld b, a
	ld a, [hl]
	sub b
	ld [hli], a
	ret nc
	dec [hl]
	ret

.ScrollOverworldMapLeft:
	ld a, [wBGMapAnchor]
	ld e, a
	and $e0
	ld d, a
	ld a, e
	sub $2
	and $1f
	or d
	ld [wBGMapAnchor], a
	ld hl, wMetatileStandingX
	dec [hl]
	ld a, [hl]
	cp -1
	ret nz
	ld [hl], 1
	ld hl, wOverworldMapAnchor
	ld a, [hl]
	sub 1
	ld [hli], a
	ret nc
	dec [hl]
	ret

.ScrollOverworldMapRight:
	ld a, [wBGMapAnchor]
	ld e, a
	and $e0
	ld d, a
	ld a, e
	add $2
	and $1f
	or d
	ld [wBGMapAnchor], a
	ld hl, wMetatileStandingX
	inc [hl]
	ld a, [hl]
	cp 2
	ret nz
	ld [hl], 0
	ld hl, wOverworldMapAnchor
	ld a, [hl]
	add 1
	ld [hli], a
	ret nc
	inc [hl]
	ret
