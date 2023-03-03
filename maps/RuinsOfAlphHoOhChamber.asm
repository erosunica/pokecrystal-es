RuinsOfAlphHoOhChamber_MapScripts:
	db 2 ; scene scripts
	scene_script .CheckWall ; SCENE_DEFAULT
	scene_script .DummyScene ; SCENE_FINISHED

	db 1 ; callbacks
	callback MAPCALLBACK_TILES, .HiddenDoors

.CheckWall:
	special HoOhChamber
	checkevent EVENT_WALL_OPENED_IN_HO_OH_CHAMBER
	iftrue .OpenWall
	end

.OpenWall:
	prioritysjump .WallOpenScript
	end

.DummyScene:
	end

.HiddenDoors:
	checkevent EVENT_WALL_OPENED_IN_HO_OH_CHAMBER
	iftrue .WallOpen
	changeblock 4, 0, $2e ; closed wall
.WallOpen:
	checkevent EVENT_SOLVED_HO_OH_PUZZLE
	iffalse .FloorClosed
	return

.FloorClosed:
	changeblock 2, 2, $01 ; left floor
	changeblock 4, 2, $02 ; right floor
	return

.WallOpenScript:
	pause 30
	earthquake 30
	showemote EMOTE_SHOCK, PLAYER, 20
	pause 30
	playsound SFX_STRENGTH
	changeblock 4, 0, $30 ; open wall
	reloadmappart
	earthquake 50
	setscene SCENE_FINISHED
	closetext
	end

RuinsOfAlphHoOhChamberPuzzle:
	refreshscreen
	setval UNOWNPUZZLE_HO_OH
	special UnownPuzzle
	closetext
	iftrue .PuzzleComplete
	end

.PuzzleComplete:
	setevent EVENT_RUINS_OF_ALPH_INNER_CHAMBER_TOURISTS
	setevent EVENT_SOLVED_HO_OH_PUZZLE
	setflag ENGINE_UNLOCKED_UNOWNS_X_TO_Z
	setmapscene RUINS_OF_ALPH_INNER_CHAMBER, SCENE_RUINSOFALPHINNERCHAMBER_STRANGE_PRESENCE
	earthquake 30
	showemote EMOTE_SHOCK, PLAYER, 15
	changeblock 2, 2, $18 ; left hole
	changeblock 4, 2, $19 ; right hole
	reloadmappart
	playsound SFX_STRENGTH
	earthquake 80
	applymovement PLAYER, RuinsOfAlphHoOhChamberSkyfallTopMovement
	playsound SFX_KINESIS
	waitsfx
	pause 20
	warpcheck
	end

RuinsOfAlphHoOhChamberAncientReplica:
	jumptext RuinsOfAlphHoOhChamberAncientReplicaText

RuinsOfAlphHoOhChamberDescriptionSign:
	jumptext RuinsOfAlphHoOhChamberDescriptionText

RuinsOfAlphHoOhChamberWallPatternLeft:
	opentext
	writetext RuinsOfAlphHoOhChamberWallPatternLeftText
	setval UNOWNWORDS_HO_OH
	special DisplayUnownWords
	closetext
	end

RuinsOfAlphHoOhChamberWallPatternRight:
	checkevent EVENT_WALL_OPENED_IN_HO_OH_CHAMBER
	iftrue .WallOpen
	opentext
	writetext RuinsOfAlphHoOhChamberWallPatternRightText
	setval UNOWNWORDS_HO_OH
	special DisplayUnownWords
	closetext
	end

.WallOpen:
	opentext
	writetext RuinsOfAlphHoOhChamberWallHoleText
	waitbutton
	closetext
	end

RuinsOfAlphHoOhChamberSkyfallTopMovement:
	skyfall_top
	step_end

RuinsOfAlphHoOhChamberWallPatternLeftText:
	text "Aparecieron"
	line "dibujos en las"
	cont "paredes…"
	done

RuinsOfAlphHoOhChamberUnownText:
; unused
	text "¡Es texto UNOWN!"
	done

RuinsOfAlphHoOhChamberWallPatternRightText:
	text "Aparecieron"
	line "dibujos en las"
	cont "paredes…"
	done

RuinsOfAlphHoOhChamberWallHoleText:
	text "¡Hay un gran agu-"
	line "jero en la pared!"
	done

RuinsOfAlphHoOhChamberAncientReplicaText:
	text "Es una réplica de"
	line "un antiguo"
	cont "#MON."
	done

RuinsOfAlphHoOhChamberDescriptionText:
	text "Un #MON que mo-"
	line "vía con gracia sus"

	para "alas de los colo-"
	line "res del arco iris."
	done

RuinsOfAlphHoOhChamber_MapEvents:
	db 0, 0 ; filler

	db 5 ; warp events
	warp_event  3,  9, RUINS_OF_ALPH_OUTSIDE, 1
	warp_event  4,  9, RUINS_OF_ALPH_OUTSIDE, 1
	warp_event  3,  3, RUINS_OF_ALPH_INNER_CHAMBER, 2
	warp_event  4,  3, RUINS_OF_ALPH_INNER_CHAMBER, 3
	warp_event  4,  0, RUINS_OF_ALPH_HO_OH_ITEM_ROOM, 1

	db 0 ; coord events

	db 6 ; bg events
	bg_event  2,  3, BGEVENT_READ, RuinsOfAlphHoOhChamberAncientReplica
	bg_event  5,  3, BGEVENT_READ, RuinsOfAlphHoOhChamberAncientReplica
	bg_event  3,  2, BGEVENT_UP, RuinsOfAlphHoOhChamberPuzzle
	bg_event  4,  2, BGEVENT_UP, RuinsOfAlphHoOhChamberDescriptionSign
	bg_event  3,  0, BGEVENT_UP, RuinsOfAlphHoOhChamberWallPatternLeft
	bg_event  4,  0, BGEVENT_UP, RuinsOfAlphHoOhChamberWallPatternRight

	db 0 ; object events
