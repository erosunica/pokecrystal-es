	object_const_def ; object_event constants
	const ROUTE11_YOUNGSTER1
	const ROUTE11_YOUNGSTER2
	const ROUTE11_YOUNGSTER3
	const ROUTE11_YOUNGSTER4
	const ROUTE11_FRUIT_TREE

Route11_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

TrainerYoungsterOwen:
	trainer YOUNGSTER, OWEN, EVENT_BEAT_YOUNGSTER_OWEN, YoungsterOwenSeenText, YoungsterOwenBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext YoungsterOwenAfterBattleText
	waitbutton
	closetext
	end

TrainerYoungsterJason:
	trainer YOUNGSTER, JASON, EVENT_BEAT_YOUNGSTER_JASON, YoungsterJasonSeenText, YoungsterJasonBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext YoungsterJasonAfterBattleText
	waitbutton
	closetext
	end

TrainerPsychicHerman:
	trainer PSYCHIC_T, HERMAN, EVENT_BEAT_PSYCHIC_HERMAN, PsychicHermanSeenText, PsychicHermanBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext PsychicHermanAfterBattleText
	waitbutton
	closetext
	end

TrainerPsychicFidel:
	trainer PSYCHIC_T, FIDEL, EVENT_BEAT_PSYCHIC_FIDEL, PsychicFidelSeenText, PsychicFidelBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext PsychicFidelAfterBattleText
	waitbutton
	closetext
	end

Route11Sign:
	jumptext Route11SignText

Route11FruitTree:
	fruittree FRUITTREE_ROUTE_11

Route11HiddenRevive:
	hiddenitem REVIVE, EVENT_ROUTE_11_HIDDEN_REVIVE

YoungsterOwenSeenText:
	text "No se puede hacer"
	line "trampa en #MON."

	para "¡Que quede bien"
	line "claro!"
	done

YoungsterOwenBeatenText:
	text "¿Qué? ¿Cómo ha"
	line "podido ocurrir?"
	done

YoungsterOwenAfterBattleText:
	text "He luchado con"
	line "honor."

	para "No me avergüenzo."
	done

YoungsterJasonSeenText:
	text "Cuando llevo"
	line "pantalones cortos"

	para "por la hierba, me"
	line "pican las piernas."
	done

YoungsterJasonBeatenText:
	text "¡Ayyyy!"
	line "¡Me han pisado!"
	done

YoungsterJasonAfterBattleText:
	text "Voy a capturar más"
	line "#MON en la"
	cont "hierba."
	done

PsychicHermanSeenText:
	text "<……>"
	done

PsychicHermanBeatenText:
	text "<……>"
	done

PsychicHermanAfterBattleText:
	text "…"

	para "Perdí cuando tenía"
	line "los ojos cerrados."
	done

PsychicFidelSeenText:
	text "Ya veo…"

	para "Todo lo que hay"
	line "que ver de ti…"
	done

PsychicFidelBeatenText:
	text "No me imaginaba tu"
	line "poder…"
	done

PsychicFidelAfterBattleText:
	text "Fuerza de"
	line "convicción…"

	para "Eres fuerte porque"
	line "confías en tus"
	cont "#MON."
	done

Route11SignText:
	text "RUTA 11"
	done

Route11_MapEvents:
	db 0, 0 ; filler

	db 0 ; warp events

	db 0 ; coord events

	db 2 ; bg events
	bg_event  3,  7, BGEVENT_READ, Route11Sign
	bg_event 32,  5, BGEVENT_ITEM, Route11HiddenRevive

	db 5 ; object events
	object_event 22, 14, SPRITE_YOUNGSTER, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 3, TrainerYoungsterOwen, -1
	object_event 20,  4, SPRITE_YOUNGSTER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 3, TrainerYoungsterJason, -1
	object_event 28,  7, SPRITE_YOUNGSTER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 1, TrainerPsychicHerman, -1
	object_event  8,  6, SPRITE_YOUNGSTER, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 3, TrainerPsychicFidel, -1
	object_event 32,  2, SPRITE_FRUIT_TREE, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, Route11FruitTree, -1
