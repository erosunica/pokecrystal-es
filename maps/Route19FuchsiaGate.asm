	object_const_def ; object_event constants
	const ROUTE19FUCHSIAGATE_OFFICER

Route19FuchsiaGate_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

Route19FuchsiaGateOfficerScript:
	faceplayer
	opentext
	checkevent EVENT_CINNABAR_ROCKS_CLEARED
	iftrue .RocksCleared
	writetext Route19FuchsiaGateOfficerText
	waitbutton
	closetext
	end

.RocksCleared:
	writetext Route19FuchsiaGateOfficerText_RocksCleared
	waitbutton
	closetext
	end

Route19FuchsiaGateOfficerText:
	text "El volcán de ISLA"
	line "CANELA ha entrado"
	cont "en erupción."

	para "Y ha lanzado rocas"
	line "que han cortado la"

	para "RUTA 19 hasta"
	line "nuevo aviso."

	para "Me pregunto si la"
	line "gente de ISLA"

	para "CANELA estará"
	line "bien…"
	done

Route19FuchsiaGateOfficerText_RocksCleared:
	text "Nadie en ISLA"
	line "CANELA resultó"

	para "herido por la"
	line "erupción. ¡Bien!"
	done

Route19FuchsiaGate_MapEvents:
	db 0, 0 ; filler

	db 4 ; warp events
	warp_event  4,  0, FUCHSIA_CITY, 10
	warp_event  5,  0, FUCHSIA_CITY, 11
	warp_event  4,  7, ROUTE_19, 1
	warp_event  5,  7, ROUTE_19, 1

	db 0 ; coord events

	db 0 ; bg events

	db 1 ; object events
	object_event  0,  4, SPRITE_OFFICER, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, Route19FuchsiaGateOfficerScript, -1
