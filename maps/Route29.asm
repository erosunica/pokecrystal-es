	object_const_def ; object_event constants
	const ROUTE29_COOLTRAINER_M1
	const ROUTE29_YOUNGSTER
	const ROUTE29_TEACHER1
	const ROUTE29_FRUIT_TREE
	const ROUTE29_FISHER
	const ROUTE29_COOLTRAINER_M2
	const ROUTE29_TUSCANY
	const ROUTE29_POKE_BALL

Route29_MapScripts:
	db 2 ; scene scripts
	scene_script .DummyScene0 ; SCENE_ROUTE29_NOTHING
	scene_script .DummyScene1 ; SCENE_ROUTE29_CATCH_TUTORIAL

	db 1 ; callbacks
	callback MAPCALLBACK_OBJECTS, .Tuscany

.DummyScene0:
	end

.DummyScene1:
	end

.Tuscany:
	checkflag ENGINE_ZEPHYRBADGE
	iftrue .DoesTuscanyAppear

.TuscanyDisappears:
	disappear ROUTE29_TUSCANY
	return

.DoesTuscanyAppear:
	readvar VAR_WEEKDAY
	ifnotequal TUESDAY, .TuscanyDisappears
	appear ROUTE29_TUSCANY
	return

Route29Tutorial1:
	turnobject ROUTE29_COOLTRAINER_M1, UP
	showemote EMOTE_SHOCK, ROUTE29_COOLTRAINER_M1, 15
	applymovement ROUTE29_COOLTRAINER_M1, DudeMovementData1a
	turnobject PLAYER, LEFT
	setevent EVENT_DUDE_TALKED_TO_YOU
	opentext
	writetext CatchingTutorialIntroText
	yesorno
	iffalse Script_RefusedTutorial1
	closetext
	follow ROUTE29_COOLTRAINER_M1, PLAYER
	applymovement ROUTE29_COOLTRAINER_M1, DudeMovementData1b
	stopfollow
	loadwildmon RATTATA, 5
	catchtutorial BATTLETYPE_TUTORIAL
	turnobject ROUTE29_COOLTRAINER_M1, UP
	opentext
	writetext CatchingTutorialDebriefText
	waitbutton
	closetext
	setscene SCENE_ROUTE29_NOTHING
	setevent EVENT_LEARNED_TO_CATCH_POKEMON
	end

Route29Tutorial2:
	turnobject ROUTE29_COOLTRAINER_M1, UP
	showemote EMOTE_SHOCK, ROUTE29_COOLTRAINER_M1, 15
	applymovement ROUTE29_COOLTRAINER_M1, DudeMovementData2a
	turnobject PLAYER, LEFT
	setevent EVENT_DUDE_TALKED_TO_YOU
	opentext
	writetext CatchingTutorialIntroText
	yesorno
	iffalse Script_RefusedTutorial2
	closetext
	follow ROUTE29_COOLTRAINER_M1, PLAYER
	applymovement ROUTE29_COOLTRAINER_M1, DudeMovementData2b
	stopfollow
	loadwildmon RATTATA, 5
	catchtutorial BATTLETYPE_TUTORIAL
	turnobject ROUTE29_COOLTRAINER_M1, UP
	opentext
	writetext CatchingTutorialDebriefText
	waitbutton
	closetext
	setscene SCENE_ROUTE29_NOTHING
	setevent EVENT_LEARNED_TO_CATCH_POKEMON
	end

Script_RefusedTutorial1:
	writetext CatchingTutorialDeclinedText
	waitbutton
	closetext
	applymovement ROUTE29_COOLTRAINER_M1, DudeMovementData1b
	setscene SCENE_ROUTE29_NOTHING
	end

Script_RefusedTutorial2:
	writetext CatchingTutorialDeclinedText
	waitbutton
	closetext
	applymovement ROUTE29_COOLTRAINER_M1, DudeMovementData2b
	setscene SCENE_ROUTE29_NOTHING
	end

CatchingTutorialDudeScript:
	faceplayer
	opentext
	readvar VAR_BOXSPACE
	ifequal 0, .BoxFull
	checkevent EVENT_LEARNED_TO_CATCH_POKEMON
	iftrue .BoxFull
	checkevent EVENT_GAVE_MYSTERY_EGG_TO_ELM
	iffalse .BoxFull
	writetext CatchingTutorialRepeatText
	yesorno
	iffalse .Declined
	closetext
	loadwildmon RATTATA, 5
	catchtutorial BATTLETYPE_TUTORIAL
	opentext
	writetext CatchingTutorialDebriefText
	waitbutton
	closetext
	setevent EVENT_LEARNED_TO_CATCH_POKEMON
	end

.BoxFull:
	writetext CatchingTutorialBoxFullText
	waitbutton
	closetext
	end

.Declined:
	writetext CatchingTutorialDeclinedText
	waitbutton
	closetext
	end

Route29YoungsterScript:
	jumptextfaceplayer Route29YoungsterText

Route29TeacherScript:
	jumptextfaceplayer Route29TeacherText

Route29FisherScript:
	jumptextfaceplayer Route29FisherText

Route29CooltrainerMScript:
	faceplayer
	opentext
	checktime DAY
	iftrue .day_morn
	checktime NITE
	iftrue .nite
.day_morn
	writetext Route29CooltrainerMText_WaitingForNight
	waitbutton
	closetext
	end

.nite
	writetext Route29CooltrainerMText_WaitingForMorning
	waitbutton
	closetext
	end

TuscanyScript:
	faceplayer
	opentext
	checkevent EVENT_GOT_PINK_BOW_FROM_TUSCANY
	iftrue TuscanyTuesdayScript
	readvar VAR_WEEKDAY
	ifnotequal TUESDAY, TuscanyNotTuesdayScript
	checkevent EVENT_MET_TUSCANY_OF_TUESDAY
	iftrue .MetTuscany
	writetext MeetTuscanyText
	promptbutton
	setevent EVENT_MET_TUSCANY_OF_TUESDAY
.MetTuscany:
	writetext TuscanyGivesGiftText
	promptbutton
	verbosegiveitem PINK_BOW
	iffalse TuscanyDoneScript
	setevent EVENT_GOT_PINK_BOW_FROM_TUSCANY
	writetext TuscanyGaveGiftText
	waitbutton
	closetext
	end

TuscanyTuesdayScript:
	writetext TuscanyTuesdayText
	waitbutton
TuscanyDoneScript:
	closetext
	end

TuscanyNotTuesdayScript:
	writetext TuscanyNotTuesdayText
	waitbutton
	closetext
	end

Route29Sign1:
	jumptext Route29Sign1Text

Route29Sign2:
	jumptext Route29Sign2Text

Route29FruitTree:
	fruittree FRUITTREE_ROUTE_29

Route29Potion:
	itemball POTION

DudeMovementData1a:
	step UP
	step UP
	step UP
	step UP
	step RIGHT
	step RIGHT
	step_end

DudeMovementData2a:
	step UP
	step UP
	step UP
	step RIGHT
	step RIGHT
	step_end

DudeMovementData1b:
	step LEFT
	step LEFT
	step DOWN
	step DOWN
	step DOWN
	step DOWN
	step_end

DudeMovementData2b:
	step LEFT
	step LEFT
	step DOWN
	step DOWN
	step DOWN
	step_end

CatchingTutorialBoxFullText:
	text "Los #MON se"
	line "esconden en la"

	para "hierba. Nadie sabe"
	line "cuándo salen…"
	done

CatchingTutorialIntroText:
	text "Te he visto un par"
	line "de veces."

	para "¿Cuántos #MON"
	line "has cogido?"

	para "¿Quieres que te"
	line "enseñe cómo"
	cont "atrapar #MON?"
	done

CatchingTutorialDebriefText:
	text "Así es como se"
	line "hace."

	para "Si los #MON"
	line "están débiles, son"

	para "más fáciles de"
	line "atrapar."
	done

CatchingTutorialDeclinedText:
	text "¡Ah! ¡Muy bien!"

	para "Pero si quieres"
	line "atrapar #MON,"

	para "tendrás que"
	line "caminar mucho."
	done

CatchingTutorialRepeatText:
	text "¿Qué? ¿Quieres que"
	line "te enseñe a"
	cont "atrapar #MON?"
	done

Route29YoungsterText:
	text "¿Cómo están tus"
	line "#MON?"

	para "Si están débiles y"
	line "no pueden luchar,"

	para "no entres en la"
	line "hierba."
	done

Route29TeacherText:
	text "¿Ves esos setos?"
	line "Da miedo"
	cont "saltarlos."

	para "Pero puedes ir a"
	line "PUEBLO PRIMAVERA"

	para "sin pasar por la"
	line "hierba."
	done

Route29FisherText:
	text "Quería descansar"
	line "un poco, así que"
	cont "guardé la partida."
	done

; unused
Text_WaitingForDay:
	text "Estoy esperando a"
	line "los #MON que"

	para "aparecen sólo por"
	line "el día."
	done

Route29CooltrainerMText_WaitingForNight:
	text "Estoy esperando a"
	line "los #MON que"

	para "aparecen sólo por"
	line "la noche."
	done

Route29CooltrainerMText_WaitingForMorning:
	text "Estoy esperando a"
	line "los #MON que"

	para "aparecen sólo por"
	line "la mañana."
	done

MeetTuscanyText:
	text "MARTA: Creo que es"
	line "la primera vez que"
	cont "nos vemos."

	para "Déjame que me"
	line "presente. Soy"
	cont "MARTA, por martes."
	done

TuscanyGivesGiftText:
	text "Como presentación,"
	line "por favor, toma"

	para "este regalo:"
	line "un LAZO ROSA."
	done

TuscanyGaveGiftText:
	text "MARTA: ¿No crees"
	line "que es adorable?"

	para "Fortalece los"
	line "movimientos de"
	cont "tipo normal."

	para "Seguro que te"
	line "será muy útil."
	done

TuscanyTuesdayText:
	text "MARTA: ¿Has visto"
	line "a LUNA, mi hermana"
	cont "mayor?"

	para "¿O a mi hermano"
	line "pequeño, MIGUEL?"

	para "Soy la segunda de"
	line "siete hermanos."
	done

TuscanyNotTuesdayText:
	text "MARTA: Hoy no es"
	line "martes."
	cont "¡Qué pena…!"
	done

Route29Sign1Text:
	text "RUTA 29"

	para "CIUDAD CEREZO -"
	line "PUEBLO PRIMAVERA"
	done

Route29Sign2Text:
	text "RUTA 29"

	para "CIUDAD CEREZO -"
	line "PUEBLO PRIMAVERA"
	done

Route29_MapEvents:
	db 0, 0 ; filler

	db 1 ; warp events
	warp_event 27,  1, ROUTE_29_ROUTE_46_GATE, 3

	db 2 ; coord events
	coord_event 53,  8, SCENE_ROUTE29_CATCH_TUTORIAL, Route29Tutorial1
	coord_event 53,  9, SCENE_ROUTE29_CATCH_TUTORIAL, Route29Tutorial2

	db 2 ; bg events
	bg_event 51,  7, BGEVENT_READ, Route29Sign1
	bg_event  3,  5, BGEVENT_READ, Route29Sign2

	db 8 ; object events
	object_event 50, 12, SPRITE_COOLTRAINER_M, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, CatchingTutorialDudeScript, -1
	object_event 27, 16, SPRITE_YOUNGSTER, SPRITEMOVEDATA_WALK_UP_DOWN, 0, 1, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, Route29YoungsterScript, -1
	object_event 15, 11, SPRITE_TEACHER, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 1, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, Route29TeacherScript, -1
	object_event 12,  2, SPRITE_FRUIT_TREE, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, Route29FruitTree, -1
	object_event 25,  3, SPRITE_FISHER, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, Route29FisherScript, -1
	object_event 13,  4, SPRITE_COOLTRAINER_M, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, Route29CooltrainerMScript, -1
	object_event 29, 12, SPRITE_TEACHER, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, TuscanyScript, EVENT_ROUTE_29_TUSCANY_OF_TUESDAY
	object_event 48,  2, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, Route29Potion, EVENT_ROUTE_29_POTION
