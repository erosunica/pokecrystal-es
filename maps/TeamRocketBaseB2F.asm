	object_const_def ; object_event constants
	const TEAMROCKETBASEB2F_ROCKET1
	const TEAMROCKETBASEB2F_ROCKET_GIRL
	const TEAMROCKETBASEB2F_LANCE
	const TEAMROCKETBASEB2F_DRAGON
	const TEAMROCKETBASEB2F_ELECTRODE1
	const TEAMROCKETBASEB2F_ELECTRODE2
	const TEAMROCKETBASEB2F_ELECTRODE3
	const TEAMROCKETBASEB2F_ELECTRODE4
	const TEAMROCKETBASEB2F_ELECTRODE5
	const TEAMROCKETBASEB2F_ELECTRODE6
	const TEAMROCKETBASEB2F_ROCKET2
	const TEAMROCKETBASEB2F_ROCKET3
	const TEAMROCKETBASEB2F_ROCKET4
	const TEAMROCKETBASEB2F_POKE_BALL

TeamRocketBaseB2F_MapScripts:
	db 4 ; scene scripts
	scene_script .DummyScene0 ; SCENE_DEFAULT
	scene_script .DummyScene1 ; SCENE_TEAMROCKETBASEB2F_ROCKET_BOSS
	scene_script .DummyScene2 ; SCENE_TEAMROCKETBASEB2F_ELECTRODES
	scene_script .DummyScene3 ; SCENE_TEAMROCKETBASEB2F_NOTHING

	db 1 ; callbacks
	callback MAPCALLBACK_TILES, .TransmitterDoorCallback

.DummyScene0:
	end

.DummyScene1:
	end

.DummyScene2:
	end

.DummyScene3:
	end

.TransmitterDoorCallback:
	checkevent EVENT_OPENED_DOOR_TO_ROCKET_HIDEOUT_TRANSMITTER
	iftrue .OpenDoor
	return

.OpenDoor:
	changeblock 14, 12, $07 ; floor
	return

RocketBaseBossFLeft:
	moveobject TEAMROCKETBASEB2F_LANCE, 9, 13
	sjump RocketBaseBossFScript

RocketBaseBossFRight:
	moveobject TEAMROCKETBASEB2F_ROCKET_GIRL, 21, 16
	moveobject TEAMROCKETBASEB2F_ROCKET1, 21, 16
	moveobject TEAMROCKETBASEB2F_DRAGON, 10, 13
	moveobject TEAMROCKETBASEB2F_LANCE, 10, 13
RocketBaseBossFScript:
	appear TEAMROCKETBASEB2F_ROCKET_GIRL
	appear TEAMROCKETBASEB2F_ROCKET1
	opentext
	writetext RocketBaseExecutiveFHoldItText
	waitbutton
	closetext
	turnobject PLAYER, DOWN
	showemote EMOTE_SHOCK, PLAYER, 15
	applymovement PLAYER, MovementData_0x6d21f
	playmusic MUSIC_ROCKET_ENCOUNTER
	applymovement TEAMROCKETBASEB2F_ROCKET_GIRL, MovementData_0x6d224
	turnobject PLAYER, UP
	applymovement TEAMROCKETBASEB2F_ROCKET1, MovementData_0x6d22f
	opentext
	writetext RocketBaseBossFThrashText
	waitbutton
	closetext
	cry DRAGONITE
	turnobject TEAMROCKETBASEB2F_ROCKET_GIRL, LEFT
	turnobject PLAYER, LEFT
	appear TEAMROCKETBASEB2F_DRAGON
	applymovement TEAMROCKETBASEB2F_DRAGON, MovementData_0x6d236
	applymovement TEAMROCKETBASEB2F_ROCKET_GIRL, MovementData_0x6d23b
	applymovement TEAMROCKETBASEB2F_ROCKET1, MovementData_0x6d24c
	appear TEAMROCKETBASEB2F_LANCE
	applymovement TEAMROCKETBASEB2F_LANCE, MovementData_0x6d244
	opentext
	writetext RocketBaseLanceShareFunText
	waitbutton
	closetext
	turnobject PLAYER, RIGHT
	applymovement TEAMROCKETBASEB2F_ROCKET_GIRL, MovementData_0x6d241
	opentext
	writetext RocketBaseBossDontMeddleText
	waitbutton
	closetext
	applymovement TEAMROCKETBASEB2F_ROCKET1, MovementData_0x6d24a
	applymovement TEAMROCKETBASEB2F_ROCKET_GIRL, MovementData_0x6d248
	winlosstext RocketBaseBossWinText, 0
	setlasttalked TEAMROCKETBASEB2F_ROCKET_GIRL
	loadtrainer EXECUTIVEF, EXECUTIVEF_2
	startbattle
	disappear TEAMROCKETBASEB2F_DRAGON
	setevent EVENT_TEAM_ROCKET_BASE_B2F_EXECUTIVE
	setevent EVENT_TEAM_ROCKET_BASE_B2F_GRUNT_WITH_EXECUTIVE
	setevent EVENT_TEAM_ROCKET_BASE_B2F_LANCE
	reloadmapafterbattle
	setevent EVENT_BEAT_ROCKET_EXECUTIVEF_2
	opentext
	writetext RocketBaseBossRetreatText
	waitbutton
	closetext
	special FadeBlackQuickly
	special ReloadSpritesNoPalettes
	disappear TEAMROCKETBASEB2F_ROCKET1
	disappear TEAMROCKETBASEB2F_ROCKET_GIRL
	disappear TEAMROCKETBASEB2F_ROCKET2
	disappear TEAMROCKETBASEB2F_ROCKET3
	disappear TEAMROCKETBASEB2F_ROCKET4
	pause 15
	special FadeInQuickly
	setscene SCENE_TEAMROCKETBASEB2F_ELECTRODES
	clearevent EVENT_TEAM_ROCKET_BASE_B2F_LANCE
	turnobject TEAMROCKETBASEB2F_LANCE, DOWN
	opentext
	writetext RocketBaseLancePostBattleText
	waitbutton
	closetext
	applymovement TEAMROCKETBASEB2F_LANCE, MovementData_0x6d250
	turnobject PLAYER, UP
	opentext
	writetext RocketBaseLancePowerOffText
	waitbutton
	closetext
	follow TEAMROCKETBASEB2F_LANCE, PLAYER
	applymovement TEAMROCKETBASEB2F_LANCE, MovementData_0x6d254
	stopfollow
	applymovement TEAMROCKETBASEB2F_LANCE, MovementData_0x6d258
	opentext
	writetext RockerBaseLanceElectrodeFaintText
	waitbutton
	closetext
	applymovement TEAMROCKETBASEB2F_LANCE, MovementData_0x6d267
	disappear TEAMROCKETBASEB2F_LANCE

RocketBaseCantLeaveScript:
	applymovement PLAYER, MovementData_0x6d271
	end

RocketBaseLancesSideScript:
	opentext
	writetext RocketBaseLancesSideText
	waitbutton
	closetext
	applymovement PLAYER, MovementData_0x6d278
	end

LanceHealsScript1:
	turnobject PLAYER, UP
	sjump LanceHealsCommon

LanceHealsScript2:
	turnobject PLAYER, RIGHT
	turnobject TEAMROCKETBASEB2F_LANCE, LEFT
LanceHealsCommon:
	opentext
	writetext LanceHealsText1
	waitbutton
	closetext
	special FadeOutPalettes
	special StubbedTrainerRankings_Healings
	playsound SFX_FULL_HEAL
	special HealParty
	special FadeInPalettes
	opentext
	writetext LanceHealsText2
	waitbutton
	closetext
	setscene SCENE_TEAMROCKETBASEB2F_ROCKET_BOSS
	setevent EVENT_LANCE_HEALED_YOU_IN_TEAM_ROCKET_BASE
	readvar VAR_FACING
	ifequal RIGHT, .FacingRight
	applymovement TEAMROCKETBASEB2F_LANCE, MovementData_0x6d212
	disappear TEAMROCKETBASEB2F_LANCE
	end

.FacingRight:
	applymovement TEAMROCKETBASEB2F_LANCE, MovementData_0x6d219
	disappear TEAMROCKETBASEB2F_LANCE
	end

TrainerGruntM17:
	trainer GRUNTM, GRUNTM_17, EVENT_BEAT_ROCKET_GRUNTM_17, GruntM17SeenText, GruntM17BeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext GruntM17AfterBattleText
	waitbutton
	closetext
	end

TrainerGruntM18:
	trainer GRUNTM, GRUNTM_18, EVENT_BEAT_ROCKET_GRUNTM_18, GruntM18SeenText, GruntM18BeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext GruntM18AfterBattleText
	waitbutton
	closetext
	end

TrainerGruntM19:
	trainer GRUNTM, GRUNTM_19, EVENT_BEAT_ROCKET_GRUNTM_19, GruntM19SeenText, GruntM19BeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext GruntM19AfterBattleText
	waitbutton
	closetext
	end

RocketElectrode1:
	cry ELECTRODE
	loadwildmon ELECTRODE, 23
	startbattle
	iftrue TeamRocketBaseB2FReloadMap
	disappear TEAMROCKETBASEB2F_ELECTRODE1
	disappear TEAMROCKETBASEB2F_ELECTRODE4
	checkevent EVENT_TEAM_ROCKET_BASE_B2F_ELECTRODE_1
	iffalse TeamRocketBaseB2FReloadMap
	checkevent EVENT_TEAM_ROCKET_BASE_B2F_ELECTRODE_2
	iffalse TeamRocketBaseB2FReloadMap
	checkevent EVENT_TEAM_ROCKET_BASE_B2F_ELECTRODE_3
	iffalse TeamRocketBaseB2FReloadMap
	reloadmapafterbattle
	special PlayMapMusic
	applymovement PLAYER, MovementData_0x6d28c
	sjump RocketBaseElectrodeScript

RocketElectrode2:
	cry ELECTRODE
	loadwildmon ELECTRODE, 23
	startbattle
	iftrue TeamRocketBaseB2FReloadMap
	disappear TEAMROCKETBASEB2F_ELECTRODE2
	disappear TEAMROCKETBASEB2F_ELECTRODE5
	checkevent EVENT_TEAM_ROCKET_BASE_B2F_ELECTRODE_1
	iffalse TeamRocketBaseB2FReloadMap
	checkevent EVENT_TEAM_ROCKET_BASE_B2F_ELECTRODE_2
	iffalse TeamRocketBaseB2FReloadMap
	checkevent EVENT_TEAM_ROCKET_BASE_B2F_ELECTRODE_3
	iffalse TeamRocketBaseB2FReloadMap
	reloadmapafterbattle
	special PlayMapMusic
	applymovement PLAYER, MovementData_0x6d299
	sjump RocketBaseElectrodeScript

RocketElectrode3:
	cry ELECTRODE
	loadwildmon ELECTRODE, 23
	startbattle
	iftrue TeamRocketBaseB2FReloadMap
	disappear TEAMROCKETBASEB2F_ELECTRODE3
	disappear TEAMROCKETBASEB2F_ELECTRODE6
	checkevent EVENT_TEAM_ROCKET_BASE_B2F_ELECTRODE_1
	iffalse TeamRocketBaseB2FReloadMap
	checkevent EVENT_TEAM_ROCKET_BASE_B2F_ELECTRODE_2
	iffalse TeamRocketBaseB2FReloadMap
	checkevent EVENT_TEAM_ROCKET_BASE_B2F_ELECTRODE_3
	iffalse TeamRocketBaseB2FReloadMap
	reloadmapafterbattle
	special PlayMapMusic
	applymovement PLAYER, MovementData_0x6d2a4
	sjump RocketBaseElectrodeScript

TeamRocketBaseB2FReloadMap:
	reloadmapafterbattle
	end

RocketBaseElectrodeScript:
	moveobject TEAMROCKETBASEB2F_LANCE, 18, 6
	appear TEAMROCKETBASEB2F_LANCE
	applymovement TEAMROCKETBASEB2F_LANCE, MovementData_0x6d27a
	turnobject PLAYER, RIGHT
	opentext
	writetext RocketBaseLanceElectrodeDoneText
	promptbutton
	verbosegiveitem HM_WHIRLPOOL
	setevent EVENT_GOT_HM06_WHIRLPOOL
	writetext RocketBaseLanceWhirlpoolText
	waitbutton
	closetext
	turnobject TEAMROCKETBASEB2F_LANCE, DOWN
	opentext
	writetext RocketBaseLanceMonMasterText
	waitbutton
	closetext
	turnobject PLAYER, DOWN
	applymovement TEAMROCKETBASEB2F_LANCE, MovementData_0x6d283
	disappear TEAMROCKETBASEB2F_LANCE
	setevent EVENT_CLEARED_ROCKET_HIDEOUT
	clearflag ENGINE_ROCKET_SIGNAL_ON_CH20
	setevent EVENT_ROUTE_43_GATE_ROCKETS
	setevent EVENT_MAHOGANY_TOWN_POKEFAN_M_BLOCKS_GYM
	setscene SCENE_TEAMROCKETBASEB2F_NOTHING
	clearevent EVENT_LAKE_OF_RAGE_CIVILIANS
	setevent EVENT_TURNED_OFF_SECURITY_CAMERAS
	setevent EVENT_SECURITY_CAMERA_1
	setevent EVENT_SECURITY_CAMERA_2
	setevent EVENT_SECURITY_CAMERA_3
	setevent EVENT_SECURITY_CAMERA_4
	setevent EVENT_SECURITY_CAMERA_5
	end

TeamRocketBaseB2FLockedDoor:
	conditional_event EVENT_OPENED_DOOR_TO_ROCKET_HIDEOUT_TRANSMITTER, .Script

.Script:
	opentext
	checkevent EVENT_LEARNED_HAIL_GIOVANNI
	iftrue .KnowsPassword
	writetext RocketBaseDoorNoPasswordText
	waitbutton
	closetext
	end

.KnowsPassword:
	writetext RocketBaseDoorKnowPasswordText
	waitbutton
	playsound SFX_ENTER_DOOR
	changeblock 14, 12, $07 ; floor
	reloadmappart
	closetext
	setevent EVENT_OPENED_DOOR_TO_ROCKET_HIDEOUT_TRANSMITTER
	waitsfx
	end

TeamRocketBaseB2FTransmitterScript:
	opentext
	checkevent EVENT_CLEARED_ROCKET_HIDEOUT
	iftrue .Deactivated
	writetext RocketBaseB2FTransmitterText
	waitbutton
	closetext
	end

.Deactivated:
	writetext RocketBaseB2FDeactivateTransmitterText
	waitbutton
	closetext
	end

TeamRocketBaseB2FTMThief:
	itemball TM_THIEF

TeamRocketBaseB2FHiddenFullHeal:
	hiddenitem FULL_HEAL, EVENT_TEAM_ROCKET_BASE_B2F_HIDDEN_FULL_HEAL

MovementData_0x6d212:
	step RIGHT
	step RIGHT
	step RIGHT
	step RIGHT
	step RIGHT
	step RIGHT
	step_end

MovementData_0x6d219:
	step RIGHT
	step RIGHT
	step RIGHT
	step RIGHT
	step RIGHT
	step_end

MovementData_0x6d21f:
	step DOWN
	step DOWN
	step DOWN
	turn_head RIGHT
	step_end

MovementData_0x6d224:
	big_step LEFT
	big_step LEFT
	big_step UP
	big_step UP
	big_step UP
	big_step LEFT
	big_step LEFT
	big_step LEFT
	big_step LEFT
	turn_head DOWN
	step_end

MovementData_0x6d22f:
	big_step LEFT
	big_step LEFT
	big_step UP
	big_step UP
	big_step LEFT
	big_step LEFT
	step_end

MovementData_0x6d236:
	big_step RIGHT
	big_step RIGHT
	big_step RIGHT
	big_step RIGHT
	step_end

MovementData_0x6d23b:
	fix_facing
	set_sliding
	jump_step RIGHT
	remove_sliding
	remove_fixed_facing
	step_end

MovementData_0x6d241:
	slow_step DOWN
	turn_head LEFT
	step_end

MovementData_0x6d244:
	step RIGHT
	step RIGHT
	step RIGHT
	step_end

MovementData_0x6d248:
	big_step LEFT
	step_end

MovementData_0x6d24a:
	big_step LEFT
	step_end

MovementData_0x6d24c:
	big_step LEFT
	big_step UP
	turn_head LEFT
	step_end

MovementData_0x6d250:
	step RIGHT
	step RIGHT
	turn_head DOWN
	step_end

MovementData_0x6d254:
	step UP
	step UP
	step UP
	step_end

MovementData_0x6d258:
	step_sleep 8
	step LEFT
	step LEFT
	turn_head UP
	step_sleep 8
	step RIGHT
	step RIGHT
	step RIGHT
	step RIGHT
	turn_head UP
	step_sleep 8
	step LEFT
	step LEFT
	turn_head DOWN
	step_end

MovementData_0x6d267:
	step RIGHT
	step RIGHT
	step RIGHT
	step RIGHT
	step UP
	step UP
	step UP
	step UP
	step UP
	step_end

MovementData_0x6d271:
	step UP
	step LEFT
	step LEFT
	step LEFT
	step LEFT
	turn_head UP
	step_end

MovementData_0x6d278:
	step LEFT
	step_end

MovementData_0x6d27a:
	step DOWN
	step DOWN
	step DOWN
	step DOWN
	step DOWN
	step LEFT
	step LEFT
	step LEFT
	step_end

MovementData_0x6d283:
	step DOWN
	step DOWN
	step LEFT
	step LEFT
	step LEFT
	step LEFT
	step LEFT
	step LEFT
	step_end

MovementData_0x6d28c:
	step RIGHT
	step RIGHT
	step DOWN
	step DOWN
	step DOWN
	step DOWN
	step DOWN
	step DOWN
	step RIGHT
	step RIGHT
	step RIGHT
	step RIGHT
	step_end

MovementData_0x6d299:
	step RIGHT
	step RIGHT
	step DOWN
	step DOWN
	step DOWN
	step DOWN
	step RIGHT
	step RIGHT
	step RIGHT
	step RIGHT
	step_end

MovementData_0x6d2a4:
	step RIGHT
	step RIGHT
	step DOWN
	step DOWN
	step RIGHT
	step RIGHT
	step RIGHT
	step RIGHT
	step_end

RocketBaseExecutiveFHoldItText:
	text "¡Alto ahí!"
	done

RocketBaseBossFThrashText:
	text "No podemos tener a"
	line "alguien como tú"
	cont "suelto por ahí."

	para "Es perjudicial"
	line "para el orgullo"
	cont "del TEAM ROCKET."

	para "Da igual lo fuerte"
	line "que seas, no"

	para "podrás con ambos"
	line "al mismo tiempo."

	para "Lo siento, pero"
	line "prepárate para la"
	cont "aniquilación."
	done

RocketBaseLanceShareFunText:
	text "¡Oye! No seas tan"
	line "egoísta. Comparte"
	cont "la diversión."
	done

RocketBaseBossDontMeddleText:
	text "¿Qué? ¿Tenías un"
	line "cómplice? ¿Dónde"

	para "está tu sentido"
	line "del honor?"

	para "Como sustituto"
	line "provisional"

	para "de GIOVANNI, ¡ya"
	line "te enseñaré yo a"

	para "no meterte con el"
	line "TEAM ROCKET!"
	done

RocketBaseBossWinText:
	text "¡Uuau! Eres muy"
	line "fuerte."

	para "¡Qué lástima!"

	para "Si te unieras al"
	line "TEAM ROCKET,"

	para "podrías llegar a"
	line "ser del EJECUTIVO."
	done

RocketBaseBossRetreatText:
	text "Esta guarida se"
	line "acabó…"

	para "Pero no importa."
	line "El experimento de"

	para "emisión fue todo"
	line "un éxito."

	para "Qué más da lo que"
	line "pase ahora con"
	cont "esta guarida."

	para "Tenemos planes más"
	line "importantes."

	para "Muy pronto"
	line "conocerás el"

	para "verdadero poder"
	line "del TEAM ROCKET."

	para "Disfruta mientras"
	line "puedas…"

	para "¡Fufufufu…!"
	done

RocketBaseLancePostBattleText:
	text "LANCE: Funcionó."
	line "Hemos derrotado a"

	para "todos estos"
	line "ROCKET."

	para "Pero me preocupa"
	line "ese joven contra"
	cont "el que luché…"
	done

RocketBaseLancePowerOffText:
	text "Lo siento,"
	line "<PLAY_G>."

	para "Vi que lo estabas"
	line "haciendo tan bien,"

	para "que me quedé"
	line "ensimismado."

	para "Ahora todo lo que"
	line "queda por hacer es"

	para "apagar esa extraña"
	line "señal de radio."
	done

RockerBaseLanceElectrodeFaintText:
	text "Ésa es la máquina"
	line "que está causando"

	para "todos los"
	line "problemas."

	para "No veo ningún"
	line "interruptor…"

	para "No hay opción."
	line "Debemos debilitar"

	para "a todos los"
	line "ELECTRODE."

	para "Eso detendrá la"
	line "máquina y no"

	para "transmitirá más"
	line "esa extraña señal."

	para "Los #MON no"
	line "tienen la culpa;"

	para "me siento respon-"
	line "sable."

	para "<PLAY_G>,"
	line "separémonos."
	done

RocketBaseLancesSideText:
	text "LANCE: Déjame"
	line "este lado."
	done

RocketBaseLanceElectrodeDoneText:
	text "LANCE: Por fin se"
	line "ha detenido esa"
	cont "extraña señal."

	para "El LAGO vuelve a"
	line "la normalidad."

	para "¡Eres increíble!"
	line "Muchas gracias en"

	para "nombre de todos"
	line "los #MON."

	para "¡Ah, sí!"
	line "Toma esto."

	para "Lo encontré aquí,"
	line "pero yo no lo"
	cont "necesito."
	done

; unused
UnknownText_0x6d8e6:
	text "<PLAYER> recibió"
	line "MO06."
	done

RocketBaseLanceWhirlpoolText:
	text "Es TORBELLINO."
	line "Enséñasela a un"

	para "#MON y podrá"
	line "cruzar"
	cont "torbellinos."

	para "Pero recuerda"
	line "que…"

	para "sólo podrás usarla"
	line "fuera de los"

	para "combates con la"
	line "MEDALLA del"
	cont "GIMNASIO CAOBA."
	done

RocketBaseLanceMonMasterText:
	text "<PLAY_G>…"

	para "El viaje para ser"
	line "MAESTRO #MON es"
	cont "largo y difícil."

	para "Sabiéndolo, ¿vas a"
	line "continuar?"

	para "…"

	para "Ya veo. No, tienes"
	line "razón."

	para "Si hubieras"
	line "abandonado tan"

	para "fácilmente, nunca"
	line "hubieras seguido"

	para "ese sueño en"
	line "primer lugar."

	para "¡Espero verte de"
	line "nuevo!"
	done

LanceHealsText1:
	text "LANCE: ¿Estás"
	line "bien?"

	para "Tus #MON están"
	line "débiles y cansa-"
	cont "dos. Toma, dales"
	cont "un poco de mi"
	cont "medicina."
	done

LanceHealsText2:
	text "LANCE: <PLAY_G>,"
	line "da lo mejor de ti"
	cont "por los #MON."
	done

GruntM17SeenText:
	text "¿No se abre la"
	line "puerta?"

	para "Bueno, necesitas"
	line "una contraseña que"

	para "sólo conoce el"
	line "TEAM ROCKET."
	done

GruntM17BeatenText:
	text "¿Qué? ¿He perdido?"
	done

GruntM17AfterBattleText:
	text "¿Qué? Soy sólo un"
	line "SOLDADO."

	para "Y no conozco la"
	line "contraseña."
	cont "Lo siento por ti."
	done

GruntM18SeenText:
	text "¡Oh! ¿Tan joven?"
	line "No me gusta, pero"
	cont "debo eliminarte."
	done

GruntM18BeatenText:
	text "Sabía que"
	line "perdería…"
	done

GruntM18AfterBattleText:
	text "En mi última"
	line "misión también fui"

	para "derrotado por"
	line "alguien tan joven."

	para "Cuando estábamos"
	line "secuestrando unos"

	para "#MON, un"
	line "chico pelirrojo y"

	para "de extraña mirada"
	line "me machacó…"
	done

GruntM19SeenText:
	text "¡Tú! ¡Pequeño"
	line "parásito podrido!"
	done

GruntM19BeatenText:
	text "¡Grrrr…!"
	done

GruntM19AfterBattleText:
	text "¡Oye! Sólo el jefe"
	line "conoce la clave de"
	cont "esa puerta."

	para "¿Dónde está el"
	line "jefe? ¡Quién sabe!"
	cont "Encuéntralo tú."
	done

RocketBaseDoorNoPasswordText:
	text "La puerta está"
	line "cerrada…"

	para "Requiere una"
	line "contraseña."
	done

RocketBaseDoorKnowPasswordText:
	text "La puerta está"
	line "cerrada…"

	para "<PLAYER> introdujo"
	line "la contraseña."

	para "¡Puerta abierta!"
	done

RocketBaseB2FTransmitterText:
	text "La emisora de"
	line "radio está"

	para "emitiendo una"
	line "siniestra señal."

	para "Está funcionando a"
	line "máxima capacidad."
	done

RocketBaseB2FDeactivateTransmitterText:
	text "Por fin la emisora"
	line "de radio ha dejado"

	para "de transmitir esa"
	line "maldita señal."
	done

TeamRocketBaseB2F_MapEvents:
	db 0, 0 ; filler

	db 5 ; warp events
	warp_event  3, 14, TEAM_ROCKET_BASE_B1F, 2
	warp_event  3,  2, TEAM_ROCKET_BASE_B3F, 1
	warp_event 27,  2, TEAM_ROCKET_BASE_B3F, 2
	warp_event  3,  6, TEAM_ROCKET_BASE_B3F, 3
	warp_event 27, 14, TEAM_ROCKET_BASE_B3F, 4

	db 9 ; coord events
	coord_event  5, 14, SCENE_DEFAULT, LanceHealsScript1
	coord_event  4, 13, SCENE_DEFAULT, LanceHealsScript2
	coord_event 14, 11, SCENE_TEAMROCKETBASEB2F_ROCKET_BOSS, RocketBaseBossFLeft
	coord_event 15, 11, SCENE_TEAMROCKETBASEB2F_ROCKET_BOSS, RocketBaseBossFRight
	coord_event 14, 12, SCENE_TEAMROCKETBASEB2F_ELECTRODES, RocketBaseCantLeaveScript
	coord_event 15, 12, SCENE_TEAMROCKETBASEB2F_ELECTRODES, RocketBaseCantLeaveScript
	coord_event 12,  3, SCENE_TEAMROCKETBASEB2F_ELECTRODES, RocketBaseLancesSideScript
	coord_event 12, 10, SCENE_TEAMROCKETBASEB2F_ELECTRODES, RocketBaseLancesSideScript
	coord_event 12, 11, SCENE_TEAMROCKETBASEB2F_ELECTRODES, RocketBaseLancesSideScript

	db 23 ; bg events
	bg_event 14, 12, BGEVENT_IFNOTSET, TeamRocketBaseB2FLockedDoor
	bg_event 15, 12, BGEVENT_IFNOTSET, TeamRocketBaseB2FLockedDoor
	bg_event 17,  9, BGEVENT_READ, TeamRocketBaseB2FTransmitterScript
	bg_event 16,  9, BGEVENT_READ, TeamRocketBaseB2FTransmitterScript
	bg_event 15,  9, BGEVENT_READ, TeamRocketBaseB2FTransmitterScript
	bg_event 14,  9, BGEVENT_READ, TeamRocketBaseB2FTransmitterScript
	bg_event 13,  9, BGEVENT_READ, TeamRocketBaseB2FTransmitterScript
	bg_event 12,  9, BGEVENT_READ, TeamRocketBaseB2FTransmitterScript
	bg_event 12,  8, BGEVENT_READ, TeamRocketBaseB2FTransmitterScript
	bg_event 12,  7, BGEVENT_READ, TeamRocketBaseB2FTransmitterScript
	bg_event 12,  6, BGEVENT_READ, TeamRocketBaseB2FTransmitterScript
	bg_event 12,  5, BGEVENT_READ, TeamRocketBaseB2FTransmitterScript
	bg_event 12,  4, BGEVENT_READ, TeamRocketBaseB2FTransmitterScript
	bg_event 13,  4, BGEVENT_READ, TeamRocketBaseB2FTransmitterScript
	bg_event 14,  4, BGEVENT_READ, TeamRocketBaseB2FTransmitterScript
	bg_event 15,  4, BGEVENT_READ, TeamRocketBaseB2FTransmitterScript
	bg_event 16,  4, BGEVENT_READ, TeamRocketBaseB2FTransmitterScript
	bg_event 17,  4, BGEVENT_READ, TeamRocketBaseB2FTransmitterScript
	bg_event 17,  5, BGEVENT_READ, TeamRocketBaseB2FTransmitterScript
	bg_event 17,  6, BGEVENT_READ, TeamRocketBaseB2FTransmitterScript
	bg_event 17,  7, BGEVENT_READ, TeamRocketBaseB2FTransmitterScript
	bg_event 17,  8, BGEVENT_READ, TeamRocketBaseB2FTransmitterScript
	bg_event 26,  7, BGEVENT_ITEM, TeamRocketBaseB2FHiddenFullHeal

	db 14 ; object events
	object_event 20, 16, SPRITE_ROCKET, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, ObjectEvent, EVENT_TEAM_ROCKET_BASE_B2F_GRUNT_WITH_EXECUTIVE
	object_event 20, 16, SPRITE_ROCKET_GIRL, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, ObjectEvent, EVENT_TEAM_ROCKET_BASE_B2F_EXECUTIVE
	object_event  5, 13, SPRITE_LANCE, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, ObjectEvent, EVENT_TEAM_ROCKET_BASE_B2F_LANCE
	object_event  9, 13, SPRITE_DRAGON, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, ObjectEvent, EVENT_TEAM_ROCKET_BASE_B2F_DRAGONITE
	object_event  7,  5, SPRITE_VOLTORB, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, RocketElectrode1, EVENT_TEAM_ROCKET_BASE_B2F_ELECTRODE_1
	object_event  7,  7, SPRITE_VOLTORB, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, RocketElectrode2, EVENT_TEAM_ROCKET_BASE_B2F_ELECTRODE_2
	object_event  7,  9, SPRITE_VOLTORB, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, RocketElectrode3, EVENT_TEAM_ROCKET_BASE_B2F_ELECTRODE_3
	object_event 22,  5, SPRITE_VOLTORB, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, ObjectEvent, EVENT_TEAM_ROCKET_BASE_B2F_ELECTRODE_1
	object_event 22,  7, SPRITE_VOLTORB, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, ObjectEvent, EVENT_TEAM_ROCKET_BASE_B2F_ELECTRODE_2
	object_event 22,  9, SPRITE_VOLTORB, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, ObjectEvent, EVENT_TEAM_ROCKET_BASE_B2F_ELECTRODE_3
	object_event 25, 13, SPRITE_ROCKET, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_TRAINER, 3, TrainerGruntM17, EVENT_TEAM_ROCKET_BASE_POPULATION
	object_event  4,  1, SPRITE_ROCKET, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, 0, OBJECTTYPE_TRAINER, 1, TrainerGruntM18, EVENT_TEAM_ROCKET_BASE_POPULATION
	object_event 21, 14, SPRITE_ROCKET, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, 0, OBJECTTYPE_TRAINER, 4, TrainerGruntM19, EVENT_TEAM_ROCKET_BASE_POPULATION
	object_event  3, 10, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, TeamRocketBaseB2FTMThief, EVENT_TEAM_ROCKET_BASE_B2F_TM_THIEF
