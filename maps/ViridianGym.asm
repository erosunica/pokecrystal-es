	object_const_def ; object_event constants
	const VIRIDIANGYM_BLUE
	const VIRIDIANGYM_GYM_GUY

ViridianGym_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

ViridianGymBlueScript:
	faceplayer
	opentext
	checkflag ENGINE_EARTHBADGE
	iftrue .FightDone
	writetext LeaderBlueBeforeText
	waitbutton
	closetext
	winlosstext LeaderBlueWinText, 0
	loadtrainer BLUE, BLUE1
	startbattle
	reloadmapafterbattle
	setevent EVENT_BEAT_BLUE
	opentext
	writetext Text_ReceivedEarthBadge
	playsound SFX_GET_BADGE
	waitsfx
	setflag ENGINE_EARTHBADGE
	writetext LeaderBlueAfterText
	waitbutton
	closetext
	end

.FightDone:
	writetext LeaderBlueEpilogueText
	waitbutton
	closetext
	end

ViridianGymGuyScript:
	faceplayer
	opentext
	checkevent EVENT_BEAT_BLUE
	iftrue .ViridianGymGuyWinScript
	writetext ViridianGymGuyText
	waitbutton
	closetext
	end

.ViridianGymGuyWinScript:
	writetext ViridianGymGuyWinText
	waitbutton
	closetext
	end

ViridianGymStatue:
	checkflag ENGINE_EARTHBADGE
	iftrue .Beaten
	jumpstd gymstatue1

.Beaten:
	gettrainername STRING_BUFFER_4, BLUE, BLUE1
	jumpstd gymstatue2

LeaderBlueBeforeText:
	text "AZUL: ¡Hola! Al"
	line "fin llegaste, ¿eh?"

	para "En ISLA CANELA no"
	line "estaba a punto,"

	para "pero ahora estoy"
	line "listo para luchar."

	para "…"

	para "¿Me estás contando"
	line "que superaste los"

	para "GIMNASIOS de"
	line "JOHTO?"

	para "¡Vaya! Pues los"
	line "GIMNASIOS de JOHTO"

	para "deben de ser"
	line "patéticos."

	para "Pero bueno, no te"
	line "preocupes."

	para "Sabremos si vales"
	line "o no en un"

	para "momento. Luchemos"
	line "ahora."

	para "¿Vale?"
	done

LeaderBlueWinText:
	text "AZUL: ¿Qué?"

	para "¿Cómo diablos he"
	line "perdido?"

	para "…"

	para "¡Está bien…!"
	line "Toma. Aquí tienes"
	cont "la MEDALLA TIERRA."
	done

Text_ReceivedEarthBadge:
	text "<PLAYER> recibió"
	line "la MEDALLA TIERRA."
	done

LeaderBlueAfterText:
	text "AZUL: …"

	para "De acuerdo, me he"
	line "equivocado."

	para "Tenías razón."
	line "No me engañabas."

	para "Pero algún día te"
	line "derrotaré."

	para "¡No lo olvides!"
	done

LeaderBlueEpilogueText:
	text "AZUL: Escucha."

	para "Será mejor que no"
	line "pierdas hasta que"

	para "yo te derrote."
	line "¿Entendido?"
	done

ViridianGymGuyText:
	text "¡Hola!"
	line "¿Qué tal te va?"

	para "Parece que estás"
	line "de suerte."

	para "El LÍDER del"
	line "GIMNASIO luchó"

	para "contra el CAMPEÓN"
	line "hace 3 años."

	para "¡Es un tipo duro!"

	para "¡Debes esforzarte"
	line "al máximo!"
	done

ViridianGymGuyWinText:
	text "Vaya, eres"
	line "realmente fuerte…"

	para "¡Qué batalla más"
	line "emocionante!"

	para "Me ha hecho"
	line "llorar."
	done

ViridianGym_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event  4, 17, VIRIDIAN_CITY, 1
	warp_event  5, 17, VIRIDIAN_CITY, 1

	db 0 ; coord events

	db 2 ; bg events
	bg_event  3, 13, BGEVENT_READ, ViridianGymStatue
	bg_event  6, 13, BGEVENT_READ, ViridianGymStatue

	db 2 ; object events
	object_event  5,  3, SPRITE_BLUE, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, ViridianGymBlueScript, EVENT_VIRIDIAN_GYM_BLUE
	object_event  7, 13, SPRITE_GYM_GUY, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, ViridianGymGuyScript, EVENT_VIRIDIAN_GYM_BLUE
