	object_const_def ; object_event constants
	const OLIVINEMART_CLERK
	const OLIVINEMART_COOLTRAINER_F
	const OLIVINEMART_LASS

OlivineMart_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

OlivineMartClerkScript:
	opentext
	pokemart MARTTYPE_STANDARD, MART_OLIVINE
	closetext
	end

OlivineMartCooltrainerFScript:
	jumptextfaceplayer OlivineMartCooltrainerFText

OlivineMartLassScript:
	jumptextfaceplayer OlivineMartLassText

OlivineMartCooltrainerFText:
	text "¿Tus #MON saben"
	line "un movimiento para"

	para "llevar personas"
	line "por el agua?"
	done

OlivineMartLassText:
	text "Mi BUTTERFREE ha"
	line "estado con mi"
	cont "novio."

	para "Y me ha traído"
	line "una CARTA suya."

	para "¿Quieres saber"
	line "lo que dice?"

	para "Veamos… ¡No!"
	line "¡Es un secreto!"
	done

OlivineMart_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event  2,  7, OLIVINE_CITY, 8
	warp_event  3,  7, OLIVINE_CITY, 8

	db 0 ; coord events

	db 0 ; bg events

	db 3 ; object events
	object_event  1,  3, SPRITE_CLERK, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, OlivineMartClerkScript, -1
	object_event  6,  2, SPRITE_COOLTRAINER_F, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 2, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, OlivineMartCooltrainerFScript, -1
	object_event  1,  6, SPRITE_LASS, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, OlivineMartLassScript, -1
