	object_const_def ; object_event constants
	const DARKCAVEBLACKTHORNENTRANCE_PHARMACIST
	const DARKCAVEBLACKTHORNENTRANCE_POKE_BALL1
	const DARKCAVEBLACKTHORNENTRANCE_POKE_BALL2

DarkCaveBlackthornEntrance_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

DarkCaveBlackthornEntrancePharmacistScript:
	faceplayer
	opentext
	checkevent EVENT_GOT_BLACKGLASSES_IN_DARK_CAVE
	iftrue .GotBlackglasses
	writetext DarkCaveBlackthornEntrancePharmacistText1
	promptbutton
	verbosegiveitem BLACKGLASSES
	iffalse .PackFull
	setevent EVENT_GOT_BLACKGLASSES_IN_DARK_CAVE
.GotBlackglasses:
	writetext DarkCaveBlackthornEntrancePharmacistText2
	waitbutton
.PackFull:
	closetext
	end

DarkCaveBlackthornEntranceRevive:
	itemball REVIVE

DarkCaveBlackthornEntranceTMSnore:
	itemball TM_SNORE

DarkCaveBlackthornEntrancePharmacistText1:
	text "¡Uauu! ¡Me has"
	line "asustado!"

	para "Tenía puestas las"
	line "GAFAS DE SOL y no"

	para "me di cuenta de tu"
	line "presencia."

	para "¿Que qué estoy"
	line "haciendo aquí?"

	para "No te preocupes"
	line "por eso."

	para "Te daré unas GAFAS"
	line "DE SOL si olvidas"

	para "que me has visto,"
	line "¿vale?"
	done

DarkCaveBlackthornEntrancePharmacistText2:
	text "Las GAFAS DE SOL"
	line "aumentan el poder"

	para "de los movimientos"
	line "de tipo siniestro."
	done

DarkCaveBlackthornEntrance_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event 23,  3, ROUTE_45, 1
	warp_event  3, 25, DARK_CAVE_VIOLET_ENTRANCE, 2

	db 0 ; coord events

	db 0 ; bg events

	db 3 ; object events
	object_event  7,  3, SPRITE_PHARMACIST, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, DarkCaveBlackthornEntrancePharmacistScript, -1
	object_event 21, 24, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, DarkCaveBlackthornEntranceRevive, EVENT_DARK_CAVE_BLACKTHORN_ENTRANCE_REVIVE
	object_event  7, 22, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, DarkCaveBlackthornEntranceTMSnore, EVENT_DARK_CAVE_BLACKTHORN_ENTRANCE_TM_SNORE
