ROUTE39FARMHOUSE_MILK_PRICE EQU 500

	object_const_def ; object_event constants
	const ROUTE39FARMHOUSE_POKEFAN_M
	const ROUTE39FARMHOUSE_POKEFAN_F

Route39Farmhouse_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

PokefanM_DairyFarmer:
	faceplayer
	opentext
	checkevent EVENT_HEALED_MOOMOO
	iftrue FarmerMScript_SellMilk
	writetext FarmerMText_SickCow
	waitbutton
	closetext
	setevent EVENT_TALKED_TO_FARMER_ABOUT_MOOMOO
	end

FarmerMScript_SellMilk:
	checkitem MOOMOO_MILK
	iftrue FarmerMScript_Milking
	writetext FarmerMText_BuyMilk
	special PlaceMoneyTopRight
	yesorno
	iffalse FarmerMScript_NoSale
	checkmoney YOUR_MONEY, ROUTE39FARMHOUSE_MILK_PRICE
	ifequal HAVE_LESS, FarmerMScript_NoMoney
	giveitem MOOMOO_MILK
	iffalse FarmerMScript_NoRoom
	takemoney YOUR_MONEY, ROUTE39FARMHOUSE_MILK_PRICE
	special PlaceMoneyTopRight
	waitsfx
	playsound SFX_TRANSACTION
	writetext FarmerMText_GotMilk
	promptbutton
	itemnotify
	closetext
	end

FarmerMScript_NoMoney:
	writetext FarmerMText_NoMoney
	waitbutton
	closetext
	end

FarmerMScript_NoRoom:
	writetext FarmerMText_NoRoom
	waitbutton
	closetext
	end

FarmerMScript_NoSale:
	writetext FarmerMText_NoSale
	waitbutton
	closetext
	end

FarmerMScript_Milking:
	writetext FarmerMText_Milking
	waitbutton
	closetext
	end

PokefanF_SnoreFarmer:
	faceplayer
	opentext
	checkevent EVENT_GOT_TM13_SNORE_FROM_MOOMOO_FARM
	iftrue FarmerFScript_GotSnore
	checkevent EVENT_HEALED_MOOMOO
	iftrue FarmerFScript_GiveSnore
	writetext FarmerFText_InTrouble
	waitbutton
	closetext
	end

FarmerFScript_GiveSnore:
	writetext FarmerFText_HealedMiltank
	promptbutton
	verbosegiveitem TM_SNORE
	iffalse FarmerFScript_NoRoomForSnore
	setevent EVENT_GOT_TM13_SNORE_FROM_MOOMOO_FARM
FarmerFScript_GotSnore:
	writetext FarmerFText_SnoreSpeech
	waitbutton
FarmerFScript_NoRoomForSnore:
	closetext
	end

FarmhouseBookshelf:
	jumpstd picturebookshelf

FarmerMText_SickCow:
	text "Mi MUU-MUU ya no"
	line "me da leche."

	para "La leche de esta"
	line "GRANJA es famosa."

	para "Casi todos"
	line "quieren probarla."

	para "Supongo que si le"
	line "doy muchas BAYAS"

	para "me dará mucha"
	line "leche."
	done

FarmerMText_BuyMilk:
	text "¿Te gusta mi LECHE"
	line "MU-MU?"

	para "Es mi orgullo y mi"
	line "alegría."

	para "¡Dásela a los"
	line "#MON para"
	cont "restaurar sus PS!"

	para "Tuya es por sólo"
	line "500¥."
	done

FarmerMText_GotMilk:
	text "¡Toma! ¡Bébetela"
	line "y disfruta!"
	done

FarmerMText_NoMoney:
	text "Lo siento."
	line "¡Si no hay dinero,"
	cont "no hay trato!"
	done

FarmerMText_NoRoom:
	text "Vaya, tu MOCHILA"
	line "está llena."
	done

FarmerMText_NoSale:
	text "¿No la quieres?"
	line "Vuelve otro día."
	done

FarmerMText_Milking:
	text "Mejor que me vaya"
	line "a ordeñar."
	done

FarmerFText_InTrouble:
	text "Nuestra leche"
	line "llega hasta KANTO."

	para "Así que si nuestra"
	line "MUU-MUU no nos da"

	para "leche, tendremos"
	line "problemas."
	done

FarmerFText_HealedMiltank:
	text "Has curado a"
	line "nuestra MUU-MUU."

	para "Ya vuelve a dar"
	line "LECHE MU-MU."

	para "Aquí tienes algo"
	line "que te ayudará."
	done

Text_ReceivedTM13:
	text "<PLAYER> recibió"
	line "MT13."
	done

FarmerFText_SnoreSpeech:
	text "Esto es RONQUIDO."

	para "Es un movimiento"
	line "raro que sólo"

	para "funciona cuando el"
	line "#MON duerme."

	para "Mejor que pienses"
	line "cómo vas a"
	cont "utilizarlo."
	done

Route39Farmhouse_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event  2,  7, ROUTE_39, 2
	warp_event  3,  7, ROUTE_39, 2

	db 0 ; coord events

	db 2 ; bg events
	bg_event  0,  1, BGEVENT_READ, FarmhouseBookshelf
	bg_event  1,  1, BGEVENT_READ, FarmhouseBookshelf

	db 2 ; object events
	object_event  3,  2, SPRITE_POKEFAN_M, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, PokefanM_DairyFarmer, -1
	object_event  5,  4, SPRITE_POKEFAN_F, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, PokefanF_SnoreFarmer, -1
