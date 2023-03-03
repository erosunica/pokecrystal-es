	object_const_def ; object_event constants
	const ECRUTEAKMART_CLERK
	const ECRUTEAKMART_SUPER_NERD
	const ECRUTEAKMART_GRANNY

EcruteakMart_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

EcruteakMartClerkScript:
	opentext
	pokemart MARTTYPE_STANDARD, MART_ECRUTEAK
	closetext
	end

EcruteakMartSuperNerdScript:
	jumptextfaceplayer EcruteakMartSuperNerdText

EcruteakMartGrannyScript:
	jumptextfaceplayer EcruteakMartGrannyText

EcruteakMartSuperNerdText:
	text "Mi EEVEE evolu-"
	line "cionó en ESPEON."

	para "Pero el EEVEE de"
	line "mi amigo evolu-"
	cont "cionó en UMBREON."

	para "No sé por qué. Los"
	line "dos educamos a"

	para "nuestros EEVEE de"
	line "la misma forma…"
	done

EcruteakMartGrannyText:
	text "Si usas REVIVIR,"
	line "el #MON"

	para "debilitado se"
	line "reanimará."
	done

EcruteakMart_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event  2,  7, ECRUTEAK_CITY, 9
	warp_event  3,  7, ECRUTEAK_CITY, 9

	db 0 ; coord events

	db 0 ; bg events

	db 3 ; object events
	object_event  1,  3, SPRITE_CLERK, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, EcruteakMartClerkScript, -1
	object_event  5,  2, SPRITE_SUPER_NERD, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 1, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, EcruteakMartSuperNerdScript, -1
	object_event  6,  6, SPRITE_GRANNY, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, EcruteakMartGrannyScript, -1
