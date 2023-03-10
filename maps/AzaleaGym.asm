	object_const_def ; object_event constants
	const AZALEAGYM_BUGSY
	const AZALEAGYM_BUG_CATCHER1
	const AZALEAGYM_BUG_CATCHER2
	const AZALEAGYM_BUG_CATCHER3
	const AZALEAGYM_TWIN1
	const AZALEAGYM_TWIN2
	const AZALEAGYM_GYM_GUY

AzaleaGym_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

AzaleaGymBugsyScript:
	faceplayer
	opentext
	checkevent EVENT_BEAT_BUGSY
	iftrue .FightDone
	writetext BugsyText_INeverLose
	waitbutton
	closetext
	winlosstext BugsyText_ResearchIncomplete, 0
	loadtrainer BUGSY, BUGSY1
	startbattle
	reloadmapafterbattle
	setevent EVENT_BEAT_BUGSY
	opentext
	writetext Text_ReceivedHiveBadge
	playsound SFX_GET_BADGE
	waitsfx
	setflag ENGINE_HIVEBADGE
	readvar VAR_BADGES
	scall AzaleaGymActivateRockets
.FightDone:
	checkevent EVENT_GOT_TM49_FURY_CUTTER
	iftrue .GotFuryCutter
	setevent EVENT_BEAT_TWINS_AMY_AND_MAY
	setevent EVENT_BEAT_BUG_CATCHER_BENNY
	setevent EVENT_BEAT_BUG_CATCHER_AL
	setevent EVENT_BEAT_BUG_CATCHER_JOSH
	writetext BugsyText_HiveBadgeSpeech
	promptbutton
	verbosegiveitem TM_FURY_CUTTER
	iffalse .NoRoomForFuryCutter
	setevent EVENT_GOT_TM49_FURY_CUTTER
	writetext BugsyText_FuryCutterSpeech
	waitbutton
	closetext
	end

.GotFuryCutter:
	writetext BugsyText_BugMonsAreDeep
	waitbutton
.NoRoomForFuryCutter:
	closetext
	end

AzaleaGymActivateRockets:
	ifequal 7, .RadioTowerRockets
	ifequal 6, .GoldenrodRockets
	end

.GoldenrodRockets:
	jumpstd goldenrodrockets

.RadioTowerRockets:
	jumpstd radiotowerrockets

TrainerTwinsAmyandmay1:
	trainer TWINS, AMYANDMAY1, EVENT_BEAT_TWINS_AMY_AND_MAY, TwinsAmyandmay1SeenText, TwinsAmyandmay1BeatenText, 0, .AfterScript

.AfterScript:
	endifjustbattled
	opentext
	writetext TwinsAmyandmay1AfterBattleText
	waitbutton
	closetext
	end

TrainerTwinsAmyandmay2:
	trainer TWINS, AMYANDMAY2, EVENT_BEAT_TWINS_AMY_AND_MAY, TwinsAmyandmay2SeenText, TwinsAmyandmay2BeatenText, 0, .AfterScript

.AfterScript:
	endifjustbattled
	opentext
	writetext TwinsAmyandmay2AfterBattleText
	waitbutton
	closetext
	end

TrainerBugCatcherBenny:
	trainer BUG_CATCHER, BUG_CATCHER_BENNY, EVENT_BEAT_BUG_CATCHER_BENNY, BugCatcherBennySeenText, BugCatcherBennyBeatenText, 0, .AfterScript

.AfterScript:
	endifjustbattled
	opentext
	writetext BugCatcherBennyAfterBattleText
	waitbutton
	closetext
	end

TrainerBugCatcherAl:
	trainer BUG_CATCHER, AL, EVENT_BEAT_BUG_CATCHER_AL, BugCatcherAlSeenText, BugCatcherAlBeatenText, 0, .AfterScript

.AfterScript:
	endifjustbattled
	opentext
	writetext BugCatcherAlAfterBattleText
	waitbutton
	closetext
	end

TrainerBugCatcherJosh:
	trainer BUG_CATCHER, JOSH, EVENT_BEAT_BUG_CATCHER_JOSH, BugCatcherJoshSeenText, BugCatcherJoshBeatenText, 0, .AfterScript

.AfterScript:
	endifjustbattled
	opentext
	writetext BugCatcherJoshAfterBattleText
	waitbutton
	closetext
	end

AzaleaGymGuyScript:
	faceplayer
	checkevent EVENT_BEAT_BUGSY
	iftrue .AzaleaGymGuyWinScript
	opentext
	writetext AzaleaGymGuyText
	waitbutton
	closetext
	end

.AzaleaGymGuyWinScript:
	opentext
	writetext AzaleaGymGuyWinText
	waitbutton
	closetext
	end

AzaleaGymStatue:
	checkflag ENGINE_HIVEBADGE
	iftrue .Beaten
	jumpstd gymstatue1
.Beaten:
	gettrainername STRING_BUFFER_4, BUGSY, BUGSY1
	jumpstd gymstatue2

BugsyText_INeverLose:
	text "??Soy ANT??N!"
	line "Soy invencible"

	para "con los #MON"
	line "bicho."

	para "??Mis estudios me"
	line "van a convertir en"

	para "una autoridad en"
	line "los #MON bicho!"

	para "Te ense??ar?? lo"
	line "que he aprendido."
	done

BugsyText_ResearchIncomplete:
	text "??Uauu, incre??ble!"
	line "??No hay #MON"
	cont "que se te resista!"

	para "Mi investigaci??n"
	line "a??n no ha acabado."

	para "Vale, t?? ganas."
	line "Toma esta MEDALLA."
	done

Text_ReceivedHiveBadge:
	text "<PLAYER> recibi?? la"
	line "MEDALLA COLMENA."
	done

BugsyText_HiveBadgeSpeech:
	text "??Conoces las"
	line "ventajas de la"
	cont "MEDALLA COLMENA?"

	para "Si la tienes, los"
	line "#MON hasta N.30"
	cont "te obedecer??n."

	para "Y los #MON"
	line "que sepan CORTE"

	para "podr??n usarlo"
	line "fuera del combate."

	para "Mira, tambi??n te"
	line "dar?? esto."
	done

BugsyText_FuryCutterSpeech:
	text "MT49 contiene"
	line "CORTEFURIA."

	para "Si no fallas, se"
	line "hace cada vez m??s"
	cont "fuerte."

	para "Cuanto m??s dure"
	line "el combate, m??s"
	cont "fuerte ser??."

	para "??No es genial?"
	line "??Lo descubr?? yo!"
	done

BugsyText_BugMonsAreDeep:
	text "Los #MON bicho"
	line "son muy complejos."

	para "Quedan muchos"
	line "misterios por"
	cont "resolver."

	para "Estudia a fondo"
	line "tus favoritos."
	done

BugCatcherBennySeenText:
	text "Los #MON bicho"
	line "evolucionan pronto"

	para "y se hacen fuertes"
	line "mucho antes."
	done

BugCatcherBennyBeatenText:
	text "??No se trata s??lo"
	line "de evolucionar!"
	done

BugCatcherBennyAfterBattleText:
	text "Los #MON se"
	line "hacen m??s fuertes"
	cont "si evolucionan."
	done

BugCatcherAlSeenText:
	text "??Los #MON bicho"
	line "son buenos y muy"

	para "fuertes! ??Te lo"
	line "demostrar??!"
	done

BugCatcherAlBeatenText:
	text "Has demostrado lo"
	line "fuerte que eres???"
	done

BugCatcherAlAfterBattleText:
	text "Son geniales,"
	line "pero la mayor??a de"

	para "las chicas odian"
	line "los #MON bicho."

	para "No s?? por qu?????"
	done

BugCatcherJoshSeenText:
	text "??Has salvado a los"
	line "SLOWPOKE? ??Uauu!"
	cont "??Eres muy fuerte!"

	para "??Pero mis #MON"
	line "entrenados tambi??n"
	cont "lo son!"
	done

BugCatcherJoshBeatenText:
	text "??Urrggg!"
	done

BugCatcherJoshAfterBattleText:
	text "Supongo que"
	line "deber??a ense??arles"
	cont "mejores ataques???"
	done

TwinsAmyandmay1SeenText:
	text "AMY: ??Hola! ??Est??s"
	line "retando al L??DER?"
	cont "??No puede ser!"
	done

TwinsAmyandmay1BeatenText:
	text "AMY-MAY: ??Oh,"
	line "madre m??a!"
	done

TwinsAmyandmay1AfterBattleText:
	text "AMY: ??Eres muy"
	line "fuerte!"
	done

TwinsAmyandmay2SeenText:
	text "MAY: ??Quieres ver"
	line "al L??DER? ??Antes"
	cont "vamos nosotras!"
	done

TwinsAmyandmay2BeatenText:
	text "AMY-MAY: ??Oh,"
	line "madre m??a!"
	done

TwinsAmyandmay2AfterBattleText:
	text "MAY: Han perdido"
	line "nuestros #MON."
	cont "??Qu?? l??stima!"
	done

AzaleaGymGuyText:
	text "??Hola, valiente!"

	para "ANT??N es joven,"
	line "pero conoce muy"

	para "bien a los #MON"
	line "bicho."

	para "Y sin mis consejos"
	line "te resultar??a a??n"
	cont "m??s duro."

	para "Veamos??? A los"
	line "#MON bicho no"
	cont "les va el fuego."

	para "Y los ataques de"
	line "tipo volador son"
	cont "muy efectivos."
	done

AzaleaGymGuyWinText:
	text "??Eso es! Ha sido"
	line "un gran encuentro"

	para "entre j??venes con"
	line "talento."

	para "Con gente como t??,"
	line "??el futuro de los"

	para "#MON ser??"
	line "maravilloso!"
	done

AzaleaGym_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event  4, 15, AZALEA_TOWN, 5
	warp_event  5, 15, AZALEA_TOWN, 5

	db 0 ; coord events

	db 2 ; bg events
	bg_event  3, 13, BGEVENT_READ, AzaleaGymStatue
	bg_event  6, 13, BGEVENT_READ, AzaleaGymStatue

	db 7 ; object events
	object_event  5,  7, SPRITE_BUGSY, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, AzaleaGymBugsyScript, -1
	object_event  5,  3, SPRITE_BUG_CATCHER, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_TRAINER, 2, TrainerBugCatcherBenny, -1
	object_event  8,  8, SPRITE_BUG_CATCHER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_TRAINER, 3, TrainerBugCatcherAl, -1
	object_event  0,  2, SPRITE_BUG_CATCHER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_TRAINER, 3, TrainerBugCatcherJosh, -1
	object_event  4, 10, SPRITE_TWIN, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 1, TrainerTwinsAmyandmay1, -1
	object_event  5, 10, SPRITE_TWIN, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 1, TrainerTwinsAmyandmay2, -1
	object_event  7, 13, SPRITE_GYM_GUY, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, AzaleaGymGuyScript, -1
