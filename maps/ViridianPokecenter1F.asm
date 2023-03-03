	object_const_def ; object_event constants
	const VIRIDIANPOKECENTER1F_NURSE
	const VIRIDIANPOKECENTER1F_COOLTRAINER_M
	const VIRIDIANPOKECENTER1F_COOLTRAINER_F
	const VIRIDIANPOKECENTER1F_BUG_CATCHER

ViridianPokecenter1F_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

ViridianPokecenter1FNurseScript:
	jumpstd pokecenternurse

ViridianPokecenter1FCooltrainerMScript:
	faceplayer
	opentext
	checkevent EVENT_BLUE_IN_CINNABAR
	iftrue .BlueReturned
	writetext ViridianPokecenter1FCooltrainerMText
	waitbutton
	closetext
	end

.BlueReturned:
	writetext ViridianPokecenter1FCooltrainerMText_BlueReturned
	waitbutton
	closetext
	end

ViridianPokecenter1FCooltrainerFScript:
	jumptextfaceplayer ViridianPokecenter1FCooltrainerFText

ViridianPokecenter1FBugCatcherScript:
	jumptextfaceplayer ViridianPokecenter1FBugCatcherText

ViridianPokecenter1FCooltrainerMText:
	text "¿Dónde estará el"
	line "LÍDER del GIMNASIO"

	para "de CIUDAD VERDE?"
	line "Quería desafiarle."
	done

ViridianPokecenter1FCooltrainerMText_BlueReturned:
	text "No hay ningún"
	line "ENTRENADOR en el"

	para "GIMNASIO de CIUDAD"
	line "VERDE."

	para "El LÍDER dice que"
	line "su política es"

	para "ganar sin tener"
	line "subordinados."
	done

ViridianPokecenter1FCooltrainerFText:
	text "Dicen que el"
	line "GIMNASIO de ISLA"

	para "CANELA está"
	line "destruido."

	para "Me pregunto qué"
	line "habrá sido de"
	cont "BLAINE, su LÍDER."
	done

ViridianPokecenter1FBugCatcherText:
	text "Mi sueño es ser"
	line "LÍDER de GIMNASIO."
	done

ViridianPokecenter1F_MapEvents:
	db 0, 0 ; filler

	db 3 ; warp events
	warp_event  3,  7, VIRIDIAN_CITY, 5
	warp_event  4,  7, VIRIDIAN_CITY, 5
	warp_event  0,  7, POKECENTER_2F, 1

	db 0 ; coord events

	db 0 ; bg events

	db 4 ; object events
	object_event  3,  1, SPRITE_NURSE, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, ViridianPokecenter1FNurseScript, -1
	object_event  8,  4, SPRITE_COOLTRAINER_M, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 1, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, ViridianPokecenter1FCooltrainerMScript, -1
	object_event  5,  3, SPRITE_COOLTRAINER_F, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, ViridianPokecenter1FCooltrainerFScript, -1
	object_event  1,  6, SPRITE_BUG_CATCHER, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, ViridianPokecenter1FBugCatcherScript, -1
