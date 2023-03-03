	object_const_def ; object_event constants
	const ROUTE12SUPERRODHOUSE_FISHING_GURU

Route12SuperRodHouse_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

Route12SuperRodHouseFishingGuruScript:
	faceplayer
	opentext
	checkevent EVENT_GOT_SUPER_ROD
	iftrue .GotSuperRod
	writetext OfferSuperRodText
	yesorno
	iffalse .Refused
	writetext GiveSuperRodText
	promptbutton
	verbosegiveitem SUPER_ROD
	iffalse .NoRoom
	setevent EVENT_GOT_SUPER_ROD
.GotSuperRod:
	writetext GaveSuperRodText
	waitbutton
	closetext
	end

.Refused:
	writetext DontWantSuperRodText
	waitbutton
.NoRoom:
	closetext
	end

SuperRodHouseBookshelf:
; unused
	jumpstd picturebookshelf

OfferSuperRodText:
	text "Soy el hermano"
	line "pequeño del GURÚ"
	cont "PESCADOR."

	para "Veo que te gusta"
	line "pescar."

	para "¡No tengo ninguna"
	line "duda!"

	para "Sé que tengo"
	line "razón."
	done

GiveSuperRodText:
	text "Sí, sí. ¡Justo lo"
	line "que pensaba!"

	para "¡Aquí tienes!"
	line "Toma esto. Es"
	cont "una SÚPER CAÑA."
	done

GaveSuperRodText:
	text "Intenta pescar"
	line "allí donde veas"
	cont "agua."

	para "Recuerda: puedes"
	line "capturar #MON"

	para "diferentes usando"
	line "distintas CAÑAS."
	done

DontWantSuperRodText:
	text "¿Eh? ¿Me engañan"
	line "mis ojos?"
	done

Route12SuperRodHouse_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event  2,  7, ROUTE_12, 1
	warp_event  3,  7, ROUTE_12, 1

	db 0 ; coord events

	db 0 ; bg events

	db 1 ; object events
	object_event  5,  3, SPRITE_FISHING_GURU, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, Route12SuperRodHouseFishingGuruScript, -1
