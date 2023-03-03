	object_const_def ; object_event constants
	const GOLDENRODDEPTSTORE1F_RECEPTIONIST
	const GOLDENRODDEPTSTORE1F_POKEFAN_F
	const GOLDENRODDEPTSTORE1F_BUG_CATCHER
	const GOLDENRODDEPTSTORE1F_GENTLEMAN

GoldenrodDeptStore1F_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

GoldenrodDeptStore1FReceptionistScript:
	jumptextfaceplayer GoldenrodDeptStore1FReceptionistText

GoldenrodDeptStore1FGentlemanScript:
	jumptextfaceplayer GoldenrodDeptStore1FGentlemanText

GoldenrodDeptStore1FPokefanFScript:
	jumptextfaceplayer GoldenrodDeptStore1FPokefanFText

GoldenrodDeptStore1FBugCatcherScript:
	jumptextfaceplayer GoldenrodDeptStore1FBugCatcherText

GoldenrodDeptStore1FDirectory:
	jumptext GoldenrodDeptStore1FDirectoryText

GoldenrodDeptStore1FElevatorButton:
	jumpstd elevatorbutton

GoldenrodDeptStore1FReceptionistText:
	text "Éste es el CENTRO"
	line "COMERCIAL de"
	cont "CIUDAD TRIGAL."
	done

GoldenrodDeptStore1FGentlemanText:
	text "El CENTRO"
	line "COMERCIAL tiene"
	cont "buenos artículos."

	para "Pero algunos"
	line "objetos sólo se"

	para "consiguen en el"
	line "CASINO."
	done

GoldenrodDeptStore1FPokefanFText:
	text "¡Me encanta ir de"
	line "compras!"
	done

GoldenrodDeptStore1FBugCatcherText:
	text "Mamá es experta en"
	line "conseguir gangas."

	para "Siempre compra"
	line "cosas a precios"
	cont "más bajos."
	done

GoldenrodDeptStore1FDirectoryText:
	text "PB INFORMACIÓN"

	para "P1 TIENDA DE"
	line "   ENTRENADORES"

	para "P2 ARTÍCULOS"
	line "   DE COMBATE"

	para "P3 BOTIQUÍN"

	para "P4 TIENDA DE MT"

	para "P5 PLAZA TRANQUILA"

	para "MIRADOR"
	done

GoldenrodDeptStore1F_MapEvents:
	db 0, 0 ; filler

	db 4 ; warp events
	warp_event  7,  7, GOLDENROD_CITY, 9
	warp_event  8,  7, GOLDENROD_CITY, 9
	warp_event 15,  0, GOLDENROD_DEPT_STORE_2F, 2
	warp_event  2,  0, GOLDENROD_DEPT_STORE_ELEVATOR, 1

	db 0 ; coord events

	db 2 ; bg events
	bg_event 14,  0, BGEVENT_READ, GoldenrodDeptStore1FDirectory
	bg_event  3,  0, BGEVENT_READ, GoldenrodDeptStore1FElevatorButton

	db 4 ; object events
	object_event 10,  1, SPRITE_RECEPTIONIST, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, GoldenrodDeptStore1FReceptionistScript, -1
	object_event  5,  4, SPRITE_POKEFAN_F, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, GoldenrodDeptStore1FPokefanFScript, -1
	object_event  5,  5, SPRITE_BUG_CATCHER, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 1, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, GoldenrodDeptStore1FBugCatcherScript, -1
	object_event 11,  5, SPRITE_GENTLEMAN, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, GoldenrodDeptStore1FGentlemanScript, -1
