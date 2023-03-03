	object_const_def ; object_event constants
	const CELADONDEPTSTORE2F_CLERK1
	const CELADONDEPTSTORE2F_CLERK2
	const CELADONDEPTSTORE2F_POKEFAN_M
	const CELADONDEPTSTORE2F_YOUNGSTER

CeladonDeptStore2F_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

CeladonDeptStore2FClerk1Script:
	faceplayer
	opentext
	pokemart MARTTYPE_STANDARD, MART_CELADON_2F_1
	closetext
	end

CeladonDeptStore2FClerk2Script:
	faceplayer
	opentext
	pokemart MARTTYPE_STANDARD, MART_CELADON_2F_2
	closetext
	end

CeladonDeptStore2FPokefanMScript:
	jumptextfaceplayer CeladonDeptStore2FPokefanMText

CeladonDeptStore2FYoungsterScript:
	jumptextfaceplayer CeladonDeptStore2FYoungsterText

CeladonDeptStore2FDirectory:
	jumptext CeladonDeptStore2FDirectoryText

CeladonDeptStore2FElevatorButton:
	jumpstd elevatorbutton

CeladonDeptStore2FPokefanMText:
	text "Hace poco que soy"
	line "entrenador. Mi"

	para "hijo me animó a"
	line "serlo."

	para "Estoy impresionado"
	line "por la cantidad de"

	para "objetos útiles"
	line "que hay."
	done

CeladonDeptStore2FYoungsterText:
	text "A mi padre le está"
	line "costando aprender"

	para "los nombres de los"
	line "objetos y cómo se"

	para "supone que debe"
	line "utilizarlos…"
	done

CeladonDeptStore2FDirectoryText:
	text "¡Objetos de máxima"
	line "calidad para"
	cont "entrenadores!"

	para "P1: TIENDA DE"
	line "    ENTRENADORES"
	done

CeladonDeptStore2F_MapEvents:
	db 0, 0 ; filler

	db 3 ; warp events
	warp_event 12,  0, CELADON_DEPT_STORE_3F, 1
	warp_event 15,  0, CELADON_DEPT_STORE_1F, 3
	warp_event  2,  0, CELADON_DEPT_STORE_ELEVATOR, 1

	db 0 ; coord events

	db 2 ; bg events
	bg_event 14,  0, BGEVENT_READ, CeladonDeptStore2FDirectory
	bg_event  3,  0, BGEVENT_READ, CeladonDeptStore2FElevatorButton

	db 4 ; object events
	object_event 13,  5, SPRITE_CLERK, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, CeladonDeptStore2FClerk1Script, -1
	object_event 14,  5, SPRITE_CLERK, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, CeladonDeptStore2FClerk2Script, -1
	object_event  5,  2, SPRITE_POKEFAN_M, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, CeladonDeptStore2FPokefanMScript, -1
	object_event  6,  2, SPRITE_YOUNGSTER, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, CeladonDeptStore2FYoungsterScript, -1
