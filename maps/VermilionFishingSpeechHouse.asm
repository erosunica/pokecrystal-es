	object_const_def ; object_event constants
	const VERMILIONFISHINGSPEECHHOUSE_FISHING_GURU

VermilionFishingSpeechHouse_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

FishingDude:
	jumptextfaceplayer FishingDudeText

FishingDudesHousePhoto:
	jumptext FishingDudesHousePhotoText

FishingDudesHouseBookshelf:
; unused
	jumpstd picturebookshelf

FishingDudeText:
	text "Soy el TÍO PESCA-"
	line "DOR, el mayor de"

	para "los HERMANOS"
	line "PESCADORES."

	para "¿Conoces al GURÚ"
	line "PESCADOR del LAGO"
	cont "DE LA FURIA?"

	para "Sueña con ver el"
	line "MAGIKARP más"
	cont "grande del mundo."

	para "Si no te importa,"
	line "¿podrías mostrarle"

	para "todos los MAGIKARP"
	line "que captures?"

	para "Quién sabe,"
	line "podrías capturar"

	para "el MAGIKARP de sus"
	line "sueños."
	done

FishingDudesHousePhotoText:
	text "Es una foto de"
	line "gente pescando…"

	para "Lo están pasando"
	line "muy bien…"
	done

VermilionFishingSpeechHouse_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event  2,  7, VERMILION_CITY, 1
	warp_event  3,  7, VERMILION_CITY, 1

	db 0 ; coord events

	db 1 ; bg events
	bg_event  3,  0, BGEVENT_READ, FishingDudesHousePhoto

	db 1 ; object events
	object_event  2,  4, SPRITE_FISHING_GURU, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, FishingDude, -1
