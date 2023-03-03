	object_const_def ; object_event constants
	const CERULEANPOKECENTER1F_NURSE
	const CERULEANPOKECENTER1F_SUPER_NERD
	const CERULEANPOKECENTER1F_GYM_GUY

CeruleanPokecenter1F_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

CeruleanPokecenter1FNurseScript:
	jumpstd pokecenternurse

CeruleanPokecenter1FSuperNerdScript:
	special Mobile_DummyReturnFalse
	iftrue .mobile
	jumptextfaceplayer CeruleanPokecenter1FSuperNerdText

.mobile
	jumptextfaceplayer CeruleanPokecenter1FSuperNerdText_Mobile

CeruleanPokecenter1FGymGuyScript:
	jumptextfaceplayer CeruleanPokecenter1FGymGuyText

CeruleanPokecenter1FSuperNerdText:
	text "En los combates yo"
	line "prefiero usar"

	para "#MON que he"
	line "entrenado, aunque"

	para "sean más débiles"
	line "que los #MON"
	cont "recién capturados."
	done

CeruleanPokecenter1FSuperNerdText_Mobile:
	text "¿Combates por"
	line "teléfono móvil?"

	para "Si el tiempo se"
	line "acaba durante la"

	para "lucha, la espera"
	line "para ver al"

	para "ganador es"
	line "desesperante."
	done

CeruleanPokecenter1FGymGuyText:
	text "El MAGNETOTRÉN"
	line "viaja a unos"

	para "550 km/h. Puede"
	line "llevarte de"

	para "KANTO a JOHTO en"
	line "pocos segundos."

	para "Hace que sea muy"
	line "fácil ir a JOHTO."
	done

CeruleanPokecenter1F_MapEvents:
	db 0, 0 ; filler

	db 3 ; warp events
	warp_event  3,  7, CERULEAN_CITY, 4
	warp_event  4,  7, CERULEAN_CITY, 4
	warp_event  0,  7, POKECENTER_2F, 1

	db 0 ; coord events

	db 0 ; bg events

	db 3 ; object events
	object_event  3,  1, SPRITE_NURSE, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, CeruleanPokecenter1FNurseScript, -1
	object_event  8,  4, SPRITE_SUPER_NERD, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 1, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, CeruleanPokecenter1FSuperNerdScript, -1
	object_event  1,  5, SPRITE_GYM_GUY, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, CeruleanPokecenter1FGymGuyScript, -1
