	object_const_def ; object_event constants
	const LAVENDERTOWN_POKEFAN_M
	const LAVENDERTOWN_TEACHER
	const LAVENDERTOWN_GRAMPS
	const LAVENDERTOWN_YOUNGSTER

LavenderTown_MapScripts:
	db 0 ; scene scripts

	db 1 ; callbacks
	callback MAPCALLBACK_NEWMAP, .FlyPoint

.FlyPoint:
	setflag ENGINE_FLYPOINT_LAVENDER
	return

LavenderTownPokefanMScript:
	jumptextfaceplayer LavenderTownPokefanMText

LavenderTownTeacherScript:
	jumptextfaceplayer LavenderTownTeacherText

LavenderTownGrampsScript:
	jumptextfaceplayer LavenderTownGrampsText

LavenderTownYoungsterScript:
	jumptextfaceplayer LavenderTownYoungsterText

LavenderTownSign:
	jumptext LavenderTownSignText

KantoRadioStationSign:
	jumptext KantoRadioStationSignText

VolunteerPokemonHouseSign:
	jumptext VolunteerPokemonHouseSignText

SoulHouseSign:
	jumptext SoulHouseSignText

LavenderPokecenterSignText:
	jumpstd pokecentersign

LavenderMartSignText:
	jumpstd martsign

LavenderTownPokefanMText:
	text "Menudo edificio,"
	line "¿eh?"

	para "Es la TORRE RADIO"
	line "de KANTO."
	done

LavenderTownTeacherText:
	text "KANTO tiene muchos"
	line "programas de radio"
	cont "buenos."
	done

LavenderTownGrampsText:
	text "Viene gente de"
	line "todas partes a"

	para "rendir homenaje a"
	line "las almas de los"

	para "#MON que han"
	line "partido."
	done

LavenderTownYoungsterText:
	text "Para despertar a"
	line "los #MON,"

	para "sintoniza FLAUTA"
	line "#MON."

	para "¡Todo entrenador"
	line "debería saberlo!"
	done

LavenderTownSignText:
	text "PUEBLO LAVANDA"

	para "El noble pueblo"
	line "púrpura"
	done

KantoRadioStationSignText:
	text "EMISORA DE"
	line "KANTO"

	para "¡Tus programas"
	line "favoritos a"
	cont "cualquier hora!"
	done

VolunteerPokemonHouseSignText:
	text "CASA #MON"
	line "DE VOLUNTARIOS DE"
	cont "PUEBLO LAVANDA"
	done

SoulHouseSignText:
	text "CEMENTERIO"

	para "Que las almas de"
	line "los #MON"
	cont "descansen en paz"
	done

LavenderTown_MapEvents:
	db 0, 0 ; filler

	db 7 ; warp events
	warp_event  5,  5, LAVENDER_POKECENTER_1F, 1
	warp_event  5,  9, MR_FUJIS_HOUSE, 1
	warp_event  3, 13, LAVENDER_SPEECH_HOUSE, 1
	warp_event  7, 13, LAVENDER_NAME_RATER, 1
	warp_event  1,  5, LAVENDER_MART, 2
	warp_event 13, 11, SOUL_HOUSE, 1
	warp_event 14,  5, LAV_RADIO_TOWER_1F, 1

	db 0 ; coord events

	db 6 ; bg events
	bg_event 11,  3, BGEVENT_READ, LavenderTownSign
	bg_event 15,  7, BGEVENT_READ, KantoRadioStationSign
	bg_event  3,  9, BGEVENT_READ, VolunteerPokemonHouseSign
	bg_event 15, 13, BGEVENT_READ, SoulHouseSign
	bg_event  6,  5, BGEVENT_READ, LavenderPokecenterSignText
	bg_event  2,  5, BGEVENT_READ, LavenderMartSignText

	db 4 ; object events
	object_event 12,  7, SPRITE_POKEFAN_M, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 1, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, LavenderTownPokefanMScript, -1
	object_event  2, 15, SPRITE_TEACHER, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 1, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, LavenderTownTeacherScript, -1
	object_event 14, 12, SPRITE_GRAMPS, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, LavenderTownGrampsScript, -1
	object_event  6, 11, SPRITE_YOUNGSTER, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 1, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 1, LavenderTownYoungsterScript, -1
