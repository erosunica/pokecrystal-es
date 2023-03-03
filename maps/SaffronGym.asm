	object_const_def ; object_event constants
	const SAFFRONGYM_SABRINA
	const SAFFRONGYM_GRANNY1
	const SAFFRONGYM_YOUNGSTER1
	const SAFFRONGYM_GRANNY2
	const SAFFRONGYM_YOUNGSTER2
	const SAFFRONGYM_GYM_GUY

SaffronGym_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

SaffronGymSabrinaScript:
	faceplayer
	opentext
	checkflag ENGINE_MARSHBADGE
	iftrue .FightDone
	writetext SabrinaIntroText
	waitbutton
	closetext
	winlosstext SabrinaWinLossText, 0
	loadtrainer SABRINA, SABRINA1
	startbattle
	reloadmapafterbattle
	setevent EVENT_BEAT_SABRINA
	setevent EVENT_BEAT_MEDIUM_REBECCA
	setevent EVENT_BEAT_MEDIUM_DORIS
	setevent EVENT_BEAT_PSYCHIC_FRANKLIN
	setevent EVENT_BEAT_PSYCHIC_JARED
	opentext
	writetext ReceivedMarshBadgeText
	playsound SFX_GET_BADGE
	waitsfx
	setflag ENGINE_MARSHBADGE
	writetext SabrinaMarshBadgeText
	waitbutton
	closetext
	end

.FightDone:
	writetext SabrinaFightDoneText
	waitbutton
	closetext
	end

TrainerMediumRebecca:
	trainer MEDIUM, REBECCA, EVENT_BEAT_MEDIUM_REBECCA, MediumRebeccaSeenText, MediumRebeccaBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext MediumRebeccaAfterBattleText
	waitbutton
	closetext
	end

TrainerPsychicFranklin:
	trainer PSYCHIC_T, FRANKLIN, EVENT_BEAT_PSYCHIC_FRANKLIN, PsychicFranklinSeenText, PsychicFranklinBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext PsychicFranklinAfterBattleText
	waitbutton
	closetext
	end

TrainerMediumDoris:
	trainer MEDIUM, DORIS, EVENT_BEAT_MEDIUM_DORIS, MediumDorisSeenText, MediumDorisBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext MediumDorisAfterBattleText
	waitbutton
	closetext
	end

TrainerPsychicJared:
	trainer PSYCHIC_T, JARED, EVENT_BEAT_PSYCHIC_JARED, PsychicJaredSeenText, PsychicJaredBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext PsychicJaredAfterBattleText
	waitbutton
	closetext
	end

SaffronGymGuyScript:
	faceplayer
	opentext
	checkevent EVENT_BEAT_SABRINA
	iftrue .SaffronGymGuyWinScript
	writetext SaffronGymGuyText
	waitbutton
	closetext
	end

.SaffronGymGuyWinScript:
	writetext SaffronGymGuyWinText
	waitbutton
	closetext
	end

SaffronGymStatue:
	checkflag ENGINE_MARSHBADGE
	iftrue .Beaten
	jumpstd gymstatue1
.Beaten:
	gettrainername STRING_BUFFER_4, SABRINA, SABRINA1
	jumpstd gymstatue2

SabrinaIntroText:
	text "SABRINA: Sabía"
	line "que vendrías…"

	para "Hace tres años"
	line "tuve una visión"
	cont "de tu llegada."

	para "Tú lo que quieres"
	line "es mi MEDALLA."

	para "No me gusta"
	line "luchar, pero mi"

	para "deber como LÍDER"
	line "es conceder"

	para "MEDALLAS a todo"
	line "aquel que se las"
	cont "merezca."

	para "Como eso es lo que"
	line "quieres, mira mis"
	cont "poderes psíquicos."
	done

SabrinaWinLossText:
	text "SABRINA: Tu poder…"
	line "supera con creces"
	cont "lo que esperaba…"

	para "Quizá no se pueda"
	line "predecir del todo"

	para "lo que nos espera"
	line "en el futuro…"

	para "Vale, tú ganas."
	line "Te has ganado la"
	cont "MEDALLA PANTANO."
	done

ReceivedMarshBadgeText:
	text "<PLAYER> recibió"
	line "MEDALLA PANTANO."
	done

SabrinaMarshBadgeText:
	text "SABRINA: La"
	line "MEDALLA PANTANO"

	para "muestra tus"
	line "poderes ocultos."

	para "Aunque no supe"
	line "predecir tu poder"

	para "con exactitud,"
	line "sabía que valías"
	cont "mucho."

	para "¡Llegarás a ser lo"
	line "que te propongas!"
	done

SabrinaFightDoneText:
	text "SABRINA: Tu amor"
	line "por tus #MON"

	para "supera mi poder"
	line "psíquico…"

	para "Creo que el poder"
	line "del amor es un"

	para "tipo de poder"
	line "psíquico…"
	done

MediumRebeccaSeenText:
	text "¡El poder de todos"
	line "a los que venciste"
	cont "está en mí!"
	done

MediumRebeccaBeatenText:
	text "Fuerte…"
	line "Muy fuerte…"
	done

MediumRebeccaAfterBattleText:
	text "¿De dónde proviene"
	line "tu poder?"
	done

PsychicFranklinSeenText:
	text "El poder psíquico"
	line "es el poder de tu"
	cont "alma."
	done

PsychicFranklinBeatenText:
	text "¡Tu alma tiene más"
	line "poder que la mía!"
	done

PsychicFranklinAfterBattleText:
	text "Has fortalecido tu"
	line "alma, no sólo tus"
	cont "habilidades."
	done

MediumDorisSeenText:
	text "¡Fufufufu…!"
	line "Lo veo claramente."

	para "¡Puedo ver lo que"
	line "encierra tu alma!"
	done

MediumDorisBeatenText:
	text "A pesar de leerte"
	line "el pensamiento,"
	cont "he perdido…"
	done

MediumDorisAfterBattleText:
	text "¡Maldición! Olvidé"
	line "que predije mi"
	cont "derrota contra ti."
	done

PsychicJaredSeenText:
	text "El DOJO-KARATE era"
	line "el GIMNASIO de"
	cont "esta ciudad."
	done

PsychicJaredBeatenText:
	text "¡No he estado a tu"
	line "altura…!"
	done

PsychicJaredAfterBattleText:
	text "El REY del KARATE,"
	line "el maestro del"

	para "DOJO-KARATE, acaba"
	line "de ser machacado"
	cont "por SABRINA."
	done

SaffronGymGuyText:
	text "¡Oye, realmente"
	line "prometes!"

	para "Alguien tan hábil"
	line "como tú, no"

	para "necesita que le"
	line "digan cómo luchar"

	para "contra #MON"
	line "psíquicos, ¿no?"

	para "¡Espero mucho de"
	line "ti!"

	para "¡Buena suerte!"
	done

SaffronGymGuyWinText:
	text "¡Otro combate"
	line "fantástico!"
	done

SaffronGym_MapEvents:
	db 0, 0 ; filler

	db 32 ; warp events
	warp_event  8, 17, SAFFRON_CITY, 2
	warp_event  9, 17, SAFFRON_CITY, 2
	warp_event 11, 15, SAFFRON_GYM, 18
	warp_event 19, 15, SAFFRON_GYM, 19
	warp_event 19, 11, SAFFRON_GYM, 20
	warp_event  1, 11, SAFFRON_GYM, 21
	warp_event  5,  3, SAFFRON_GYM, 22
	warp_event 11,  5, SAFFRON_GYM, 23
	warp_event  1, 15, SAFFRON_GYM, 24
	warp_event 19,  3, SAFFRON_GYM, 25
	warp_event 15, 17, SAFFRON_GYM, 26
	warp_event  5, 17, SAFFRON_GYM, 27
	warp_event  5,  9, SAFFRON_GYM, 28
	warp_event  9,  3, SAFFRON_GYM, 29
	warp_event 15,  9, SAFFRON_GYM, 30
	warp_event 15,  5, SAFFRON_GYM, 31
	warp_event  1,  5, SAFFRON_GYM, 32
	warp_event 19, 17, SAFFRON_GYM, 3
	warp_event 19,  9, SAFFRON_GYM, 4
	warp_event  1,  9, SAFFRON_GYM, 5
	warp_event  5,  5, SAFFRON_GYM, 6
	warp_event 11,  3, SAFFRON_GYM, 7
	warp_event  1, 17, SAFFRON_GYM, 8
	warp_event 19,  5, SAFFRON_GYM, 9
	warp_event 15, 15, SAFFRON_GYM, 10
	warp_event  5, 15, SAFFRON_GYM, 11
	warp_event  5, 11, SAFFRON_GYM, 12
	warp_event  9,  5, SAFFRON_GYM, 13
	warp_event 15, 11, SAFFRON_GYM, 14
	warp_event 15,  3, SAFFRON_GYM, 15
	warp_event  1,  3, SAFFRON_GYM, 16
	warp_event 11,  9, SAFFRON_GYM, 17

	db 0 ; coord events

	db 1 ; bg events
	bg_event  8, 15, BGEVENT_READ, SaffronGymStatue

	db 6 ; object events
	object_event  9,  8, SPRITE_SABRINA, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, SaffronGymSabrinaScript, -1
	object_event 17, 16, SPRITE_GRANNY, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_TRAINER, 3, TrainerMediumRebecca, -1
	object_event  3, 16, SPRITE_YOUNGSTER, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 3, TrainerPsychicFranklin, -1
	object_event  3,  4, SPRITE_GRANNY, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_TRAINER, 2, TrainerMediumDoris, -1
	object_event 17,  4, SPRITE_YOUNGSTER, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 2, TrainerPsychicJared, -1
	object_event  9, 14, SPRITE_GYM_GUY, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, SaffronGymGuyScript, -1
