	object_const_def ; object_event constants
	const VERMILIONPOKECENTER1F_NURSE
	const VERMILIONPOKECENTER1F_FISHING_GURU
	const VERMILIONPOKECENTER1F_SAILOR
	const VERMILIONPOKECENTER1F_BUG_CATCHER

VermilionPokecenter1F_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

VermilionPokecenter1FNurseScript:
	jumpstd pokecenternurse

VermilionPokecenter1FFishingGuruScript:
	faceplayer
	opentext
	checkevent EVENT_FOUGHT_SNORLAX
	iftrue .FoughtSnorlax
	writetext VermilionPokecenter1FFishingGuruText
	waitbutton
	closetext
	end

.FoughtSnorlax:
	writetext VermilionPokecenter1FFishingGuruText_FoughtSnorlax
	waitbutton
	closetext
	end

VermilionPokecenter1FSailorScript:
	jumptextfaceplayer VermilionPokecenter1FSailorText

VermilionPokecenter1FBugCatcherScript:
	jumptextfaceplayer VermilionPokecenter1FBugCatcherText

VermilionPokecenter1FFishingGuruText:
	text "Hay un #MON"
	line "dormido delante de"
	cont "la CUEVA DIGLETT."

	para "¡El momento ideal"
	line "para atraparlo!"

	para "¿Pero cómo lo"
	line "despertaremos?"
	done

VermilionPokecenter1FFishingGuruText_FoughtSnorlax:
	text "Antes había un"
	line "#MON durmiendo"

	para "delante de la"
	line "CUEVA de DIGLETT."

	para "Pero parece que"
	line "ha desaparecido."
	done

VermilionPokecenter1FSailorText:
	text "El FERRY es un"
	line "buen lugar para"

	para "luchar y conocer"
	line "entrenadores."
	done

VermilionPokecenter1FBugCatcherText:
	text "Tienes algunas"
	line "MEDALLAS que no"
	cont "había visto nunca."

	para "¡Claro! Las has"
	line "ganado en JOHTO."
	done

VermilionPokecenter1F_MapEvents:
	db 0, 0 ; filler

	db 3 ; warp events
	warp_event  3,  7, VERMILION_CITY, 2
	warp_event  4,  7, VERMILION_CITY, 2
	warp_event  0,  7, POKECENTER_2F, 1

	db 0 ; coord events

	db 0 ; bg events

	db 4 ; object events
	object_event  3,  1, SPRITE_NURSE, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, VermilionPokecenter1FNurseScript, -1
	object_event  7,  2, SPRITE_FISHING_GURU, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, VermilionPokecenter1FFishingGuruScript, -1
	object_event  6,  5, SPRITE_SAILOR, SPRITEMOVEDATA_WALK_UP_DOWN, 0, 1, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, VermilionPokecenter1FSailorScript, -1
	object_event  1,  5, SPRITE_BUG_CATCHER, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, VermilionPokecenter1FBugCatcherScript, -1
