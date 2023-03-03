	object_const_def ; object_event constants
	const CERULEANTRADESPEECHHOUSE_GRANNY
	const CERULEANTRADESPEECHHOUSE_GRAMPS
	const CERULEANTRADESPEECHHOUSE_RHYDON
	const CERULEANTRADESPEECHHOUSE_ZUBAT

CeruleanTradeSpeechHouse_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

CeruleanTradeSpeechHouseGrannyScript:
	jumptextfaceplayer CeruleanTradeSpeechHouseGrannyText

CeruleanTradeSpeechHouseGrampsScript:
	jumptextfaceplayer CeruleanTradeSpeechHouseGrampsText

CeruleanTradeSpeechHouseRhydonScript:
	opentext
	writetext CeruleanTradeSpeechHouseRhydonText
	cry KANGASKHAN
	waitbutton
	closetext
	end

CeruleanTradeSpeechHouseZubatScript:
	opentext
	writetext CeruleanTradeSpeechHouseZubatText
	cry ZUBAT
	waitbutton
	closetext
	end

CeruleanTradeSpeechHouseGrannyText:
	text "Mi marido vive"
	line "feliz con los"

	para "#MON que ha"
	line "intercambiado."
	done

CeruleanTradeSpeechHouseGrampsText:
	text "Soy tan feliz…"
	done

CeruleanTradeSpeechHouseRhydonText:
	text "KANGASKHAN:"
	line "Kangas, kangas."
	done

CeruleanTradeSpeechHouseZubatText:
	text "ZUBAT: Zu, zubaa."
	done

CeruleanTradeSpeechHouse_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event  2,  7, CERULEAN_CITY, 3
	warp_event  3,  7, CERULEAN_CITY, 3

	db 0 ; coord events

	db 0 ; bg events

	db 4 ; object events
	object_event  2,  4, SPRITE_GRANNY, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, CeruleanTradeSpeechHouseGrannyScript, -1
	object_event  1,  2, SPRITE_GRAMPS, SPRITEMOVEDATA_WANDER, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, CeruleanTradeSpeechHouseGrampsScript, -1
	object_event  5,  2, SPRITE_RHYDON, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, CeruleanTradeSpeechHouseRhydonScript, -1
	object_event  5,  6, SPRITE_ZUBAT, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, CeruleanTradeSpeechHouseZubatScript, -1
