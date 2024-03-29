	object_const_def ; object_event constants
	const ROUTE46_POKEFAN_M
	const ROUTE46_YOUNGSTER
	const ROUTE46_LASS
	const ROUTE46_FRUIT_TREE1
	const ROUTE46_FRUIT_TREE2
	const ROUTE46_POKE_BALL

Route46_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

TrainerCamperTed:
	trainer CAMPER, TED, EVENT_BEAT_CAMPER_TED, CamperTedSeenText, CamperTedBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext CamperTedAfterBattleText
	waitbutton
	closetext
	end

TrainerPicnickerErin1:
	trainer PICNICKER, ERIN1, EVENT_BEAT_PICNICKER_ERIN, PicnickerErin1SeenText, PicnickerErin1BeatenText, 0, .Script

.Script:
	loadvar VAR_CALLERID, PHONE_PICNICKER_ERIN
	endifjustbattled
	opentext
	checkflag ENGINE_ERIN
	iftrue .WantsBattle
	checkcellnum PHONE_PICNICKER_ERIN
	iftrue Route46NumberAcceptedF
	checkevent EVENT_ERIN_ASKED_FOR_PHONE_NUMBER
	iftrue .AskedAlready
	writetext PicnickerErinAfterBattleText
	promptbutton
	setevent EVENT_ERIN_ASKED_FOR_PHONE_NUMBER
	scall Route46AskNumber1F
	sjump .AskForNumber

.AskedAlready:
	scall Route46AskNumber2F
.AskForNumber:
	askforphonenumber PHONE_PICNICKER_ERIN
	ifequal PHONE_CONTACTS_FULL, Route46PhoneFullF
	ifequal PHONE_CONTACT_REFUSED, Route46NumberDeclinedF
	gettrainername STRING_BUFFER_3, PICNICKER, ERIN1
	scall Route46RegisteredNumberF
	sjump Route46NumberAcceptedF

.WantsBattle:
	scall Route46RematchF
	winlosstext PicnickerErin1BeatenText, 0
	readmem wErinFightCount
	ifequal 2, .Fight2
	ifequal 1, .Fight1
	ifequal 0, .LoadFight0
.Fight2:
	checkevent EVENT_RESTORED_POWER_TO_KANTO
	iftrue .LoadFight2
.Fight1:
	checkevent EVENT_BEAT_ELITE_FOUR
	iftrue .LoadFight1
.LoadFight0:
	loadtrainer PICNICKER, ERIN1
	startbattle
	reloadmapafterbattle
	loadmem wErinFightCount, 1
	clearflag ENGINE_ERIN
	end

.LoadFight1:
	loadtrainer PICNICKER, ERIN2
	startbattle
	reloadmapafterbattle
	loadmem wErinFightCount, 2
	clearflag ENGINE_ERIN
	end

.LoadFight2:
	loadtrainer PICNICKER, ERIN3
	startbattle
	reloadmapafterbattle
	clearflag ENGINE_ERIN
	checkevent EVENT_ERIN_CALCIUM
	iftrue .HasCalcium
	checkevent EVENT_GOT_CALCIUM_FROM_ERIN
	iftrue .GotCalciumAlready
	scall Route46RematchGiftF
	verbosegiveitem CALCIUM
	iffalse ErinNoRoomForCalcium
	setevent EVENT_GOT_CALCIUM_FROM_ERIN
	sjump Route46NumberAcceptedF

.GotCalciumAlready:
	end

.HasCalcium:
	opentext
	writetext PicnickerErin2BeatenText
	waitbutton
	verbosegiveitem CALCIUM
	iffalse ErinNoRoomForCalcium
	clearevent EVENT_ERIN_CALCIUM
	setevent EVENT_GOT_CALCIUM_FROM_ERIN
	sjump Route46NumberAcceptedF

Route46AskNumber1F:
	jumpstd asknumber1f
	end

Route46AskNumber2F:
	jumpstd asknumber2f
	end

Route46RegisteredNumberF:
	jumpstd registerednumberf
	end

Route46NumberAcceptedF:
	jumpstd numberacceptedf
	end

Route46NumberDeclinedF:
	jumpstd numberdeclinedf
	end

Route46PhoneFullF:
	jumpstd phonefullf
	end

Route46RematchF:
	jumpstd rematchf
	end

ErinNoRoomForCalcium:
	setevent EVENT_ERIN_CALCIUM
	jumpstd packfullf
	end

Route46RematchGiftF:
	jumpstd rematchgiftf
	end

TrainerHikerBailey:
	trainer HIKER, BAILEY, EVENT_BEAT_HIKER_BAILEY, HikerBaileySeenText, HikerBaileyBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext HikerBaileyAfterBattleText
	waitbutton
	closetext
	end

Route46Sign:
	jumptext Route46SignText

Route46XSpeed:
	itemball X_SPEED

Route46FruitTree1:
	fruittree FRUITTREE_ROUTE_46_1

Route46FruitTree2:
	fruittree FRUITTREE_ROUTE_46_2

HikerBaileySeenText:
	text "De acuerdo. ¡Te"
	line "enseñaré el poder"

	para "de los #MON"
	line "de montaña!"
	done

HikerBaileyBeatenText:
	text "¡Me has demostrado"
	line "tu poder!"
	done

HikerBaileyAfterBattleText:
	text "Se acabó, pero no"
	line "me importa."

	para "Los MONTAÑEROS"
	line "somos así."
	done

CamperTedSeenText:
	text "¡Yo también"
	line "entreno #MON!"

	para "¿Quieres luchar"
	line "contra mí?"
	done

CamperTedBeatenText:
	text "¿Qué…?"
	done

CamperTedAfterBattleText:
	text "Hice lo que pude"
	line "pero no sirvió."

	para "No hay excusa que"
	line "valga. He perdido."
	done

PicnickerErin1SeenText:
	text "¡Yo también"
	line "entreno #MON!"

	para "¿Quieres luchar"
	line "contra mí?"
	done

PicnickerErin1BeatenText:
	text "¡Oh, narices!"
	done

PicnickerErinAfterBattleText:
	text "He estado en"
	line "muchos GIMNASIOS,"

	para "pero el de TRIGAL"
	line "es mi favorito."

	para "¡Está lleno de"
	line "flores preciosas!"
	done

PicnickerErin2BeatenText:
	text "Auuuu… ¡Pierdo"
	line "siempre! ¡Sólo"

	para "tengo que seguir"
	line "intentándolo!"

	para "Bueno, gracias por"
	line "luchar conmigo una"

	para "y otra vez. Toma"
	line "este regalo de la"
	cont "última vez."
	done

Route46SignText:
	text "RUTA 46"
	line "CAMINO MONTAÑA"
	done

Route46_MapEvents:
	db 0, 0 ; filler

	db 3 ; warp events
	warp_event  7, 33, ROUTE_29_ROUTE_46_GATE, 1
	warp_event  8, 33, ROUTE_29_ROUTE_46_GATE, 2
	warp_event 14,  5, DARK_CAVE_VIOLET_ENTRANCE, 3

	db 0 ; coord events

	db 1 ; bg events
	bg_event  9, 27, BGEVENT_READ, Route46Sign

	db 6 ; object events
	object_event 12, 19, SPRITE_POKEFAN_M, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_TRAINER, 2, TrainerHikerBailey, -1
	object_event  4, 14, SPRITE_YOUNGSTER, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_TRAINER, 2, TrainerCamperTed, -1
	object_event  2, 13, SPRITE_LASS, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_TRAINER, 2, TrainerPicnickerErin1, -1
	object_event  7,  5, SPRITE_FRUIT_TREE, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, Route46FruitTree1, -1
	object_event  8,  6, SPRITE_FRUIT_TREE, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, Route46FruitTree2, -1
	object_event  1, 15, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, Route46XSpeed, EVENT_ROUTE_46_X_SPEED
