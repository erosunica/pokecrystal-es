GOLDENRODDEPTSTORE6F_FRESH_WATER_PRICE EQU 200
GOLDENRODDEPTSTORE6F_SODA_POP_PRICE    EQU 300
GOLDENRODDEPTSTORE6F_LEMONADE_PRICE    EQU 350

	object_const_def ; object_event constants
	const GOLDENRODDEPTSTORE6F_LASS
	const GOLDENRODDEPTSTORE6F_SUPER_NERD

GoldenrodDeptStore6F_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

GoldenrodVendingMachine:
	opentext
	writetext GoldenrodVendingText
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
	checkmoney YOUR_MONEY, GOLDENRODDEPTSTORE6F_FRESH_WATER_PRICE
	ifequal HAVE_LESS, .NotEnoughMoney
	giveitem FRESH_WATER
	iffalse .NotEnoughSpace
	takemoney YOUR_MONEY, GOLDENRODDEPTSTORE6F_FRESH_WATER_PRICE
	getitemname STRING_BUFFER_3, FRESH_WATER
	sjump .VendItem

.SodaPop:
	checkmoney YOUR_MONEY, GOLDENRODDEPTSTORE6F_SODA_POP_PRICE
	ifequal HAVE_LESS, .NotEnoughMoney
	giveitem SODA_POP
	iffalse .NotEnoughSpace
	takemoney YOUR_MONEY, GOLDENRODDEPTSTORE6F_SODA_POP_PRICE
	getitemname STRING_BUFFER_3, SODA_POP
	sjump .VendItem

.Lemonade:
	checkmoney YOUR_MONEY, GOLDENRODDEPTSTORE6F_LEMONADE_PRICE
	ifequal HAVE_LESS, .NotEnoughMoney
	giveitem LEMONADE
	iffalse .NotEnoughSpace
	takemoney YOUR_MONEY, GOLDENRODDEPTSTORE6F_LEMONADE_PRICE
	getitemname STRING_BUFFER_3, LEMONADE
	sjump .VendItem

.VendItem:
	pause 10
	playsound SFX_ENTER_DOOR
	writetext GoldenrodClangText
	promptbutton
	itemnotify
	sjump .Start

.NotEnoughMoney:
	writetext GoldenrodVendingNoMoneyText
	waitbutton
	sjump .Start

.NotEnoughSpace:
	writetext GoldenrodVendingNoSpaceText
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

GoldenrodDeptStore6FLassScript:
	jumptextfaceplayer GoldenrodDeptStore6FLassText

GoldenrodDeptStore6FSuperNerdScript:
	jumptextfaceplayer GoldenrodDeptStore6FSuperNerdText

GoldenrodDeptStore6FDirectory:
	jumptext GoldenrodDeptStore6FDirectoryText

GoldenrodDeptStore6FElevatorButton:
	jumpstd elevatorbutton

GoldenrodVendingText:
	text "¡Una máquina"
	line "expendedora!"
	done

GoldenrodClangText:
	text "¡Clang! ¡Salió"
	line "una lata de"
	cont "@"
	text_ram wStringBuffer3
	text "!"
	done

GoldenrodVendingNoMoneyText:
	text "¡Uups! No tienes"
	line "bastante dinero."
	done

GoldenrodVendingNoSpaceText:
	text "No hay sitio para"
	line "nada más."
	done

GoldenrodDeptStore6FLassText:
	text "¿Escuchas el CANAL"
	line "de la SUERTE?"

	para "Si quieres ganar,"
	line "cambia #MON con"

	para "mucha gente para"
	line "conseguir muchos"
	cont "números ID."
	done

GoldenrodDeptStore6FSuperNerdText:
	text "Si te cansas,"
	line "prueba las bebidas"
	cont "de las máquinas."

	para "A tus #MON les"
	line "gustarán."
	done

GoldenrodDeptStore6FDirectoryText:
	text "¡Descansa de las"
	line "compras!"

	para "P5 PLAZA TRANQUILA"
	done

GoldenrodDeptStore6F_MapEvents:
	db 0, 0 ; filler

	db 3 ; warp events
	warp_event 15,  0, GOLDENROD_DEPT_STORE_5F, 2
	warp_event  2,  0, GOLDENROD_DEPT_STORE_ELEVATOR, 1
	warp_event 13,  0, GOLDENROD_DEPT_STORE_ROOF, 1

	db 0 ; coord events

	db 6 ; bg events
	bg_event 14,  0, BGEVENT_READ, GoldenrodDeptStore6FDirectory
	bg_event  3,  0, BGEVENT_READ, GoldenrodDeptStore6FElevatorButton
	bg_event  8,  1, BGEVENT_UP, GoldenrodVendingMachine
	bg_event  9,  1, BGEVENT_UP, GoldenrodVendingMachine
	bg_event 10,  1, BGEVENT_UP, GoldenrodVendingMachine
	bg_event 11,  1, BGEVENT_UP, GoldenrodVendingMachine

	db 2 ; object events
	object_event 10,  2, SPRITE_LASS, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 1, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, GoldenrodDeptStore6FLassScript, -1
	object_event  8,  2, SPRITE_SUPER_NERD, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, GoldenrodDeptStore6FSuperNerdScript, -1
