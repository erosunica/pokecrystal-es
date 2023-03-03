	object_const_def ; object_event constants
	const ROUTE21_SWIMMER_GIRL
	const ROUTE21_SWIMMER_GUY
	const ROUTE21_FISHER

Route21_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

TrainerSwimmermSeth:
	trainer SWIMMERM, SETH, EVENT_BEAT_SWIMMERM_SETH, SwimmermSethSeenText, SwimmermSethBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext SwimmermSethAfterBattleText
	waitbutton
	closetext
	end

TrainerSwimmerfNikki:
	trainer SWIMMERF, NIKKI, EVENT_BEAT_SWIMMERF_NIKKI, SwimmerfNikkiSeenText, SwimmerfNikkiBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext SwimmerfNikkiAfterBattleText
	waitbutton
	closetext
	end

TrainerFisherArnold:
	trainer FISHER, ARNOLD, EVENT_BEAT_FISHER_ARNOLD, FisherArnoldSeenText, FisherArnoldBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext FisherArnoldAfterBattleText
	waitbutton
	closetext
	end

SwimmermSethSeenText:
	text "Tierra a la vista."
	line "¡Sigamos adelante!"
	done

SwimmermSethBeatenText:
	text "¡Glup…!"
	done

SwimmermSethAfterBattleText:
	text "Ese chico tan"
	line "arrogante estaba"

	para "en el volcán de"
	line "ISLA CANELA."
	done

SwimmerfNikkiSeenText:
	text "¡Si gano, tienes"
	line "que ayudarme con"
	cont "la loción solar!"
	done

SwimmerfNikkiBeatenText:
	text "No quiero"
	line "quemarme…"
	done

SwimmerfNikkiAfterBattleText:
	text "Debería tener"
	line "cuidado con las"

	para "manchas causadas"
	line "por el sol."
	done

FisherArnoldSeenText:
	text "Estoy aburrido de"
	line "pescar. ¡Luchemos!"
	done

FisherArnoldBeatenText:
	text "Qué fracaso…"
	done

FisherArnoldAfterBattleText:
	text "Voy a volver a"
	line "pescar…"
	done

Route21_MapEvents:
	db 0, 0 ; filler

	db 0 ; warp events

	db 0 ; coord events

	db 0 ; bg events

	db 3 ; object events
	object_event 11, 16, SPRITE_SWIMMER_GIRL, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_TRAINER, 3, TrainerSwimmerfNikki, -1
	object_event  2, 30, SPRITE_SWIMMER_GUY, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 4, TrainerSwimmermSeth, -1
	object_event 14, 22, SPRITE_FISHER, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_TRAINER, 1, TrainerFisherArnold, -1
