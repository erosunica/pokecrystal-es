	object_const_def ; object_event constants
	const ROUTE6_POKEFAN_M1
	const ROUTE6_POKEFAN_M2
	const ROUTE6_POKEFAN_M3

Route6_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

TrainerPokefanmRex:
	trainer POKEFANM, REX, EVENT_BEAT_POKEFANM_REX, PokefanmRexSeenText, PokefanmRexBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext PokefanmRexAfterBattleText
	waitbutton
	closetext
	end

TrainerPokefanmAllan:
	trainer POKEFANM, ALLAN, EVENT_BEAT_POKEFANM_ALLAN, PokefanmAllanSeenText, PokefanmAllanBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext PokefanmAllanAfterBattleText
	waitbutton
	closetext
	end

Route6PokefanMScript:
	jumptextfaceplayer Route6PokefanMText

Route6UndergroundPathSign:
	jumptext Route6UndergroundPathSignText

Route6PokefanMText:
	text "La carretera está"
	line "cortada hasta que"

	para "arreglen la CEN-"
	line "TRAL ENERGÍA."
	done

Route6UndergroundPathSignText:
	text "VÍA SUBTERRÁNEA"

	para "CIUDAD CELESTE -"
	line "CIUDAD CARMÍN"
	done

PokefanmRexSeenText:
	text "Mi PHANPY es el"
	line "más bonito del"
	cont "mundo."
	done

PokefanmRexBeatenText:
	text "¡Mi PHANPY!"
	done

PokefanmRexAfterBattleText:
	text "¡Mira qué adorable"
	line "es mi PHANPY!"

	para "¿No es tan bonito"
	line "que te emociona?"
	done

PokefanmAllanSeenText:
	text "Mi TEDDIURSA es el"
	line "más bonito del"
	cont "mundo."
	done

PokefanmAllanBeatenText:
	text "¡Mi TEDDIURSA!"
	done

PokefanmAllanAfterBattleText:
	text "¡Mira qué adorable"
	line "es mi TEDDIURSA!"

	para "¿No es tan bonito"
	line "que te emociona?"
	done

Route6_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event 17,  3, ROUTE_6_UNDERGROUND_PATH_ENTRANCE, 1
	warp_event  6,  1, ROUTE_6_SAFFRON_GATE, 3

	db 0 ; coord events

	db 1 ; bg events
	bg_event 19,  5, BGEVENT_READ, Route6UndergroundPathSign

	db 3 ; object events
	object_event 17,  4, SPRITE_POKEFAN_M, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 2, Route6PokefanMScript, EVENT_ROUTE_5_6_POKEFAN_M_BLOCKS_UNDERGROUND_PATH
	object_event  9, 12, SPRITE_POKEFAN_M, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 0, TrainerPokefanmRex, -1
	object_event 10, 12, SPRITE_POKEFAN_M, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 0, TrainerPokefanmAllan, -1
