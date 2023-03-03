	object_const_def ; object_event constants
	const ROUTE38ECRUTEAKGATE_OFFICER

Route38EcruteakGate_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

Route38EcruteakGateOfficerScript:
	jumptextfaceplayer Route38EcruteakGateOfficerText

Route38EcruteakGateOfficerText:
	text "¿De dónde has"
	line "dicho que eras?"

	para "¿De PUEBLO"
	line "PRIMAVERA?"

	para "El PROF. ELM vive"
	line "por allí, ¿no?"

	para "Has recorrido un"
	line "largo camino."
	done

Route38EcruteakGate_MapEvents:
	db 0, 0 ; filler

	db 4 ; warp events
	warp_event  0,  4, ROUTE_38, 1
	warp_event  0,  5, ROUTE_38, 2
	warp_event  9,  4, ECRUTEAK_CITY, 14
	warp_event  9,  5, ECRUTEAK_CITY, 15

	db 0 ; coord events

	db 0 ; bg events

	db 1 ; object events
	object_event  5,  2, SPRITE_OFFICER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, Route38EcruteakGateOfficerScript, -1
