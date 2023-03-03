	object_const_def ; object_event constants
	const BILLSHOUSE_GRAMPS

BillsHouse_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

BillsGrandpa:
	faceplayer
	opentext
	checkevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_1
	iftrue .JustShowedSomething
	checkevent EVENT_GOT_THUNDERSTONE_FROM_BILLS_GRANDPA
	iftrue .GotThunderstone
	checkevent EVENT_MET_BILLS_GRANDPA
	iftrue .MetGrandpa
	writetext BillsGrandpaIntroText
	promptbutton
	setevent EVENT_MET_BILLS_GRANDPA
.MetGrandpa:
	checkevent EVENT_SHOWED_PICHU_TO_BILLS_GRANDPA
	iftrue .ShowedPichu
	checkevent EVENT_SHOWED_GROWLITHE_VULPIX_TO_BILLS_GRANDPA
	iftrue .ShowedGrowlitheVulpix
	checkevent EVENT_SHOWED_STARYU_TO_BILLS_GRANDPA
	iftrue .ShowedStaryu
	checkevent EVENT_SHOWED_ODDISH_TO_BILLS_GRANDPA
	iftrue .ShowedOddish
	checkevent EVENT_SHOWED_LICKITUNG_TO_BILLS_GRANDPA
	iftrue .ShowedLickitung
	writetext BillsGrandpaLickitungText
	promptbutton
	writetext BillsGrandpaAskToSeeMonText
	yesorno
	iffalse .SaidNo
	scall .ExcitedToSee
	special BillsGrandfather
	iffalse .SaidNo
	ifnotequal LICKITUNG, .WrongPokemon
	scall .CorrectPokemon
	setevent EVENT_SHOWED_LICKITUNG_TO_BILLS_GRANDPA
	sjump .ShowedLickitung

.GotEverstone:
	writetext BillsGrandpaOddishText
	promptbutton
	writetext BillsGrandpaAskToSeeMonText
	yesorno
	iffalse .SaidNo
	scall .ExcitedToSee
	special BillsGrandfather
	iffalse .SaidNo
	ifnotequal ODDISH, .WrongPokemon
	scall .CorrectPokemon
	setevent EVENT_SHOWED_ODDISH_TO_BILLS_GRANDPA
	sjump .ShowedOddish

.GotLeafStone:
	writetext BillsGrandpaStaryuText
	promptbutton
	writetext BillsGrandpaAskToSeeMonText
	yesorno
	iffalse .SaidNo
	scall .ExcitedToSee
	special BillsGrandfather
	iffalse .SaidNo
	ifnotequal STARYU, .WrongPokemon
	scall .CorrectPokemon
	setevent EVENT_SHOWED_STARYU_TO_BILLS_GRANDPA
	sjump .ShowedStaryu

.GotWaterStone:
	checkver
	iftrue .AskVulpix
	writetext BillsGrandpaGrowlitheText
	promptbutton
	writetext BillsGrandpaAskToSeeMonText
	yesorno
	iffalse .SaidNo
	scall .ExcitedToSee
	special BillsGrandfather
	iffalse .SaidNo
	ifnotequal GROWLITHE, .WrongPokemon
	scall .CorrectPokemon
	setevent EVENT_SHOWED_GROWLITHE_VULPIX_TO_BILLS_GRANDPA
	sjump .ShowedGrowlitheVulpix

.AskVulpix:
	writetext BillsGrandpaVulpixText
	promptbutton
	writetext BillsGrandpaAskToSeeMonText
	yesorno
	iffalse .SaidNo
	scall .ExcitedToSee
	special BillsGrandfather
	iffalse .SaidNo
	ifnotequal VULPIX, .WrongPokemon
	scall .CorrectPokemon
	setevent EVENT_SHOWED_GROWLITHE_VULPIX_TO_BILLS_GRANDPA
	sjump .ShowedGrowlitheVulpix

.GotFireStone:
	writetext BillsGrandpaPichuText
	promptbutton
	writetext BillsGrandpaAskToSeeMonText
	yesorno
	iffalse .SaidNo
	scall .ExcitedToSee
	special BillsGrandfather
	iffalse .SaidNo
	ifnotequal PICHU, .WrongPokemon
	scall .CorrectPokemon
	setevent EVENT_SHOWED_PICHU_TO_BILLS_GRANDPA
	sjump .ShowedPichu

.ShowedLickitung:
	checkevent EVENT_GOT_EVERSTONE_FROM_BILLS_GRANDPA
	iftrue .GotEverstone
	scall .ReceiveItem
	verbosegiveitem EVERSTONE
	iffalse .BagFull
	setevent EVENT_GOT_EVERSTONE_FROM_BILLS_GRANDPA
	setevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_1
	closetext
	end

.ShowedOddish:
	checkevent EVENT_GOT_LEAF_STONE_FROM_BILLS_GRANDPA
	iftrue .GotLeafStone
	scall .ReceiveItem
	verbosegiveitem LEAF_STONE
	iffalse .BagFull
	setevent EVENT_GOT_LEAF_STONE_FROM_BILLS_GRANDPA
	setevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_1
	closetext
	end

.ShowedStaryu:
	checkevent EVENT_GOT_WATER_STONE_FROM_BILLS_GRANDPA
	iftrue .GotWaterStone
	scall .ReceiveItem
	verbosegiveitem WATER_STONE
	iffalse .BagFull
	setevent EVENT_GOT_WATER_STONE_FROM_BILLS_GRANDPA
	setevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_1
	closetext
	end

.ShowedGrowlitheVulpix:
	checkevent EVENT_GOT_FIRE_STONE_FROM_BILLS_GRANDPA
	iftrue .GotFireStone
	scall .ReceiveItem
	verbosegiveitem FIRE_STONE
	iffalse .BagFull
	setevent EVENT_GOT_FIRE_STONE_FROM_BILLS_GRANDPA
	setevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_1
	closetext
	end

.ShowedPichu:
	scall .ReceiveItem
	verbosegiveitem THUNDERSTONE
	iffalse .BagFull
	setevent EVENT_GOT_THUNDERSTONE_FROM_BILLS_GRANDPA
	closetext
	end

.ExcitedToSee:
	writetext BillsGrandpaExcitedToSeeText
	promptbutton
	end

.SaidNo:
	writetext BillsGrandpaYouDontHaveItTextText
	waitbutton
	closetext
	end

.CorrectPokemon:
	writetext BillsGrandpaShownPokemonText
	promptbutton
	end

.ReceiveItem:
	writetext BillsGrandpaTokenOfAppreciationText
	promptbutton
	end

.JustShowedSomething:
	writetext BillsGrandpaComeAgainText
	waitbutton
	closetext
	end

.GotThunderstone:
	writetext BillsGrandpaShownAllThePokemonText
	waitbutton
	closetext
	end

.WrongPokemon:
	writetext BillsGrandpaWrongPokemonText
	waitbutton
	closetext
	end

.BagFull:
	closetext
	end

BillsGrandpaIntroText:
	text "¿Conoces a BILL?"
	line "Es mi nieto."

	para "Está en JOHTO"
	line "trabajando con"

	para "los PC. Yo le"
	line "cuido la casa."
	done

BillsGrandpaAskToSeeMonText:
	text "Si tienes ese"
	line "#MON, ¿me"
	cont "dejas verlo?"
	done

BillsGrandpaExcitedToSeeText:
	text "¿Me lo dejas ver?"
	line "¡Qué amable eres!"
	done

BillsGrandpaYouDontHaveItTextText:
	text "¿No lo tienes?"
	line "¡Qué pena…!"
	done

BillsGrandpaShownPokemonText:
	text "¡Ah! ¿es ése"
	line "@"
	text_ram wStringBuffer3
	text "?"

	para "¡Qué mono!"
	line "Eres muy amable."
	done

BillsGrandpaTokenOfAppreciationText:
	text "¡Gracias!"

	para "Toma esto como"
	line "agradecimiento."
	done

BillsGrandpaComeAgainText:
	text "Vuelve cuando"
	line "quieras."
	done

BillsGrandpaShownAllThePokemonText:
	text "Gracias por"
	line "mostrarme tantos"

	para "#MON tan"
	line "bonitos."

	para "Me he divertido"
	line "mucho. Me alegro"

	para "de haber vivido"
	line "tantos años."
	done

BillsGrandpaWrongPokemonText:
	text "¿Mmm?"

	para "Ése no es el"
	line "#MON del que"
	cont "me hablaron."
	done

BillsGrandpaLickitungText:
	text "Mi nieto BILL me"
	line "dijo que había un"

	para "#MON con una"
	line "lengua muy larga."
	done

BillsGrandpaOddishText:
	text "Mi nieto mencionó"
	line "a un #MON verde"

	para "y redondo al que"
	line "le crecen hojas en"
	cont "la cabeza."
	done

BillsGrandpaStaryuText:
	text "¿Conoces a un"
	line "#MON de mar que"

	para "tiene una esfera"
	line "roja en el cuerpo?"

	para "Ya sabes, ése que"
	line "tiene forma de"
	cont "estrella."

	para "Dicen que sale"
	line "por la noche."

	para "Me encantaría"
	line "verlo."
	done

BillsGrandpaGrowlitheText:
	text "BILL me habló de"
	line "un #MON que"

	para "es muy fiel a su"
	line "entrenador."

	para "Se supone que"
	line "RUGE bien."
	done

BillsGrandpaVulpixText:
	text "He oído hablar de"
	line "un #MON que"
	cont "tiene seis colas."

	para "Me gustaría"
	line "abrazar a un"
	cont "#MON así."
	done

BillsGrandpaPichuText:
	text "¿Conoces a ese"
	line "#MON tan"
	cont "popular?"

	para "El #MON de"
	line "cuerpo amarillo y"
	cont "mejillas rojas."

	para "Me gustaría verlo"
	line "antes de que"
	cont "evolucione."
	done

BillsHouse_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event  2,  7, ROUTE_25, 1
	warp_event  3,  7, ROUTE_25, 1

	db 0 ; coord events

	db 0 ; bg events

	db 1 ; object events
	object_event  2,  3, SPRITE_GRAMPS, SPRITEMOVEDATA_STANDING_UP, 0, 2, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, BillsGrandpa, -1
