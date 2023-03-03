	object_const_def ; object_event constants
	const PLAYERSHOUSE1F_MOM1
	const PLAYERSHOUSE1F_MOM2
	const PLAYERSHOUSE1F_MOM3
	const PLAYERSHOUSE1F_MOM4
	const PLAYERSHOUSE1F_POKEFAN_F

PlayersHouse1F_MapScripts:
	db 2 ; scene scripts
	scene_script .DummyScene0 ; SCENE_DEFAULT
	scene_script .DummyScene1 ; SCENE_FINISHED

	db 0 ; callbacks

.DummyScene0:
	end

.DummyScene1:
	end

MeetMomLeftScript:
	setevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_1

MeetMomRightScript:
	playmusic MUSIC_MOM
	showemote EMOTE_SHOCK, PLAYERSHOUSE1F_MOM1, 15
	turnobject PLAYER, LEFT
	checkevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_1
	iffalse .OnRight
	applymovement PLAYERSHOUSE1F_MOM1, MomTurnsTowardPlayerMovement
	sjump MeetMomScript

.OnRight:
	applymovement PLAYERSHOUSE1F_MOM1, MomWalksToPlayerMovement
MeetMomScript:
	opentext
	writetext ElmsLookingForYouText
	promptbutton
	getstring STRING_BUFFER_4, PokegearName
	scall PlayersHouse1FReceiveItemStd
	setflag ENGINE_POKEGEAR
	setflag ENGINE_PHONE_CARD
	addcellnum PHONE_MOM
	setscene SCENE_FINISHED
	setevent EVENT_PLAYERS_HOUSE_MOM_1
	clearevent EVENT_PLAYERS_HOUSE_MOM_2
	writetext MomGivesPokegearText
	promptbutton
	special SetDayOfWeek
.SetDayOfWeek:
	writetext IsItDSTText
	yesorno
	iffalse .WrongDay
	special InitialSetDSTFlag
	yesorno
	iffalse .SetDayOfWeek
	sjump .DayOfWeekDone

.WrongDay:
	special InitialClearDSTFlag
	yesorno
	iffalse .SetDayOfWeek
.DayOfWeekDone:
	writetext ComeHomeForDSTText
	yesorno
	iffalse .ExplainPhone
	sjump .KnowPhone

.KnowPhone:
	writetext KnowTheInstructionsText
	promptbutton
	sjump .FinishPhone

.ExplainPhone:
	writetext DontKnowTheInstructionsText
	promptbutton
	sjump .FinishPhone

.FinishPhone:
	writetext InstructionsNextText
	waitbutton
	closetext
	checkevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_1
	iftrue .FromRight
	checkevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_2
	iffalse .FromLeft
	sjump .Finish

.FromRight:
	applymovement PLAYERSHOUSE1F_MOM1, MomTurnsBackMovement
	sjump .Finish

.FromLeft:
	applymovement PLAYERSHOUSE1F_MOM1, MomWalksBackMovement
	sjump .Finish

.Finish:
	special RestartMapMusic
	turnobject PLAYERSHOUSE1F_MOM1, LEFT
	end

MeetMomTalkedScript:
	playmusic MUSIC_MOM
	sjump MeetMomScript

PokegearName:
	db "#GEAR@"

PlayersHouse1FReceiveItemStd:
	jumpstd receiveitem
	end

MomScript:
	faceplayer
	setevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_2
	checkscene
	iffalse MeetMomTalkedScript ; SCENE_DEFAULT
	opentext
	checkevent EVENT_FIRST_TIME_BANKING_WITH_MOM
	iftrue .FirstTimeBanking
	checkevent EVENT_TALKED_TO_MOM_AFTER_MYSTERY_EGG_QUEST
	iftrue .BankOfMom
	checkevent EVENT_GAVE_MYSTERY_EGG_TO_ELM
	iftrue .GaveMysteryEgg
	checkevent EVENT_GOT_A_POKEMON_FROM_ELM
	iftrue .GotAPokemon
	writetext HurryUpElmIsWaitingText
	waitbutton
	closetext
	end

.GotAPokemon:
	writetext SoWhatWasProfElmsErrandText
	waitbutton
	closetext
	end

.FirstTimeBanking:
	writetext ImBehindYouText
	waitbutton
	closetext
	end

.GaveMysteryEgg:
	setevent EVENT_FIRST_TIME_BANKING_WITH_MOM
.BankOfMom:
	setevent EVENT_TALKED_TO_MOM_AFTER_MYSTERY_EGG_QUEST
	special BankOfMom
	waitbutton
	closetext
	end

NeighborScript:
	faceplayer
	opentext
	checktime MORN
	iftrue .MornScript
	checktime DAY
	iftrue .DayScript
	checktime NITE
	iftrue .NiteScript

.MornScript:
	writetext NeighborMornIntroText
	promptbutton
	sjump .Main

.DayScript:
	writetext NeighborDayIntroText
	promptbutton
	sjump .Main

.NiteScript:
	writetext NeighborNiteIntroText
	promptbutton
	sjump .Main

.Main:
	writetext NeighborText
	waitbutton
	closetext
	turnobject PLAYERSHOUSE1F_POKEFAN_F, RIGHT
	end

TVScript:
	jumptext TVText

StoveScript:
	jumptext StoveText

SinkScript:
	jumptext SinkText

FridgeScript:
	jumptext FridgeText

MomTurnsTowardPlayerMovement:
	turn_head RIGHT
	step_end

MomWalksToPlayerMovement:
	slow_step RIGHT
	step_end

MomTurnsBackMovement:
	turn_head LEFT
	step_end

MomWalksBackMovement:
	slow_step LEFT
	step_end

ElmsLookingForYouText:
	text "¡Ah, <PLAYER>…!"
	line "Nuestro vecino,"

	para "el PROF. ELM, te"
	line "estaba buscando."

	para "Dijo que quería"
	line "que le hicieras"
	cont "un favor."

	para "¡Ah! ¡Casi se me"
	line "olvida! Ya han"

	para "traído tu #GEAR"
	line "del taller."

	para "¡Aquí tienes!"
	done

MomGivesPokegearText:
	text "El #MON GEAR o"
	line "sólo #GEAR."

	para "Es básico para"
	line "ser un buen"
	cont "entrenador."

	para "¡Ah! Falta el día"
	line "de la semana."

	para "¡No olvides"
	line "ponerlo!"
	done

IsItDSTText:
	text "¿Es horario de"
	line "verano?"
	done

ComeHomeForDSTText:
	text "Vuelve a casa"
	line "para cambiar de"
	cont "hora el reloj."

	para "Por cierto…"
	line "¿Sabes cómo usar"
	cont "el TELÉFONO?"
	done

KnowTheInstructionsText:
	text "¿Recuerdas que"
	line "hay que encender"

	para "el #GEAR y"
	line "elegir el"
	cont "TELÉFONO?"
	done

DontKnowTheInstructionsText:
	text "Te leeré las"
	line "instrucciones."

	para "Enciende el"
	line "#GEAR y elige"
	cont "el TELÉFONO."
	done

InstructionsNextText:
	text "Los números están"
	line "en la memoria."

	para "Elige el nombre"
	line "que quieras."

	para "¿No te parece"
	line "estupendo?"
	done

HurryUpElmIsWaitingText:
	text "El PROF. ELM te"
	line "está esperando."

	para "¡Date prisa!"
	done

SoWhatWasProfElmsErrandText:
	text "¿Qué quería el"
	line "PROF. ELM?"

	para "…"

	para "Parece muy"
	line "difícil."

	para "Deberías llevar"
	line "con orgullo el que"

	para "la gente confíe en"
	line "ti."
	done

ImBehindYouText:
	text "¡Vamos, <PLAYER>!"

	para "¡Cuentas con toda"
	line "mi ayuda!"
	done

NeighborMornIntroText:
	text "¡Buenos días,"
	line "<PLAY_G>!"

	para "¡Estoy de visita!"
	done

NeighborDayIntroText:
	text "¡Hola, <PLAY_G>!"
	line "¡Estoy de visita!"
	done

NeighborNiteIntroText:
	text "¡Buenas tardes,"
	line "<PLAY_G>!"

	para "¡Estoy de visita!"
	done

NeighborText:
	text "<PLAY_G>, ¿lo"
	line "has oído?"

	para "Mi hija está"
	line "empeñada en"

	para "convertirse en"
	line "ayudante del PROF."
	cont "ELM."

	para "¡Le encantan"
	line "los #MON!"
	done

StoveText:
	text "¡La especialidad"
	line "de mi madre!"

	para "¡HAMBURGUESA"
	line "VOLCÁN CANELA!"
	done

SinkText:
	text "El fregadero está"
	line "impecable. A mamá"
	cont "le gusta limpio."
	done

FridgeText:
	text "Veamos qué hay en"
	line "la nevera…"

	para "¡AGUA FRESCA y una"
	line "sabrosa LIMONADA!"
	done

TVText:
	text "Hay una película"
	line "en TV: dos chicos"

	para "montan en tren"
	line "bajo el cielo"
	cont "estrellado…"

	para "¡Será mejor que yo"
	line "me ponga en marcha"
	cont "también!"
	done

PlayersHouse1F_MapEvents:
	db 0, 0 ; filler

	db 3 ; warp events
	warp_event  6,  7, NEW_BARK_TOWN, 2
	warp_event  7,  7, NEW_BARK_TOWN, 2
	warp_event  9,  0, PLAYERS_HOUSE_2F, 1

	db 2 ; coord events
	coord_event  8,  4, SCENE_DEFAULT, MeetMomLeftScript
	coord_event  9,  4, SCENE_DEFAULT, MeetMomRightScript

	db 4 ; bg events
	bg_event  0,  1, BGEVENT_READ, StoveScript
	bg_event  1,  1, BGEVENT_READ, SinkScript
	bg_event  2,  1, BGEVENT_READ, FridgeScript
	bg_event  4,  1, BGEVENT_READ, TVScript

	db 5 ; object events
	object_event  7,  4, SPRITE_MOM, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, MomScript, EVENT_PLAYERS_HOUSE_MOM_1
	object_event  2,  2, SPRITE_MOM, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, MORN, 0, OBJECTTYPE_SCRIPT, 0, MomScript, EVENT_PLAYERS_HOUSE_MOM_2
	object_event  7,  4, SPRITE_MOM, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, DAY, 0, OBJECTTYPE_SCRIPT, 0, MomScript, EVENT_PLAYERS_HOUSE_MOM_2
	object_event  0,  2, SPRITE_MOM, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, NITE, 0, OBJECTTYPE_SCRIPT, 0, MomScript, EVENT_PLAYERS_HOUSE_MOM_2
	object_event  4,  4, SPRITE_POKEFAN_F, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, NeighborScript, EVENT_PLAYERS_HOUSE_1F_NEIGHBOR
