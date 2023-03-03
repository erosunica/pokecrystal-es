	object_const_def ; object_event constants
	const ROUTE2NUGGETHOUSE_FISHER

Route2NuggetHouse_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

Route2NuggetHouseFisherScript:
	faceplayer
	opentext
	checkevent EVENT_GOT_NUGGET_FROM_GUY
	iftrue .GotNugget
	writetext Route2NuggetHouseFisherText
	promptbutton
	verbosegiveitem NUGGET
	iffalse .NoRoom
	setevent EVENT_GOT_NUGGET_FROM_GUY
.GotNugget:
	writetext Route2NuggetHouseFisherText_GotNugget
	waitbutton
.NoRoom:
	closetext
	end

Route2NuggetHouseBookshelf:
; unused
	jumpstd difficultbookshelf

Route2NuggetHouseFisherText:
	text "¡Hola! Me alegro"
	line "de verte."

	para "Eres la primera"
	line "visita que recibo"

	para "desde hace mucho"
	line "tiempo."

	para "¡Estoy muy"
	line "contento! Te voy"

	para "a hacer un"
	line "pequeño regalo."
	done

Route2NuggetHouseFisherText_GotNugget:
	text "Es una PEPITA."

	para "No puedo darte"
	line "pepitas de la"

	para "sabiduría,"
	line "¡sólo esto!"
	done

Route2NuggetHouse_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event  2,  7, ROUTE_2, 1
	warp_event  3,  7, ROUTE_2, 1

	db 0 ; coord events

	db 0 ; bg events

	db 1 ; object events
	object_event  2,  4, SPRITE_FISHER, SPRITEMOVEDATA_WALK_UP_DOWN, 0, 2, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, Route2NuggetHouseFisherScript, -1
