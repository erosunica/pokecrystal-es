CELADONDEPTSTORE6F_FRESH_WATER_PRICE EQU 200
CELADONDEPTSTORE6F_SODA_POP_PRICE    EQU 300
CELADONDEPTSTORE6F_LEMONADE_PRICE    EQU 350

	object_const_def ; object_event constants
	const CELADONDEPTSTORE6F_SUPER_NERD
	const CELADONDEPTSTORE6F_YOUNGSTER

CeladonDeptStore6F_MapScripts:
	db 0 ; scene scripts

	db 1 ; callbacks
	callback MAPCALLBACK_TILES, .HideRooftopStairs

.HideRooftopStairs:
	changeblock 12, 0, $03 ; wall
	return

CeladonDeptStore6FSuperNerdScript:
	jumptextfaceplayer CeladonDeptStore6FSuperNerdText

CeladonDeptStore6FYoungsterScript:
	jumptextfaceplayer CeladonDeptStore6FYoungsterText

CeladonDeptStore6FVendingMachine:
	opentext
	writetext CeladonVendingText
.Start:
	special PlaceMoneyTopRight
	loadmenu .MenuHeader
	verticalmenu
	closewindow
	ifequal 1, .FreshWater
	ifequal 2, .SodaPop
	ifequal 3, .Lemonade
	closetext
	end

.FreshWater:
	checkmoney YOUR_MONEY, CELADONDEPTSTORE6F_FRESH_WATER_PRICE
	ifequal HAVE_LESS, .NotEnoughMoney
	giveitem FRESH_WATER
	iffalse .NotEnoughSpace
	takemoney YOUR_MONEY, CELADONDEPTSTORE6F_FRESH_WATER_PRICE
	getitemname STRING_BUFFER_3, FRESH_WATER
	sjump .VendItem

.SodaPop:
	checkmoney YOUR_MONEY, CELADONDEPTSTORE6F_SODA_POP_PRICE
	ifequal HAVE_LESS, .NotEnoughMoney
	giveitem SODA_POP
	iffalse .NotEnoughSpace
	takemoney YOUR_MONEY, CELADONDEPTSTORE6F_SODA_POP_PRICE
	getitemname STRING_BUFFER_3, SODA_POP
	sjump .VendItem

.Lemonade:
	checkmoney YOUR_MONEY, CELADONDEPTSTORE6F_LEMONADE_PRICE
	ifequal HAVE_LESS, .NotEnoughMoney
	giveitem LEMONADE
	iffalse .NotEnoughSpace
	takemoney YOUR_MONEY, CELADONDEPTSTORE6F_LEMONADE_PRICE
	getitemname STRING_BUFFER_3, LEMONADE
	sjump .VendItem

.VendItem:
	pause 10
	playsound SFX_ENTER_DOOR
	writetext CeladonClangText
	promptbutton
	itemnotify
	sjump .Start

.NotEnoughMoney:
	writetext CeladonVendingNoMoneyText
	waitbutton
	sjump .Start

.NotEnoughSpace:
	writetext CeladonVendingNoSpaceText
	waitbutton
	sjump .Start

.MenuHeader:
	db MENU_BACKUP_TILES ; flags
	menu_coords 0, 2, SCREEN_WIDTH - 1, TEXTBOX_Y - 1
	dw .MenuData
	db 1 ; default option

.MenuData:
	db STATICMENU_CURSOR ; flags
	db 4 ; items
	db "AGUA FRESCA  200¥@"
	db "REFRESCO     300¥@"
	db "LIMONADA     350¥@"
	db "SALIR@"

CeladonDeptStore6FDirectory:
	jumptext CeladonDeptStore6FDirectoryText

; unused
CeladonDeptStore6FElevatorButton:
	jumpstd elevatorbutton

CeladonVendingText:
	text "¡Una máquina"
	line "expendedora!"
	done

CeladonClangText:
	text "¡Clang!"

	para "Salió"
	line "@"
	text_ram wStringBuffer3
	text "."
	done

CeladonVendingNoMoneyText:
	text "¡Uups, no tienes"
	line "bastantes fichas!"
	done

CeladonVendingNoSpaceText:
	text "No hay sitio"
	line "para nada más…"
	done

CeladonDeptStore6FSuperNerdText:
	text "Una máquina expen-"
	line "dedora con una"
	cont "ruleta de premios…"

	para "Nunca verás"
	line "nada igual."
	done

CeladonDeptStore6FYoungsterText:
	text "¡Auu! ¡Aquí no"
	line "hay juegos!"

	para "Quería jugar…"
	done

CeladonDeptStore6FDirectoryText:
	text "P5: AZOTEA"
	line "EXPENDEDORAS"
	done

CeladonDeptStore6F_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event 15,  0, CELADON_DEPT_STORE_5F, 2
	warp_event  2,  0, CELADON_DEPT_STORE_ELEVATOR, 1

	db 0 ; coord events

	db 6 ; bg events
	bg_event 14,  0, BGEVENT_READ, CeladonDeptStore6FDirectory
	bg_event  3,  0, BGEVENT_READ, CeladonDeptStore1FElevatorButton
	bg_event  8,  1, BGEVENT_UP, CeladonDeptStore6FVendingMachine
	bg_event  9,  1, BGEVENT_UP, CeladonDeptStore6FVendingMachine
	bg_event 10,  1, BGEVENT_UP, CeladonDeptStore6FVendingMachine
	bg_event 11,  1, BGEVENT_UP, CeladonDeptStore6FVendingMachine

	db 2 ; object events
	object_event  9,  2, SPRITE_SUPER_NERD, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, CeladonDeptStore6FSuperNerdScript, -1
	object_event 12,  5, SPRITE_YOUNGSTER, SPRITEMOVEDATA_WANDER, 2, 1, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, CeladonDeptStore6FYoungsterScript, -1
