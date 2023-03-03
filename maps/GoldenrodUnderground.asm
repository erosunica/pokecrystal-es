GOLDENRODUNDERGROUND_OLDER_HAIRCUT_PRICE   EQU 500
GOLDENRODUNDERGROUND_YOUNGER_HAIRCUT_PRICE EQU 300

	object_const_def ; object_event constants
	const GOLDENRODUNDERGROUND_SUPER_NERD1
	const GOLDENRODUNDERGROUND_SUPER_NERD2
	const GOLDENRODUNDERGROUND_SUPER_NERD3
	const GOLDENRODUNDERGROUND_SUPER_NERD4
	const GOLDENRODUNDERGROUND_POKE_BALL
	const GOLDENRODUNDERGROUND_GRAMPS
	const GOLDENRODUNDERGROUND_OLDER_HAIRCUT_BROTHER
	const GOLDENRODUNDERGROUND_YOUNGER_HAIRCUT_BROTHER
	const GOLDENRODUNDERGROUND_GRANNY

GoldenrodUnderground_MapScripts:
	db 0 ; scene scripts

	db 3 ; callbacks
	callback MAPCALLBACK_NEWMAP, .ResetSwitches
	callback MAPCALLBACK_TILES, .CheckBasementKey
	callback MAPCALLBACK_OBJECTS, .CheckDayOfWeek

.ResetSwitches:
	clearevent EVENT_SWITCH_1
	clearevent EVENT_SWITCH_2
	clearevent EVENT_SWITCH_3
	clearevent EVENT_EMERGENCY_SWITCH
	clearevent EVENT_SWITCH_4
	clearevent EVENT_SWITCH_5
	clearevent EVENT_SWITCH_6
	clearevent EVENT_SWITCH_7
	clearevent EVENT_SWITCH_8
	clearevent EVENT_SWITCH_9
	clearevent EVENT_SWITCH_10
	clearevent EVENT_SWITCH_11
	clearevent EVENT_SWITCH_12
	clearevent EVENT_SWITCH_13
	clearevent EVENT_SWITCH_14
	setval 0
	writemem wUndergroundSwitchPositions
	return

.CheckBasementKey:
	checkevent EVENT_USED_BASEMENT_KEY
	iffalse .LockBasementDoor
	return

.LockBasementDoor:
	changeblock 18, 6, $3d ; locked door
	return

.CheckDayOfWeek:
	readvar VAR_WEEKDAY
	ifequal MONDAY, .Monday
	ifequal TUESDAY, .Tuesday
	ifequal WEDNESDAY, .Wednesday
	ifequal THURSDAY, .Thursday
	ifequal FRIDAY, .Friday
	ifequal SATURDAY, .Saturday

.Sunday:
	disappear GOLDENRODUNDERGROUND_GRAMPS
	disappear GOLDENRODUNDERGROUND_OLDER_HAIRCUT_BROTHER
	appear GOLDENRODUNDERGROUND_YOUNGER_HAIRCUT_BROTHER
	appear GOLDENRODUNDERGROUND_GRANNY
	return

.Monday:
	disappear GOLDENRODUNDERGROUND_GRAMPS
	checktime MORN
	iffalse .NotMondayMorning
	appear GOLDENRODUNDERGROUND_GRAMPS
.NotMondayMorning:
	disappear GOLDENRODUNDERGROUND_OLDER_HAIRCUT_BROTHER
	disappear GOLDENRODUNDERGROUND_YOUNGER_HAIRCUT_BROTHER
	disappear GOLDENRODUNDERGROUND_GRANNY
	return

.Tuesday:
	disappear GOLDENRODUNDERGROUND_GRAMPS
	appear GOLDENRODUNDERGROUND_OLDER_HAIRCUT_BROTHER
	disappear GOLDENRODUNDERGROUND_YOUNGER_HAIRCUT_BROTHER
	disappear GOLDENRODUNDERGROUND_GRANNY
	return

.Wednesday:
	disappear GOLDENRODUNDERGROUND_GRAMPS
	disappear GOLDENRODUNDERGROUND_OLDER_HAIRCUT_BROTHER
	appear GOLDENRODUNDERGROUND_YOUNGER_HAIRCUT_BROTHER
	disappear GOLDENRODUNDERGROUND_GRANNY
	return

.Thursday:
	disappear GOLDENRODUNDERGROUND_GRAMPS
	appear GOLDENRODUNDERGROUND_OLDER_HAIRCUT_BROTHER
	disappear GOLDENRODUNDERGROUND_YOUNGER_HAIRCUT_BROTHER
	disappear GOLDENRODUNDERGROUND_GRANNY
	return

.Friday:
	disappear GOLDENRODUNDERGROUND_GRAMPS
	disappear GOLDENRODUNDERGROUND_OLDER_HAIRCUT_BROTHER
	appear GOLDENRODUNDERGROUND_YOUNGER_HAIRCUT_BROTHER
	disappear GOLDENRODUNDERGROUND_GRANNY
	return

.Saturday:
	disappear GOLDENRODUNDERGROUND_GRAMPS
	appear GOLDENRODUNDERGROUND_OLDER_HAIRCUT_BROTHER
	disappear GOLDENRODUNDERGROUND_YOUNGER_HAIRCUT_BROTHER
	appear GOLDENRODUNDERGROUND_GRANNY
	return

TrainerSupernerdEric:
	trainer SUPER_NERD, ERIC, EVENT_BEAT_SUPER_NERD_ERIC, SupernerdEricSeenText, SupernerdEricBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext SupernerdEricAfterBattleText
	waitbutton
	closetext
	end

TrainerSupernerdTeru:
	trainer SUPER_NERD, TERU, EVENT_BEAT_SUPER_NERD_TERU, SupernerdTeruSeenText, SupernerdTeruBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext SupernerdTeruAfterBattleText
	waitbutton
	closetext
	end

TrainerPokemaniacIssac:
	trainer POKEMANIAC, ISSAC, EVENT_BEAT_POKEMANIAC_ISSAC, PokemaniacIssacSeenText, PokemaniacIssacBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext PokemaniacIssacAfterBattleText
	waitbutton
	closetext
	end

TrainerPokemaniacDonald:
	trainer POKEMANIAC, DONALD, EVENT_BEAT_POKEMANIAC_DONALD, PokemaniacDonaldSeenText, PokemaniacDonaldBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext PokemaniacDonaldAfterBattleText
	waitbutton
	closetext
	end

BitterMerchantScript:
	opentext
	readvar VAR_WEEKDAY
	ifequal SUNDAY, .Open
	ifequal SATURDAY, .Open
	sjump GoldenrodUndergroundScript_ShopClosed

.Open:
	pokemart MARTTYPE_BITTER, MART_UNDERGROUND
	closetext
	end

BargainMerchantScript:
	opentext
	checkflag ENGINE_GOLDENROD_UNDERGROUND_MERCHANT_CLOSED
	iftrue GoldenrodUndergroundScript_ShopClosed
	readvar VAR_WEEKDAY
	ifequal MONDAY, .CheckMorn
	sjump GoldenrodUndergroundScript_ShopClosed

.CheckMorn:
	checktime MORN
	iffalse GoldenrodUndergroundScript_ShopClosed
	pokemart MARTTYPE_BARGAIN, 0
	closetext
	end

OlderHaircutBrotherScript:
	opentext
	readvar VAR_WEEKDAY
	ifequal TUESDAY, .DoHaircut
	ifequal THURSDAY, .DoHaircut
	ifequal SATURDAY, .DoHaircut
	sjump GoldenrodUndergroundScript_ShopClosed

.DoHaircut:
	checkflag ENGINE_GOLDENROD_UNDERGROUND_GOT_HAIRCUT
	iftrue .AlreadyGotHaircut
	special PlaceMoneyTopRight
	writetext GoldenrodUndergroundOlderHaircutBrotherOfferHaircutText
	yesorno
	iffalse .Refused
	checkmoney YOUR_MONEY, GOLDENRODUNDERGROUND_OLDER_HAIRCUT_PRICE
	ifequal HAVE_LESS, .NotEnoughMoney
	writetext GoldenrodUndergroundOlderHaircutBrotherAskWhichMonText
	promptbutton
	special OlderHaircutBrother
	ifequal $0, .Refused
	ifequal $1, .Refused
	setflag ENGINE_GOLDENROD_UNDERGROUND_GOT_HAIRCUT
	ifequal $2, .two
	ifequal $3, .three
	sjump .else

.two
	setevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_1
	clearevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_2
	clearevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_3
	sjump .then

.three
	clearevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_1
	setevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_2
	clearevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_3
	sjump .then

.else
	clearevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_1
	clearevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_2
	setevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_3
	sjump .then

.then
	takemoney YOUR_MONEY, GOLDENRODUNDERGROUND_OLDER_HAIRCUT_PRICE
	special PlaceMoneyTopRight
	writetext GoldenrodUndergroundOlderHaircutBrotherWatchItBecomeBeautifulText
	waitbutton
	closetext
	special FadeOutPalettes
	playmusic MUSIC_HEAL
	pause 60
	special FadeInPalettes
	special RestartMapMusic
	opentext
	writetext GoldenrodUndergroundOlderHaircutBrotherAllDoneText
	waitbutton
	checkevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_1
	iftrue EitherHaircutBrotherScript_SlightlyHappier
	checkevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_2
	iftrue EitherHaircutBrotherScript_Happier
	sjump EitherHaircutBrotherScript_MuchHappier

.Refused:
	writetext GoldenrodUndergroundOlderHaircutBrotherThatsAShameText
	waitbutton
	closetext
	end

.NotEnoughMoney:
	writetext GoldenrodUndergroundOlderHaircutBrotherYoullNeedMoreMoneyText
	waitbutton
	closetext
	end

.AlreadyGotHaircut:
	writetext GoldenrodUndergroundOlderHaircutBrotherOneHaircutADayText
	waitbutton
	closetext
	end

YoungerHaircutBrotherScript:
	opentext
	readvar VAR_WEEKDAY
	ifequal SUNDAY, .DoHaircut
	ifequal WEDNESDAY, .DoHaircut
	ifequal FRIDAY, .DoHaircut
	sjump GoldenrodUndergroundScript_ShopClosed

.DoHaircut:
	checkflag ENGINE_GOLDENROD_UNDERGROUND_GOT_HAIRCUT
	iftrue .AlreadyGotHaircut
	special PlaceMoneyTopRight
	writetext GoldenrodUndergroundYoungerHaircutBrotherOfferHaircutText
	yesorno
	iffalse .Refused
	checkmoney YOUR_MONEY, GOLDENRODUNDERGROUND_YOUNGER_HAIRCUT_PRICE
	ifequal HAVE_LESS, .NotEnoughMoney
	writetext GoldenrodUndergroundYoungerHaircutBrotherAskWhichMonText
	promptbutton
	special YoungerHaircutBrother
	ifequal $0, .Refused
	ifequal $1, .Refused
	setflag ENGINE_GOLDENROD_UNDERGROUND_GOT_HAIRCUT
	ifequal $2, .two
	ifequal $3, .three
	sjump .else

.two
	setevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_1
	clearevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_2
	clearevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_3
	sjump .then

.three
	clearevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_1
	setevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_2
	clearevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_3
	sjump .then

.else
	clearevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_1
	clearevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_2
	setevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_3
	sjump .then

.then
	takemoney YOUR_MONEY, GOLDENRODUNDERGROUND_YOUNGER_HAIRCUT_PRICE
	special PlaceMoneyTopRight
	writetext GoldenrodUndergroundYoungerHaircutBrotherIllMakeItLookCoolText
	waitbutton
	closetext
	special FadeOutPalettes
	playmusic MUSIC_HEAL
	pause 60
	special FadeInPalettes
	special RestartMapMusic
	opentext
	writetext GoldenrodUndergroundYoungerHaircutBrotherAllDoneText
	waitbutton
	checkevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_1
	iftrue EitherHaircutBrotherScript_SlightlyHappier
	checkevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_2
	iftrue EitherHaircutBrotherScript_Happier
	sjump EitherHaircutBrotherScript_MuchHappier

.Refused:
	writetext GoldenrodUndergroundYoungerHaircutBrotherHowDisappointingText
	waitbutton
	closetext
	end

.NotEnoughMoney:
	writetext GoldenrodUndergroundYoungerHaircutBrotherShortOnFundsText
	waitbutton
	closetext
	end

.AlreadyGotHaircut:
	writetext GoldenrodUndergroundYoungerHaircutBrotherOneHaircutADayText
	waitbutton
	closetext
	end

EitherHaircutBrotherScript_SlightlyHappier:
	writetext HaircutBrosText_SlightlyHappier
	special PlayCurMonCry
	waitbutton
	closetext
	end

EitherHaircutBrotherScript_Happier:
	writetext HaircutBrosText_Happier
	special PlayCurMonCry
	waitbutton
	closetext
	end

EitherHaircutBrotherScript_MuchHappier:
	writetext HaircutBrosText_MuchHappier
	special PlayCurMonCry
	waitbutton
	closetext
	end

BasementDoorScript::
	opentext
	checkevent EVENT_USED_BASEMENT_KEY
	iftrue .Open
	checkitem BASEMENT_KEY
	iftrue .Unlock
	writetext GoldenrodUndergroundTheDoorsLockedText
	waitbutton
	closetext
	end

.Unlock:
	playsound SFX_TRANSACTION
	writetext GoldenrodUndergroundBasementKeyOpenedDoorText
	waitbutton
	closetext
	changeblock 18, 6, $2e ; unlocked door
	reloadmappart
	closetext
	setevent EVENT_USED_BASEMENT_KEY
	end

.Open:
	writetext GoldenrodUndergroundTheDoorIsOpenText
	waitbutton
	closetext
	end

GoldenrodUndergroundScript_ShopClosed:
	writetext GoldenrodUndergroundWeAreNotOpenTodayText
	waitbutton
	closetext
	end

GoldenrodUndergroundCoinCase:
	itemball COIN_CASE

GoldenrodUndergroundNoEntrySign:
	jumptext GoldenrodUndergroundNoEntryText

GoldenrodUndergroundHiddenParlyzHeal:
	hiddenitem PARLYZ_HEAL, EVENT_GOLDENROD_UNDERGROUND_HIDDEN_PARLYZ_HEAL

GoldenrodUndergroundHiddenSuperPotion:
	hiddenitem SUPER_POTION, EVENT_GOLDENROD_UNDERGROUND_HIDDEN_SUPER_POTION

GoldenrodUndergroundHiddenAntidote:
	hiddenitem ANTIDOTE, EVENT_GOLDENROD_UNDERGROUND_HIDDEN_ANTIDOTE

SupernerdEricSeenText:
	text "Me echaron del"
	line "CASINO."

	para "Intentaba hacer"
	line "trampas usando mis"
	cont "#MON…"
	done

SupernerdEricBeatenText:
	text "¡Caray…!"
	done

SupernerdEricAfterBattleText:
	text "Supongo que"
	line "debería actuar"
	cont "honradamente…"
	done

SupernerdTeruSeenText:
	text "¿Tienes en cuenta"
	line "los tipos durante"
	cont "el combate?"

	para "Si conoces bien"
	line "los distintos"

	para "tipos, rendirás"
	line "más en combate."
	done

SupernerdTeruBeatenText:
	text "¡Oh, oh, oh!"
	done

SupernerdTeruAfterBattleText:
	text "Conozco mis tipos"
	line "de #MON."

	para "Pero sólo uso un"
	line "tipo de #MON."
	done

PokemaniacIssacSeenText:
	text "¡Les corté el pelo"
	line "a mis #MON!"

	para "¡Ahora verás lo"
	line "fuertes que son!"
	done

PokemaniacIssacBeatenText:
	text "¡Ayyyy!"
	done

PokemaniacIssacAfterBattleText:
	text "Los #MON serán"
	line "más amigos tuyos"

	para "si los llevas a"
	line "cortarse el pelo."
	done

PokemaniacDonaldSeenText:
	text "Creo que tienes"
	line "algunos #MON"
	cont "muy raros."

	para "¡Déjame verlos!"
	done

PokemaniacDonaldBeatenText:
	text "¡Bah! ¡He perdido!"
	line "¡Qué rabia me da!"
	done

PokemaniacDonaldAfterBattleText:
	text "¿Tienes una"
	line "#DEX? Pues te"
	cont "daré una pista."

	para "El MONTAÑERO de la"
	line "RUTA 33, LUIS, es"
	cont "un buen chico."

	para "Te telefoneará si"
	line "ve algún #MON"
	cont "raro."
	done

GoldenrodUndergroundTheDoorsLockedText:
	text "Puerta cerrada…"
	done

GoldenrodUndergroundTheDoorIsOpenText:
	text "Puerta abierta."
	done

GoldenrodUndergroundBasementKeyOpenedDoorText:
	text "Puerta abierta con"
	line "LLAVE del SÓTANO."
	done

GoldenrodUndergroundOlderHaircutBrotherOfferHaircutText:
	text "¡Hola! ¡Yo dirijo"
	line "la PELUQUERÍA"
	cont "#MON!"

	para "Soy el mayor y"
	line "el mejor de los"

	para "dos HERMANOS"
	line "PELUQUEROS."

	para "Puedo poner guapos"
	line "a tus #MON por"
	cont "sólo 500¥."

	para "¿Quieres que les"
	line "corte el pelo?"
	done

GoldenrodUndergroundOlderHaircutBrotherAskWhichMonText:
	text "¿A qué #MON"
	line "le corto el pelo?"
	done

GoldenrodUndergroundOlderHaircutBrotherWatchItBecomeBeautifulText:
	text "¡Vale! ¡Verás lo"
	line "bien que queda!"
	done

GoldenrodUndergroundOlderHaircutBrotherAllDoneText:
	text "¡Bien! ¡Ya está!"
	done

GoldenrodUndergroundOlderHaircutBrotherThatsAShameText:
	text "¿De verdad?"
	line "¡Qué pena!"
	done

GoldenrodUndergroundOlderHaircutBrotherYoullNeedMoreMoneyText:
	text "Necesitarás más"
	line "dinero."
	done

GoldenrodUndergroundOlderHaircutBrotherOneHaircutADayText:
	text "Sólo corto el pelo"
	line "una vez al día."
	cont "Ya vale por hoy."
	done

GoldenrodUndergroundYoungerHaircutBrotherOfferHaircutText:
	text "¡Bienvenidos a la"
	line "PELUQUERÍA!"

	para "Soy el más joven y"
	line "el más novato de"

	para "los dos HERMANOS"
	line "PELUQUEROS."

	para "Pondré guapos a"
	line "tus #MON por"
	cont "sólo 300¥."

	para "¿Qué dices?"
	done

GoldenrodUndergroundYoungerHaircutBrotherAskWhichMonText:
	text "¿A qué #MON"
	line "le corto el pelo?"
	done

GoldenrodUndergroundYoungerHaircutBrotherIllMakeItLookCoolText:
	text "¡Vale! Ya verás lo"
	line "bien que queda."
	done

GoldenrodUndergroundYoungerHaircutBrotherAllDoneText:
	text "¡Muy bien!"
	line "¡Ya está!"
	done

GoldenrodUndergroundYoungerHaircutBrotherHowDisappointingText:
	text "¿No?"
	line "¡Qué lástima!"
	done

GoldenrodUndergroundYoungerHaircutBrotherShortOnFundsText:
	text "No te queda mucho"
	line "dinero."
	done

GoldenrodUndergroundYoungerHaircutBrotherOneHaircutADayText:
	text "Sólo corto el pelo"
	line "una vez al día."

	para "Perdona, pero hoy"
	line "no trabajo más."
	done

HaircutBrosText_SlightlyHappier:
	text_ram wStringBuffer3
	text_start
	line "parece un poco"
	cont "más feliz."
	done

HaircutBrosText_Happier:
	text_ram wStringBuffer3
	text_start
	line "parece feliz."
	done

HaircutBrosText_MuchHappier:
	text "¡@"
	text_ram wStringBuffer3
	text_start
	line "está encantado!"
	done

GoldenrodUndergroundWeAreNotOpenTodayText:
	text "Lo siento,"
	line "hemos cerrado."
	done

GoldenrodUndergroundNoEntryText:
	text "PROHIBIDO PASAR"
	line "DE ESTE PUNTO"
	done

GoldenrodUnderground_MapEvents:
	db 0, 0 ; filler

	db 6 ; warp events
	warp_event  3,  2, GOLDENROD_UNDERGROUND_SWITCH_ROOM_ENTRANCES, 7
	warp_event  3, 34, GOLDENROD_UNDERGROUND_SWITCH_ROOM_ENTRANCES, 4
	warp_event 18,  6, GOLDENROD_UNDERGROUND, 4
	warp_event 21, 31, GOLDENROD_UNDERGROUND, 3
	warp_event 22, 31, GOLDENROD_UNDERGROUND, 3
	warp_event 22, 27, GOLDENROD_UNDERGROUND_SWITCH_ROOM_ENTRANCES, 1

	db 0 ; coord events

	db 5 ; bg events
	bg_event 18,  6, BGEVENT_READ, BasementDoorScript
	bg_event 19,  6, BGEVENT_READ, GoldenrodUndergroundNoEntrySign
	bg_event  6, 13, BGEVENT_ITEM, GoldenrodUndergroundHiddenParlyzHeal
	bg_event  4, 18, BGEVENT_ITEM, GoldenrodUndergroundHiddenSuperPotion
	bg_event 17,  8, BGEVENT_ITEM, GoldenrodUndergroundHiddenAntidote

	db 9 ; object events
	object_event  5, 31, SPRITE_SUPER_NERD, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_TRAINER, 3, TrainerSupernerdEric, -1
	object_event  6,  9, SPRITE_SUPER_NERD, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_TRAINER, 2, TrainerSupernerdTeru, -1
	object_event  3, 27, SPRITE_SUPER_NERD, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 2, TrainerPokemaniacIssac, -1
	object_event  2,  6, SPRITE_SUPER_NERD, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 3, TrainerPokemaniacDonald, -1
	object_event  7, 25, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, GoldenrodUndergroundCoinCase, EVENT_GOLDENROD_UNDERGROUND_COIN_CASE
	object_event  7, 11, SPRITE_GRAMPS, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, BargainMerchantScript, EVENT_GOLDENROD_UNDERGROUND_GRAMPS
	object_event  7, 14, SPRITE_SUPER_NERD, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, OlderHaircutBrotherScript, EVENT_GOLDENROD_UNDERGROUND_OLDER_HAIRCUT_BROTHER
	object_event  7, 15, SPRITE_SUPER_NERD, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, YoungerHaircutBrotherScript, EVENT_GOLDENROD_UNDERGROUND_YOUNGER_HAIRCUT_BROTHER
	object_event  7, 21, SPRITE_GRANNY, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, BitterMerchantScript, EVENT_GOLDENROD_UNDERGROUND_GRANNY
