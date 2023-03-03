	object_const_def ; object_event constants
	const ROUTE40_OLIVINE_RIVAL1
	const ROUTE40_OLIVINE_RIVAL2
	const ROUTE40_SWIMMER_GIRL1
	const ROUTE40_SWIMMER_GIRL2
	const ROUTE40_ROCK1
	const ROUTE40_ROCK2
	const ROUTE40_ROCK3
	const ROUTE40_LASS1
	const ROUTE40_MONICA
	const ROUTE40_POKEFAN_M
	const ROUTE40_LASS2
	const ROUTE40_STANDING_YOUNGSTER

Route40_MapScripts:
	db 0 ; scene scripts

	db 1 ; callbacks
	callback MAPCALLBACK_OBJECTS, .MonicaCallback

.MonicaCallback:
	clearevent EVENT_BATTLE_TOWER_OUTSIDE_SAILOR
	readvar VAR_WEEKDAY
	ifequal MONDAY, .MonicaAppears
	disappear ROUTE40_MONICA
	return

.MonicaAppears:
	appear ROUTE40_MONICA
	return

TrainerSwimmerfElaine:
	trainer SWIMMERF, ELAINE, EVENT_BEAT_SWIMMERF_ELAINE, SwimmerfElaineSeenText, SwimmerfElaineBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext SwimmerfElaineAfterBattleText
	waitbutton
	closetext
	end

TrainerSwimmerfPaula:
	trainer SWIMMERF, PAULA, EVENT_BEAT_SWIMMERF_PAULA, SwimmerfPaulaSeenText, SwimmerfPaulaBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext SwimmerfPaulaAfterBattleText
	waitbutton
	closetext
	end

TrainerSwimmermSimon:
	trainer SWIMMERM, SIMON, EVENT_BEAT_SWIMMERM_SIMON, SwimmermSimonSeenText, SwimmermSimonBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext SwimmermSimonAfterBattleText
	waitbutton
	closetext
	end

TrainerSwimmermRandall:
	trainer SWIMMERM, RANDALL, EVENT_BEAT_SWIMMERM_RANDALL, SwimmermRandallSeenText, SwimmermRandallBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext SwimmermRandallAfterBattleText
	waitbutton
	closetext
	end

Route40Lass1Script:
	jumptextfaceplayer Route40Lass1Text

Route40PokefanMScript:
	special Mobile_DummyReturnFalse
	iftrue .mobile
	jumptextfaceplayer Route40PokefanMText

.mobile
	jumptextfaceplayer Route40PokefanMText_Mobile

Route40Lass2Script:
	jumptextfaceplayer Route40Lass2Text

Route40StandingYoungsterScript:
	jumptextfaceplayer Route40StandingYoungsterText

MonicaScript:
	faceplayer
	opentext
	checkevent EVENT_GOT_SHARP_BEAK_FROM_MONICA
	iftrue .Monday
	readvar VAR_WEEKDAY
	ifnotequal MONDAY, .NotMonday
	checkevent EVENT_MET_MONICA_OF_MONDAY
	iftrue .MetMonica
	writetext MeetMonicaText
	promptbutton
	setevent EVENT_MET_MONICA_OF_MONDAY
.MetMonica:
	writetext MonicaGivesGiftText
	promptbutton
	verbosegiveitem SHARP_BEAK
	iffalse .done
	setevent EVENT_GOT_SHARP_BEAK_FROM_MONICA
	writetext MonicaGaveGiftText
	waitbutton
	closetext
	end

.Monday:
	writetext MonicaMondayText
	waitbutton
.done:
	closetext
	end

.NotMonday:
	writetext MonicaNotMondayText
	waitbutton
	closetext
	end

Route40Sign:
	jumptext Route40SignText

Route40Rock:
	jumpstd smashrock

Route40HiddenHyperPotion:
	hiddenitem HYPER_POTION, EVENT_ROUTE_40_HIDDEN_HYPER_POTION

MovementData_0x1a621c:
	step RIGHT
	step UP
	step UP
	step UP
	step UP
	step UP
	step UP
	step_end

MovementData_0x1a6224:
	step UP
	step UP
	step UP
	step UP
	step UP
	step_end

MovementData_0x1a622a:
	step UP
	step UP
	step UP
	step UP
	step_end

SwimmermSimonSeenText:
	text "Debes calentar"
	line "antes de entrar en"
	cont "el agua."

	para "Es imprescindible."
	done

SwimmermSimonBeatenText:
	text "¡Vale! ¡Me rindo!"
	done

SwimmermSimonAfterBattleText:
	text "CIUDAD ORQUÍDEA"
	line "está bastante"
	cont "lejos de aquí."
	done

SwimmermRandallSeenText:
	text "¡Eres joven y"
	line "estás en forma!"

	para "¡No vayas sobre tu"
	line "#MON! ¡Nada!"
	done

SwimmermRandallBeatenText:
	text "¡Oh, he perdido…!"
	done

SwimmermRandallAfterBattleText:
	text "La natación"
	line "fortalece tu"
	cont "cuerpo. Es sana."
	done

SwimmerfElaineSeenText:
	text "¿Vas a CIUDAD"
	line "ORQUÍDEA?"

	para "¿Te apetece luchar"
	line "antes?"
	done

SwimmerfElaineBeatenText:
	text "¡He perdido!"
	done

SwimmerfElaineAfterBattleText:
	text "Creo que nado"
	line "mejor que tú."
	cont "¡Sin duda!"
	done

SwimmerfPaulaSeenText:
	text "Yo no necesito"
	line "flotador."

	para "¡Voy agarrada a un"
	line "#MON de mar!"
	done

SwimmerfPaulaBeatenText:
	text "¡Ooh, estoy"
	line "mareada!"
	done

SwimmerfPaulaAfterBattleText:
	text "Mientras flote"
	line "así, las olas me"
	cont "llevarán."
	done

Route40Lass1Text:
	text "Aunque no se ve"
	line "desde aquí, CIUDAD"

	para "ORQUÍDEA está al"
	line "otro lado del mar."
	done

Route40PokefanMText:
	text "¡Mira! ¡Hay un"
	line "gran edificio ahí!"

	para "¿Qué será?"
	done

Route40PokefanMText_Mobile:
	text "¡Mmmmm! Mira cómo"
	line "entran todos esos"

	para "entrenadores tan"
	line "preparados."

	para "¿Qué? ¿Qué?"
	done

Route40Lass2Text:
	text "Vine en barco a"
	line "C. OLIVO por las"

	para "vistas y el aire"
	line "que se respira."

	para "Como es un puerto,"
	line "parece diferente"
	cont "de la gran ciudad."
	done

Route40StandingYoungsterText:
	text "¿Has estado en la"
	line "TORRE BATALLA?"

	para "Creo que en ella"
	line "se han reunido mu-"
	cont "chos entrenadores"
	cont "muy fuertes."

	para "Aunque, teniendo"
	line "tantas MEDALLAS,"

	para "no debería resul-"
	line "tarte difícil."
	done

MeetMonicaText:
	text "LUNA: Encantada de"
	line "conocerte. Soy"
	cont "LUNA, por lunes."
	done

MonicaGivesGiftText:
	text "¡Como prueba de"
	line "nuestra amistad,"

	para "tengo un regalo"
	line "para ti!"
	done

MonicaGaveGiftText:
	text "LUNA: Es un objeto"
	line "que aumenta el"

	para "poder de los"
	line "movimientos de"
	cont "tipo volador."

	para "Deberías dar este"
	line "objeto a un"
	cont "#MON pájaro."
	done

MonicaMondayText:
	text "LUNA: Mis hermanos"
	line "y hermanas están"
	cont "por todas partes."

	para "¡A ver si los"
	line "encuentras!"
	done

MonicaNotMondayText:
	text "LUNA: No creo que"
	line "hoy sea lunes."
	cont "¡Qué pena…!"
	done

Route40SignText:
	text "RUTA 40"

	para "CIUDAD ORQUÍDEA -"
	line "CIUDAD OLIVO"
	done

Route40_MapEvents:
	db 0, 0 ; filler

	db 1 ; warp events
	warp_event  9,  5, ROUTE_40_BATTLE_TOWER_GATE, 1

	db 0 ; coord events

	db 2 ; bg events
	bg_event 14, 10, BGEVENT_READ, Route40Sign
	bg_event  7,  8, BGEVENT_ITEM, Route40HiddenHyperPotion

	db 12 ; object events
	object_event 14, 18, SPRITE_OLIVINE_RIVAL, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 4, TrainerSwimmermSimon, -1
	object_event 18, 30, SPRITE_OLIVINE_RIVAL, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 5, TrainerSwimmermRandall, -1
	object_event  3, 19, SPRITE_SWIMMER_GIRL, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_TRAINER, 4, TrainerSwimmerfElaine, -1
	object_event 10, 25, SPRITE_SWIMMER_GIRL, SPRITEMOVEDATA_SPINCLOCKWISE, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_TRAINER, 3, TrainerSwimmerfPaula, -1
	object_event  7, 11, SPRITE_ROCK, SPRITEMOVEDATA_SMASHABLE_ROCK, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, Route40Rock, -1
	object_event  6,  9, SPRITE_ROCK, SPRITEMOVEDATA_SMASHABLE_ROCK, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, Route40Rock, -1
	object_event  7,  8, SPRITE_ROCK, SPRITEMOVEDATA_SMASHABLE_ROCK, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, Route40Rock, -1
	object_event 11, 13, SPRITE_LASS, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, Route40Lass1Script, -1
	object_event  8, 10, SPRITE_BUENA, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, MonicaScript, EVENT_ROUTE_40_MONICA_OF_MONDAY
	object_event  7,  6, SPRITE_POKEFAN_M, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, Route40PokefanMScript, -1
	object_event 13,  4, SPRITE_LASS, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, Route40Lass2Script, -1
	object_event 12,  9, SPRITE_STANDING_YOUNGSTER, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, Route40StandingYoungsterScript, EVENT_BATTLE_TOWER_OUTSIDE_SAILOR
