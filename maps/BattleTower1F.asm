	object_const_def ; object_event constants
	const BATTLETOWER1F_RECEPTIONIST
	const BATTLETOWER1F_YOUNGSTER
	const BATTLETOWER1F_COOLTRAINER_F
	const BATTLETOWER1F_BUG_CATCHER
	const BATTLETOWER1F_GRANNY

BattleTower1F_MapScripts:
	db 2 ; scene scripts
	scene_script .Scene0 ; SCENE_DEFAULT
	scene_script .Scene1 ; SCENE_FINISHED

	db 0 ; callbacks

.Scene0:
	setval BATTLETOWERACTION_CHECKSAVEFILEISYOURS
	special BattleTowerAction
	iffalse .SkipEverything
	setval BATTLETOWERACTION_GET_CHALLENGE_STATE ; readmem sBattleTowerChallengeState
	special BattleTowerAction
	ifequal $0, .SkipEverything
	ifequal $2, .LeftWithoutSaving
	ifequal $3, .SkipEverything
	ifequal $4, .SkipEverything
	opentext
	writetext Text_WeveBeenWaitingForYou
	waitbutton
	closetext
	prioritysjump Script_ResumeBattleTowerChallenge
	end

.LeftWithoutSaving
	prioritysjump BattleTower_LeftWithoutSaving
	setval BATTLETOWERACTION_CHALLENGECANCELED
	special BattleTowerAction
	setval BATTLETOWERACTION_06
	special BattleTowerAction
.SkipEverything:
	setscene SCENE_FINISHED
.Scene1:
	end

BattleTower1FRulesSign:
	opentext
	writetext Text_ReadBattleTowerRules
	yesorno
	iffalse .skip
	writetext Text_BattleTowerRules
	waitbutton
.skip:
	closetext
	end

BattleTower1FReceptionistScript:
	setval BATTLETOWERACTION_GET_CHALLENGE_STATE ; readmem sBattleTowerChallengeState
	special BattleTowerAction
	ifequal $3, Script_BeatenAllTrainers2 ; maps/BattleTowerBattleRoom.asm
	opentext
	writetext Text_BattleTowerWelcomesYou
	promptbutton
	setval BATTLETOWERACTION_CHECK_EXPLANATION_READ ; if new save file: bit 1, [sBattleTowerSaveFileFlags]
	special BattleTowerAction
	ifnotequal $0, Script_Menu_ChallengeExplanationCancel
	sjump Script_BattleTowerIntroductionYesNo

Script_Menu_ChallengeExplanationCancel:
	writetext Text_WantToGoIntoABattleRoom
	setval TRUE
	special Menu_ChallengeExplanationCancel
	ifequal 1, Script_ChooseChallenge
	ifequal 2, Script_BattleTowerExplanation
	sjump Script_BattleTowerHopeToServeYouAgain

Script_ChooseChallenge:
	setval BATTLETOWERACTION_RESETDATA ; ResetBattleTowerTrainerSRAM
	special BattleTowerAction
	special CheckForBattleTowerRules
	ifnotequal FALSE, Script_WaitButton
	writetext Text_SaveBeforeEnteringBattleRoom
	yesorno
	iffalse Script_Menu_ChallengeExplanationCancel
	setscene SCENE_DEFAULT
	special TryQuickSave
	iffalse Script_Menu_ChallengeExplanationCancel
	setscene SCENE_FINISHED
	setval BATTLETOWERACTION_SET_EXPLANATION_READ ; set 1, [sBattleTowerSaveFileFlags]
	special BattleTowerAction
	special BattleTowerRoomMenu
	ifequal $a, Script_Menu_ChallengeExplanationCancel
	ifnotequal $0, Script_MobileError
	setval BATTLETOWERACTION_11
	special BattleTowerAction
	writetext Text_RightThisWayToYourBattleRoom
	waitbutton
	closetext
	setval BATTLETOWERACTION_CHOOSEREWARD
	special BattleTowerAction
	sjump Script_WalkToBattleTowerElevator

Script_ResumeBattleTowerChallenge:
	closetext
	setval BATTLETOWERACTION_LOADLEVELGROUP ; load choice of level group
	special BattleTowerAction
Script_WalkToBattleTowerElevator:
	musicfadeout MUSIC_NONE, 8
	setmapscene BATTLE_TOWER_BATTLE_ROOM, SCENE_DEFAULT
	setmapscene BATTLE_TOWER_ELEVATOR, SCENE_DEFAULT
	setmapscene BATTLE_TOWER_HALLWAY, SCENE_DEFAULT
	follow BATTLETOWER1F_RECEPTIONIST, PLAYER
	applymovement BATTLETOWER1F_RECEPTIONIST, MovementData_BattleTower1FWalkToElevator
	setval BATTLETOWERACTION_0A
	special BattleTowerAction
	warpsound
	disappear BATTLETOWER1F_RECEPTIONIST
	stopfollow
	applymovement PLAYER, MovementData_BattleTowerHallwayPlayerEntersBattleRoom
	warpcheck
	end

Script_GivePlayerHisPrize:
	setval BATTLETOWERACTION_1C
	special BattleTowerAction
	setval BATTLETOWERACTION_GIVEREWARD
	special BattleTowerAction
	ifequal POTION, Script_YourPackIsStuffedFull
	getitemname STRING_BUFFER_4, USE_SCRIPT_VAR
	giveitem ITEM_FROM_MEM, 5
	writetext Text_PlayerGotFive
	setval BATTLETOWERACTION_1D
	special BattleTowerAction
	closetext
	end

Script_YourPackIsStuffedFull:
	writetext Text_YourPackIsStuffedFull
	waitbutton
	closetext
	end

Script_BattleTowerIntroductionYesNo:
	writetext Text_WouldYouLikeToHearAboutTheBattleTower
	yesorno
	iffalse Script_BattleTowerSkipExplanation
Script_BattleTowerExplanation:
	writetext Text_BattleTowerIntroduction_2
Script_BattleTowerSkipExplanation:
	setval BATTLETOWERACTION_SET_EXPLANATION_READ
	special BattleTowerAction
	sjump Script_Menu_ChallengeExplanationCancel

Script_BattleTowerHopeToServeYouAgain:
	writetext Text_WeHopeToServeYouAgain
	waitbutton
	closetext
	end

UnreferencedScript_0x9e4b6:
	special BattleTowerMobileError
	closetext
	end

Script_WaitButton:
	waitbutton
	closetext
	end

UnreferencedScript_0x9e4be:
	writetext Text_SaveBeforeEnteringBattleRoom
	yesorno
	iffalse Script_Menu_ChallengeExplanationCancel
	special TryQuickSave
	iffalse Script_Menu_ChallengeExplanationCancel
	setval BATTLETOWERACTION_SET_EXPLANATION_READ
	special BattleTowerAction
	special Function1700ba
	ifequal $a, Script_Menu_ChallengeExplanationCancel
	ifnotequal $0, Script_MobileError
	writetext Text_ReceivedAListOfLeadersOnTheHonorRoll
	turnobject BATTLETOWER1F_RECEPTIONIST, LEFT
	writetext Text_PleaseConfirmOnThisMonitor
	waitbutton
	turnobject BATTLETOWER1F_RECEPTIONIST, DOWN
	closetext
	end

UnreferencedScript_0x9e4ea:
	setval BATTLETOWERACTION_LEVEL_CHECK
	special BattleTowerAction
	ifnotequal $0, Script_AMonLevelExceeds
	setval BATTLETOWERACTION_UBERS_CHECK
	special BattleTowerAction
	ifnotequal $0, Script_MayNotEnterABattleRoomUnderL70
	special CheckForBattleTowerRules
	ifnotequal FALSE, Script_WaitButton
	setval BATTLETOWERACTION_05
	special BattleTowerAction
	ifequal $0, .zero
	writetext Text_CantBeRegistered_PreviousRecordDeleted
	sjump continue

.zero
	writetext Text_CantBeRegistered
continue:
	yesorno
	iffalse Script_Menu_ChallengeExplanationCancel
	writetext Text_SaveBeforeReentry
	yesorno
	iffalse Script_Menu_ChallengeExplanationCancel
	setscene SCENE_DEFAULT
	special TryQuickSave
	iffalse Script_Menu_ChallengeExplanationCancel
	setscene SCENE_FINISHED
	setval BATTLETOWERACTION_06
	special BattleTowerAction
	setval BATTLETOWERACTION_12
	special BattleTowerAction
	writetext Text_RightThisWayToYourBattleRoom
	waitbutton
	sjump Script_ResumeBattleTowerChallenge

UnreferencedScript_0x9e53b:
	writetext Text_FiveDayBattleLimit_Mobile
	waitbutton
	sjump Script_BattleTowerHopeToServeYouAgain

Script_AMonLevelExceeds:
	writetext Text_AMonLevelExceeds
	waitbutton
	sjump Script_Menu_ChallengeExplanationCancel

Script_MayNotEnterABattleRoomUnderL70:
	writetext Text_MayNotEnterABattleRoomUnderL70
	waitbutton
	sjump Script_Menu_ChallengeExplanationCancel

Script_MobileError:
	special BattleTowerMobileError
	closetext
	end

BattleTower_LeftWithoutSaving:
	opentext
	writetext Text_BattleTower_LeftWithoutSaving
	waitbutton
	sjump Script_BattleTowerHopeToServeYouAgain

BattleTower1FYoungsterScript:
	faceplayer
	opentext
	writetext Text_BattleTowerYoungster
	waitbutton
	closetext
	turnobject BATTLETOWER1F_YOUNGSTER, RIGHT
	end

BattleTower1FCooltrainerFScript:
	jumptextfaceplayer Text_BattleTowerCooltrainerF

BattleTower1FBugCatcherScript:
	jumptextfaceplayer Text_BattleTowerBugCatcher

BattleTower1FGrannyScript:
	jumptextfaceplayer Text_BattleTowerGranny

MovementData_BattleTower1FWalkToElevator:
	step UP
	step UP
	step UP
	step UP
	step UP
MovementData_BattleTowerHallwayPlayerEntersBattleRoom:
	step UP
	step_end

MovementData_BattleTowerElevatorExitElevator:
	step DOWN
	step_end

MovementData_BattleTowerHallwayWalkTo1020Room:
	step RIGHT
	step RIGHT
MovementData_BattleTowerHallwayWalkTo3040Room:
	step RIGHT
	step RIGHT
	step UP
	step RIGHT
	turn_head LEFT
	step_end

MovementData_BattleTowerHallwayWalkTo90100Room:
	step LEFT
	step LEFT
MovementData_BattleTowerHallwayWalkTo7080Room:
	step LEFT
	step LEFT
MovementData_BattleTowerHallwayWalkTo5060Room:
	step LEFT
	step LEFT
	step UP
	step LEFT
	turn_head RIGHT
	step_end

MovementData_BattleTowerBattleRoomPlayerWalksIn:
	step UP
	step UP
	step UP
	step UP
	turn_head RIGHT
	step_end

MovementData_BattleTowerBattleRoomOpponentWalksIn:
	slow_step DOWN
	slow_step DOWN
	slow_step DOWN
	turn_head LEFT
	step_end

MovementData_BattleTowerBattleRoomOpponentWalksOut:
	turn_head UP
	slow_step UP
	slow_step UP
	slow_step UP
	step_end

MovementData_BattleTowerBattleRoomReceptionistWalksToPlayer:
	slow_step RIGHT
	slow_step RIGHT
	slow_step UP
	slow_step UP
	step_end

MovementData_BattleTowerBattleRoomReceptionistWalksAway:
	slow_step DOWN
	slow_step DOWN
	slow_step LEFT
	slow_step LEFT
	turn_head RIGHT
	step_end

MovementData_BattleTowerBattleRoomPlayerTurnsToFaceReceptionist:
	turn_head DOWN
	step_end

MovementData_BattleTowerBattleRoomPlayerTurnsToFaceNextOpponent:
	turn_head RIGHT
	step_end

Text_BattleTowerWelcomesYou:
	text "¡Gracias por venir"
	line "a la TORRE"
	cont "BATALLA!"

	para "Te mostraré una"
	line "SALA BATALLA."
	done

Text_WantToGoIntoABattleRoom:
	text "¿Quieres entrar en"
	line "una SALA BATALLA?"
	done

Text_RightThisWayToYourBattleRoom:
	text "Por aquí accederás"
	line "a tu SALA BATALLA."
	done

Text_BattleTowerIntroduction_1:
	text "TORRE BATALLA es"
	line "el lugar de las"
	cont "batallas #MON."

	para "Entrenadores"
	line "#MON de todas"

	para "partes vienen para"
	line "luchar en SALAS"

	para "BATALLA especial-"
	line "mente diseñadas."

	para "Hay muchas SALAS"
	line "BATALLA en la"
	cont "TORRE BATALLA."

	para "En cada SALA hay"
	line "7 entrenadores."

	para "Si vences a los"
	line "siete de la SALA,"

	para "y demuestras que"
	line "lo mereces, te"

	para "convertirás en"
	line "LÍDER de la SALA."

	para "Los LÍDERES van a"
	line "la LISTA de HONOR"

	para "para la"
	line "posteridad."

	para "Puedes acceder"
	line "hasta a 5 SALAS"
	cont "BATALLA por día."

	para "Aunque sólo puedes"
	line "luchar una vez al"

	para "día en una misma"
	line "SALA."

	para "Para detener una"
	line "sesión, debes"

	para "GUARDAR. Si no, no"
	line "podrás retomar"

	para "el combate en la"
	line "SALA."

	para ""
	done

Text_BattleTowerIntroduction_2:
	text "La TORRE BATALLA"
	line "es una instalación"

	para "construida para"
	line "combates #MON."

	para "Incontables entre-"
	line "nadores #MON"

	para "llegan de todas"
	line "partes para luchar"

	para "en las SALAS"
	line "BATALLA."

	para "Hay muchas SALAS"
	line "BATALLA en la"
	cont "TORRE BATALLA."

	para "Cada SALA cuenta"
	line "con siete"
	cont "entrenadores."

	para "Derrótales a todos"
	line "y ganarás un"
	cont "premio."

	para "Para interrumpir"
	line "una sesión, debes"

	para "GUARDAR. Si no lo"
	line "haces, no podrás"

	para "continuar tu"
	line "desafío."

	para ""
	done

Text_ReceivedAListOfLeadersOnTheHonorRoll:
	text "Recibió una lista"
	line "de LÍDERES de la"
	cont "LISTA de HONOR."

	para ""
	done

Text_PleaseConfirmOnThisMonitor:
	text "Confirma en este"
	line "monitor."
	done

Text_ThankYou:
	text "¡Gracias!"
	prompt

Text_ThanksForVisiting:
	text "¡Gracias por tu"
	line "visita!"
	done

Text_BeatenAllTheTrainers_Mobile:
	text "¡Felicidades!"

	para "¡Has vencido a los"
	line "entrenadores!"

	para "Tu proeza merece"
	line "ser registrada,"

	para "<PLAYER>. Con"
	line "estos resultados,"

	para "pasas a ser LÍDER"
	line "de la SALA."
	prompt

Text_CongratulationsYouveBeatenAllTheTrainers:
	text "¡Felicidades!"

	para "¡Has derrotado a"
	line "todos los"
	cont "entrenadores!"

	para "¡Por ello, toma"
	line "este gran premio!"

	para ""
	done

Text_AskRegisterRecord_Mobile:
	text "¿Quieres registrar"
	line "tu récord con el"
	cont "CENTRO?"
	done

Text_PlayerGotFive:
	text "¡<PLAYER> obtiene 5"
	line "@"
	text_ram wStringBuffer4
	text "!@"
	sound_item
	text_promptbutton
	text_end

Text_YourPackIsStuffedFull:
	text "Ups, tu MOCHILA"
	line "está llena."

	para "Por favor, vacíala"
	line "y vuelve."
	done

Text_YourRegistrationIsComplete:
	text "Tu registro ha"
	line "sido completado."

	para "¡Vuelve pronto!"
	done

Text_WeHopeToServeYouAgain:
	text "Esperamos volver a"
	line "atenderte pronto."
	done

Text_PleaseStepThisWay:
	text "Por aquí, por"
	line "favor."
	done

Text_WouldYouLikeToHearAboutTheBattleTower:
	text "¿Quieres saber"
	line "más sobre la"
	cont "TORRE BATALLA?"
	done

Text_CantBeRegistered:
	text "Tu récord de la"
	line "anterior SALA no"

	para "puede ser"
	line "registrado. ¿Vale?"
	done

Text_CantBeRegistered_PreviousRecordDeleted:
	text "Tu récord de la"
	line "anterior SALA no"

	para "puede ser"
	line "registrado."

	para "Además, el récord"
	line "actual será"
	cont "borrado. ¿Vale?"
	done

Text_CheckTheLeaderHonorRoll:
	text "¿Miras la LISTA"
	line "de HONOR?"
	done

Text_ReadBattleTowerRules:
	text "Las reglas de la"
	line "TORRE BATALLA"

	para "están aquí."
	line "¿Quieres leerlas?"
	done

Text_BattleTowerRules:
	text "Pueden combatir"
	line "tres #MON."

	para "Los tres deben ser"
	line "diferentes."

	para "Los objetos que"
	line "lleven también"
	cont "serán diferentes."

	para "Ciertos #MON"
	line "pueden tener"

	para "restricciones de"
	line "nivel."
	done

Text_BattleTower_LeftWithoutSaving:
	text "¡Perdona!"
	line "No has GUARDADO"

	para "antes de salir de"
	line "la SALA."

	para "Lo siento mucho,"
	line "pero tu batalla se"

	para "declarará no"
	line "válida."
	done

Text_YourMonWillBeHealedToFullHealth:
	text "Tus #MON"
	line "serán curados"
	cont "completamente."
	done

Text_NextUpOpponentNo:
	text "Ahora el oponente"
	line "n.° @"
	text_ram wStringBuffer3
	text ". ¡Adelante!"
	done

Text_SaveBeforeConnecting_Mobile:
	text "Tu sesión será"
	line "GUARDADA antes de"

	para "conectar con el"
	line "CENTRO."
	done

Text_SaveBeforeEnteringBattleRoom:
	text "Antes de entrar en"
	line "la SALA BATALLA,"

	para "tu progreso será"
	line "guardado."
	done

Text_SaveAndEndTheSession:
	text "¿GUARDAR y acabar"
	line "la sesión?"
	done

Text_SaveBeforeReentry:
	text "Tu récord será"
	line "GUARDADO antes de"

	para "que vuelvas a la"
	line "SALA anterior."
	done

Text_CancelYourBattleRoomChallenge:
	text "¿Cancelar la"
	line "SALA BATALLA?"
	done

Text_RegisterRecordOnFile_Mobile:
	text "Tu récord anterior"
	line "está archivado."

	para "¿Quieres"
	line "registrarlo"
	cont "en el CENTRO?"
	done

Text_WeveBeenWaitingForYou:
	text "Te esperábamos."
	line "Por aquí llegarás"

	para "a una SALA"
	line "BATALLA."
	done

Text_FiveDayBattleLimit_Mobile:
	text "Sólo puedes entrar"
	line "a 5 SALAS BATALLA"
	cont "al día."

	para "Por favor, vuelve"
	line "mañana."
	done

Text_TooMuchTimeElapsedNoRegister:
	text "Lo siento, pero no"
	line "es posible"

	para "registrar tu"
	line "actual récord en"

	para "el CENTRO porque"
	line "ha pasado mucho"

	para "tiempo desde que"
	line "empezaste el"
	cont "desafío."
	done

; a dupe?
Text_RegisterRecordTimedOut_Mobile:
	text "Lo siento. No es"
	line "posible registrar"

	para "tu récord más"
	line "reciente en el"

	para "CENTRO porque ha"
	line "pasado mucho"

	para "tiempo desde que"
	line "empezaste el"
	cont "desafío."
	done

Text_AMonLevelExceeds:
	text "Al menos uno de"
	line "tus #MON excede"
	cont "el nivel de @"
	text_decimal wScriptVar, 1, 3
	text "."
	done

Text_MayNotEnterABattleRoomUnderL70:
	text_ram wcd49
	text " no"
	line "entrará en una"
	cont "SALA menor de N70."

	para "Esta SALA es para"
	line "el N@"
	text_decimal wScriptVar, 1, 3
	text "."
	done

Text_BattleTowerYoungster:
	text "Destruido por el"
	line "primer oponente en"

	para "un instante…"
	line "Qué malo soy…"
	done

Text_BattleTowerCooltrainerF:
	text "¡Hay muchas SALAS"
	line "BATALLA, pero"

	para "voy a superarlas"
	line "todas!"
	done

Text_BattleTowerGranny:
	text "Es duro no poder"
	line "usar objetos"

	para "durante la"
	line "batalla."

	para "Hacer que tus"
	line "#MON lleven"

	para "objetos es clave"
	line "para vencer."
	done

Text_BattleTowerBugCatcher:
	text "Quiero ver hasta"
	line "dónde puedo llegar"

	para "usando sólo"
	line "#MON bicho."

	para "Espero que no haya"
	line "#MON de fuego…"
	done

BattleTower1F_MapEvents:
	db 0, 0 ; filler

	db 3 ; warp events
	warp_event  7,  9, BATTLE_TOWER_OUTSIDE, 3
	warp_event  8,  9, BATTLE_TOWER_OUTSIDE, 4
	warp_event  7,  0, BATTLE_TOWER_ELEVATOR, 1

	db 0 ; coord events

	db 1 ; bg events
	bg_event  6,  6, BGEVENT_READ, BattleTower1FRulesSign

	db 5 ; object events
	object_event  7,  6, SPRITE_RECEPTIONIST, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, BattleTower1FReceptionistScript, -1
	object_event 14,  9, SPRITE_YOUNGSTER, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, BattleTower1FYoungsterScript, -1
	object_event  4,  9, SPRITE_COOLTRAINER_F, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 1, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, BattleTower1FCooltrainerFScript, -1
	object_event  1,  3, SPRITE_BUG_CATCHER, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, BattleTower1FBugCatcherScript, -1
	object_event 14,  3, SPRITE_GRANNY, SPRITEMOVEDATA_WALK_UP_DOWN, 0, 1, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, BattleTower1FGrannyScript, -1
