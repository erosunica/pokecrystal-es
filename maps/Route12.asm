	object_const_def ; object_event constants
	const ROUTE12_FISHER1
	const ROUTE12_FISHER2
	const ROUTE12_FISHER3
	const ROUTE12_FISHER4
	const ROUTE12_POKE_BALL1
	const ROUTE12_POKE_BALL2

Route12_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

TrainerFisherKyle:
	trainer FISHER, KYLE, EVENT_BEAT_FISHER_KYLE, FisherKyleSeenText, FisherKyleBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext FisherKyleAfterBattleText
	waitbutton
	closetext
	end

TrainerFisherMartin:
	trainer FISHER, MARTIN, EVENT_BEAT_FISHER_MARTIN, FisherMartinSeenText, FisherMartinBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext FisherMartinAfterBattleText
	waitbutton
	closetext
	end

TrainerFisherStephen:
	trainer FISHER, STEPHEN, EVENT_BEAT_FISHER_STEPHEN, FisherStephenSeenText, FisherStephenBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext FisherStephenAfterBattleText
	waitbutton
	closetext
	end

TrainerFisherBarney:
	trainer FISHER, BARNEY, EVENT_BEAT_FISHER_BARNEY, FisherBarneySeenText, FisherBarneyBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext FisherBarneyAfterBattleText
	waitbutton
	closetext
	end

Route12Sign:
	jumptext Route12SignText

FishingSpotSign:
	jumptext FishingSpotSignText

Route12Calcium:
	itemball CALCIUM

Route12Nugget:
	itemball NUGGET

Route12HiddenElixer:
	hiddenitem ELIXER, EVENT_ROUTE_12_HIDDEN_ELIXER

FisherMartinSeenText:
	text "La paciencia es la"
	line "clave para pescar"
	cont "y criar #MON."
	done

FisherMartinBeatenText:
	text "¡Guaaa!"
	done

FisherMartinAfterBattleText:
	text "No tengo paciencia"
	line "para la pesca…"
	done

FisherStephenSeenText:
	text "Me gusta pescar"
	line "mientras escucho"

	para "canciones por la"
	line "radio."
	done

FisherStephenBeatenText:
	text "¡Mi estúpida radio"
	line "me ha distraído!"
	done

FisherStephenAfterBattleText:
	text "¿Conoces las"
	line "emisoras de"

	para "radio de KANTO?"
	line "Tenemos muchas."
	done

FisherBarneySeenText:
	text "¿Qué es lo más"
	line "importante en"
	cont "nuestras vidas?"
	done

FisherBarneyBeatenText:
	text "¡La respuesta"
	line "vendrá luego!"
	done

FisherBarneyAfterBattleText:
	text "Creo que la"
	line "electricidad es lo"

	para "más importante en"
	line "nuestras vidas."

	para "Si no lo fuera, no"
	line "se habría montado"

	para "tanto follón"
	line "cuando se estropeó"

	para "la CENTRAL"
	line "ENERGÍA."
	done

FisherKyleSeenText:
	text "¿Te acuerdas?"
	done

FisherKyleBeatenText:
	text "Te acuerdas, ¿no?"
	done

FisherKyleAfterBattleText:
	text "El tirón de la"
	line "CAÑA cuando ha"
	cont "picado un #MON…"

	para "Ésa es la mejor"
	line "sensación para un"
	cont "pescador como yo."
	done

Route12SignText:
	text "RUTA 12"

	para "PUEBLO LAVANDA"
	line "HACIA EL NORTE"
	done

FishingSpotSignText:
	text "COTO DE PESCA"
	done

Route12_MapEvents:
	db 0, 0 ; filler

	db 1 ; warp events
	warp_event 11, 33, ROUTE_12_SUPER_ROD_HOUSE, 1

	db 0 ; coord events

	db 3 ; bg events
	bg_event 11, 27, BGEVENT_READ, Route12Sign
	bg_event 13,  9, BGEVENT_READ, FishingSpotSign
	bg_event 14, 13, BGEVENT_ITEM, Route12HiddenElixer

	db 6 ; object events
	object_event  5, 13, SPRITE_FISHER, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_TRAINER, 1, TrainerFisherMartin, -1
	object_event 14, 23, SPRITE_FISHER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_TRAINER, 1, TrainerFisherStephen, -1
	object_event 10, 38, SPRITE_FISHER, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_TRAINER, 5, TrainerFisherBarney, -1
	object_event  6,  7, SPRITE_FISHER, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_TRAINER, 3, TrainerFisherKyle, -1
	object_event  5, 43, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, Route12Calcium, EVENT_ROUTE_12_CALCIUM
	object_event  5, 51, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, Route12Nugget, EVENT_ROUTE_12_NUGGET
