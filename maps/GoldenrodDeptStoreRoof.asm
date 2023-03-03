	object_const_def ; object_event constants
	const GOLDENRODDEPTSTOREROOF_CLERK
	const GOLDENRODDEPTSTOREROOF_POKEFAN_F
	const GOLDENRODDEPTSTOREROOF_FISHER
	const GOLDENRODDEPTSTOREROOF_TWIN
	const GOLDENRODDEPTSTOREROOF_SUPER_NERD
	const GOLDENRODDEPTSTOREROOF_POKEFAN_M
	const GOLDENRODDEPTSTOREROOF_TEACHER
	const GOLDENRODDEPTSTOREROOF_BUG_CATCHER

GoldenrodDeptStoreRoof_MapScripts:
	db 0 ; scene scripts

	db 2 ; callbacks
	callback MAPCALLBACK_TILES, .CheckSaleChangeBlock
	callback MAPCALLBACK_OBJECTS, .CheckSaleChangeClerk

.CheckSaleChangeBlock:
	checkflag ENGINE_GOLDENROD_DEPT_STORE_SALE_IS_ON
	iftrue .SaleIsOn
	return

.SaleIsOn:
	changeblock 0, 2, $3f ; cardboard boxes
	changeblock 0, 4, $0f ; vendor booth
	return

.CheckSaleChangeClerk:
	checkflag ENGINE_GOLDENROD_DEPT_STORE_SALE_IS_ON
	iftrue .ChangeClerk
	setevent EVENT_GOLDENROD_SALE_OFF
	clearevent EVENT_GOLDENROD_SALE_ON
	return

.ChangeClerk:
	clearevent EVENT_GOLDENROD_SALE_OFF
	setevent EVENT_GOLDENROD_SALE_ON
	return

GoldenrodDeptStoreRoofClerkScript:
	opentext
	pokemart MARTTYPE_ROOFTOP, 0
	closetext
	end

GoldenrodDeptStoreRoofPokefanFScript:
	jumptextfaceplayer GoldenrodDeptStoreRoofPokefanFText

GoldenrodDeptStoreRoofFisherScript:
	faceplayer
	opentext
	writetext GoldenrodDeptStoreRoofFisherText
	waitbutton
	closetext
	turnobject GOLDENRODDEPTSTOREROOF_FISHER, UP
	end

GoldenrodDeptStoreRoofTwinScript:
	jumptextfaceplayer GoldenrodDeptStoreRoofTwinText

GoldenrodDeptStoreRoofSuperNerdScript:
	opentext
	writetext GoldenrodDeptStoreRoofSuperNerdOhWowText
	waitbutton
	closetext
	turnobject GOLDENRODDEPTSTOREROOF_SUPER_NERD, UP
	opentext
	writetext GoldenrodDeptStoreRoofSuperNerdQuitBotheringMeText
	waitbutton
	closetext
	turnobject GOLDENRODDEPTSTOREROOF_SUPER_NERD, RIGHT
	end

GoldenrodDeptStoreRoofPokefanMScript:
	jumptextfaceplayer GoldenrodDeptStoreRoofPokefanMText

GoldenrodDeptStoreRoofTeacherScript:
	jumptextfaceplayer GoldenrodDeptStoreRoofTeacherText

GoldenrodDeptStoreRoofBugCatcherScript:
	jumptextfaceplayer GoldenrodDeptStoreRoofBugCatcherText

Binoculars1:
	jumptext Binoculars1Text

Binoculars2:
	jumptext Binoculars2Text

Binoculars3:
	jumptext Binoculars3Text

PokeDollVendingMachine:
	jumptext PokeDollVendingMachineText

GoldenrodDeptStoreRoofPokefanFText:
	text "Uf, estoy cansada."
	line "A veces vengo a la"

	para "azotea a tomarme"
	line "un respiro."
	done

GoldenrodDeptStoreRoofFisherText:
	text "¿Perdona? ¿Quién"
	line "dijo que un adulto"

	para "no podía meterse"
	line "en esto?"

	para "¡Voy a volver"
	line "todos los días"

	para "para coleccionar"
	line "todos los muñecos!"
	done

GoldenrodDeptStoreRoofTwinText:
	text "Aquí suelen tener"
	line "gangas a menudo."
	done

GoldenrodDeptStoreRoofSuperNerdOhWowText:
	text "¡Oh, uau!"
	done

GoldenrodDeptStoreRoofSuperNerdQuitBotheringMeText:
	text "¿Vas a dejarme"
	line "en paz?"
	done

GoldenrodDeptStoreRoofPokefanMText:
	text "Hay algo que"
	line "quiero realmente,"

	para "pero no tengo el"
	line "dinero suficiente…"

	para "Es posible que"
	line "venda las BAYAS"
	cont "que he recogido…"
	done

GoldenrodDeptStoreRoofTeacherText:
	text "¡Oh, todo está tan"
	line "barato!"

	para "¡Compré tanto que"
	line "mi MOCHILA está"
	cont "abarrotada!"
	done

GoldenrodDeptStoreRoofBugCatcherText:
	text "Mis #MON quedan"
	line "paralizados o"

	para "envenenados cuando"
	line "menos lo esperas…"

	para "Así que vine a"
	line "comprar CURA"
	cont "TOTAL."

	para "Me pregunto si"
	line "aún quedará…"
	done

Binoculars1Text:
	text "Con estos"
	line "binoculares puedo"
	cont "ver muy lejos."

	para "Puede que vea mi"
	line "propia casa."

	para "¿No es ésa del"
	line "tejado verde?"
	done

Binoculars2Text:
	text "¡Eh! ¡Hay unos"
	line "entrenadores"

	para "combatiendo en el"
	line "camino!"

	para "¡Un #MON lanzó"
	line "una ráfaga de"
	cont "hojas!"

	para "¡Me están entrando"
	line "unas ganas de"
	cont "luchar increíbles!"
	done

Binoculars3Text:
	text "Un PESCADOR atrapó"
	line "un montón de"
	cont "MAGIKARP…"

	para "¡Están SALPICANDO"
	line "todos a la vez!"

	para "¡Mira, están"
	line "salpicándolo todo!"
	done

PokeDollVendingMachineText:
	text "¿Una máquina"
	line "expendedora de"
	cont "muñecos #MON?"

	para "Echa dinero y"
	line "mueve la manivela…"

	para "Pero, si está casi"
	line "vacía…"
	done

GoldenrodDeptStoreRoof_MapEvents:
	db 0, 0 ; filler

	db 1 ; warp events
	warp_event 13,  1, GOLDENROD_DEPT_STORE_6F, 3

	db 0 ; coord events

	db 4 ; bg events
	bg_event 15,  3, BGEVENT_RIGHT, Binoculars1
	bg_event 15,  5, BGEVENT_RIGHT, Binoculars2
	bg_event 15,  6, BGEVENT_RIGHT, Binoculars3
	bg_event  3,  0, BGEVENT_UP, PokeDollVendingMachine

	db 8 ; object events
	object_event  1,  4, SPRITE_CLERK, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, GoldenrodDeptStoreRoofClerkScript, EVENT_GOLDENROD_SALE_OFF
	object_event 10,  3, SPRITE_POKEFAN_F, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 1, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, GoldenrodDeptStoreRoofPokefanFScript, -1
	object_event  2,  1, SPRITE_FISHER, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, GoldenrodDeptStoreRoofFisherScript, -1
	object_event  3,  4, SPRITE_TWIN, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, GoldenrodDeptStoreRoofTwinScript, EVENT_GOLDENROD_SALE_ON
	object_event 14,  6, SPRITE_SUPER_NERD, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, GoldenrodDeptStoreRoofSuperNerdScript, EVENT_GOLDENROD_SALE_ON
	object_event  7,  0, SPRITE_POKEFAN_M, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 1, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, GoldenrodDeptStoreRoofPokefanMScript, EVENT_GOLDENROD_SALE_OFF
	object_event  5,  3, SPRITE_TEACHER, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, GoldenrodDeptStoreRoofTeacherScript, EVENT_GOLDENROD_SALE_OFF
	object_event  1,  6, SPRITE_BUG_CATCHER, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, GoldenrodDeptStoreRoofBugCatcherScript, EVENT_GOLDENROD_SALE_OFF
