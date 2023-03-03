	object_const_def ; object_event constants
	const ECRUTEAKLUGIASPEECHHOUSE_GRAMPS
	const ECRUTEAKLUGIASPEECHHOUSE_YOUNGSTER

EcruteakLugiaSpeechHouse_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

EcruteakLugiaSpeechHouseGrampsScript:
	jumptextfaceplayer EcruteakLugiaSpeechHouseGrampsText

EcruteakLugiaSpeechHouseYoungsterScript:
	jumptextfaceplayer EcruteakLugiaSpeechHouseYoungsterText

LugiaSpeechHouseRadio:
	jumpstd radio2

EcruteakLugiaSpeechHouseGrampsText:
	text "Sucedió cuando era"
	line "joven."

	para "El cielo se oscu-"
	line "reció de repente."

	para "Un enorme #MON"
	line "estaba tapando el"
	cont "sol."

	para "Me pregunto qué"
	line "sería ese #MON,"

	para "mezcla de pájaro y"
	line "dragón."
	done

EcruteakLugiaSpeechHouseYoungsterText:
	text "¿Existe un #MON"
	line "tan grande? Si"

	para "existe, debe de"
	line "ser muy fuerte."
	done

EcruteakLugiaSpeechHouse_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event  3,  7, ECRUTEAK_CITY, 7
	warp_event  4,  7, ECRUTEAK_CITY, 7

	db 0 ; coord events

	db 1 ; bg events
	bg_event  2,  1, BGEVENT_READ, LugiaSpeechHouseRadio

	db 2 ; object events
	object_event  2,  3, SPRITE_GRAMPS, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, EcruteakLugiaSpeechHouseGrampsScript, -1
	object_event  5,  4, SPRITE_YOUNGSTER, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, EcruteakLugiaSpeechHouseYoungsterScript, -1
