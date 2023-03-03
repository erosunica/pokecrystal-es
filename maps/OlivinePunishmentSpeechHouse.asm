	object_const_def ; object_event constants
	const OLIVINEPUNISHMENTSPEECHHOUSE_POKEFAN_M
	const OLIVINEPUNISHMENTSPEECHHOUSE_LASS

OlivinePunishmentSpeechHouse_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

OlivinePunishmentSpeechHouseDad:
	jumptextfaceplayer OlivinePunishmentSpeechHouseDadText

OlivinePunishmentSpeechHouseDaughter:
	jumptextfaceplayer OlivinePunishmentSpeechHouseDaughterText

OlivinePunishmentSpeechHouseBookshelf2:
	jumpstd picturebookshelf

OlivinePunishmentSpeechHouseBookshelf1:
	jumpstd magazinebookshelf

OlivinePunishmentSpeechHouseDadText:
	text "De camino a CIUDAD"
	line "ORQUÍDEA, hay"

	para "cuatro islas"
	line "desiertas."

	para "¡Los niños malos"
	line "van a las islas"
	cont "como castigo!"
	done

OlivinePunishmentSpeechHouseDaughterText:
	text "Cuando me meto en"
	line "líos, papá siempre"
	cont "se enfada."
	done

OlivinePunishmentSpeechHouse_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event  2,  7, OLIVINE_CITY, 5
	warp_event  3,  7, OLIVINE_CITY, 5

	db 0 ; coord events

	db 2 ; bg events
	bg_event  0,  1, BGEVENT_READ, OlivinePunishmentSpeechHouseBookshelf1
	bg_event  1,  1, BGEVENT_READ, OlivinePunishmentSpeechHouseBookshelf2

	db 2 ; object events
	object_event  1,  2, SPRITE_POKEFAN_M, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, OlivinePunishmentSpeechHouseDad, -1
	object_event  5,  5, SPRITE_LASS, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 2, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, OlivinePunishmentSpeechHouseDaughter, -1
