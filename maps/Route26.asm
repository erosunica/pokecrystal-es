	object_const_def ; object_event constants
	const ROUTE26_COOLTRAINER_M1
	const ROUTE26_COOLTRAINER_M2
	const ROUTE26_COOLTRAINER_F1
	const ROUTE26_COOLTRAINER_F2
	const ROUTE26_YOUNGSTER
	const ROUTE26_FISHER
	const ROUTE26_FRUIT_TREE
	const ROUTE26_POKE_BALL

Route26_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

TrainerCooltrainermJake:
	trainer COOLTRAINERM, JAKE, EVENT_BEAT_COOLTRAINERM_JAKE, CooltrainermJakeSeenText, CooltrainermJakeBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext CooltrainermJakeAfterBattleText
	waitbutton
	closetext
	end

TrainerCooltrainermGaven3:
	trainer COOLTRAINERM, GAVEN3, EVENT_BEAT_COOLTRAINERM_GAVEN, CooltrainermGaven3SeenText, CooltrainermGaven3BeatenText, 0, .Script

.Script:
	loadvar VAR_CALLERID, PHONE_COOLTRAINERM_GAVEN
	endifjustbattled
	opentext
	checkflag ENGINE_GAVEN
	iftrue .WantsBattle
	checkcellnum PHONE_COOLTRAINERM_GAVEN
	iftrue .NumberAccepted
	checkevent EVENT_GAVEN_ASKED_FOR_PHONE_NUMBER
	iftrue .AskedAlready
	writetext CooltrainermGavenAfterText
	promptbutton
	setevent EVENT_GAVEN_ASKED_FOR_PHONE_NUMBER
	scall .AskNumber1
	sjump .AskForNumber

.AskedAlready:
	scall .AskNumber2
.AskForNumber:
	askforphonenumber PHONE_COOLTRAINERM_GAVEN
	ifequal PHONE_CONTACTS_FULL, .PhoneFull
	ifequal PHONE_CONTACT_REFUSED, .NumberDeclined
	gettrainername STRING_BUFFER_3, COOLTRAINERM, GAVEN3
	scall .RegisteredNumber
	sjump .NumberAccepted

.WantsBattle:
	scall .Rematch
	winlosstext CooltrainermGaven3BeatenText, 0
	readmem wGavenFightCount
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
	loadtrainer COOLTRAINERM, GAVEN3
	startbattle
	reloadmapafterbattle
	loadmem wGavenFightCount, 1
	clearflag ENGINE_GAVEN
	end

.LoadFight1:
	loadtrainer COOLTRAINERM, GAVEN1
	startbattle
	reloadmapafterbattle
	loadmem wGavenFightCount, 2
	clearflag ENGINE_GAVEN
	end

.LoadFight2:
	loadtrainer COOLTRAINERM, GAVEN2
	startbattle
	reloadmapafterbattle
	clearflag ENGINE_GAVEN
	end

.AskNumber1:
	jumpstd asknumber1m
	end

.AskNumber2:
	jumpstd asknumber2m
	end

.RegisteredNumber:
	jumpstd registerednumberm
	end

.NumberAccepted:
	jumpstd numberacceptedm
	end

.NumberDeclined:
	jumpstd numberdeclinedm
	end

.PhoneFull:
	jumpstd phonefullm
	end

.Rematch:
	jumpstd rematchm
	end

TrainerCooltrainerfJoyce:
	trainer COOLTRAINERF, JOYCE, EVENT_BEAT_COOLTRAINERF_JOYCE, CooltrainerfJoyceSeenText, CooltrainerfJoyceBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext CooltrainerfJoyceAfterBattleText
	waitbutton
	closetext
	end

TrainerCooltrainerfBeth1:
	trainer COOLTRAINERF, BETH1, EVENT_BEAT_COOLTRAINERF_BETH, CooltrainerfBeth1SeenText, CooltrainerfBeth1BeatenText, 0, .Script

.Script:
	loadvar VAR_CALLERID, PHONE_COOLTRAINERF_BETH
	endifjustbattled
	opentext
	checkflag ENGINE_BETH
	iftrue .WantsBattle
	checkcellnum PHONE_COOLTRAINERF_BETH
	iftrue .NumberAccepted
	checkevent EVENT_BETH_ASKED_FOR_PHONE_NUMBER
	iftrue .AskedAlready
	writetext CooltrainerfBethAfterText
	promptbutton
	setevent EVENT_BETH_ASKED_FOR_PHONE_NUMBER
	scall .AskNumber1
	sjump .AskForNumber

.AskedAlready:
	scall .AskNumber2
.AskForNumber:
	askforphonenumber PHONE_COOLTRAINERF_BETH
	ifequal PHONE_CONTACTS_FULL, .PhoneFull
	ifequal PHONE_CONTACT_REFUSED, .NumberDeclined
	gettrainername STRING_BUFFER_3, COOLTRAINERF, BETH1
	scall .RegisteredNumber
	sjump .NumberAccepted

.WantsBattle:
	scall .Rematch
	winlosstext CooltrainerfBeth1BeatenText, 0
	readmem wBethFightCount
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
	loadtrainer COOLTRAINERF, BETH1
	startbattle
	reloadmapafterbattle
	loadmem wBethFightCount, 1
	clearflag ENGINE_BETH
	end

.LoadFight1:
	loadtrainer COOLTRAINERF, BETH2
	startbattle
	reloadmapafterbattle
	loadmem wBethFightCount, 2
	clearflag ENGINE_BETH
	end

.LoadFight2:
	loadtrainer COOLTRAINERF, BETH3
	startbattle
	reloadmapafterbattle
	clearflag ENGINE_BETH
	end

.AskNumber1:
	jumpstd asknumber1f
	end

.AskNumber2:
	jumpstd asknumber2f
	end

.RegisteredNumber:
	jumpstd registerednumberf
	end

.NumberAccepted:
	jumpstd numberacceptedf
	end

.NumberDeclined:
	jumpstd numberdeclinedf
	end

.PhoneFull:
	jumpstd phonefullf
	end

.Rematch:
	jumpstd rematchf
	end

TrainerPsychicRichard:
	trainer PSYCHIC_T, RICHARD, EVENT_BEAT_PSYCHIC_RICHARD, PsychicRichardSeenText, PsychicRichardBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext PsychicRichardAfterBattleText
	waitbutton
	closetext
	end

TrainerFisherScott:
	trainer FISHER, SCOTT, EVENT_BEAT_FISHER_SCOTT, FisherScottSeenText, FisherScottBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext FisherScottAfterBattleText
	waitbutton
	closetext
	end

Route26Sign:
	jumptext Route26SignText

Route26FruitTree:
	fruittree FRUITTREE_ROUTE_26

Route26MaxElixer:
	itemball MAX_ELIXER

CooltrainermJakeSeenText:
	text "Estoy haciendo"
	line "los últimos"

	para "preparativos para"
	line "la LIGA #MON."
	done

CooltrainermJakeBeatenText:
	text "¡Caramba!"
	done

CooltrainermJakeAfterBattleText:
	text "Va a ser difícil"
	line "ganar en la LIGA."

	para "Tengo que entre-"
	line "narme mucho más."

	para "Dicen que el ALTO"
	line "MANDO es más duro"

	para "que los LÍDERES de"
	line "GIMNASIO."
	done

CooltrainermGaven3SeenText:
	text "Es en estos duros"
	line "combates donde"
	cont "ganas más poder."
	done

CooltrainermGaven3BeatenText:
	text "¡La vida es aún"
	line "más dura!"
	done

CooltrainermGavenAfterText:
	text "Para llegar a la"
	line "LIGA #MON,"

	para "hay que pasar por"
	line "la CALLE VICTORIA."

	para "Pero la CALLE"
	line "VICTORIA es dura."

	para "¡No va allí casi"
	line "nadie!"
	done

CooltrainerfJoyceSeenText:
	text "Si has llegado tan"
	line "lejos, debes de"
	cont "ser el no va más."

	para "¡Voy a dar todo"
	line "lo que tengo en"
	cont "este combate!"
	done

CooltrainerfJoyceBeatenText:
	text "¡No! ¡No puedo"
	line "creerlo!"
	done

CooltrainerfJoyceAfterBattleText:
	text "Como había vencido"
	line "a ocho LÍDERES de"

	para "GIMNASIO, me"
	line "confié demasiado."

	para "Tendré que"
	line "esforzarme más."
	done

CooltrainerfBeth1SeenText:
	text "He perdido contra"
	line "<RIVAL>."

	para "Era realmente"
	line "fuerte, pero…"

	para "Parecía como si"
	line "tuviera que ganar"
	cont "a toda costa."

	para "Me dieron pena"
	line "sus #MON."
	done

CooltrainerfBeth1BeatenText:
	text "Los #MON no son"
	line "armas de guerra."
	done

CooltrainerfBethAfterText:
	text "Los #MON son"
	line "valiosos amigos"
	cont "para toda la vida."
	done

PsychicRichardSeenText:
	text "¡Uau! ¡Cuántas"
	line "MEDALLAS! Estoy"
	cont "impresionado."

	para "Pero no te basta"
	line "sólo con coleccio-"
	cont "narlas, ¿verdad?"
	done

PsychicRichardBeatenText:
	text "¡Buena batalla!"
	done

PsychicRichardAfterBattleText:
	text "Las personas y los"
	line "#MON se"

	para "enriquecen con la"
	line "experiencia."

	para "No seas tan"
	line "conformista."
	done

FisherScottSeenText:
	text "¡Hoy me siento"
	line "muy bien!"

	para "¡Siento que podría"
	line "vencer hasta al"
	cont "CAMPEÓN de LIGA!"
	done

FisherScottBeatenText:
	text "¡No! ¡En esta"
	line "batalla, no!"
	done

FisherScottAfterBattleText:
	text "Como en la pesca,"
	line "con los #MON"

	para "todo está perdido"
	line "si te rindes."
	done

Route26SignText:
	text "RUTA 26"

	para "RECEPCIÓN DE LA"
	line "LIGA #MON"
	done

Route26_MapEvents:
	db 0, 0 ; filler

	db 3 ; warp events
	warp_event  7,  5, VICTORY_ROAD_GATE, 3
	warp_event 15, 57, ROUTE_26_HEAL_HOUSE, 1
	warp_event  5, 71, DAY_OF_WEEK_SIBLINGS_HOUSE, 1

	db 0 ; coord events

	db 1 ; bg events
	bg_event  8,  6, BGEVENT_READ, Route26Sign

	db 8 ; object events
	object_event 14, 24, SPRITE_COOLTRAINER_M, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 2, TrainerCooltrainermJake, -1
	object_event  9, 38, SPRITE_COOLTRAINER_M, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 3, TrainerCooltrainermGaven3, -1
	object_event 10, 56, SPRITE_COOLTRAINER_F, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 3, TrainerCooltrainerfJoyce, -1
	object_event  5,  8, SPRITE_COOLTRAINER_F, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 4, TrainerCooltrainerfBeth1, -1
	object_event 13, 79, SPRITE_YOUNGSTER, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 2, TrainerPsychicRichard, -1
	object_event 10, 92, SPRITE_FISHER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_TRAINER, 3, TrainerFisherScott, -1
	object_event 14, 54, SPRITE_FRUIT_TREE, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, Route26FruitTree, -1
	object_event  9, 15, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, Route26MaxElixer, EVENT_ROUTE_26_MAX_ELIXER
