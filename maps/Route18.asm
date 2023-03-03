	object_const_def ; object_event constants
	const ROUTE18_YOUNGSTER1
	const ROUTE18_YOUNGSTER2

Route18_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

TrainerBirdKeeperBoris:
	trainer BIRD_KEEPER, BORIS, EVENT_BEAT_BIRD_KEEPER_BORIS, BirdKeeperBorisSeenText, BirdKeeperBorisBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext BirdKeeperBorisAfterBattleText
	waitbutton
	closetext
	end

TrainerBirdKeeperBob:
	trainer BIRD_KEEPER, BOB, EVENT_BEAT_BIRD_KEEPER_BOB, BirdKeeperBobSeenText, BirdKeeperBobBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext BirdKeeperBobAfterBattleText
	waitbutton
	closetext
	end

Route18Sign:
	jumptext Route18SignText

BirdKeeperBorisSeenText:
	text "Si estás buscando"
	line "#MON, mira"

	para "en las zonas de"
	line "hierba alta."
	done

BirdKeeperBorisBeatenText:
	text "¡Ayyyy!"
	done

BirdKeeperBorisAfterBattleText:
	text "Siendo tan fuerte,"
	line "debe de ser muy"
	cont "divertido luchar."
	done

BirdKeeperBobSeenText:
	text "El CAMINO de BICIS"
	line "es un atajo a"
	cont "CIUDAD AZULONA."
	done

BirdKeeperBobBeatenText:
	text "¡Uau…!"
	done

BirdKeeperBobAfterBattleText:
	text "Si no tienes una"
	line "BICI, no podrás"

	para "usar el atajo."
	done

Route18SignText:
	text "RUTA 18"

	para "CIUDAD AZULONA -"
	line "CIUDAD FUCSIA"
	done

Route18_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event  2,  6, ROUTE_17_ROUTE_18_GATE, 3
	warp_event  2,  7, ROUTE_17_ROUTE_18_GATE, 4

	db 0 ; coord events

	db 1 ; bg events
	bg_event  9,  5, BGEVENT_READ, Route18Sign

	db 2 ; object events
	object_event  9, 12, SPRITE_YOUNGSTER, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 3, TrainerBirdKeeperBoris, -1
	object_event 13,  6, SPRITE_YOUNGSTER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 3, TrainerBirdKeeperBob, -1
