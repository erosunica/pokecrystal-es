	object_const_def ; object_event constants
	const ROUTE4_YOUNGSTER
	const ROUTE4_LASS1
	const ROUTE4_LASS2
	const ROUTE4_POKE_BALL

Route4_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

TrainerBirdKeeperHank:
	trainer BIRD_KEEPER, HANK, EVENT_BEAT_BIRD_KEEPER_HANK, BirdKeeperHankSeenText, BirdKeeperHankBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext BirdKeeperHankAfterBattleText
	waitbutton
	closetext
	end

TrainerPicnickerHope:
	trainer PICNICKER, HOPE, EVENT_BEAT_PICNICKER_HOPE, PicnickerHopeSeenText, PicnickerHopeBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext PicnickerHopeAfterBattleText
	waitbutton
	closetext
	end

TrainerPicnickerSharon:
	trainer PICNICKER, SHARON, EVENT_BEAT_PICNICKER_SHARON, PicnickerSharonSeenText, PicnickerSharonBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext PicnickerSharonAfterBattleText
	waitbutton
	closetext
	end

MtMoonSquareSign:
	jumptext MtMoonSquareSignText

Route4HPUp:
	itemball HP_UP

Route4HiddenUltraBall:
	hiddenitem ULTRA_BALL, EVENT_ROUTE_4_HIDDEN_ULTRA_BALL

BirdKeeperHankSeenText:
	text "Estoy mejorando"
	line "mis #MON."

	para "¿Quieres luchar"
	line "contra mí?"
	done

BirdKeeperHankBeatenText:
	text "¡Argh! He perdido"
	line "esta vez…"
	done

BirdKeeperHankAfterBattleText:
	text "Si tienes un"
	line "#MON que desees"

	para "mejorar, ponlo en"
	line "primer lugar y"

	para "cámbialo nada más"
	line "empezar."

	para "Así es como hay"
	line "que hacerlo."
	done

PicnickerHopeSeenText:
	text "Presiento que"
	line "puedo ganar."

	para "¡Veamos si tengo"
	line "razón!"
	done

PicnickerHopeBeatenText:
	text "¡Uau! Eres"
	line "demasiado fuerte."
	done

PicnickerHopeAfterBattleText:
	text "Dicen que CLEFAIRY"
	line "aparece en el"

	para "MT. MOON."
	line "¿Pero dónde?"
	done

PicnickerSharonSeenText:
	text "¡Umm…!"
	line "Yo…"
	done

PicnickerSharonBeatenText:
	text "<……>"
	done

PicnickerSharonAfterBattleText:
	text "…Creo que seguiré"
	line "entrenándome…"
	done

MtMoonSquareSignText:
	text "PLAZA MT. MOON"

	para "Sube las"
	line "escaleras"
	done

Route4_MapEvents:
	db 0, 0 ; filler

	db 1 ; warp events
	warp_event  2,  5, MOUNT_MOON, 2

	db 0 ; coord events

	db 2 ; bg events
	bg_event  3,  7, BGEVENT_READ, MtMoonSquareSign
	bg_event 10,  3, BGEVENT_ITEM, Route4HiddenUltraBall

	db 4 ; object events
	object_event 17,  9, SPRITE_YOUNGSTER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 3, TrainerBirdKeeperHank, -1
	object_event  9,  8, SPRITE_LASS, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_TRAINER, 4, TrainerPicnickerHope, -1
	object_event 21,  6, SPRITE_LASS, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_TRAINER, 4, TrainerPicnickerSharon, -1
	object_event 26,  3, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, Route4HPUp, EVENT_ROUTE_4_HP_UP
