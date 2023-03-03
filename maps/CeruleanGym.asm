	object_const_def ; object_event constants
	const CERULEANGYM_ROCKET
	const CERULEANGYM_MISTY
	const CERULEANGYM_SWIMMER_GIRL1
	const CERULEANGYM_SWIMMER_GIRL2
	const CERULEANGYM_SWIMMER_GUY
	const CERULEANGYM_GYM_GUY

CeruleanGym_MapScripts:
	db 2 ; scene scripts
	scene_script .DummyScene0 ; SCENE_CERULEANGYM_NOTHING
	scene_script .GruntRunsOut ; SCENE_CERULEANGYM_GRUNT_RUNS_OUT

	db 0 ; callbacks

.DummyScene0:
	end

.GruntRunsOut:
	prioritysjump .GruntRunsOutScript
	end

.GruntRunsOutScript:
	applymovement CERULEANGYM_ROCKET, CeruleanGymGruntRunsDownMovement
	playsound SFX_TACKLE
	applymovement CERULEANGYM_ROCKET, CeruleanGymGruntRunsIntoYouMovement
	playmusic MUSIC_ROCKET_ENCOUNTER
	opentext
	writetext CeruleanGymGruntIntroText
	waitbutton
	closetext
	showemote EMOTE_SHOCK, CERULEANGYM_ROCKET, 15
	applymovement CERULEANGYM_ROCKET, CeruleanGymGruntBacksAwayMovement
	opentext
	writetext CeruleanGymGruntBigMistakeText
	waitbutton
	closetext
	applymovement CERULEANGYM_ROCKET, CeruleanGymGruntMovesCloseMovement
	opentext
	writetext CeruleanGymGruntByeText
	waitbutton
	closetext
	applymovement CERULEANGYM_ROCKET, CeruleanGymGruntRunsOutMovement
	playsound SFX_EXIT_BUILDING
	disappear CERULEANGYM_ROCKET
	setevent EVENT_MET_ROCKET_GRUNT_AT_CERULEAN_GYM
	clearevent EVENT_ROUTE_24_ROCKET
	clearevent EVENT_ROUTE_25_MISTY_BOYFRIEND
	setscene SCENE_CERULEANGYM_NOTHING
	setmapscene ROUTE_25, SCENE_ROUTE25_MISTYS_DATE
	setmapscene POWER_PLANT, SCENE_POWERPLANT_NOTHING
	waitsfx
	special RestartMapMusic
	pause 15
	turnobject PLAYER, DOWN
	pause 15
	end

CeruleanGymMistyScript:
	faceplayer
	opentext
	checkflag ENGINE_CASCADEBADGE
	iftrue .FightDone
	writetext MistyIntroText
	waitbutton
	closetext
	winlosstext MistyWinLossText, 0
	loadtrainer MISTY, MISTY1
	startbattle
	reloadmapafterbattle
	setevent EVENT_BEAT_MISTY
	setevent EVENT_BEAT_SWIMMERF_DIANA
	setevent EVENT_BEAT_SWIMMERF_BRIANA
	setevent EVENT_BEAT_SWIMMERM_PARKER
	opentext
	writetext ReceivedCascadeBadgeText
	playsound SFX_GET_BADGE
	waitsfx
	setflag ENGINE_CASCADEBADGE
.FightDone:
	writetext MistyFightDoneText
	waitbutton
	closetext
	end

TrainerSwimmerfDiana:
	trainer SWIMMERF, DIANA, EVENT_BEAT_SWIMMERF_DIANA, SwimmerfDianaSeenText, SwimmerfDianaBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext SwimmerfDianaAfterBattleText
	waitbutton
	closetext
	end

TrainerSwimmerfBriana:
	trainer SWIMMERF, BRIANA, EVENT_BEAT_SWIMMERF_BRIANA, SwimmerfBrianaSeenText, SwimmerfBrianaBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext SwimmerfBrianaAfterBattleText
	waitbutton
	closetext
	end

TrainerSwimmermParker:
	trainer SWIMMERM, PARKER, EVENT_BEAT_SWIMMERM_PARKER, SwimmermParkerSeenText, SwimmermParkerBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext SwimmermParkerAfterBattleText
	waitbutton
	closetext
	end

CeruleanGymGuyScript:
	faceplayer
	opentext
	checkevent EVENT_BEAT_MISTY
	iftrue .CeruleanGymGuyWinScript
	writetext CeruleanGymGuyText
	waitbutton
	closetext
	end

.CeruleanGymGuyWinScript:
	writetext CeruleanGymGuyWinText
	waitbutton
	closetext
	end

CeruleanGymHiddenMachinePart:
	hiddenitem MACHINE_PART, EVENT_FOUND_MACHINE_PART_IN_CERULEAN_GYM

CeruleanGymStatue1:
	checkevent EVENT_TRAINERS_IN_CERULEAN_GYM
	iffalse CeruleanGymStatue
	opentext
	writetext CeruleanGymNote1Text
	waitbutton
	closetext
	end

CeruleanGymStatue2:
	checkevent EVENT_TRAINERS_IN_CERULEAN_GYM
	iffalse CeruleanGymStatue
	opentext
	writetext CeruleanGymNote2Text
	waitbutton
	closetext
	end

CeruleanGymStatue:
	checkflag ENGINE_CASCADEBADGE
	iftrue .Beaten
	jumpstd gymstatue1
.Beaten:
	gettrainername STRING_BUFFER_4, MISTY, MISTY1
	jumpstd gymstatue2

CeruleanGymGruntRunsDownMovement:
	big_step DOWN
	big_step DOWN
	big_step DOWN
	big_step DOWN
	step_end

CeruleanGymGruntRunsOutMovement:
	big_step RIGHT
	big_step DOWN
	step_end

CeruleanGymGruntRunsIntoYouMovement:
	fix_facing
	set_sliding
	jump_step UP
	remove_sliding
	remove_fixed_facing
	step_sleep 8
	step_sleep 8
	step DOWN
	step DOWN
	step_end

CeruleanGymGruntMovesCloseMovement:
	big_step DOWN
	step_end

CeruleanGymGruntBacksAwayMovement:
	fix_facing
	slow_step UP
	remove_fixed_facing
	step_end

CeruleanGymGruntIntroText:
	text "¡Uups! ¡Yo sentir!"
	line "Tú no hacer daño,"
	cont "¿de acuerdo?"

	para "Yo muy ocupado."
	line "No tener tiempo"

	para "para hablar"
	line "contigo. No poder"
	cont "verme nadie."
	done

CeruleanGymGruntBigMistakeText:
	text "¡Oh, no! ¡Tú"
	line "verme! ¡Yo cometer"
	cont "gran error!"
	done

CeruleanGymGruntByeText:
	text "¡Oye! Tú olvidar"
	line "que me has visto,"

	para "¿vale? Tú ver, oír"
	line "y saber nada, ¿de"

	para "acuerdo?"
	line "¡Adiós, joven!"

	para "¡Hasta la vista!"
	done

CeruleanGymNote1Text:
	text "Lo siento, estaré"
	line "fuera un tiempo."

	para "MISTY, LÍDER del"
	line "GIMNASIO"
	done

CeruleanGymNote2Text:
	text "Como MISTY ha"
	line "salido, nosotros"

	para "tampoco estaremos."
	line "Los ENTRENADORES"
	done

MistyIntroText:
	text "MISTY: ¡Te estaba"
	line "esperando, pelma!"

	para "Seguro que tienes"
	line "muchas MEDALLAS de"

	para "JOHTO, pero no me"
	line "subestimes en"
	cont "absoluto."

	para "¡Mis #MON de"
	line "tipo agua son"
	cont "fuertes!"
	done

MistyWinLossText:
	text "MISTY: Eres"
	line "realmente genial…"

	para "Reconozco tu gran"
	line "experiencia…"

	para "Aquí tienes la"
	line "MEDALLA CASCADA."
	done

ReceivedCascadeBadgeText:
	text "<PLAYER> recibió"
	line "MEDALLA CASCADA."
	done

MistyFightDoneText:
	text "MISTY: ¿Hay muchos"
	line "entrenadores"

	para "fuertes en JOHTO?"
	line "Como tú, digo."

	para "Un día viajaré y"
	line "lucharé contra"

	para "entrenadores"
	line "expertos."
	done

SwimmerfDianaSeenText:
	text "Siento haber"
	line "estado fuera."
	cont "¡A lo nuestro!"
	done

SwimmerfDianaBeatenText:
	text "¡Me rindo!"
	line "¡Has ganado!"
	done

SwimmerfDianaAfterBattleText:
	text "Estaré nadando"
	line "tranquilamente."
	done

SwimmerfBrianaSeenText:
	text "No te desanimes"
	line "por mi elegante"
	cont "forma de nadar."
	done

SwimmerfBrianaBeatenText:
	text "¡Ooh! Has acabado"
	line "conmigo…"
	done

SwimmerfBrianaAfterBattleText:
	text "No fardes tanto de"
	line "haberme vencido."

	para "MISTY acabará"
	line "contigo si te"
	cont "confías demasiado."
	done

SwimmermParkerSeenText:
	text "¡Glup…!"

	para "¡Soy el primero!"
	line "¡Ven a por mí!"
	done

SwimmermParkerBeatenText:
	text "No puede ser…"
	done

SwimmermParkerAfterBattleText:
	text "MISTY ha mejorado"
	line "mucho en los"
	cont "últimos años."

	para "¡No bajes la"
	line "guardia o acabarás"
	cont "mal!"
	done

CeruleanGymGuyText:
	text "¡Hola!"

	para "Como MISTY no"
	line "estaba, salí a"

	para "divertirme un"
	line "rato. ¡Je, je, je!"
	done

CeruleanGymGuyWinText:
	text "¡Uauu! ¡Qué"
	line "fuerte eres!"

	para "¡Como siempre, ha"
	line "sido un combate"
	cont "realmente bueno!"
	done

CeruleanGym_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event  4, 15, CERULEAN_CITY, 5
	warp_event  5, 15, CERULEAN_CITY, 5

	db 0 ; coord events

	db 3 ; bg events
	bg_event  3,  8, BGEVENT_ITEM, CeruleanGymHiddenMachinePart
	bg_event  2, 13, BGEVENT_READ, CeruleanGymStatue1
	bg_event  6, 13, BGEVENT_READ, CeruleanGymStatue2

	db 6 ; object events
	object_event  4, 10, SPRITE_ROCKET, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, ObjectEvent, EVENT_CERULEAN_GYM_ROCKET
	object_event  5,  3, SPRITE_MISTY, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, CeruleanGymMistyScript, EVENT_TRAINERS_IN_CERULEAN_GYM
	object_event  4,  6, SPRITE_SWIMMER_GIRL, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_TRAINER, 3, TrainerSwimmerfDiana, EVENT_TRAINERS_IN_CERULEAN_GYM
	object_event  1,  9, SPRITE_SWIMMER_GIRL, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_TRAINER, 1, TrainerSwimmerfBriana, EVENT_TRAINERS_IN_CERULEAN_GYM
	object_event  8,  9, SPRITE_SWIMMER_GUY, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 3, TrainerSwimmermParker, EVENT_TRAINERS_IN_CERULEAN_GYM
	object_event  7, 13, SPRITE_GYM_GUY, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, CeruleanGymGuyScript, EVENT_TRAINERS_IN_CERULEAN_GYM
