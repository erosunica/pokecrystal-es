	object_const_def ; object_event constants
	const DRAGONSHRINE_ELDER1
	const DRAGONSHRINE_ELDER2
	const DRAGONSHRINE_ELDER3
	const DRAGONSHRINE_CLAIR

DragonShrine_MapScripts:
	db 2 ; scene scripts
	scene_script .DragonShrineTest ; SCENE_DEFAULT
	scene_script .DummyScene ; SCENE_FINISHED

	db 0 ; callbacks

.DragonShrineTest:
	prioritysjump .DragonShrineTestScript
	end

.DummyScene:
	end

.DragonShrineTestScript:
	applymovement PLAYER, DragonShrinePlayerWalkInMovement
	applymovement DRAGONSHRINE_ELDER1, DragonShrineElderStepDownMovement
	opentext
	writetext DragonShrineElderGreetingText
	promptbutton
.Question1:
	setevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_2
	writetext DragonShrineQuestion1Text
	promptbutton
	loadmenu DragonShrineQuestion1_MenuHeader
	verticalmenu
	closewindow
	ifequal 1, .RightAnswer
	ifequal 2, .WrongAnswer
	ifequal 3, .RightAnswer
	end

.Question2:
	setevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_3
	writetext DragonShrineQuestion2Text
	promptbutton
	loadmenu DragonShrineQuestion2_MenuHeader
	verticalmenu
	closewindow
	ifequal 1, .RightAnswer
	ifequal 2, .RightAnswer
	ifequal 3, .WrongAnswer
.Question3:
	setevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_4
	writetext DragonShrineQuestion3Text
	promptbutton
	loadmenu DragonShrineQuestion3_MenuHeader
	verticalmenu
	closewindow
	ifequal 1, .WrongAnswer
	ifequal 2, .RightAnswer
	ifequal 3, .RightAnswer
.Question4:
	setevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_5
	writetext DragonShrineQuestion4Text
	promptbutton
	loadmenu DragonShrineQuestion4_MenuHeader
	verticalmenu
	closewindow
	ifequal 1, .RightAnswer
	ifequal 2, .WrongAnswer
	ifequal 3, .RightAnswer
.Question5:
	setevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_6
	writetext DragonShrineQuestion5Text
	promptbutton
	loadmenu DragonShrineQuestion5_MenuHeader
	verticalmenu
	closewindow
	ifequal 1, .WrongAnswer
	ifequal 2, .RightAnswer
	ifequal 3, .WrongAnswer
.RightAnswer:
	checkevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_6
	iftrue .PassedTheTest
	writetext DragonShrineRightAnswerText
	promptbutton
	checkevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_5
	iftrue .Question5
	checkevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_4
	iftrue .Question4
	checkevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_3
	iftrue .Question3
	checkevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_2
	iftrue .Question2
.WrongAnswer:
	closetext
	turnobject DRAGONSHRINE_ELDER1, LEFT
	opentext
	writetext DragonShrineWrongAnswerText1
	waitbutton
	closetext
	turnobject DRAGONSHRINE_ELDER1, DOWN
	opentext
	writetext DragonShrineWrongAnswerText2
	waitbutton
	closetext
	setevent EVENT_ANSWERED_DRAGON_MASTER_QUIZ_WRONG
	opentext
	checkevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_6
	iftrue .Question5
	checkevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_5
	iftrue .Question4
	checkevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_4
	iftrue .Question3
	checkevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_3
	iftrue .Question2
	checkevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_2
	iftrue .Question1
.PassedTheTest:
	writetext DragonShrinePassedTestText
	waitbutton
	closetext
	playsound SFX_ENTER_DOOR
	showemote EMOTE_SHOCK, PLAYER, 15
	playmusic MUSIC_CLAIR
	appear DRAGONSHRINE_CLAIR
	waitsfx
	turnobject PLAYER, DOWN
	pause 30
	applymovement DRAGONSHRINE_CLAIR, DragonShrineClairWalkInMovement
	turnobject DRAGONSHRINE_CLAIR, RIGHT
	turnobject PLAYER, LEFT
	turnobject DRAGONSHRINE_ELDER1, LEFT
	opentext
	writetext DragonShrineClairYouPassedText
	waitbutton
	closetext
	special FadeOutMusic
	applymovement DRAGONSHRINE_CLAIR, DragonShrineClairBigStepLeftMovement
	opentext
	writetext DragonShrineClairThatCantBeText
	waitbutton
	closetext
	applymovement DRAGONSHRINE_CLAIR, DragonShrineClairSlowStepLeftMovement
	opentext
	writetext DragonShrineClairYoureLyingText
	waitbutton
	closetext
	applymovement DRAGONSHRINE_ELDER1, DragonShrineElderWalkToClairMovement
	turnobject DRAGONSHRINE_CLAIR, UP
	opentext
	writetext DragonShrineMustIInformLanceText
	waitbutton
	closetext
	showemote EMOTE_SHOCK, DRAGONSHRINE_CLAIR, 15
	opentext
	writetext DragonShrineIUnderstandText
	waitbutton
	closetext
	applymovement DRAGONSHRINE_CLAIR, DragonShrineClairTwoSlowStepsRightMovement
	opentext
	writetext DragonShrineHereRisingBadgeText
	waitbutton
	setflag ENGINE_RISINGBADGE
	playsound SFX_GET_BADGE
	waitsfx
	special RestartMapMusic
	specialphonecall SPECIALCALL_MASTERBALL
	setscene SCENE_FINISHED
	setmapscene DRAGONS_DEN_B1F, SCENE_DRAGONSDENB1F_CLAIR_GIVES_TM
	writetext DragonShrinePlayerReceivedRisingBadgeText
	promptbutton
	writetext DragonShrineRisingBadgeExplanationText
	waitbutton
	closetext
	applymovement DRAGONSHRINE_ELDER1, DragonShrineElderWalkAway1Movement
	turnobject DRAGONSHRINE_CLAIR, UP
	applymovement DRAGONSHRINE_ELDER1, DragonShrineElderWalkAway2Movement
	turnobject PLAYER, UP
	opentext
	writetext DragonShrineElderScoldsClairText
	waitbutton
	closetext
	opentext
	writetext DragonShrineSpeechlessText
	waitbutton
	closetext
	applymovement DRAGONSHRINE_CLAIR, DragonShrineClairWalkOutMovement
	playsound SFX_ENTER_DOOR
	disappear DRAGONSHRINE_CLAIR
	waitsfx
	setevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_1
	end

DragonShrineElder1Script:
	faceplayer
	opentext
	checkevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_1
	iftrue .DontGiveDratiniYet
	checkevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_7
	iftrue .ReceivedDratini
	checkevent EVENT_GOT_DRATINI
	iffalse .GiveDratini
	checkevent EVENT_BEAT_RIVAL_IN_MT_MOON
	iftrue .BeatRivalInMtMoon
	writetext DragonShrineClairsGrandfatherText
	waitbutton
	closetext
	end

.GiveDratini:
	writetext DragonShrineTakeThisDratiniText
	waitbutton
	readvar VAR_PARTYCOUNT
	ifequal PARTY_LENGTH, .PartyFull
	writetext DragonShrinePlayerReceivedDratiniText
	playsound SFX_CAUGHT_MON
	waitsfx
	givepoke DRATINI, 15
	checkevent EVENT_ANSWERED_DRAGON_MASTER_QUIZ_WRONG
	special GiveDratini
	setevent EVENT_GOT_DRATINI
	setevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_7
	writetext DragonShrineSymbolicDragonText
	waitbutton
	closetext
	end

.PartyFull:
	writetext DragonShrinePartyFullText
	waitbutton
	closetext
	end

.BeatRivalInMtMoon:
	writetext DragonShrineSilverIsInTrainingText
	waitbutton
	closetext
	end

.DontGiveDratiniYet:
	writetext DragonShrineComeAgainText
	waitbutton
	closetext
	end

.ReceivedDratini:
	writetext DragonShrineSymbolicDragonText
	waitbutton
	closetext
	end

DragonShrineElder2Script:
	faceplayer
	opentext
	writetext DragonShrineElder2Text
	waitbutton
	closetext
	end

DragonShrineElder3Script:
	faceplayer
	opentext
	writetext DragonShrineElder3Text
	waitbutton
	closetext
	end

DragonShrineQuestion1_MenuHeader:
	db MENU_BACKUP_TILES ; flags
	menu_coords 8, 4, SCREEN_WIDTH - 1, TEXTBOX_Y - 1
	dw .MenuData
	db 1 ; default option

.MenuData:
	db STATICMENU_CURSOR | STATICMENU_DISABLE_B ; flags
	db 3 ; items
	db "Compañero@"
	db "Secuaz@"
	db "Amigo@"

DragonShrineQuestion2_MenuHeader:
	db MENU_BACKUP_TILES ; flags
	menu_coords 7, 4, SCREEN_WIDTH - 1, TEXTBOX_Y - 1
	dw .MenuData
	db 1 ; default option

.MenuData:
	db STATICMENU_CURSOR | STATICMENU_DISABLE_B ; flags
	db 3 ; items
	db "Estrategia@"
	db "Mejora@"
	db "Trampas@"

DragonShrineQuestion3_MenuHeader:
	db MENU_BACKUP_TILES ; flags
	menu_coords 7, 4, SCREEN_WIDTH - 1, TEXTBOX_Y - 1
	dw .MenuData
	db 1 ; default option

.MenuData:
	db STATICMENU_CURSOR | STATICMENU_DISABLE_B ; flags
	db 3 ; items
	db "Débil@"
	db "Duro@"
	db "Cualquiera@"

DragonShrineQuestion4_MenuHeader:
	db MENU_BACKUP_TILES ; flags
	menu_coords 8, 4, SCREEN_WIDTH - 1, TEXTBOX_Y - 1
	dw .MenuData
	db 1 ; default option

.MenuData:
	db STATICMENU_CURSOR | STATICMENU_DISABLE_B ; flags
	db 3 ; items
	db "Amor@"
	db "Violencia@"
	db "Sabiduría@"

DragonShrineQuestion5_MenuHeader:
	db MENU_BACKUP_TILES ; flags
	menu_coords 10, 4, SCREEN_WIDTH - 1, TEXTBOX_Y - 1
	dw .MenuData
	db 1 ; default option

.MenuData:
	db STATICMENU_CURSOR | STATICMENU_DISABLE_B ; flags
	db 3 ; items
	db "Duros@"
	db "Ambos@"
	db "Débiles@"

DragonShrinePlayerWalkInMovement:
	slow_step UP
	slow_step UP
	slow_step UP
	slow_step RIGHT
	slow_step UP
	slow_step UP
	slow_step UP
	step_end

DragonShrineElderStepDownMovement:
	slow_step DOWN
	step_end

DragonShrineElderWalkToClairMovement:
	slow_step LEFT
	slow_step LEFT
	slow_step LEFT
	turn_head DOWN
	step_end

DragonShrineElderWalkAway1Movement:
	slow_step RIGHT
	slow_step RIGHT
	step_end

DragonShrineElderWalkAway2Movement:
	slow_step RIGHT
	turn_head DOWN
	step_end

DragonShrineClairWalkInMovement:
	slow_step UP
	slow_step UP
	slow_step UP
	slow_step UP
	slow_step UP
	step_end

DragonShrineClairBigStepLeftMovement:
	fix_facing
	big_step LEFT
	step_end

DragonShrineClairSlowStepLeftMovement:
	slow_step LEFT
	remove_fixed_facing
	step_end

DragonShrineClairTwoSlowStepsRightMovement:
	slow_step RIGHT
	slow_step RIGHT
	step_end

DragonShrineClairWalkOutMovement:
	step DOWN
	step DOWN
	step DOWN
	step DOWN
	step DOWN
	step DOWN
	step_end

DragonShrineElderGreetingText:
	text "Mmm… Encantado"
	line "de verte."

	para "No necesitas"
	line "explicarme por qué"
	cont "has venido."

	para "DÉBORA te envía,"
	line "¿verdad?"

	para "Esa chica es muy"
	line "traviesa…"

	para "Lo siento, pero"
	line "debo probarte."

	para "No te preocupes."
	line "Sólo deberás"

	para "contestar unas"
	line "pocas preguntas."

	para "¿Ya?"
	done

DragonShrineQuestion1Text:
	text "¿Qué son los #-"
	line "MON para ti?"
	done

DragonShrineQuestion2Text:
	text "¿Qué te ayuda a"
	line "vencer combates?"
	done

DragonShrineQuestion3Text:
	text "¿Contra qué clase"
	line "de entrenador"
	cont "prefieres luchar?"
	done

DragonShrineQuestion4Text:
	text "¿Qué es lo más"
	line "importante para"
	cont "mejorar #MON?"
	done

DragonShrineQuestion5Text:
	text "#MON fuertes."
	line "#MON débiles."

	para "¿Cuáles son más"
	line "importantes?"
	done

DragonShrinePassedTestText:
	text "Mmm… Ya veo…"

	para "Cuidas mucho de"
	line "los #MON."

	para "Muy encomiable."

	para "¡La convicción es"
	line "lo más importante!"

	para "<PLAYER>, no pier-"
	line "das la confianza."

	para "La necesitarás en"
	line "la LIGA #MON."
	done

DragonShrineMustIInformLanceText:
	text "¡DÉBORA!"

	para "¡Esta persona es"
	line "admirable en todos"
	cont "los sentidos!"

	para "¡Admite la derrota"
	line "y dale la MEDALLA"
	cont "DRAGÓN!"

	para "¿O debo informar a"
	line "LANCE de esto…?"
	done

DragonShrineElderScoldsClairText:
	text "DÉBORA…"

	para "Medita acerca de"
	line "lo que tiene y"
	cont "tú careces…"
	done

DragonShrineComeAgainText:
	text "Ven de nuevo, si"
	line "así lo deseas."
	done

DragonShrineTakeThisDratiniText:
	text "Mmmm… Encantado"
	line "de verte."

	para "Tu llegada es más"
	line "que afortunada."

	para "Tengo algo para"
	line "ti."

	para "Coge este DRATINI"
	line "como prueba de"

	para "que reconozco tu"
	line "esfuerzo."
	done

DragonShrinePlayerReceivedDratiniText:
	text "¡<PLAYER> recibió"
	line "a DRATINI!"
	done

DragonShrinePartyFullText:
	text "¿Mmm? Tu equipo"
	line "#MON está"
	cont "lleno."
	done

DragonShrineSymbolicDragonText:
	text "Los #MON dragón"
	line "son el símbolo de"
	cont "nuestro clan."

	para "Has demostrado que"
	line "podemos darte uno."
	done

DragonShrineClairsGrandfatherText:
	text "Parece que DÉBORA"
	line "ha aprendido de ti"

	para "una lección"
	line "inestimable."

	para "Te lo agradezco"
	line "como abuelo suyo"
	cont "que soy."
	done

DragonShrineSilverIsInTrainingText:
	text "Un chico de tu"
	line "edad está aquí"
	cont "entrenándose."

	para "Es como DÉBORA"
	line "cuando era joven."

	para "Es algo"
	line "inquietante…"
	done

DragonShrineWrongAnswerText1:
	text "¿Eh? No lo he"
	line "entendido…"
	done

DragonShrineWrongAnswerText2:
	text "¿Qué has dicho?"
	done

DragonShrineRightAnswerText:
	text "Oh, ya entiendo…"
	done

DragonShrineElder2Text:
	text "Ha pasado bastante"
	line "tiempo desde la"

	para "última vez que un"
	line "entrenador obtuvo"

	para "la aprobación de"
	line "nuestro MAESTRO."

	para "De hecho, nadie"
	line "lo ha conseguido"

	para "desde que el Maes-"
	line "tro LANCE la ganó."
	done

DragonShrineElder3Text:
	text "¿Conoces al joven"
	line "Maestro LANCE?"

	para "Se parece bastante"
	line "a nuestro MAESTRO"
	cont "cuando era joven."

	para "Lo llevan en la"
	line "sangre."
	done

DragonShrineClairYouPassedText:
	text "¿Qué tal te fue?"

	para "Creo que no hace"
	line "falta preguntar…"

	para "¿Fallaste?"

	para "<……><……><……><……><……><……>"

	para "¿Qué…?"
	line "¿Lo conseguiste?"
	done

DragonShrineClairThatCantBeText:
	text "¡No es posible!"
	done

DragonShrineClairYoureLyingText:
	text "¡Estás mintiendo!"

	para "¡Ni siquiera yo he"
	line "conseguido la"
	cont "aprobación!"
	done

DragonShrineIUnderstandText:
	text "En… entiendo…"
	done

DragonShrineHereRisingBadgeText:
	text "Toma. Ésta es la"
	line "MEDALLA DRAGÓN…"

	para "¡Deprisa! ¡Cógela!"
	done

DragonShrinePlayerReceivedRisingBadgeText:
	text "<PLAYER> recibió"
	line "la MEDALLA DRAGÓN."
	done

DragonShrineRisingBadgeExplanationText:
	text "La MEDALLA DRAGÓN"
	line "permite que tus"

	para "#MON puedan"
	line "usar el movimiento"

	para "para subir"
	line "cascadas."

	para "Además, todos los"
	line "#MON te"

	para "reconocerán y obe-"
	line "decerán cualquier"

	para "orden sin hacer"
	line "preguntas."
	done

DragonShrineSpeechlessText:
	text "<……><……><……><……><……><……>"
	done

DragonShrine_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event  4,  9, DRAGONS_DEN_B1F, 2
	warp_event  5,  9, DRAGONS_DEN_B1F, 2

	db 0 ; coord events

	db 0 ; bg events

	db 4 ; object events
	object_event  5,  1, SPRITE_ELDER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, DragonShrineElder1Script, EVENT_TEMPORARY_UNTIL_MAP_RELOAD_1
	object_event  2,  4, SPRITE_ELDER, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, DragonShrineElder2Script, EVENT_TEMPORARY_UNTIL_MAP_RELOAD_1
	object_event  7,  4, SPRITE_ELDER, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, DragonShrineElder3Script, EVENT_TEMPORARY_UNTIL_MAP_RELOAD_1
	object_event  4,  8, SPRITE_CLAIR, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, ObjectEvent, EVENT_DRAGON_SHRINE_CLAIR
