	object_const_def ; object_event constants
	const LAVENDERPOKECENTER1F_NURSE
	const LAVENDERPOKECENTER1F_GENTLEMAN
	const LAVENDERPOKECENTER1F_TEACHER
	const LAVENDERPOKECENTER1F_YOUNGSTER

LavenderPokecenter1F_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

LavenderPokecenter1FNurseScript:
	jumpstd pokecenternurse

LavenderPokecenter1FGentlemanScript:
	jumptextfaceplayer LavenderPokecenter1FGentlemanText

LavenderPokecenter1FTeacherScript:
	jumptextfaceplayer LavenderPokecenter1FTeacherText

LavenderPokecenter1FYoungsterScript:
	faceplayer
	opentext
	checkevent EVENT_RETURNED_MACHINE_PART
	iftrue .ReturnedMachinePart
	writetext LavenderPokecenter1FYoungsterText
	waitbutton
	closetext
	end

.ReturnedMachinePart:
	writetext LavenderPokecenter1FYoungsterText_ReturnedMachinePart
	waitbutton
	closetext
	end

LavenderPokecenter1FGentlemanText:
	text "Al norte de PUEBLO"
	line "LAVANDA está el"
	cont "TÚNEL ROCA."

	para "Crúzalo para lle-"
	line "gar a la CENTRAL"
	cont "ENERGÍA."
	done

LavenderPokecenter1FTeacherText:
	text "Hay un programa de"
	line "radio que pone"

	para "música de #"
	line "FLAUTA."

	para "Necesitas una"
	line "TARJETA EXPN para"
	cont "sintonizarlo."
	done

LavenderPokecenter1FYoungsterText:
	text "Si la CENTRAL"
	line "ENERGÍA no está en"

	para "funcionamiento, el"
	line "MAGNETOTRÉN"
	cont "tampoco lo estará…"

	para "Y eso significa"
	line "que la ESTACIÓN de"

	para "RADIO no podrá"
	line "emitir…"
	done

LavenderPokecenter1FYoungsterText_ReturnedMachinePart:
	text "El DIRECTOR de la"
	line "EMISORA estaba muy"
	cont "contento."

	para "Dijo que han"
	line "vuelto a emitir"

	para "porque la CENTRAL"
	line "ENERGÍA ya"
	cont "funciona."
	done

LavenderPokecenter1F_MapEvents:
	db 0, 0 ; filler

	db 3 ; warp events
	warp_event  3,  7, LAVENDER_TOWN, 1
	warp_event  4,  7, LAVENDER_TOWN, 1
	warp_event  0,  7, POKECENTER_2F, 1

	db 0 ; coord events

	db 0 ; bg events

	db 4 ; object events
	object_event  3,  1, SPRITE_NURSE, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, LavenderPokecenter1FNurseScript, -1
	object_event  7,  6, SPRITE_GENTLEMAN, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 1, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, LavenderPokecenter1FGentlemanScript, -1
	object_event  5,  3, SPRITE_TEACHER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, LavenderPokecenter1FTeacherScript, -1
	object_event  1,  5, SPRITE_YOUNGSTER, SPRITEMOVEDATA_WALK_UP_DOWN, 0, 1, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, LavenderPokecenter1FYoungsterScript, -1
