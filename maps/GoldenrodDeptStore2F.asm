	object_const_def ; object_event constants
	const GOLDENRODDEPTSTORE2F_CLERK1
	const GOLDENRODDEPTSTORE2F_CLERK2
	const GOLDENRODDEPTSTORE2F_YOUNGSTER
	const GOLDENRODDEPTSTORE2F_COOLTRAINER_F
	const GOLDENRODDEPTSTORE2F_GENTLEMAN

GoldenrodDeptStore2F_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

GoldenrodDeptStore2FClerk1Script:
	faceplayer
	opentext
	pokemart MARTTYPE_STANDARD, MART_GOLDENROD_2F_1
	closetext
	end

GoldenrodDeptStore2FClerk2Script:
	faceplayer
	opentext
	pokemart MARTTYPE_STANDARD, MART_GOLDENROD_2F_2
	closetext
	end

GoldenrodDeptStore2FYoungsterScript:
	jumptextfaceplayer GoldenrodDeptStore2FYoungsterText

GoldenrodDeptStore2FCooltrainerFScript:
	jumptextfaceplayer GoldenrodDeptStore2FCooltrainerFText

GoldenrodDeptStore2FGentlemanScript:
	jumptextfaceplayer GoldenrodDeptStore2FGentlemanText

GoldenrodDeptStore2FDirectory:
	jumptext GoldenrodDeptStore2FDirectoryText

GoldenrodDeptStore2FElevatorButton:
	jumpstd elevatorbutton

GoldenrodDeptStore2FUnusedText1:
; unused
	text "Vendemos objetos"
	line "para los #MON."

	para "Esto es un regalo."
	line "Dáselo a un"
	cont "#MON."
	done

GoldenrodDeptStore2FUnusedText2:
; unused
	text "Si equipas a tus"
	line "#MON con"

	para "objetos, podrías"
	line "salir ganando en"
	cont "el combate."
	done

GoldenrodDeptStore2FYoungsterText:
	text "El #GEAR puede"
	line "almacenar hasta"
	cont "diez números."

	para "Es difícil decidir"
	line "qué números debes"
	cont "guardar."
	done

GoldenrodDeptStore2FCooltrainerFText:
	text "Conseguí mi ABRA"
	line "en el CASINO."

	para "Ahora es mi mejor"
	line "compañero."
	done

GoldenrodDeptStore2FGentlemanText:
	text "Este CENTRO"
	line "COMERCIAL indica"

	para "que CIUDAD TRIGAL"
	line "es muy grande."

	para "Su gama de"
	line "productos no tiene"
	cont "rival."
	done

GoldenrodDeptStore2FDirectoryText:
	text "Tu Compañero"
	line "de Viaje"

	para "P1 TIENDA DE"
	line "   ENTRENADORES"
	done

GoldenrodDeptStore2F_MapEvents:
	db 0, 0 ; filler

	db 3 ; warp events
	warp_event 12,  0, GOLDENROD_DEPT_STORE_3F, 1
	warp_event 15,  0, GOLDENROD_DEPT_STORE_1F, 3
	warp_event  2,  0, GOLDENROD_DEPT_STORE_ELEVATOR, 1

	db 0 ; coord events

	db 2 ; bg events
	bg_event 14,  0, BGEVENT_READ, GoldenrodDeptStore2FDirectory
	bg_event  3,  0, BGEVENT_READ, GoldenrodDeptStore2FElevatorButton

	db 5 ; object events
	object_event 13,  5, SPRITE_CLERK, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, GoldenrodDeptStore2FClerk1Script, -1
	object_event 13,  6, SPRITE_CLERK, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, GoldenrodDeptStore2FClerk2Script, -1
	object_event  9,  6, SPRITE_YOUNGSTER, SPRITEMOVEDATA_WALK_UP_DOWN, 0, 1, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, GoldenrodDeptStore2FYoungsterScript, -1
	object_event  6,  2, SPRITE_COOLTRAINER_F, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 2, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, GoldenrodDeptStore2FCooltrainerFScript, -1
	object_event  2,  6, SPRITE_GENTLEMAN, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, GoldenrodDeptStore2FGentlemanScript, -1
