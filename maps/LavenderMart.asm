	object_const_def ; object_event constants
	const LAVENDERMART_CLERK
	const LAVENDERMART_POKEFAN_M
	const LAVENDERMART_ROCKER

LavenderMart_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

LavenderMartClerkScript:
	opentext
	pokemart MARTTYPE_STANDARD, MART_LAVENDER
	closetext
	end

LavenderMartPokefanMScript:
	jumptextfaceplayer LavenderMartPokefanMText

LavenderMartRockerScript:
	jumptextfaceplayer LavenderMartRockerText

LavenderMartPokefanMText:
	text "Si vas a explorar"
	line "una cueva, debes"

	para "llevar siempre"
	line "REPELENTE."

	para "Aunque me gusta la"
	line "exploración, aún"

	para "no he recorrido"
	line "todas las cuevas."
	done

LavenderMartRockerText:
	text "He oído hablar de"
	line "un artesano que"

	para "fabrica # BALL"
	line "a medida en PUEBLO"

	para "AZALEA, en JOHTO."
	line "¡Yo quiero una!"
	done

LavenderMart_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event  2,  7, LAVENDER_TOWN, 5
	warp_event  3,  7, LAVENDER_TOWN, 5

	db 0 ; coord events

	db 0 ; bg events

	db 3 ; object events
	object_event  1,  3, SPRITE_CLERK, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, LavenderMartClerkScript, -1
	object_event  6,  6, SPRITE_POKEFAN_M, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 2, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, LavenderMartPokefanMScript, -1
	object_event  9,  2, SPRITE_ROCKER, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, LavenderMartRockerScript, -1
