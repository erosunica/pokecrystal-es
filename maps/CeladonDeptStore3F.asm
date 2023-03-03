	object_const_def ; object_event constants
	const CELADONDEPTSTORE3F_CLERK
	const CELADONDEPTSTORE3F_YOUNGSTER
	const CELADONDEPTSTORE3F_GAMEBOY_KID1
	const CELADONDEPTSTORE3F_GAMEBOY_KID2
	const CELADONDEPTSTORE3F_SUPER_NERD

CeladonDeptStore3F_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

CeladonDeptStore3FClerkScript:
	faceplayer
	opentext
	pokemart MARTTYPE_STANDARD, MART_CELADON_3F
	closetext
	end

CeladonDeptStore3FYoungsterScript:
	jumptextfaceplayer CeladonDeptStore3FYoungsterText

CeladonDeptStore3FGameboyKid1Script:
	faceplayer
	opentext
	writetext CeladonDeptStore3FGameboyKid1Text
	waitbutton
	closetext
	turnobject CELADONDEPTSTORE3F_GAMEBOY_KID1, DOWN
	end

CeladonDeptStore3FGameboyKid2Script:
	faceplayer
	opentext
	writetext CeladonDeptStore3FGameboyKid2Text
	waitbutton
	closetext
	turnobject CELADONDEPTSTORE3F_GAMEBOY_KID2, DOWN
	end

CeladonDeptStore3FSuperNerdScript:
	jumptextfaceplayer CeladonDeptStore3FSuperNerdText

CeladonDeptStore3FElevatorButton:
	jumpstd elevatorbutton

CeladonDeptStore3FDirectory:
	jumptext CeladonDeptStore3FDirectoryText

CeladonDeptStore3FYoungsterText:
	text "No sé en qué"
	line "#MON debería"
	cont "utilizar esta MT…"
	done

CeladonDeptStore3FGameboyKid1Text:
	text "¡Oh, oh! Cambié"
	line "mis #MON sin"

	para "quitarles la"
	line "MEJORA."
	done

CeladonDeptStore3FGameboyKid2Text:
	text "¡Sí! ¡Ya tengo"
	line "un PORYGON!"

	para "Se me dan muy mal"
	line "las tragaperras."

	para "¡Jamás ganaría"
	line "bastantes fichas!"

	para "¿Ehh…?"

	para "¡El PORYGON que he"
	line "cambiado se ha"

	para "convertido en otro"
	line "#MON!"
	done

CeladonDeptStore3FSuperNerdText:
	text "En la TIENDA DE MT"
	line "hay movimientos"
	cont "raros."
	done

CeladonDeptStore3FDirectoryText:
	text "P2: TIENDA DE MT"

	para "¡Fortalece a tus"
	line "#MON!"
	done

CeladonDeptStore3F_MapEvents:
	db 0, 0 ; filler

	db 3 ; warp events
	warp_event 12,  0, CELADON_DEPT_STORE_2F, 1
	warp_event 15,  0, CELADON_DEPT_STORE_4F, 2
	warp_event  2,  0, CELADON_DEPT_STORE_ELEVATOR, 1

	db 0 ; coord events

	db 2 ; bg events
	bg_event 14,  0, BGEVENT_READ, CeladonDeptStore3FDirectory
	bg_event  3,  0, BGEVENT_READ, CeladonDeptStore3FElevatorButton

	db 5 ; object events
	object_event  7,  1, SPRITE_CLERK, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, CeladonDeptStore3FClerkScript, -1
	object_event  6,  4, SPRITE_YOUNGSTER, SPRITEMOVEDATA_WALK_UP_DOWN, 0, 1, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, CeladonDeptStore3FYoungsterScript, -1
	object_event  9,  1, SPRITE_GAMEBOY_KID, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, CeladonDeptStore3FGameboyKid1Script, -1
	object_event 10,  1, SPRITE_GAMEBOY_KID, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, CeladonDeptStore3FGameboyKid2Script, -1
	object_event 13,  4, SPRITE_SUPER_NERD, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, CeladonDeptStore3FSuperNerdScript, -1
