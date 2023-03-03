	object_const_def ; object_event constants
	const ROUTE7SAFFRONGATE_OFFICER

Route7SaffronGate_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

Route7SaffronGuardScript:
	faceplayer
	opentext
	checkevent EVENT_RETURNED_MACHINE_PART
	iftrue .ReturnedPart
	writetext Route7SaffronGuardPowerPlantText
	waitbutton
	closetext
	end

.ReturnedPart:
	writetext Route7SaffronGuardSeriousText
	waitbutton
	closetext
	end

Route7SaffronGuardPowerPlantText:
	text "¿Has oído lo del"
	line "accidente de la"
	cont "CENTRAL ENERGÍA?"

	para "Se encuentra al"
	line "Este, cerca de"
	cont "PUEBLO LAVANDA."
	done

Route7SaffronGuardSeriousText:
	text "Me tomo muy en"
	line "serio mi trabajo"
	cont "de GUARDA."

	para "¡Eh! Tienes una"
	line "#DEX."

	para "Vale. Puedes"
	line "pasar."
	done

Route7SaffronGate_MapEvents:
	db 0, 0 ; filler

	db 4 ; warp events
	warp_event  0,  4, ROUTE_7, 1
	warp_event  0,  5, ROUTE_7, 2
	warp_event  9,  4, SAFFRON_CITY, 10
	warp_event  9,  5, SAFFRON_CITY, 11

	db 0 ; coord events

	db 0 ; bg events

	db 1 ; object events
	object_event  5,  2, SPRITE_OFFICER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, Route7SaffronGuardScript, -1
