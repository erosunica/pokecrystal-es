	object_const_def ; object_event constants
	const PEWTERGYM_BROCK
	const PEWTERGYM_YOUNGSTER
	const PEWTERGYM_GYM_GUY

PewterGym_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

PewterGymBrockScript:
	faceplayer
	opentext
	checkflag ENGINE_BOULDERBADGE
	iftrue .FightDone
	writetext BrockIntroText
	waitbutton
	closetext
	winlosstext BrockWinLossText, 0
	loadtrainer BROCK, BROCK1
	startbattle
	reloadmapafterbattle
	setevent EVENT_BEAT_BROCK
	setevent EVENT_BEAT_CAMPER_JERRY
	opentext
	writetext ReceivedBoulderBadgeText
	playsound SFX_GET_BADGE
	waitsfx
	setflag ENGINE_BOULDERBADGE
	writetext BrockBoulderBadgeText
	waitbutton
	closetext
	end

.FightDone:
	writetext BrockFightDoneText
	waitbutton
	closetext
	end

TrainerCamperJerry:
	trainer CAMPER, JERRY, EVENT_BEAT_CAMPER_JERRY, CamperJerrySeenText, CamperJerryBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext CamperJerryAfterBattleText
	waitbutton
	closetext
	end

PewterGymGuyScript:
	faceplayer
	opentext
	checkevent EVENT_BEAT_BROCK
	iftrue .PewterGymGuyWinScript
	writetext PewterGymGuyText
	waitbutton
	closetext
	end

.PewterGymGuyWinScript:
	writetext PewterGymGuyWinText
	waitbutton
	closetext
	end

PewterGymStatue:
	checkflag ENGINE_BOULDERBADGE
	iftrue .Beaten
	jumpstd gymstatue1
.Beaten:
	gettrainername STRING_BUFFER_4, BROCK, BROCK1
	jumpstd gymstatue2

BrockIntroText:
	text "BROCK: ¡Uau! No"
	line "todos los días nos"

	para "desafía alguien de"
	line "JOHTO."

	para "Soy BROCK, LÍDER"
	line "del GIM. de C."

	para "PLATEADA y experto"
	line "en #MON roca."

	para "Mis #MON son"
	line "insensibles a la"

	para "mayoría de ataques"
	line "físicos. Te será"

	para "muy difícil"
	line "hacerles daño."

	para "¡Venga!"
	done

BrockWinLossText:
	text "BROCK: Mi dura"
	line "defensa no soportó"

	para "los ataques de tus"
	line "#MON…"

	para "Eres más fuerte de"
	line "lo que pensaba…"

	para "Toma. Coge esta"
	line "MEDALLA."
	done

ReceivedBoulderBadgeText:
	text "<PLAYER> recibió"
	line "la MEDALLA ROCA."
	done

BrockBoulderBadgeText:
	text "BROCK: <PLAY_G>,"
	line "gracias. Me ha"

	para "gustado el combate"
	line "aunque estoy algo"
	cont "molesto."

	para "La MEDALLA ROCA"
	line "hará que tus"

	para "#MON sean más"
	line "fuertes."
	done

BrockFightDoneText:
	text "BROCK: El mundo es"
	line "enorme. Hay muchos"

	para "entrenadores tan"
	line "fuertes como tú."

	para "Espera y verás."
	line "Yo también me voy"

	para "a hacer más"
	line "fuerte."
	done

CamperJerrySeenText:
	text "Los entrenadores"
	line "de este GIMNASIO"
	cont "usan #MON roca."

	para "Éstos tienen mayor"
	line "DEFENSA. Los"

	para "combates pueden"
	line "durar mucho rato."

	para "¿Te sientes con"
	line "fuerzas?"
	done

CamperJerryBeatenText:
	text "Tengo que ganar"
	line "estos combates…"
	done

CamperJerryAfterBattleText:
	text "¡Eh, tú! ¡Joven de"
	line "JOHTO! BROCK es"
	cont "muy duro."

	para "Te castigará si no"
	line "le tomas en serio."
	done

PewterGymGuyText:
	text "¡Eh! Eres"
	line "realmente temible."

	para "¿Estás enfrentán-"
	line "dote a los LÍDERES"

	para "de GIMNASIO de"
	line "KANTO?"

	para "Son fuertes y"
	line "entregados, igual"

	para "que los LÍDERES de"
	line "GIMNASIO de JOHTO."
	done

PewterGymGuyWinText:
	text "¡Hola! Este"
	line "GIMNASIO no te ha"
	cont "costado mucho."

	para "Tu forma de atacar"
	line "ha sido realmente"

	para "increíble."
	line "Lo digo en serio."
	done

PewterGym_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event  4, 13, PEWTER_CITY, 2
	warp_event  5, 13, PEWTER_CITY, 2

	db 0 ; coord events

	db 2 ; bg events
	bg_event  2, 11, BGEVENT_READ, PewterGymStatue
	bg_event  7, 11, BGEVENT_READ, PewterGymStatue

	db 3 ; object events
	object_event  5,  1, SPRITE_BROCK, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, PewterGymBrockScript, -1
	object_event  2,  5, SPRITE_YOUNGSTER, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_TRAINER, 3, TrainerCamperJerry, -1
	object_event  6, 11, SPRITE_GYM_GUY, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 1, PewterGymGuyScript, -1
