	object_const_def ; object_event constants
	const BLACKTHORNMART_CLERK
	const BLACKTHORNMART_COOLTRAINER_M
	const BLACKTHORNMART_BLACK_BELT

BlackthornMart_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

BlackthornMartClerkScript:
	opentext
	pokemart MARTTYPE_STANDARD, MART_BLACKTHORN
	closetext
	end

BlackthornMartCooltrainerMScript:
	jumptextfaceplayer BlackthornMartCooltrainerMText

BlackthornMartBlackBeltScript:
	jumptextfaceplayer BlackthornMartBlackBeltText

BlackthornMartCooltrainerMText:
	text "No puedes comprar"
	line "MÁX. REVIVIR, pero"

	para "éste reanima"
	line "a un #MON"
	cont "debilitado."

	para "Atención: No"
	line "restaura los PP o"

	para "PUNTOS de PODER de"
	line "los movimientos."
	done

BlackthornMartBlackBeltText:
	text "MÁX. REPEL evita"
	line "que se acerquen"
	cont "#MON débiles."

	para "Es el repelente"
	line "más duradero"
	cont "de todos."
	done

BlackthornMart_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event  2,  7, BLACKTHORN_CITY, 4
	warp_event  3,  7, BLACKTHORN_CITY, 4

	db 0 ; coord events

	db 0 ; bg events

	db 3 ; object events
	object_event  1,  3, SPRITE_CLERK, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, BlackthornMartClerkScript, -1
	object_event  7,  6, SPRITE_COOLTRAINER_M, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 2, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, BlackthornMartCooltrainerMScript, -1
	object_event  5,  2, SPRITE_BLACK_BELT, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, BlackthornMartBlackBeltScript, -1
