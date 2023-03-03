	object_const_def ; object_event constants
	const ELMSLAB_ELM
	const ELMSLAB_ELMS_AIDE
	const ELMSLAB_POKE_BALL1
	const ELMSLAB_POKE_BALL2
	const ELMSLAB_POKE_BALL3
	const ELMSLAB_OFFICER

ElmsLab_MapScripts:
	db 6 ; scene scripts
	scene_script .MeetElm ; SCENE_DEFAULT
	scene_script .DummyScene1 ; SCENE_ELMSLAB_CANT_LEAVE
	scene_script .DummyScene2 ; SCENE_ELMSLAB_NOTHING
	scene_script .DummyScene3 ; SCENE_ELMSLAB_MEET_OFFICER
	scene_script .DummyScene4 ; SCENE_ELMSLAB_UNUSED
	scene_script .DummyScene5 ; SCENE_ELMSLAB_AIDE_GIVES_POTION

	db 1 ; callbacks
	callback MAPCALLBACK_OBJECTS, .MoveElmCallback

.MeetElm:
	prioritysjump .WalkUpToElm
	end

.DummyScene1:
	end

.DummyScene2:
	end

.DummyScene3:
	end

.DummyScene4:
	end

.DummyScene5:
	end

.MoveElmCallback:
	checkscene
	iftrue .Skip ; not SCENE_DEFAULT
	moveobject ELMSLAB_ELM, 3, 4
.Skip:
	return

.WalkUpToElm:
	applymovement PLAYER, ElmsLab_WalkUpToElmMovement
	showemote EMOTE_SHOCK, ELMSLAB_ELM, 15
	turnobject ELMSLAB_ELM, RIGHT
	opentext
	writetext ElmText_Intro
.MustSayYes:
	yesorno
	iftrue .ElmGetsEmail
	writetext ElmText_Refused
	sjump .MustSayYes

.ElmGetsEmail:
	writetext ElmText_Accepted
	promptbutton
	writetext ElmText_ResearchAmbitions
	waitbutton
	closetext
	playsound SFX_GLASS_TING
	pause 30
	showemote EMOTE_SHOCK, ELMSLAB_ELM, 10
	turnobject ELMSLAB_ELM, DOWN
	opentext
	writetext ElmText_GotAnEmail
	waitbutton
	closetext
	opentext
	turnobject ELMSLAB_ELM, RIGHT
	writetext ElmText_MissionFromMrPokemon
	waitbutton
	closetext
	applymovement ELMSLAB_ELM, ElmsLab_ElmToDefaultPositionMovement1
	turnobject PLAYER, UP
	applymovement ELMSLAB_ELM, ElmsLab_ElmToDefaultPositionMovement2
	turnobject PLAYER, RIGHT
	opentext
	writetext ElmText_ChooseAPokemon
	waitbutton
	setscene SCENE_ELMSLAB_CANT_LEAVE
	closetext
	end

ProfElmScript:
	faceplayer
	opentext
	checkevent EVENT_GOT_SS_TICKET_FROM_ELM
	iftrue ElmCheckMasterBall
	checkevent EVENT_BEAT_ELITE_FOUR
	iftrue ElmGiveTicketScript
ElmCheckMasterBall:
	checkevent EVENT_GOT_MASTER_BALL_FROM_ELM
	iftrue ElmCheckEverstone
	checkflag ENGINE_RISINGBADGE
	iftrue ElmGiveMasterBallScript
ElmCheckEverstone:
	checkevent EVENT_GOT_EVERSTONE_FROM_ELM
	iftrue ElmScript_CallYou
	checkevent EVENT_SHOWED_TOGEPI_TO_ELM
	iftrue ElmGiveEverstoneScript
	checkevent EVENT_TOLD_ELM_ABOUT_TOGEPI_OVER_THE_PHONE
	iffalse ElmCheckTogepiEgg
	setval TOGEPI
	special FindPartyMonThatSpeciesYourTrainerID
	iftrue ShowElmTogepiScript
	setval TOGETIC
	special FindPartyMonThatSpeciesYourTrainerID
	iftrue ShowElmTogepiScript
	writetext ElmThoughtEggHatchedText
	waitbutton
	closetext
	end

ElmEggHatchedScript:
	setval TOGEPI
	special FindPartyMonThatSpeciesYourTrainerID
	iftrue ShowElmTogepiScript
	setval TOGETIC
	special FindPartyMonThatSpeciesYourTrainerID
	iftrue ShowElmTogepiScript
	sjump ElmCheckGotEggAgain

ElmCheckTogepiEgg:
	checkevent EVENT_GOT_TOGEPI_EGG_FROM_ELMS_AIDE
	iffalse ElmCheckGotEggAgain
	checkevent EVENT_TOGEPI_HATCHED
	iftrue ElmEggHatchedScript
ElmCheckGotEggAgain:
	checkevent EVENT_GOT_TOGEPI_EGG_FROM_ELMS_AIDE ; why are we checking it again?
	iftrue ElmWaitingEggHatchScript
	checkflag ENGINE_ZEPHYRBADGE
	iftrue ElmAideHasEggScript
	checkevent EVENT_GAVE_MYSTERY_EGG_TO_ELM
	iftrue ElmStudyingEggScript
	checkevent EVENT_GOT_MYSTERY_EGG_FROM_MR_POKEMON
	iftrue ElmAfterTheftScript
	checkevent EVENT_GOT_A_POKEMON_FROM_ELM
	iftrue ElmDescribesMrPokemonScript
	writetext ElmText_LetYourMonBattleIt
	waitbutton
	closetext
	end

LabTryToLeaveScript:
	turnobject ELMSLAB_ELM, DOWN
	opentext
	writetext LabWhereGoingText
	waitbutton
	closetext
	applymovement PLAYER, ElmsLab_CantLeaveMovement
	end

CyndaquilPokeBallScript:
	checkevent EVENT_GOT_A_POKEMON_FROM_ELM
	iftrue LookAtElmPokeBallScript
	turnobject ELMSLAB_ELM, DOWN
	refreshscreen
	pokepic CYNDAQUIL
	cry CYNDAQUIL
	waitbutton
	closepokepic
	opentext
	writetext TakeCyndaquilText
	yesorno
	iffalse DidntChooseStarterScript
	disappear ELMSLAB_POKE_BALL1
	setevent EVENT_GOT_CYNDAQUIL_FROM_ELM
	writetext ChoseStarterText
	promptbutton
	waitsfx
	getmonname STRING_BUFFER_3, CYNDAQUIL
	writetext ReceivedStarterText
	playsound SFX_CAUGHT_MON
	waitsfx
	promptbutton
	givepoke CYNDAQUIL, 5, BERRY
	closetext
	readvar VAR_FACING
	ifequal RIGHT, ElmDirectionsScript
	applymovement PLAYER, AfterCyndaquilMovement
	sjump ElmDirectionsScript

TotodilePokeBallScript:
	checkevent EVENT_GOT_A_POKEMON_FROM_ELM
	iftrue LookAtElmPokeBallScript
	turnobject ELMSLAB_ELM, DOWN
	refreshscreen
	pokepic TOTODILE
	cry TOTODILE
	waitbutton
	closepokepic
	opentext
	writetext TakeTotodileText
	yesorno
	iffalse DidntChooseStarterScript
	disappear ELMSLAB_POKE_BALL2
	setevent EVENT_GOT_TOTODILE_FROM_ELM
	writetext ChoseStarterText
	promptbutton
	waitsfx
	getmonname STRING_BUFFER_3, TOTODILE
	writetext ReceivedStarterText
	playsound SFX_CAUGHT_MON
	waitsfx
	promptbutton
	givepoke TOTODILE, 5, BERRY
	closetext
	applymovement PLAYER, AfterTotodileMovement
	sjump ElmDirectionsScript

ChikoritaPokeBallScript:
	checkevent EVENT_GOT_A_POKEMON_FROM_ELM
	iftrue LookAtElmPokeBallScript
	turnobject ELMSLAB_ELM, DOWN
	refreshscreen
	pokepic CHIKORITA
	cry CHIKORITA
	waitbutton
	closepokepic
	opentext
	writetext TakeChikoritaText
	yesorno
	iffalse DidntChooseStarterScript
	disappear ELMSLAB_POKE_BALL3
	setevent EVENT_GOT_CHIKORITA_FROM_ELM
	writetext ChoseStarterText
	promptbutton
	waitsfx
	getmonname STRING_BUFFER_3, CHIKORITA
	writetext ReceivedStarterText
	playsound SFX_CAUGHT_MON
	waitsfx
	promptbutton
	givepoke CHIKORITA, 5, BERRY
	closetext
	applymovement PLAYER, AfterChikoritaMovement
	sjump ElmDirectionsScript

DidntChooseStarterScript:
	writetext DidntChooseStarterText
	waitbutton
	closetext
	end

ElmDirectionsScript:
	turnobject PLAYER, UP
	opentext
	writetext ElmDirectionsText1
	waitbutton
	closetext
	addcellnum PHONE_ELM
	opentext
	writetext GotElmsNumberText
	playsound SFX_REGISTER_PHONE_NUMBER
	waitsfx
	waitbutton
	closetext
	turnobject ELMSLAB_ELM, LEFT
	opentext
	writetext ElmDirectionsText2
	waitbutton
	closetext
	turnobject ELMSLAB_ELM, DOWN
	opentext
	writetext ElmDirectionsText3
	waitbutton
	closetext
	setevent EVENT_GOT_A_POKEMON_FROM_ELM
	setevent EVENT_RIVAL_CHERRYGROVE_CITY
	setscene SCENE_ELMSLAB_AIDE_GIVES_POTION
	setmapscene NEW_BARK_TOWN, SCENE_FINISHED
	end

ElmDescribesMrPokemonScript:
	writetext ElmDescribesMrPokemonText
	waitbutton
	closetext
	end

LookAtElmPokeBallScript:
	opentext
	writetext ElmPokeBallText
	waitbutton
	closetext
	end

ElmsLabHealingMachine:
	opentext
	checkevent EVENT_GOT_A_POKEMON_FROM_ELM
	iftrue .CanHeal
	writetext ElmsLabHealingMachineText1
	waitbutton
	closetext
	end

.CanHeal:
	writetext ElmsLabHealingMachineText2
	yesorno
	iftrue ElmsLabHealingMachine_HealParty
	closetext
	end

ElmsLabHealingMachine_HealParty:
	special StubbedTrainerRankings_Healings
	special HealParty
	playmusic MUSIC_NONE
	setval HEALMACHINE_ELMS_LAB
	special HealMachineAnim
	pause 30
	special RestartMapMusic
	closetext
	end

ElmAfterTheftDoneScript:
	waitbutton
	closetext
	end

ElmAfterTheftScript:
	writetext ElmAfterTheftText1
	checkitem MYSTERY_EGG
	iffalse ElmAfterTheftDoneScript
	promptbutton
	writetext ElmAfterTheftText2
	waitbutton
	takeitem MYSTERY_EGG
	scall ElmJumpBackScript1
	writetext ElmAfterTheftText3
	waitbutton
	scall ElmJumpBackScript2
	writetext ElmAfterTheftText4
	promptbutton
	writetext ElmAfterTheftText5
	promptbutton
	setevent EVENT_GAVE_MYSTERY_EGG_TO_ELM
	setflag ENGINE_MAIN_MENU_MOBILE_CHOICES
	setmapscene ROUTE_29, SCENE_ROUTE29_CATCH_TUTORIAL
	clearevent EVENT_ROUTE_30_YOUNGSTER_JOEY
	setevent EVENT_ROUTE_30_BATTLE
	writetext ElmAfterTheftText6
	waitbutton
	closetext
	setscene SCENE_ELMSLAB_AIDE_GIVES_POKE_BALLS
	end

ElmStudyingEggScript:
	writetext ElmStudyingEggText
	waitbutton
	closetext
	end

ElmAideHasEggScript:
	writetext ElmAideHasEggText
	waitbutton
	closetext
	end

ElmWaitingEggHatchScript:
	writetext ElmWaitingEggHatchText
	waitbutton
	closetext
	end

ShowElmTogepiScript:
	writetext ShowElmTogepiText1
	waitbutton
	closetext
	showemote EMOTE_SHOCK, ELMSLAB_ELM, 15
	setevent EVENT_SHOWED_TOGEPI_TO_ELM
	opentext
	writetext ShowElmTogepiText2
	promptbutton
	writetext ShowElmTogepiText3
	promptbutton
ElmGiveEverstoneScript:
	writetext ElmGiveEverstoneText1
	promptbutton
	verbosegiveitem EVERSTONE
	iffalse ElmScript_NoRoomForEverstone
	writetext ElmGiveEverstoneText2
	waitbutton
	closetext
	setevent EVENT_GOT_EVERSTONE_FROM_ELM
	end

ElmScript_CallYou:
	writetext ElmText_CallYou
	waitbutton
ElmScript_NoRoomForEverstone:
	closetext
	end

ElmGiveMasterBallScript:
	writetext ElmGiveMasterBallText1
	promptbutton
	verbosegiveitem MASTER_BALL
	iffalse .notdone
	setevent EVENT_GOT_MASTER_BALL_FROM_ELM
	writetext ElmGiveMasterBallText2
	waitbutton
.notdone
	closetext
	end

ElmGiveTicketScript:
	writetext ElmGiveTicketText1
	promptbutton
	verbosegiveitem S_S_TICKET
	setevent EVENT_GOT_SS_TICKET_FROM_ELM
	writetext ElmGiveTicketText2
	waitbutton
	closetext
	end

ElmJumpBackScript1:
	closetext
	readvar VAR_FACING
	ifequal DOWN, ElmJumpDownScript
	ifequal UP, ElmJumpUpScript
	ifequal LEFT, ElmJumpLeftScript
	ifequal RIGHT, ElmJumpRightScript
	end

ElmJumpBackScript2:
	closetext
	readvar VAR_FACING
	ifequal DOWN, ElmJumpUpScript
	ifequal UP, ElmJumpDownScript
	ifequal LEFT, ElmJumpRightScript
	ifequal RIGHT, ElmJumpLeftScript
	end

ElmJumpUpScript:
	applymovement ELMSLAB_ELM, ElmJumpUpMovement
	opentext
	end

ElmJumpDownScript:
	applymovement ELMSLAB_ELM, ElmJumpDownMovement
	opentext
	end

ElmJumpLeftScript:
	applymovement ELMSLAB_ELM, ElmJumpLeftMovement
	opentext
	end

ElmJumpRightScript:
	applymovement ELMSLAB_ELM, ElmJumpRightMovement
	opentext
	end

AideScript_WalkPotion1:
	applymovement ELMSLAB_ELMS_AIDE, AideWalksRight1
	turnobject PLAYER, DOWN
	scall AideScript_GivePotion
	applymovement ELMSLAB_ELMS_AIDE, AideWalksLeft1
	end

AideScript_WalkPotion2:
	applymovement ELMSLAB_ELMS_AIDE, AideWalksRight2
	turnobject PLAYER, DOWN
	scall AideScript_GivePotion
	applymovement ELMSLAB_ELMS_AIDE, AideWalksLeft2
	end

AideScript_GivePotion:
	opentext
	writetext AideText_GiveYouPotion
	promptbutton
	verbosegiveitem POTION
	writetext AideText_AlwaysBusy
	waitbutton
	closetext
	setscene SCENE_ELMSLAB_NOTHING
	end

AideScript_WalkBalls1:
	applymovement ELMSLAB_ELMS_AIDE, AideWalksRight1
	turnobject PLAYER, DOWN
	scall AideScript_GiveYouBalls
	applymovement ELMSLAB_ELMS_AIDE, AideWalksLeft1
	end

AideScript_WalkBalls2:
	applymovement ELMSLAB_ELMS_AIDE, AideWalksRight2
	turnobject PLAYER, DOWN
	scall AideScript_GiveYouBalls
	applymovement ELMSLAB_ELMS_AIDE, AideWalksLeft2
	end

AideScript_GiveYouBalls:
	opentext
	writetext AideText_GiveYouBalls
	promptbutton
	getitemname STRING_BUFFER_4, POKE_BALL
	scall AideScript_ReceiveTheBalls
	giveitem POKE_BALL, 5
	writetext AideText_ExplainBalls
	promptbutton
	itemnotify
	closetext
	setscene SCENE_ELMSLAB_NOTHING
	end

AideScript_ReceiveTheBalls:
	jumpstd receiveitem
	end

ElmsAideScript:
	faceplayer
	opentext
	checkevent EVENT_GOT_TOGEPI_EGG_FROM_ELMS_AIDE
	iftrue AideScript_AfterTheft
	checkevent EVENT_GAVE_MYSTERY_EGG_TO_ELM
	iftrue AideScript_ExplainBalls
	checkevent EVENT_GOT_MYSTERY_EGG_FROM_MR_POKEMON
	iftrue AideScript_TheftTestimony
	writetext AideText_AlwaysBusy
	waitbutton
	closetext
	end

AideScript_TheftTestimony:
	writetext AideText_TheftTestimony
	waitbutton
	closetext
	end

AideScript_ExplainBalls:
	writetext AideText_ExplainBalls
	waitbutton
	closetext
	end

AideScript_AfterTheft:
	writetext AideText_AfterTheft
	waitbutton
	closetext
	end

MeetCopScript2:
	applymovement PLAYER, MeetCopScript2_StepLeft

MeetCopScript:
	applymovement PLAYER, MeetCopScript_WalkUp
CopScript:
	turnobject ELMSLAB_OFFICER, LEFT
	opentext
	writetext ElmsLabOfficerText1
	promptbutton
	special NameRival
	writetext ElmsLabOfficerText2
	waitbutton
	closetext
	applymovement ELMSLAB_OFFICER, OfficerLeavesMovement
	disappear ELMSLAB_OFFICER
	setscene SCENE_ELMSLAB_NOTHING
	end

ElmsLabWindow:
	opentext
	checkflag ENGINE_FLYPOINT_VIOLET
	iftrue .Normal
	checkevent EVENT_ELM_CALLED_ABOUT_STOLEN_POKEMON
	iftrue .BreakIn
	sjump .Normal

.BreakIn:
	writetext ElmsLabWindowText2
	waitbutton
	closetext
	end

.Normal:
	writetext ElmsLabWindowText1
	waitbutton
	closetext
	end

ElmsLabTravelTip1:
	jumptext ElmsLabTravelTip1Text

ElmsLabTravelTip2:
	jumptext ElmsLabTravelTip2Text

ElmsLabTravelTip3:
	jumptext ElmsLabTravelTip3Text

ElmsLabTravelTip4:
	jumptext ElmsLabTravelTip4Text

ElmsLabTrashcan:
	jumptext ElmsLabTrashcanText

ElmsLabPC:
	jumptext ElmsLabPCText

ElmsLabTrashcan2:
; unused
	jumpstd trashcan

ElmsLabBookshelf:
	jumpstd difficultbookshelf

ElmsLab_WalkUpToElmMovement:
	step UP
	step UP
	step UP
	step UP
	step UP
	step UP
	step UP
	turn_head LEFT
	step_end

ElmsLab_CantLeaveMovement:
	step UP
	step_end

MeetCopScript2_StepLeft:
	step LEFT
	step_end

MeetCopScript_WalkUp:
	step UP
	step UP
	turn_head RIGHT
	step_end

OfficerLeavesMovement:
	step DOWN
	step DOWN
	step DOWN
	step DOWN
	step DOWN
	step_end

AideWalksRight1:
	step RIGHT
	step RIGHT
	turn_head UP
	step_end

AideWalksRight2:
	step RIGHT
	step RIGHT
	step RIGHT
	turn_head UP
	step_end

AideWalksLeft1:
	step LEFT
	step LEFT
	turn_head DOWN
	step_end

AideWalksLeft2:
	step LEFT
	step LEFT
	step LEFT
	turn_head DOWN
	step_end

ElmJumpUpMovement:
	fix_facing
	big_step UP
	remove_fixed_facing
	step_end

ElmJumpDownMovement:
	fix_facing
	big_step DOWN
	remove_fixed_facing
	step_end

ElmJumpLeftMovement:
	fix_facing
	big_step LEFT
	remove_fixed_facing
	step_end

ElmJumpRightMovement:
	fix_facing
	big_step RIGHT
	remove_fixed_facing
	step_end

ElmsLab_ElmToDefaultPositionMovement1:
	step UP
	step_end

ElmsLab_ElmToDefaultPositionMovement2:
	step RIGHT
	step RIGHT
	step UP
	turn_head DOWN
	step_end

AfterCyndaquilMovement:
	step LEFT
	step UP
	turn_head UP
	step_end

AfterTotodileMovement:
	step LEFT
	step LEFT
	step UP
	turn_head UP
	step_end

AfterChikoritaMovement:
	step LEFT
	step LEFT
	step LEFT
	step UP
	turn_head UP
	step_end

ElmText_Intro:
	text "ELM: ¡<PLAY_G>!"
	line "¡Aquí estás!"

	para "Tengo que pedirte"
	line "un favor."

	para "Estoy llevando una"
	line "nueva investiga-"
	cont "ción #MON en"
	cont "este momento."

	para "Me preguntaba si"
	line "podrías ayudarme,"
	cont "<PLAY_G>."

	para "Mira…"

	para "Estoy preparando"
	line "el discurso que"

	para "daré en una"
	line "conferencia."

	para "Pero hay algunas"
	line "cosas que todavía"

	para "no llego a"
	line "comprender."

	para "¡Bueno!"

	para "Necesito que"
	line "cuides de un"

	para "#MON que"
	line "capturé hace poco."
	done

ElmText_Accepted:
	text "¡Gracias,"
	line "<PLAY_G>!"

	para "¡No sabes cuánto"
	line "te lo agradezco!"
	done

ElmText_Refused:
	text "Pero… ¡por"
	line "favor, ayúdame!"
	done

ElmText_ResearchAmbitions:
	text "Cuando haga públi-"
	line "cos mis hallazgos,"

	para "habremos ahondado"
	line "un poco más en los"

	para "misterios que"
	line "rodean a los"
	cont "#MON."

	para "¡Con toda"
	line "seguridad!"
	done

ElmText_GotAnEmail:
	text "¡Oh, vaya! ¡Tengo"
	line "un e-mail!"

	para "<……><……><……>"
	line "Mmmmm… Ajá…"

	para "Vale…"
	done

ElmText_MissionFromMrPokemon:
	text "Eh, escucha."

	para "Conozco a"
	line "alguien llamado"
	cont "SR. #MON."

	para "Investiga cosas"
	line "extrañas y le"

	para "entusiasman sus"
	line "descubrimientos."

	para "Bueno, pues me ha"
	line "enviado un e-mail"

	para "diciendo que"
	line "está pasando algo."

	para "Es intrigante,"
	line "pero estamos"

	para "ocupados con la"
	line "investigación…"

	para "¡Espera!"

	para "¡Ya sé!"

	para "<PLAY_G>,"
	line "¿puedes ir por"
	cont "nosotros?"
	done

ElmText_ChooseAPokemon:
	text "Quiero que cuides"
	line "de uno de los"

	para "#MON que hay"
	line "dentro de las"
	cont "BALL."

	para "¡Estos #MON"
	line "nunca han tenido"

	para "un compañero,"
	line "<PLAY_G>!"

	para "Venga. ¡Elige!"
	done

ElmText_LetYourMonBattleIt:
	text "Si aparece un"
	line "#MON salvaje,"

	para "haz que tu #MON"
	line "luche contra él."
	done

LabWhereGoingText:
	text "ELM: ¡Espera!"
	line "¿Adónde vas?"
	done

TakeCyndaquilText:
	text "ELM: ¿Quieres a"
	line "CYNDAQUIL, el"
	cont "#MON de fuego?"
	done

TakeTotodileText:
	text "ELM: ¿Quieres a"
	line "TOTODILE, el"
	cont "#MON de agua?"
	done

TakeChikoritaText:
	text "ELM: ¿Quieres a"
	line "CHIKORITA, el"
	cont "#MON planta?"
	done

DidntChooseStarterText:
	text "ELM: Piénsalo con"
	line "cuidado."

	para "Tu compañero es"
	line "importante."
	done

ChoseStarterText:
	text "ELM: ¡Yo también"
	line "creo que es un"
	cont "#MON genial!"
	done

ReceivedStarterText:
	text "¡<PLAYER>"
	line "recibió a"
	cont "@"
	text_ram wStringBuffer3
	text "!"
	done

ElmDirectionsText1:
	text "El SR. #MON"
	line "vive un poco más"

	para "allá de CEREZO, la"
	line "próxima ciudad."

	para "Es casi una ruta"
	line "directa, así que"
	cont "no tiene pérdida."

	para "Pero por si acaso,"
	line "aquí tienes mi"

	para "número de móvil."
	line "¡Llámame si"
	cont "ocurriera algo!"
	done

ElmDirectionsText2:
	text "Si tu #MON"
	line "resulta dañado,"

	para "debes curarlo con"
	line "esta máquina."

	para "Úsala siempre que"
	line "quieras."
	done

ElmDirectionsText3:
	text "¡<PLAY_G>, cuento"
	line "contigo!"
	done

GotElmsNumberText:
	text "<PLAYER> anotó"
	line "el número de ELM."
	done

ElmDescribesMrPokemonText:
	text "El SR. #MON"
	line "busca las rarezas"
	cont "en todas partes."

	para "Lo malo es que,"
	line "además de ser"

	para "raras, no son muy"
	line "útiles…"
	done

ElmPokeBallText:
	text "Contiene un"
	line "#MON atrapado"
	cont "por el PROF. ELM."
	done

ElmsLabHealingMachineText1:
	text "Me pregunto qué"
	line "será esto."
	done

ElmsLabHealingMachineText2:
	text "¿Quieres curar a"
	line "tus #MON?"
	done

ElmAfterTheftText1:
	text "ELM: <PLAY_G>,"
	line "es terrible…"

	para "Oh, sí, ¿cuál era"
	line "el gran descubri-"
	cont "miento del SR."
	cont "#MON?"
	done

ElmAfterTheftText2:
	text "<PLAYER> le dio el"
	line "HUEVO MISTERIOSO"
	cont "al PROF. ELM."
	done

ElmAfterTheftText3:
	text "ELM: ¿Esto?"
	done

ElmAfterTheftText4:
	text "Pero… ¿es un"
	line "HUEVO de #MON?"

	para "Si lo es, ¡vaya"
	line "descubrimiento!"
	done

ElmAfterTheftText5:
	text "ELM: ¿¡Qué!?"

	para "¿El PROF. OAK te"
	line "dio una #DEX?"

	para "<PLAY_G>, ¿es"
	line "cierto? Es… ¡Es"
	cont "increíble!"

	para "Él es capaz de ver"
	line "el potencial de un"

	para "entrenador sólo"
	line "con mirarle."

	para "Uau, <PLAY_G>."
	line "Parece que tienes"

	para "lo que hay que"
	line "tener."

	para "Y parece que te"
	line "llevas muy bien"
	cont "con los #MON."

	para "Deberías afrontar"
	line "el reto de los"
	cont "GIMNASIOS #MON."

	para "El GIMNASIO más"
	line "cercano es el de"
	cont "CIUDAD MALVA."
	done

ElmAfterTheftText6:
	text "<PLAY_G>… El"
	line "camino hacia el"

	para "campeonato será"
	line "largo."

	para "Antes de partir,"
	line "no te olvides de"
	cont "ver a tu madre."
	done

ElmStudyingEggText:
	text "ELM: ¡No te"
	line "rindas! Si sé algo"

	para "sobre ese HUEVO,"
	line "te llamaré."
	done

ElmAideHasEggText:
	text "ELM: ¿<PLAY_G>?"
	line "¿Te encontraste"
	cont "con mi ayudante?"

	para "Debía llevarte el"
	line "HUEVO al CENTRO"

	para "#MON de CIUDAD"
	line "MALVA."

	para "No le habrás"
	line "visto. Búscale"
	cont "allí."
	done

ElmWaitingEggHatchText:
	text "ELM: ¿Alguna"
	line "novedad?"
	done

ElmThoughtEggHatchedText:
	text "¿<PLAY_G>? Creía"
	line "que el HUEVO había"
	cont "eclosionado…"

	para "¿Dónde está el"
	line "#MON?"
	done

ShowElmTogepiText1:
	text "ELM: ¡<PLAY_G>,"
	line "estás genial!"
	done

ShowElmTogepiText2:
	text "¿Qué?"
	line "¿¡Ese #MON!?"
	done

ShowElmTogepiText3:
	text "¡El HUEVO se"
	line "abrió! Los #MON"
	cont "deben nacer así."

	para "Quizá no todos"
	line "los #MON."

	para "¡Uauu! Aún nos"
	line "queda mucho por"
	cont "aprender."
	done

ElmGiveEverstoneText1:
	text "¡Gracias,"
	line "<PLAY_G>, por"

	para "ayudarnos a"
	line "desenmarañar los"
	cont "misterios #MON!"

	para "Quiero que lleves"
	line "esto como muestra"
	cont "de agradecimiento."
	done

ElmGiveEverstoneText2:
	text "Eso es una"
	line "PIEDRAETERNA."

	para "Algunos #MON"
	line "evolucionan al"

	para "alcanzar ciertos"
	line "niveles."

	para "Si un #MON"
	line "va equipado con la"

	para "PIEDRAETERNA,"
	line "no evolucionará."

	para "Dásela al #MON"
	line ""
	line "que no quieras que"
	cont "evolucione."
	done

ElmText_CallYou:
	text "ELM: <PLAY_G>,"
	line "te llamaré si"
	cont "ocurre algo."
	done

AideText_AfterTheft:
	text "(Suspiro…)"

	para "El #MON robado…"

	para "Me pregunto cómo"
	line "estará."

	para "Dicen que los"
	line "#MON educados"

	para "por malas personas"
	line "se vuelven malos."
	done

ElmGiveMasterBallText1:
	text "ELM: ¡Hola,"
	line "<PLAY_G>!"

	para "¡Mi investigación"
	line "está mejorando"

	para "gracias a tu"
	line "ayuda!"

	para "Toma esto como"
	line "muestra de"
	cont "agradecimiento."
	done

ElmGiveMasterBallText2:
	text "¡La MASTER BALL es"
	line "la mejor!"

	para "¡Es la BALL"
	line "definitiva!"

	para "Captura cualquier"
	line "#MON sin"
	cont "fallar."

	para "Se les entrega a"
	line "los grandes"

	para "investigadores"
	line "#MON."

	para "¡Creo que tú harás"
	line "un mejor uso de"

	para "ella que yo,"
	line "<PLAY_G>!"
	done

ElmGiveTicketText1:
	text "ELM: ¡<PLAY_G>!"
	line "¡Aquí estás!"

	para "Te llamé porque"
	line "tengo algo para"
	cont "ti."

	para "¿Ves? Es un TICKET"
	line "BARCO."

	para "Ahora puedes"
	line "atrapar #MON"
	cont "en KANTO."
	done

ElmGiveTicketText2:
	text "El barco parte de"
	line "CIUDAD OLIVO."

	para "Pero eso ya lo"
	line "sabes, <PLAY_G>."

	para "Ya lo has reco-"
	line "rrido todo con tus"
	cont "#MON."

	para "¡Saluda al PROF."
	line "OAK de mi parte"
	cont "en KANTO!"
	done

ElmsLabSignpostText_Egg:
	text "El HUEVO #MON"
	line "que estudia"
	cont "el PROF. ELM."
	done

AideText_GiveYouPotion:
	text "<PLAY_G>, quiero"
	line "que tengas esto"
	cont "por el recado."
	done

AideText_AlwaysBusy:
	text "Sólo somos dos,"
	line "así que siempre"
	cont "estamos ocupados."
	done

AideText_TheftTestimony:
	text "Oímos un ruido"
	line "muy fuerte…"

	para "Y cuando salimos"
	line "a mirar, alguien"

	para "nos robó un"
	line "#MON."

	para "¡Es horrible"
	line "que alguien"
	cont "hiciera eso!"

	para "(Suspiro…)"

	para "El #MON robado…"

	para "Me pregunto cómo"
	line "estará."

	para "Dicen que los"
	line "#MON educados"

	para "por malas personas"
	line "se vuelven malos."
	done

AideText_GiveYouBalls:
	text "¡<PLAY_G>!"

	para "¡Úsalas en tu"
	line "aventura #DEX!"
	done

AideText_ExplainBalls:
	text "Atrapa #MON"
	line "para completar tu"
	cont "#DEX."

	para "Atrapa #MON"
	line "salvajes usando"
	cont "las # BALL."
	done

ElmsLabOfficerText1:
	text "Dicen que han"
	line "robado un #MON."

	para "Y acabo de recibir"
	line "cierta información"
	cont "del PROF. ELM."

	para "Parece que fue un"
	line "joven pelirrojo,"
	cont "de pelo largo."

	para "¿Qué?"

	para "¿Que tú te has"
	line "enfrentado a un"
	cont "entrenador así?"

	para "¿Y sabes cómo se"
	line "llama?"
	done

ElmsLabOfficerText2:
	text "¡Bien! Así que su"
	line "nombre es <RIVAL>."

	para "¡Gracias por tu"
	line "colaboración!"
	done

ElmsLabWindowText1:
	text "La ventana está"
	line "abierta."

	para "Entra una suave"
	line "brisa."
	done

ElmsLabWindowText2:
	text "¡Entró por aquí!"
	done

ElmsLabTravelTip1Text:
	text "<PLAYER> abrió"
	line "un libro."

	para "Pista de viaje 1:"

	para "Pulsa START para"
	line "abrir el MENÚ."
	done

ElmsLabTravelTip2Text:
	text "<PLAYER> abrió"
	line "un libro."

	para "Pista de viaje 2:"

	para "¡Graba tu viaje"
	line "con GUARDAR!"
	done

ElmsLabTravelTip3Text:
	text "<PLAYER> abrió"
	line "un libro."

	para "Pista de viaje 3:"

	para "Abre tu MOCHILA y"
	line "pulsa SELECT para"
	cont "mover objetos."
	done

ElmsLabTravelTip4Text:
	text "<PLAYER> abrió"
	line "un libro."

	para "Pista de viaje 4:"

	para "Mira los ataques"
	line "de tus #MON."

	para "Pulsa A para"
	line "cambiar de ataque."
	done

ElmsLabTrashcanText:
	text "Dentro está el"
	line "envoltorio del"

	para "tentempié que se"
	line "tomó el PROF. ELM."
	done

ElmsLabPCText:
	text "OBSERVACIONES DE"
	line "EVOLUCIÓN #MON"

	para "Es lo que pone"
	line "en la pantalla…"
	done

ElmsLab_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event  4, 11, NEW_BARK_TOWN, 1
	warp_event  5, 11, NEW_BARK_TOWN, 1

	db 8 ; coord events
	coord_event  4,  6, SCENE_ELMSLAB_CANT_LEAVE, LabTryToLeaveScript
	coord_event  5,  6, SCENE_ELMSLAB_CANT_LEAVE, LabTryToLeaveScript
	coord_event  4,  5, SCENE_ELMSLAB_MEET_OFFICER, MeetCopScript
	coord_event  5,  5, SCENE_ELMSLAB_MEET_OFFICER, MeetCopScript2
	coord_event  4,  8, SCENE_ELMSLAB_AIDE_GIVES_POTION, AideScript_WalkPotion1
	coord_event  5,  8, SCENE_ELMSLAB_AIDE_GIVES_POTION, AideScript_WalkPotion2
	coord_event  4,  8, SCENE_ELMSLAB_AIDE_GIVES_POKE_BALLS, AideScript_WalkBalls1
	coord_event  5,  8, SCENE_ELMSLAB_AIDE_GIVES_POKE_BALLS, AideScript_WalkBalls2

	db 16 ; bg events
	bg_event  2,  1, BGEVENT_READ, ElmsLabHealingMachine
	bg_event  6,  1, BGEVENT_READ, ElmsLabBookshelf
	bg_event  7,  1, BGEVENT_READ, ElmsLabBookshelf
	bg_event  8,  1, BGEVENT_READ, ElmsLabBookshelf
	bg_event  9,  1, BGEVENT_READ, ElmsLabBookshelf
	bg_event  0,  7, BGEVENT_READ, ElmsLabTravelTip1
	bg_event  1,  7, BGEVENT_READ, ElmsLabTravelTip2
	bg_event  2,  7, BGEVENT_READ, ElmsLabTravelTip3
	bg_event  3,  7, BGEVENT_READ, ElmsLabTravelTip4
	bg_event  6,  7, BGEVENT_READ, ElmsLabBookshelf
	bg_event  7,  7, BGEVENT_READ, ElmsLabBookshelf
	bg_event  8,  7, BGEVENT_READ, ElmsLabBookshelf
	bg_event  9,  7, BGEVENT_READ, ElmsLabBookshelf
	bg_event  9,  3, BGEVENT_READ, ElmsLabTrashcan
	bg_event  5,  0, BGEVENT_READ, ElmsLabWindow
	bg_event  3,  5, BGEVENT_DOWN, ElmsLabPC

	db 6 ; object events
	object_event  5,  2, SPRITE_ELM, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, ProfElmScript, -1
	object_event  2,  9, SPRITE_SCIENTIST, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, ElmsAideScript, EVENT_ELMS_AIDE_IN_LAB
	object_event  6,  3, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, CyndaquilPokeBallScript, EVENT_CYNDAQUIL_POKEBALL_IN_ELMS_LAB
	object_event  7,  3, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, TotodilePokeBallScript, EVENT_TOTODILE_POKEBALL_IN_ELMS_LAB
	object_event  8,  3, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, ChikoritaPokeBallScript, EVENT_CHIKORITA_POKEBALL_IN_ELMS_LAB
	object_event  5,  3, SPRITE_OFFICER, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, CopScript, EVENT_COP_IN_ELMS_LAB
