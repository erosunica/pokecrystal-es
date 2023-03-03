	object_const_def ; object_event constants
	const CELADONMANSIONROOF_FISHER

CeladonMansionRoof_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

CeladonMansionRoofFisherScript:
	jumptextfaceplayer CeladonMansionRoofFisherText

CeladonMansionRoofGraffiti:
	jumptext CeladonMansionRoofGraffitiText

CeladonMansionRoofFisherText:
	text "Las alturas…"
	line "¡me gustan tanto…!"

	para "¡Me atrevería a"
	line "decir que la única"

	para "cosa que ama las"
	line "alturas como yo es"
	cont "el humo!"
	done

CeladonMansionRoofGraffitiText:
	text "Hay un graffiti"
	line "en la pared…"

	para "¡<PLAYER> añadió"
	line "un bigote!"
	done

CeladonMansionRoof_MapEvents:
	db 0, 0 ; filler

	db 3 ; warp events
	warp_event  1,  1, CELADON_MANSION_3F, 1
	warp_event  6,  1, CELADON_MANSION_3F, 4
	warp_event  2,  5, CELADON_MANSION_ROOF_HOUSE, 1

	db 0 ; coord events

	db 1 ; bg events
	bg_event  6,  1, BGEVENT_LEFT, CeladonMansionRoofGraffiti

	db 1 ; object events
	object_event  7,  5, SPRITE_FISHER, SPRITEMOVEDATA_WALK_UP_DOWN, 0, 1, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, CeladonMansionRoofFisherScript, -1
