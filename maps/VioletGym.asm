	object_const_def ; object_event constants
	const VIOLETGYM_FALKNER
	const VIOLETGYM_YOUNGSTER1
	const VIOLETGYM_YOUNGSTER2
	const VIOLETGYM_GYM_GUY

VioletGym_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

VioletGymFalknerScript:
	faceplayer
	opentext
	checkevent EVENT_BEAT_FALKNER
	iftrue .FightDone
	writetext FalknerIntroText
	waitbutton
	closetext
	winlosstext FalknerWinLossText, 0
	loadtrainer FALKNER, FALKNER1
	startbattle
	reloadmapafterbattle
	setevent EVENT_BEAT_FALKNER
	opentext
	writetext ReceivedZephyrBadgeText
	playsound SFX_GET_BADGE
	waitsfx
	setflag ENGINE_ZEPHYRBADGE
	readvar VAR_BADGES
	scall VioletGymActivateRockets
.FightDone:
	checkevent EVENT_GOT_TM31_MUD_SLAP
	iftrue .SpeechAfterTM
	setevent EVENT_BEAT_BIRD_KEEPER_ROD
	setevent EVENT_BEAT_BIRD_KEEPER_ABE
	setmapscene ELMS_LAB, SCENE_ELMSLAB_NOTHING
	specialphonecall SPECIALCALL_ASSISTANT
	writetext FalknerZephyrBadgeText
	promptbutton
	verbosegiveitem TM_MUD_SLAP
	iffalse .NoRoomForMudSlap
	setevent EVENT_GOT_TM31_MUD_SLAP
	writetext FalknerTMMudSlapText
	waitbutton
	closetext
	end

.SpeechAfterTM:
	writetext FalknerFightDoneText
	waitbutton
.NoRoomForMudSlap:
	closetext
	end

VioletGymActivateRockets:
	ifequal 7, .RadioTowerRockets
	ifequal 6, .GoldenrodRockets
	end

.GoldenrodRockets:
	jumpstd goldenrodrockets

.RadioTowerRockets:
	jumpstd radiotowerrockets

TrainerBirdKeeperRod:
	trainer BIRD_KEEPER, ROD, EVENT_BEAT_BIRD_KEEPER_ROD, BirdKeeperRodSeenText, BirdKeeperRodBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext BirdKeeperRodAfterBattleText
	waitbutton
	closetext
	end

TrainerBirdKeeperAbe:
	trainer BIRD_KEEPER, ABE, EVENT_BEAT_BIRD_KEEPER_ABE, BirdKeeperAbeSeenText, BirdKeeperAbeBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext BirdKeeperAbeAfterBattleText
	waitbutton
	closetext
	end

VioletGymGuyScript:
	faceplayer
	opentext
	checkevent EVENT_BEAT_FALKNER
	iftrue .VioletGymGuyWinScript
	writetext VioletGymGuyText
	waitbutton
	closetext
	end

.VioletGymGuyWinScript:
	writetext VioletGymGuyWinText
	waitbutton
	closetext
	end

VioletGymStatue:
	checkflag ENGINE_ZEPHYRBADGE
	iftrue .Beaten
	jumpstd gymstatue1
.Beaten:
	gettrainername STRING_BUFFER_4, FALKNER, FALKNER1
	jumpstd gymstatue2

FalknerIntroText:
	text "??Soy PEGASO, L??DER"
	line "del GIMNASIO de"
	cont "CIUDAD MALVA!"

	para "Dicen que una"
	line "sacudida el??ctrica"

	para "puede acabar con"
	line "las alas de los"
	cont "#MON voladores."

	para "??No permitir?? que"
	line "hablen as?? de"
	cont "ellos!"

	para "??Yo te ense??ar?? el"
	line "aut??ntico poder de"

	para "los magn??ficos"
	line "p??jaros #MON!"
	done

FalknerWinLossText:
	text "??Maldici??n! Los"
	line "queridos #MON"
	cont "de mi padre???"

	para "??Muy bien!"
	line "Toma esto."

	para "Es la MEDALLA"
	line "C??FIRO oficial de"
	cont "la LIGA #MON."
	done

ReceivedZephyrBadgeText:
	text "<PLAYER> recibi??"
	line "la MEDALLA C??FIRO."
	done

FalknerZephyrBadgeText:
	text "La MEDALLA C??FIRO"
	line "mejora el ATAQUE"
	cont "de los #MON."

	para "Y permite que"
	line "los #MON"

	para "usen DESTELLO, si"
	line "lo tienen."

	para "Toma, tambi??n te"
	line "dar?? esto."
	done

FalknerTMMudSlapText:
	text "Al usar una MT, el"
	line "#MON aprender??"

	para "inmediatamente un"
	line "nuevo movimiento."

	para "Piensa antes de"
	line "actuar, ya que las"

	para "MT s??lo se pueden"
	line "usar una vez."

	para "MT31 contiene"
	line "BOFET??N-LODO."

	para "Reduce la"
	line "precisi??n del"

	para "enemigo y causa"
	line "grandes da??os."

	para "Es decir, es tanto"
	line "defensiva como"
	cont "ofensiva."
	done

FalknerFightDoneText:
	text "Encontrar??s"
	line "GIMNASIOS #MON"

	para "en las ciudades"
	line "y en los pueblos."

	para "Deber??as probar"
	line "tus habilidades en"
	cont "estos GIMNASIOS."

	para "??Yo seguir??"
	line "entren??ndome para"

	para "ser el maestro de"
	line "los p??jaros!"
	done

BirdKeeperRodSeenText:
	text "??La clave est?? en"
	line "tener valor!"

	para "??stos se entrenan"
	line "noche y d??a para"

	para "convertirse en"
	line "maestros #MON."

	para "??Adelante!"
	done

BirdKeeperRodBeatenText:
	text "??Aaah!"
	done

BirdKeeperRodAfterBattleText:
	text "??La destreza de"
	line "PEGASO es real!"

	para "??No te conf??es por"
	line "haberme vencido!"
	done

BirdKeeperAbeSeenText:
	text "??Demu??strame que"
	line "vales lo suficien-"
	cont "te para luchar"
	cont "contra PEGASO!"
	done

BirdKeeperAbeBeatenText:
	text "??No puede ser"
	line "cierto!"
	done

BirdKeeperAbeAfterBattleText:
	text "Qu?? pat??tico"
	line "resulta perder"

	para "contra entrena-"
	line "dores novatos???"
	done

VioletGymGuyText:
	text "??Hola! ??No soy"
	line "entrenador pero te"
	cont "puedo aconsejar!"

	para "??Cr??eme!"
	line "Si conf??as, tus"

	para "sue??os de triunfo"
	line "podr??an cumplirse."

	para "??Conf??as? Pues"
	line "escucha."

	para "El tipo planta es"
	line "d??bil contra el"

	para "tipo volador."
	line "??No lo olvides!"
	done

VioletGymGuyWinText:
	text "??Bonita batalla!"
	line "??Sigue as?? y"

	para "podr??s conseguir"
	line "lo que quieras!"
	done

VioletGym_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event  4, 15, VIOLET_CITY, 2
	warp_event  5, 15, VIOLET_CITY, 2

	db 0 ; coord events

	db 2 ; bg events
	bg_event  3, 13, BGEVENT_READ, VioletGymStatue
	bg_event  6, 13, BGEVENT_READ, VioletGymStatue

	db 4 ; object events
	object_event  5,  1, SPRITE_FALKNER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, VioletGymFalknerScript, -1
	object_event  7,  6, SPRITE_YOUNGSTER, SPRITEMOVEDATA_STANDING_LEFT, 2, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 3, TrainerBirdKeeperRod, -1
	object_event  2, 10, SPRITE_YOUNGSTER, SPRITEMOVEDATA_STANDING_RIGHT, 2, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 3, TrainerBirdKeeperAbe, -1
	object_event  7, 13, SPRITE_GYM_GUY, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, VioletGymGuyScript, -1
