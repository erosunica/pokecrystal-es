	object_const_def ; object_event constants
	const ROUTE31_FISHER
	const ROUTE31_YOUNGSTER
	const ROUTE31_BUG_CATCHER
	const ROUTE31_COOLTRAINER_M
	const ROUTE31_FRUIT_TREE
	const ROUTE31_POKE_BALL1
	const ROUTE31_POKE_BALL2

Route31_MapScripts:
	db 0 ; scene scripts

	db 1 ; callbacks
	callback MAPCALLBACK_NEWMAP, .CheckMomCall

.CheckMomCall:
	checkevent EVENT_TALKED_TO_MOM_AFTER_MYSTERY_EGG_QUEST
	iffalse .DoMomCall
	return

.DoMomCall:
	specialphonecall SPECIALCALL_WORRIED
	return

TrainerBugCatcherWade1:
	trainer BUG_CATCHER, WADE1, EVENT_BEAT_BUG_CATCHER_WADE, BugCatcherWade1SeenText, BugCatcherWade1BeatenText, 0, .Script

.Script:
	loadvar VAR_CALLERID, PHONE_BUG_CATCHER_WADE
	endifjustbattled
	opentext
	checkflag ENGINE_WADE
	iftrue .WadeRematch
	checkflag ENGINE_WADE_HAS_ITEM
	iftrue .WadeItem
	checkcellnum PHONE_BUG_CATCHER_WADE
	iftrue .AcceptedNumberSTD
	checkevent EVENT_WADE_ASKED_FOR_PHONE_NUMBER
	iftrue .AskAgain
	writetext BugCatcherWade1AfterText
	waitbutton
	setevent EVENT_WADE_ASKED_FOR_PHONE_NUMBER
	scall .AskPhoneNumberSTD
	sjump .Continue

.AskAgain:
	scall .AskAgainSTD
.Continue:
	askforphonenumber PHONE_BUG_CATCHER_WADE
	ifequal PHONE_CONTACTS_FULL, .PhoneFullSTD
	ifequal PHONE_CONTACT_REFUSED, .DeclinedNumberSTD
	gettrainername STRING_BUFFER_3, BUG_CATCHER, WADE1
	scall .RegisterNumberSTD
	sjump .AcceptedNumberSTD

.WadeRematch:
	scall .RematchSTD
	winlosstext BugCatcherWade1BeatenText, 0
	readmem wWadeFightCount
	ifequal 4, .Fight4
	ifequal 3, .Fight3
	ifequal 2, .Fight2
	ifequal 1, .Fight1
	ifequal 0, .LoadFight0
.Fight4:
	checkevent EVENT_BEAT_ELITE_FOUR
	iftrue .LoadFight4
.Fight3:
	checkevent EVENT_CLEARED_RADIO_TOWER
	iftrue .LoadFight3
.Fight2:
	checkflag ENGINE_FLYPOINT_MAHOGANY
	iftrue .LoadFight2
.Fight1:
	checkflag ENGINE_FLYPOINT_GOLDENROD
	iftrue .LoadFight1
.LoadFight0:
	loadtrainer BUG_CATCHER, WADE1
	startbattle
	reloadmapafterbattle
	loadmem wWadeFightCount, 1
	clearflag ENGINE_WADE
	end

.LoadFight1:
	loadtrainer BUG_CATCHER, WADE2
	startbattle
	reloadmapafterbattle
	loadmem wWadeFightCount, 2
	clearflag ENGINE_WADE
	end

.LoadFight2:
	loadtrainer BUG_CATCHER, WADE3
	startbattle
	reloadmapafterbattle
	loadmem wWadeFightCount, 3
	clearflag ENGINE_WADE
	end

.LoadFight3:
	loadtrainer BUG_CATCHER, WADE4
	startbattle
	reloadmapafterbattle
	loadmem wWadeFightCount, 4
	clearflag ENGINE_WADE
	end

.LoadFight4:
	loadtrainer BUG_CATCHER, WADE5
	startbattle
	reloadmapafterbattle
	clearflag ENGINE_WADE
	end

.WadeItem:
	scall .ItemSTD
	checkevent EVENT_WADE_HAS_BERRY
	iftrue .Berry
	checkevent EVENT_WADE_HAS_PSNCUREBERRY
	iftrue .Psncureberry
	checkevent EVENT_WADE_HAS_PRZCUREBERRY
	iftrue .Przcureberry
	checkevent EVENT_WADE_HAS_BITTER_BERRY
	iftrue .BitterBerry
.Berry:
	verbosegiveitem BERRY
	iffalse .PackFull
	sjump .Done
.Psncureberry:
	verbosegiveitem PSNCUREBERRY
	iffalse .PackFull
	sjump .Done
.Przcureberry:
	verbosegiveitem PRZCUREBERRY
	iffalse .PackFull
	sjump .Done
.BitterBerry:
	verbosegiveitem BITTER_BERRY
	iffalse .PackFull
.Done:
	clearflag ENGINE_WADE_HAS_ITEM
	sjump .AcceptedNumberSTD
.PackFull:
	sjump .PackFullSTD

.AskPhoneNumberSTD:
	jumpstd asknumber1m
	end

.AskAgainSTD:
	jumpstd asknumber2m
	end

.RegisterNumberSTD:
	jumpstd registerednumberm
	end

.AcceptedNumberSTD:
	jumpstd numberacceptedm
	end

.DeclinedNumberSTD:
	jumpstd numberdeclinedm
	end

.PhoneFullSTD:
	jumpstd phonefullm
	end

.RematchSTD:
	jumpstd rematchm
	end

.ItemSTD:
	jumpstd giftm
	end

.PackFullSTD:
	jumpstd packfullm
	end

Route31MailRecipientScript:
	faceplayer
	opentext
	checkevent EVENT_GOT_TM50_NIGHTMARE
	iftrue .DescribeNightmare
	checkevent EVENT_GOT_KENYA
	iftrue .TryGiveKenya
	writetext Text_Route31SleepyMan
	waitbutton
	closetext
	end

.TryGiveKenya:
	writetext Text_Route31SleepyManGotMail
	promptbutton
	checkpokemail ReceivedSpearowMailText
	ifequal POKEMAIL_WRONG_MAIL, .WrongMail
	ifequal POKEMAIL_REFUSED, .Refused
	ifequal POKEMAIL_NO_MAIL, .NoMail
	ifequal POKEMAIL_LAST_MON, .LastMon
	; POKEMAIL_CORRECT
	writetext Text_Route31HandOverMailMon
	promptbutton
	writetext Text_Route31ReadingMail
	promptbutton
	setevent EVENT_GAVE_KENYA
	verbosegiveitem TM_NIGHTMARE
	iffalse .NoRoomForItems
	setevent EVENT_GOT_TM50_NIGHTMARE
.DescribeNightmare:
	writetext Text_Route31DescribeNightmare
	waitbutton
.NoRoomForItems:
	closetext
	end

.WrongMail:
	writetext Text_Route31WrongMail
	waitbutton
	closetext
	end

.NoMail:
	writetext Text_Route31MissingMail
	waitbutton
	closetext
	end

.Refused:
	writetext Text_Route31DeclinedToHandOverMail
	waitbutton
	closetext
	end

.LastMon:
	writetext Text_Route31CantTakeLastMon
	waitbutton
	closetext
	end

ReceivedSpearowMailText:
	db   "CUEVA OSCURA da"
	next "a otro camino  @"

Route31YoungsterScript:
	jumptextfaceplayer Route31YoungsterText

Route31Sign:
	jumptext Route31SignText

DarkCaveSign:
	jumptext DarkCaveSignText

Route31CooltrainerMScript:
	jumptextfaceplayer Route31CooltrainerMText

Route31FruitTree:
	fruittree FRUITTREE_ROUTE_31

Route31Potion:
	itemball POTION

Route31PokeBall:
	itemball POKE_BALL

Route31CooltrainerMText:
	text "CUEVA OSCURA…"

	para "Si los #MON"
	line "pudieran"

	para "iluminarla,"
	line "la exploraría."
	done

BugCatcherWade1SeenText:
	text "He atrapado un"
	line "montón de #MON."
	cont "¡Luchemos!"
	done

BugCatcherWade1BeatenText:
	text "¡Auuuu…!"
	done

BugCatcherWade1AfterText:
	text "Puedes atrapar"
	line "#MON aunque"

	para "ya lleves seis"
	line "contigo."

	para "Si atrapas alguno"
	line "más, será enviado"
	cont "a la CAJA."
	done

Text_Route31SleepyMan:
	text "¡Arg…! ¿Eh?"

	para "Hoy he caminado"
	line "mucho buscando"
	cont "#MON."

	para "Me duelen los pies"
	line "y tengo sueño…"

	para "Si fuera un"
	line "#MON salvaje,"

	para "sería fácil"
	line "atraparme…"

	para "¡Zzzz…!"
	done

Text_Route31SleepyManGotMail:
	text "Zzzz… ¿Eh?"

	para "¿Qué es eso? ¿Una"
	line "CARTA para mí?"
	done

Text_Route31HandOverMailMon:
	text "<PLAYER> entregó"
	line "el #MON que"
	cont "lleva la CARTA."
	done

Text_Route31ReadingMail:
	text "Veamos…"

	para "La C. OSCURA lleva"
	line "a otro camino."

	para "Es bueno saberlo."

	para "Gracias por"
	line "traerme esto."

	para "Mi amigo es un"
	line "buen chico."

	para "¡Tú también eres"
	line "increíble!"

	para "¡Me gustaría"
	line "devolverte el"
	cont "favor!"

	para "¡Ya sé!"
	line "¡Toma esto!"
	done

Text_Route31DescribeNightmare:
	text "MT50 es PESADILLA."

	para "Es un movimiento"
	line "terrible que"

	para "reduce los PS de"
	line "un rival dormido."

	para "¡Ooooh…!"
	line "¡Qué miedo…!"

	para "No me gustan las"
	line "pesadillas."
	done

Text_Route31WrongMail:
	text "Esta CARTA no"
	line "es para mí."
	done

Text_Route31MissingMail:
	text "¿Por qué es espe-"
	line "cial este #MON?"

	para "No tiene ninguna"
	line "CARTA."
	done

Text_Route31DeclinedToHandOverMail:
	text "¿Qué? ¿No quieres"
	line "nada?"
	done

Text_Route31CantTakeLastMon:
	text "Si te quito ese"
	line "#MON, ¿qué"

	para "vas a usar en los"
	line "combates?"
	done

Route31YoungsterText:
	text "He encontrado un"
	line "buen #MON en"
	cont "la CUEVA OSCURA."

	para "Voy a criarlo"
	line "para enfrentarme"
	cont "a PEGASO."

	para "Es el LÍDER del"
	line "GIMNASIO de CIUDAD"
	cont "MALVA."
	done

Route31SignText:
	text "RUTA 31"

	para "CIUDAD MALVA -"
	line "CIUDAD CEREZO"
	done

DarkCaveSignText:
	text "CUEVA OSCURA"
	done

Route31_MapEvents:
	db 0, 0 ; filler

	db 3 ; warp events
	warp_event  4,  6, ROUTE_31_VIOLET_GATE, 3
	warp_event  4,  7, ROUTE_31_VIOLET_GATE, 4
	warp_event 34,  5, DARK_CAVE_VIOLET_ENTRANCE, 1

	db 0 ; coord events

	db 2 ; bg events
	bg_event  7,  5, BGEVENT_READ, Route31Sign
	bg_event 31,  5, BGEVENT_READ, DarkCaveSign

	db 7 ; object events
	object_event 17,  7, SPRITE_FISHER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, Route31MailRecipientScript, -1
	object_event  9,  5, SPRITE_YOUNGSTER, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, Route31YoungsterScript, -1
	object_event 21, 13, SPRITE_BUG_CATCHER, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_TRAINER, 5, TrainerBugCatcherWade1, -1
	object_event 33,  8, SPRITE_COOLTRAINER_M, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, Route31CooltrainerMScript, -1
	object_event 16,  7, SPRITE_FRUIT_TREE, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, Route31FruitTree, -1
	object_event 29,  5, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, Route31Potion, EVENT_ROUTE_31_POTION
	object_event 19, 15, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, Route31PokeBall, EVENT_ROUTE_31_POKE_BALL
