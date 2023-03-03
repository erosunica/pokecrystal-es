	object_const_def ; object_event constants
	const ECRUTEAKTINTOWERENTRANCE_SAGE1
	const ECRUTEAKTINTOWERENTRANCE_SAGE2
	const ECRUTEAKTINTOWERENTRANCE_SAGE3
	const ECRUTEAKTINTOWERENTRANCE_GRAMPS

EcruteakTinTowerEntrance_MapScripts:
	db 2 ; scene scripts
	scene_script .DummyScene0 ; SCENE_DEFAULT
	scene_script .DummyScene1 ; SCENE_FINISHED

	db 1 ; callbacks
	callback MAPCALLBACK_OBJECTS, .InitializeSages

.DummyScene0:
	end

.DummyScene1:
	end

.InitializeSages:
	checkevent EVENT_FOUGHT_SUICUNE
	iftrue .DontBlockTower
	checkevent EVENT_KOJI_ALLOWS_YOU_PASSAGE_TO_TIN_TOWER
	iftrue .DontBlockTower
	checkevent EVENT_CLEARED_RADIO_TOWER
	iftrue .BlockTower
	return

.BlockTower:
	clearevent EVENT_RANG_CLEAR_BELL_1
	setevent EVENT_RANG_CLEAR_BELL_2
	setevent EVENT_ECRUTEAK_TIN_TOWER_ENTRANCE_WANDERING_SAGE
	checkitem CLEAR_BELL
	iftrue .NoClearBell
	setscene SCENE_DEFAULT
.NoClearBell:
	return

.DontBlockTower:
	clearevent EVENT_ECRUTEAK_TIN_TOWER_ENTRANCE_WANDERING_SAGE
	return

EcruteakTinTowerEntrance_CoordEvent1:
	checkevent EVENT_RANG_CLEAR_BELL_2
	iftrue EcruteakTinTowerEntrance_CoordEvent_DontMove
	applymovement ECRUTEAKTINTOWERENTRANCE_SAGE2, MovementData_0x980c7
	moveobject ECRUTEAKTINTOWERENTRANCE_SAGE1, 4, 6
	appear ECRUTEAKTINTOWERENTRANCE_SAGE1
	pause 5
	disappear ECRUTEAKTINTOWERENTRANCE_SAGE2
	end

EcruteakTinTowerEntrance_CoordEvent2:
	checkevent EVENT_RANG_CLEAR_BELL_1
	iftrue EcruteakTinTowerEntrance_CoordEvent_DontMove
	applymovement ECRUTEAKTINTOWERENTRANCE_SAGE1, MovementData_0x980cc
	moveobject ECRUTEAKTINTOWERENTRANCE_SAGE2, 5, 6
	appear ECRUTEAKTINTOWERENTRANCE_SAGE2
	pause 5
	disappear ECRUTEAKTINTOWERENTRANCE_SAGE1
	end

EcruteakTinTowerEntrance_CoordEvent_DontMove:
	end

EcruteakTinTowerEntranceSageScript:
	faceplayer
	opentext
	checkevent EVENT_CLEARED_RADIO_TOWER
	iftrue .CheckForClearBell
	checkflag ENGINE_FOGBADGE
	iftrue .BlockPassage_GotFogBadge
	writetext EcruteakTinTowerEntranceSageText
	waitbutton
	closetext
	end

.BlockPassage_GotFogBadge:
	writetext EcruteakTinTowerEntranceSageText_GotFogBadge
	waitbutton
	closetext
	end

.CheckForClearBell:
	checkevent EVENT_KOJI_ALLOWS_YOU_PASSAGE_TO_TIN_TOWER
	iftrue .AllowedThrough
	checkevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_1
	iftrue .RangClearBell
	checkitem CLEAR_BELL
	iftrue .GotClearBell
	writetext EcruteakTinTowerEntranceSageText_NoClearBell
	waitbutton
	closetext
	end

.GotClearBell:
	writetext EcruteakTinTowerEntranceSageText_HearsClearBell
	waitbutton
	closetext
	setscene SCENE_FINISHED
	setevent EVENT_RANG_CLEAR_BELL_2
	clearevent EVENT_RANG_CLEAR_BELL_1
	setevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_1
	end

.AllowedThrough:
	writetext EcruteakTinTowerEntranceSageText_PleaseDoGoOn
	waitbutton
	closetext
	end

.RangClearBell:
	writetext EcruteakTinTowerEntranceSageText_HeardClearBell
	waitbutton
	closetext
	end

EcruteakTinTowerEntranceWanderingSageScript:
	faceplayer
	opentext
	checkevent EVENT_GOT_CLEAR_BELL
	iftrue .GotClearBell
	writetext EcruteakTinTowerEntranceWanderingSageText
	waitbutton
	closetext
	end

.GotClearBell:
	writetext EcruteakTinTowerEntranceWanderingSageText_GotClearBell
	waitbutton
	closetext
	end

EcruteakTinTowerEntranceGrampsScript:
	jumptextfaceplayer EcruteakTinTowerEntranceGrampsText

MovementData_0x980c7:
	fix_facing
	big_step LEFT
	remove_fixed_facing
	turn_head DOWN
	step_end

MovementData_0x980cc:
	fix_facing
	big_step RIGHT
	remove_fixed_facing
	turn_head DOWN
	step_end

EcruteakTinTowerEntranceSageText:
	text "Sin la MEDALLA del"
	line "GIMNASIO de CIUDAD"

	para "IRIS, no se puede"
	line "entrar en la TORRE"
	cont "HOJALATA."

	para "¡Tendrás que irte!"
	done

EcruteakTinTowerEntranceSageText_GotFogBadge:
	text "Sin la MEDALLA del"
	line "GIMNASIO de CIUDAD"

	para "IRIS, no se puede"
	line "entrar en la TORRE"
	cont "HOJALATA."

	para "¡Ah!"

	para "¡La MEDALLA de"
	line "CIUDAD IRIS!"

	para "Puedes pasar."
	done

EcruteakTinTowerEntranceSageText_NoClearBell:
	text "Ha ocurrido un"
	line "hecho importante."

	para "Perdóname, pero"
	line "tengo que pedirte"
	cont "que te vayas."

	para "Lo que alivia el"
	line "alma…"

	para "El TRÍO DE SABIOS"
	line "dice cosas muy"

	para "difíciles de"
	line "entender…"
	done

EcruteakTinTowerEntranceSageText_HearsClearBell:
	text "Ha ocurrido un"
	line "hecho importante."

	para "Perdóname, pero"
	line "tengo que pedirte"
	cont "que te vayas."

	para "<……> <……> <……>"

	para "¡Ah!"

	para "¡El sonido de esa"
	line "CAMPANA CLARA!"

	para "Es… ¡Es sublime!"

	para "¡Nunca antes había"
	line "escuchado un"
	cont "sonido así!"

	para "El sonido de la"
	line "campana muestra el"
	cont "alma del portador."

	para "Tú…"

	para "Puedes entrar en"
	line "la TORRE HOJALATA."

	para "Sigue adelante."
	done

EcruteakTinTowerEntranceSageText_PleaseDoGoOn:
	text "Sigue adelante."
	done

EcruteakTinTowerEntranceSageText_HeardClearBell:
	text "El sonido de la"
	line "campana muestra el"
	cont "alma del portador."

	para "Tú…"

	para "Puedes entrar en"
	line "la TORRE HOJALATA."

	para "Sigue adelante."
	done

EcruteakTinTowerEntranceWanderingSageText:
	text "La TORRE HOJALATA"
	line "es una espléndida"

	para "torre de nueve"
	line "pisos."

	para "Alivia el alma de"
	line "todos los que la"
	cont "miran."
	done

EcruteakTinTowerEntranceWanderingSageText_GotClearBell:
	text "¡La TORRE HOJALATA"
	line "se ha movido!"

	para "¡Se habrá posado"
	line "un #MON arriba!"
	done

EcruteakTinTowerEntranceGrampsText:
	text "Dos torres…"
	line "Dos #MON…"

	para "Pero cuando una se"
	line "quemó, los dos"

	para "#MON huyeron y"
	line "nunca volvieron."
	done

EcruteakTinTowerEntrance_MapEvents:
	db 0, 0 ; filler

	db 5 ; warp events
	warp_event  4, 17, ECRUTEAK_CITY, 3
	warp_event  5, 17, ECRUTEAK_CITY, 3
	warp_event  5,  3, ECRUTEAK_TIN_TOWER_ENTRANCE, 4
	warp_event 17, 15, ECRUTEAK_TIN_TOWER_ENTRANCE, 3
	warp_event 17,  3, WISE_TRIOS_ROOM, 3

	db 2 ; coord events
	coord_event  4,  7, SCENE_DEFAULT, EcruteakTinTowerEntrance_CoordEvent1
	coord_event  5,  7, SCENE_DEFAULT, EcruteakTinTowerEntrance_CoordEvent2

	db 0 ; bg events

	db 4 ; object events
	object_event  4,  6, SPRITE_SAGE, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, EcruteakTinTowerEntranceSageScript, EVENT_RANG_CLEAR_BELL_1
	object_event  5,  6, SPRITE_SAGE, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, EcruteakTinTowerEntranceSageScript, EVENT_RANG_CLEAR_BELL_2
	object_event  6,  9, SPRITE_SAGE, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, EcruteakTinTowerEntranceWanderingSageScript, EVENT_ECRUTEAK_TIN_TOWER_ENTRANCE_WANDERING_SAGE
	object_event  3, 11, SPRITE_GRAMPS, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, EcruteakTinTowerEntranceGrampsScript, EVENT_ECRUTEAK_TIN_TOWER_ENTRANCE_WANDERING_SAGE
