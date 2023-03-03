	object_const_def ; object_event constants
	const REDSHOUSE1F_REDS_MOM

RedsHouse1F_MapScripts:
	db 1 ; scene scripts
	scene_script .DummyScene

	db 0 ; callbacks

.DummyScene:
	end

RedsMom:
	faceplayer
	opentext
	checkevent EVENT_MET_REDS_MOM
	iftrue .MetAlready
	writetext RedsMomText1
	waitbutton
	closetext
	setevent EVENT_MET_REDS_MOM
	end
.MetAlready:
	writetext RedsMomText2
	waitbutton
	closetext
	end

RedsHouse1FTV:
	jumptext RedsHouse1FTVText

RedsHouse1FBookshelf:
	jumpstd picturebookshelf

RedsMomText1:
	text "¡Hola!"

	para "ROJO lleva fuera"
	line "mucho tiempo."

	para "Tampoco ha"
	line "llamado, así que"

	para "no sé dónde está,"
	line "ni lo que ha"
	cont "estado haciendo."

	para "Dicen que si no"
	line "hay noticias es"

	para "que todo va bien,"
	line "pero estoy"
	cont "preocupada por él."
	done

RedsMomText2:
	text "Me preocupa que"
	line "ROJO esté herido o"

	para "enfermo, pero ya"
	line "es todo un hombre-"
	cont "cito. Estoy"
	cont "orgullosa de que"

	para "esté haciendo lo"
	line "que quiere."
	done

RedsHouse1FTVText:
	text "Tienen programas"
	line "que no se emiten"
	cont "en JOHTO…"
	done

RedsHouse1F_MapEvents:
	db 0, 0 ; filler

	db 3 ; warp events
	warp_event  2,  7, PALLET_TOWN, 1
	warp_event  3,  7, PALLET_TOWN, 1
	warp_event  7,  0, REDS_HOUSE_2F, 1

	db 0 ; coord events

	db 3 ; bg events
	bg_event  0,  1, BGEVENT_READ, RedsHouse1FBookshelf
	bg_event  1,  1, BGEVENT_READ, RedsHouse1FBookshelf
	bg_event  2,  1, BGEVENT_READ, RedsHouse1FTV

	db 1 ; object events
	object_event  5,  3, SPRITE_REDS_MOM, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, RedsMom, -1
