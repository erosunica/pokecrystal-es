	object_const_def ; object_event constants
	const ROUTE28STEELWINGHOUSE_CELEBRITY
	const ROUTE28STEELWINGHOUSE_FEAROW

Route28SteelWingHouse_MapScripts:
	db 1 ; scene scripts
	scene_script .DummyScene

	db 0 ; callbacks

.DummyScene:
	end

Celebrity:
	faceplayer
	opentext
	checkevent EVENT_GOT_TM47_STEEL_WING
	iftrue .AlreadyGotItem
	writetext CelebrityText1
	promptbutton
	verbosegiveitem TM_STEEL_WING
	iffalse .Done
	setevent EVENT_GOT_TM47_STEEL_WING
.Done:
	closetext
	end
.AlreadyGotItem:
	writetext CelebrityText2
	waitbutton
	closetext
	end

CelebritysFearow:
	opentext
	writetext CelebritysFearowText
	cry FEAROW
	waitbutton
	closetext
	end

CelebrityHouseBookshelf:
	jumpstd magazinebookshelf

CelebrityText1:
	text "¡Pues vaya!"
	line "Me encontraste."

	para "Por favor, no se"
	line "lo digas a nadie."

	para "Te daré esto si"
	line "me guardas el"
	cont "secreto. ¿Vale?"
	done

CelebrityText2:
	text "Es muy duro ser"
	line "famoso."

	para "Todo el mundo me"
	line "persigue."

	para "Sólo quiero que me"
	line "dejen en paz…"
	done

CelebritysFearowText:
	text "FEAROW: ¡Fearow!"
	done

Route28SteelWingHouse_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event  2,  7, ROUTE_28, 1
	warp_event  3,  7, ROUTE_28, 1

	db 0 ; coord events

	db 2 ; bg events
	bg_event  0,  1, BGEVENT_READ, CelebrityHouseBookshelf
	bg_event  1,  1, BGEVENT_READ, CelebrityHouseBookshelf

	db 2 ; object events
	object_event  2,  3, SPRITE_COOLTRAINER_F, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, Celebrity, -1
	object_event  6,  5, SPRITE_MOLTRES, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, CelebritysFearow, -1
