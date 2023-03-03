	object_const_def ; object_event constants
	const GOLDENRODFLOWERSHOP_TEACHER
	const GOLDENRODFLOWERSHOP_FLORIA

GoldenrodFlowerShop_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

FlowerShopTeacherScript:
	checkevent EVENT_FOUGHT_SUDOWOODO
	iftrue .Lalala
	checkevent EVENT_GOT_SQUIRTBOTTLE
	iftrue .GotSquirtbottle
	checkevent EVENT_MET_FLORIA
	iffalse .HaventMetFloria
	checkevent EVENT_TALKED_TO_FLORIA_AT_FLOWER_SHOP
	iffalse .Lalala
	checkflag ENGINE_PLAINBADGE
	iffalse .NoPlainBadge
	faceplayer
	opentext
	writetext GoldenrodFlowerShopTeacherHeresTheSquirtbottleText
	promptbutton
	verbosegiveitem SQUIRTBOTTLE
	setevent EVENT_GOT_SQUIRTBOTTLE
	closetext
	setevent EVENT_FLORIA_AT_SUDOWOODO
	clearevent EVENT_FLORIA_AT_FLOWER_SHOP
	end

.Lalala:
	turnobject GOLDENRODFLOWERSHOP_TEACHER, LEFT
	opentext
	writetext GoldenrodFlowerShopTeacherLalalaHavePlentyOfWaterText
	waitbutton
	closetext
	end

.GotSquirtbottle:
	jumptextfaceplayer GoldenrodFlowerShopTeacherDontDoAnythingDangerousText

.NoPlainBadge:
	jumptextfaceplayer GoldenrodFlowerShopTeacherAskWantToBorrowWaterBottleText

.HaventMetFloria:
	jumptextfaceplayer GoldenrodFlowerShopTeacherMySisterWentToSeeWigglyTreeRoute36Text

FlowerShopFloriaScript:
	faceplayer
	opentext
	checkevent EVENT_FOUGHT_SUDOWOODO
	iftrue .FoughtSudowoodo
	checkevent EVENT_GOT_SQUIRTBOTTLE
	iftrue .GotSquirtbottle
	writetext GoldenrodFlowerShopFloriaWonderIfSisWillLendWaterBottleText
	waitbutton
	closetext
	setevent EVENT_TALKED_TO_FLORIA_AT_FLOWER_SHOP
	setevent EVENT_FLORIA_AT_FLOWER_SHOP
	clearevent EVENT_FLORIA_AT_SUDOWOODO
	end

.GotSquirtbottle:
	writetext GoldenrodFlowerShopFloriaYouBeatWhitneyText
	waitbutton
	closetext
	end

.FoughtSudowoodo:
	writetext GoldenrodFlowerShopFloriaItReallyWasAMonText
	waitbutton
	closetext
	end

FlowerShopShelf1:
; unused
	jumpstd picturebookshelf

FlowerShopShelf2:
; unused
	jumpstd magazinebookshelf

FlowerShopRadio:
; unused
	jumpstd radio2

GoldenrodFlowerShopTeacherMySisterWentToSeeWigglyTreeRoute36Text:
	text "¿Has visto ese"
	line "extraño árbol que"

	para "crece en la RUTA"
	line "36?"

	para "Mi hermana sintió"
	line "curiosidad y salió"
	cont "a verlo…"

	para "Estoy preocupada…"
	line "¿No es peligroso?"
	done

GoldenrodFlowerShopTeacherAskWantToBorrowWaterBottleText:
	text "¿Quieres llevarte"
	line "la REGADERA? No"

	para "quiero que cometas"
	line "ninguna impruden-"
	cont "cia con ella."
	done

GoldenrodFlowerShopTeacherHeresTheSquirtbottleText:
	text "Oh, eres mejor que"
	line "BLANCA…"

	para "Entonces vale."
	line "¡Aquí tienes la"
	cont "REGADERA!"
	done

GoldenrodFlowerShopTeacherDontDoAnythingDangerousText:
	text "¡No hagas nada"
	line "peligroso!"
	done

GoldenrodFlowerShopTeacherLalalaHavePlentyOfWaterText:
	text "Lalala, lalalala."
	line "¡Échale mucha"
	cont "agua, cariño!"
	done

GoldenrodFlowerShopFloriaWonderIfSisWillLendWaterBottleText:
	text "Cuando le conté a"
	line "mi hermana lo del"

	para "extraño árbol, me"
	line "dijo que era"
	cont "peligroso."

	para "Si venzo a BLANCA,"
	line "es posible que me"

	para "preste su"
	line "REGADERA…"
	done

GoldenrodFlowerShopFloriaYouBeatWhitneyText:
	text "Uuau, ¿venciste a"
	line "BLANCA? ¡Genial!"
	done

GoldenrodFlowerShopFloriaItReallyWasAMonText:
	text "¡Entonces era un"
	line "#MON!"
	done

GoldenrodFlowerShop_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event  2,  7, GOLDENROD_CITY, 6
	warp_event  3,  7, GOLDENROD_CITY, 6

	db 0 ; coord events

	db 0 ; bg events

	db 2 ; object events
	object_event  2,  4, SPRITE_TEACHER, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, FlowerShopTeacherScript, -1
	object_event  5,  6, SPRITE_LASS, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, FlowerShopFloriaScript, EVENT_FLORIA_AT_FLOWER_SHOP
