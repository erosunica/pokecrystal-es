	object_const_def ; object_event constants
	const SLOWPOKEWELLB2F_GYM_GUY
	const SLOWPOKEWELLB2F_POKE_BALL

SlowpokeWellB2F_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

SlowpokeWellB2FGymGuyScript:
	faceplayer
	opentext
	checkevent EVENT_GOT_KINGS_ROCK_IN_SLOWPOKE_WELL
	iftrue .GotKingsRock
	writetext SlowpokeWellB2FGymGuyText
	promptbutton
	verbosegiveitem KINGS_ROCK
	iffalse .NoRoom
	setevent EVENT_GOT_KINGS_ROCK_IN_SLOWPOKE_WELL
.NoRoom:
	closetext
	end

.GotKingsRock:
	writetext SlowpokeWellB2FGymGuyText_GotKingsRock
	waitbutton
	closetext
	end

SlowpokeWellB2FTMRainDance:
	itemball TM_RAIN_DANCE

SlowpokeWellB2FGymGuyText:
	text "Me gustaría ver"
	line "cómo evolucionan"
	cont "los SLOWPOKE."

	para "Observándolos he"
	line "hecho un nuevo"
	cont "descubrimiento."

	para "Un SLOWPOKE con"
	line "una ROCA DEL REY"

	para "suele ser mordido"
	line "por un SHELLDER."

	para "Toma, compartiré"
	line "una ROCA DEL REY"
	cont "contigo."
	done

SlowpokeWellB2FGymGuyText_GotKingsRock:
	text "Voy a ser como"
	line "SLOWPOKE."

	para "Tendré paciencia"
	line "y a ver si"
	cont "evoluciona alguno."
	done

SlowpokeWellB2F_MapEvents:
	db 0, 0 ; filler

	db 1 ; warp events
	warp_event  9, 11, SLOWPOKE_WELL_B1F, 2

	db 0 ; coord events

	db 0 ; bg events

	db 2 ; object events
	object_event  5,  4, SPRITE_GYM_GUY, SPRITEMOVEDATA_WANDER, 1, 2, -1, -1, 0, OBJECTTYPE_SCRIPT, 1, SlowpokeWellB2FGymGuyScript, -1
	object_event 15,  5, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, SlowpokeWellB2FTMRainDance, EVENT_SLOWPOKE_WELL_B2F_TM_RAIN_DANCE
