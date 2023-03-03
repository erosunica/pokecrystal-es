	object_const_def ; object_event constants
	const ELMSHOUSE_ELMS_WIFE
	const ELMSHOUSE_ELMS_SON

ElmsHouse_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

ElmsWife:
	jumptextfaceplayer ElmsWifeText

ElmsSon:
	jumptextfaceplayer ElmsSonText

ElmsHousePC:
	jumptext ElmsHousePCText

ElmsHouseBookshelf:
	jumpstd difficultbookshelf

ElmsWifeText:
	text "¡Hola, <PLAY_G>!"
	line "Mi marido siempre"

	para "está muy ocupado."
	line "Espero que esté"
	cont "bien."

	para "Cuando está"
	line "embebido en la"

	para "investigación"
	line "#MON, se olvida"
	cont "hasta de comer."
	done

ElmsSonText:
	text "¡Cuando sea mayor,"
	line "ayudaré a mi"
	cont "padre!"

	para "¡Voy a ser un gran"
	line "profesor #MON!"
	done

ElmsHouseLabFoodText:
; unused
	text "Aquí hay comida."
	line "Debe de ser para"
	cont "el LABORATORIO."
	done

ElmsHousePokemonFoodText:
; unused
	text "Aquí hay comida."
	line "Debe de ser para"
	cont "los #MON."
	done

ElmsHousePCText:
	text "#MON… ¿De"
	line "dónde vienen?"

	para "¿Adónde van?"

	para "¿Por qué nadie ha"
	line "visto un #MON"
	cont "nacer?"

	para "¡Quiero saberlo!"
	line "¡Dedicaré mi vida"

	para "al estudio de"
	line "los #MON!"

	para "…"

	para "Es parte de los"
	line "papeles de la"

	para "investigación del"
	line "PROF. ELM."
	done

ElmsHouse_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event  2,  7, NEW_BARK_TOWN, 4
	warp_event  3,  7, NEW_BARK_TOWN, 4

	db 0 ; coord events

	db 3 ; bg events
	bg_event  0,  1, BGEVENT_READ, ElmsHousePC
	bg_event  6,  1, BGEVENT_READ, ElmsHouseBookshelf
	bg_event  7,  1, BGEVENT_READ, ElmsHouseBookshelf

	db 2 ; object events
	object_event  1,  5, SPRITE_TEACHER, SPRITEMOVEDATA_WALK_UP_DOWN, 0, 1, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, ElmsWife, -1
	object_event  5,  4, SPRITE_BUG_CATCHER, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, ElmsSon, -1
