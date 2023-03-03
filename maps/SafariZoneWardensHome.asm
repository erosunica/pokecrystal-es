	object_const_def ; object_event constants
	const SAFARIZONEWARDENSHOME_LASS

SafariZoneWardensHome_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

WardensGranddaughter:
	faceplayer
	opentext
	checkevent EVENT_TALKED_TO_WARDENS_GRANDDAUGHTER
	iftrue .AlreadyMet
	writetext WardensGranddaughterText1
	waitbutton
	closetext
	setevent EVENT_TALKED_TO_WARDENS_GRANDDAUGHTER
	end
.AlreadyMet:
	writetext WardensGranddaughterText2
	waitbutton
	closetext
	end

WardenPhoto:
	jumptext WardenPhotoText

SafariZonePhoto:
	jumptext SafariZonePhotoText

WardensHomeBookshelf:
	jumpstd picturebookshelf

WardensGranddaughterText1:
	text "Mi abuelo es el"
	line "GUARDA de la ZONA"
	cont "SAFARI."

	para "Al menos lo era…"

	para "Decidió irse de"
	line "vacaciones y se"

	para "fue al extranjero"
	line "él solo."

	para "Así fue como dejó"
	line "de ocuparse de la"
	cont "ZONA SAFARI."
	done

WardensGranddaughterText2:
	text "Mucha gente se"
	line "enfadó cuando"

	para "cerraron la ZONA"
	line "SAFARI, pero el"
	cont "abuelo es terco."
	done

WardenPhotoText:
	text "Es una foto de un"
	line "anciano sonriente"

	para "rodeado de"
	line "#MON."
	done

SafariZonePhotoText:
	text "Es una foto de una"
	line "extensa pradera"

	para "llena de #MON"
	line "raros jugando."
	done

SafariZoneWardensHome_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event  2,  7, FUCHSIA_CITY, 6
	warp_event  3,  7, FUCHSIA_CITY, 6

	db 0 ; coord events

	db 4 ; bg events
	bg_event  0,  1, BGEVENT_READ, WardensHomeBookshelf
	bg_event  1,  1, BGEVENT_READ, WardensHomeBookshelf
	bg_event  7,  0, BGEVENT_READ, WardenPhoto
	bg_event  9,  0, BGEVENT_READ, SafariZonePhoto

	db 1 ; object events
	object_event  2,  4, SPRITE_LASS, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, WardensGranddaughter, -1
