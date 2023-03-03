	object_const_def ; object_event constants
	const CERULEANPOLICESTATION_FISHING_GURU
	const CERULEANPOLICESTATION_POKEFAN_F
	const CERULEANPOLICESTATION_DIGLETT

CeruleanPoliceStation_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

CeruleanPoliceStationFishingGuruScript:
	jumptextfaceplayer CeruleanPoliceStationFishingGuruText

CeruleanPoliceStationPokefanFScript:
	jumptextfaceplayer CeruleanPoliceStationPokefanFText

CeruleanDiglett:
	opentext
	writetext CeruleanDiglettText
	cry DIGLETT
	waitbutton
	closetext
	end

CeruleanPoliceStationFishingGuruText:
	text "Dicen que hay un"
	line "tipo sospechoso"
	cont "merodeando."

	para "Si resulta ser el"
	line "ladrón, le"
	cont "detendré."
	done

CeruleanPoliceStationPokefanFText:
	text "Ya nos atracaron"
	line "antes."
	done

CeruleanDiglettText:
	text "DIGLETT: Dig, dig."
	done

CeruleanPoliceStation_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event  2,  7, CERULEAN_CITY, 2
	warp_event  3,  7, CERULEAN_CITY, 2

	db 0 ; coord events

	db 0 ; bg events

	db 3 ; object events
	object_event  5,  1, SPRITE_FISHING_GURU, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, CeruleanPoliceStationFishingGuruScript, -1
	object_event  5,  4, SPRITE_POKEFAN_F, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, CeruleanPoliceStationPokefanFScript, -1
	object_event  3,  5, SPRITE_DIGLETT, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, CeruleanDiglett, -1
