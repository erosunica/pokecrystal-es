	object_const_def ; object_event constants
	const ROUTE19_SWIMMER_GIRL
	const ROUTE19_SWIMMER_GUY1
	const ROUTE19_SWIMMER_GUY2
	const ROUTE19_SWIMMER_GUY3
	const ROUTE19_FISHER1
	const ROUTE19_FISHER2

Route19_MapScripts:
	db 0 ; scene scripts

	db 1 ; callbacks
	callback MAPCALLBACK_TILES, .ClearRocks

.ClearRocks:
	checkevent EVENT_CINNABAR_ROCKS_CLEARED
	iftrue .Done
	changeblock  6,  6, $7a ; rock
	changeblock  8,  6, $7a ; rock
	changeblock 10,  6, $7a ; rock
	changeblock 12,  8, $7a ; rock
	changeblock  4,  8, $7a ; rock
	changeblock 10, 10, $7a ; rock
.Done:
	return

TrainerSwimmerfDawn:
	trainer SWIMMERF, DAWN, EVENT_BEAT_SWIMMERF_DAWN, SwimmerfDawnSeenText, SwimmerfDawnBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext SwimmerfDawnAfterBattleText
	waitbutton
	closetext
	end

TrainerSwimmermHarold:
	trainer SWIMMERM, HAROLD, EVENT_BEAT_SWIMMERM_HAROLD, SwimmermHaroldSeenText, SwimmermHaroldBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext SwimmermHaroldAfterBattleText
	waitbutton
	closetext
	end

TrainerSwimmermJerome:
	trainer SWIMMERM, JEROME, EVENT_BEAT_SWIMMERM_JEROME, SwimmermJeromeSeenText, SwimmermJeromeBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext SwimmermJeromeAfterBattleText
	waitbutton
	closetext
	end

TrainerSwimmermTucker:
	trainer SWIMMERM, TUCKER, EVENT_BEAT_SWIMMERM_TUCKER, SwimmermTuckerSeenText, SwimmermTuckerBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext SwimmermTuckerAfterBattleText
	waitbutton
	closetext
	end

Route19Fisher1Script:
	faceplayer
	opentext
	checkevent EVENT_CINNABAR_ROCKS_CLEARED
	iftrue .RocksCleared
	writetext Route19Fisher1Text
	waitbutton
	closetext
	end

.RocksCleared:
	writetext Route19Fisher1Text_RocksCleared
	waitbutton
	closetext
	end

Route19Fisher2Script:
	faceplayer
	opentext
	checkevent EVENT_CINNABAR_ROCKS_CLEARED
	iftrue .RocksCleared
	writetext Route19Fisher2Text
	waitbutton
	closetext
	end

.RocksCleared:
	writetext Route19Fisher2Text_RocksCleared
	waitbutton
	closetext
	end

Route19Sign:
	jumptext Route19SignText

CarefulSwimmingSign:
	jumptext CarefulSwimmingSignText

SwimmermHaroldSeenText:
	text "¿Has nadado alguna"
	line "vez en el mar por"
	cont "la noche?"
	done

SwimmermHaroldBeatenText:
	text "¡Glup…!"
	done

SwimmermHaroldAfterBattleText:
	text "De noche, el mar"
	line "está oscuro. Da la"

	para "impresión de que"
	line "te va a tragar."
	done

SwimmermTuckerSeenText:
	text "(Resoplido)…"
	line "Un… poco más…"

	para "y… llegaré…"
	line "a CIUDAD FUCSIA…"
	done

SwimmermTuckerBeatenText:
	text "¡Me ahogo!"
	done

SwimmermTuckerAfterBattleText:
	text "Le… pedí a mi"
	line "novia que nadara"
	cont "a CIUDAD FUCSIA…"
	done

SwimmerfDawnSeenText:
	text "¡No me gustan los"
	line "peques!"
	done

SwimmerfDawnBeatenText:
	text "Podría ganarte"
	line "nadando…"
	done

SwimmerfDawnAfterBattleText:
	text "No hay que nadar"
	line "mucho desde CIUDAD"

	para "FUCSIA a las ISLAS"
	line "ESPUMA…"

	para "¡Con todo lo gran-"
	line "de que es, menudo"
	cont "blandengue!"
	done

SwimmermJeromeSeenText:
	text "Soy malísimo"
	line "nadando."

	para "Sólo estoy"
	line "chapoteando por"

	para "estas aguas poco"
	line "profundas."
	done

SwimmermJeromeBeatenText:
	text "Creía que podía"
	line "ganar."
	done

SwimmermJeromeAfterBattleText:
	text "Puede que no nade"
	line "muy bien, pero me"
	cont "encanta el mar."
	done

Route19Fisher1Text:
	text "Lo siento. La"
	line "carretera está"
	cont "cortada por obras."

	para "Si quieres llegar"
	line "a ISLA CANELA, ve"

	para "por el Sur, desde"
	line "PUEBLO PALETA."
	done

Route19Fisher1Text_RocksCleared:
	text "Estoy sudando."
	line "¡Voy a bañarme!"
	done

Route19Fisher2Text:
	text "A saber cuánto se"
	line "tardaría en mover"
	cont "esta roca…"
	done

Route19Fisher2Text_RocksCleared:
	text "Las obras de la"
	line "carretera ya han"
	cont "terminado."

	para "Ya puedo volver a"
	line "pescar."
	done

Route19SignText:
	text "RUTA 19"

	para "CIUDAD FUCSIA -"
	line "ISLAS ESPUMA"
	done

CarefulSwimmingSignText:
	text "Por favor, ten"
	line "cuidado si vas"

	para "nadando hasta las"
	line "ISLAS ESPUMA"

	para "POLICÍA C. FUCSIA"
	done

Route19_MapEvents:
	db 0, 0 ; filler

	db 1 ; warp events
	warp_event  7,  3, ROUTE_19_FUCHSIA_GATE, 3

	db 0 ; coord events

	db 2 ; bg events
	bg_event 11, 13, BGEVENT_READ, Route19Sign
	bg_event 11,  1, BGEVENT_READ, CarefulSwimmingSign

	db 6 ; object events
	object_event  9, 23, SPRITE_SWIMMER_GIRL, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_TRAINER, 0, TrainerSwimmerfDawn, -1
	object_event 13, 28, SPRITE_SWIMMER_GUY, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 3, TrainerSwimmermHarold, -1
	object_event 11, 17, SPRITE_SWIMMER_GUY, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 3, TrainerSwimmermJerome, -1
	object_event  8, 23, SPRITE_SWIMMER_GUY, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 0, TrainerSwimmermTucker, -1
	object_event  9,  5, SPRITE_FISHER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 1, Route19Fisher1Script, -1
	object_event 11,  5, SPRITE_FISHER, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 1, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 1, Route19Fisher2Script, -1
