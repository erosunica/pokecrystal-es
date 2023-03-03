	object_const_def ; object_event constants
	const ROUTE13_YOUNGSTER1
	const ROUTE13_YOUNGSTER2
	const ROUTE13_POKEFAN_M1
	const ROUTE13_POKEFAN_M2
	const ROUTE13_POKEFAN_M3

Route13_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

TrainerPokefanmAlex:
	trainer POKEFANM, ALEX, EVENT_BEAT_POKEFANM_ALEX, PokefanmAlexSeenText, PokefanmAlexBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext PokefanmAlexAfterBattleText
	waitbutton
	closetext
	end

TrainerPokefanmJoshua:
	trainer POKEFANM, JOSHUA, EVENT_BEAT_POKEFANM_JOSHUA, PokefanmJoshuaSeenText, PokefanmJoshuaBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext PokefanmJoshuaAfterBattleText
	waitbutton
	closetext
	end

TrainerBirdKeeperPerry:
	trainer BIRD_KEEPER, PERRY, EVENT_BEAT_BIRD_KEEPER_PERRY, BirdKeeperPerrySeenText, BirdKeeperPerryBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext BirdKeeperPerryAfterBattleText
	waitbutton
	closetext
	end

TrainerBirdKeeperBret:
	trainer BIRD_KEEPER, BRET, EVENT_BEAT_BIRD_KEEPER_BRET, BirdKeeperBretSeenText, BirdKeeperBretBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext BirdKeeperBretAfterBattleText
	waitbutton
	closetext
	end

TrainerHikerKenny:
	trainer HIKER, KENNY, EVENT_BEAT_HIKER_KENNY, HikerKennySeenText, HikerKennyBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext HikerKennyAfterBattleText
	waitbutton
	closetext
	end

Route13TrainerTips:
	jumptext Route13TrainerTipsText

Route13Sign:
	jumptext Route13SignText

Route13DirectionsSign:
	jumptext Route13DirectionsSignText

Route13HiddenCalcium:
	hiddenitem CALCIUM, EVENT_ROUTE_13_HIDDEN_CALCIUM

PokefanmAlexSeenText:
	text "¡Arrodíllate ante"
	line "mi regio #MON!"
	done

PokefanmAlexBeatenText:
	text "¿Qué? ¡Te burlas"
	line "de la realeza!"
	done

PokefanmAlexAfterBattleText:
	text "¿Acaso no quiere"
	line "ser rey todo el"
	cont "mundo?"
	done

PokefanmJoshuaSeenText:
	text "¡Jijiji! ¿Quieres"
	line "luchar contra mi"
	cont "grupo de PIKACHU?"
	done

PokefanmJoshuaBeatenText:
	text "¡PI, PIKACHU!"
	done

PokefanmJoshuaAfterBattleText:
	text "Parece que tienes"
	line "muchos #MON,"

	para "pero PIKACHU es el"
	line "mejor."
	done

BirdKeeperPerrySeenText:
	text "La agilidad es"
	line "la clave de los"
	cont "#MON pájaro."
	done

BirdKeeperPerryBeatenText:
	text "Me venciste con"
	line "tu velocidad…"
	done

BirdKeeperPerryAfterBattleText:
	text "Tus #MON"
	line "están muy bien"
	cont "entrenados."
	done

BirdKeeperBretSeenText:
	text "Mira mis #MON."

	para "Fíjate en su color"
	line "y en su plumaje."
	done

BirdKeeperBretBeatenText:
	text "¡Vaya! ¡No soy lo"
	line "bastante bueno!"
	done

BirdKeeperBretAfterBattleText:
	text "Los #MON son"
	line "felices si los"
	cont "pones guapos."
	done

HikerKennySeenText:
	text "Debería ir al"
	line "TÚNEL ROCA para"
	cont "conseguir un ONIX."
	done

HikerKennyBeatenText:
	text "He perdido…"
	done

HikerKennyAfterBattleText:
	text "Parece que las"
	line "formas geológicas"
	cont "no cambian."

	para "Pero sí que"
	line "cambian, aunque"
	cont "poco a poco."
	done

Route13TrainerTipsText:
	text "PISTAS ENTRENADOR"

	para "¡Mira! Allí, a la"
	line "izquierda del"
	cont "poste"
	done

Route13SignText:
	text "RUTA 13 HACIA EL"
	line "NORTE AL PUENTE"
	cont "SILENCIO"
	done

Route13DirectionsSignText:
	text "HACIA EL NORTE"
	line "AL PUEBLO LAVANDA"

	para "HACIA EL OESTE"
	line "A CIUDAD FUCSIA"
	done

Route13_MapEvents:
	db 0, 0 ; filler

	db 0 ; warp events

	db 0 ; coord events

	db 4 ; bg events
	bg_event 29, 13, BGEVENT_READ, Route13TrainerTips
	bg_event 41, 11, BGEVENT_READ, Route13Sign
	bg_event 17, 13, BGEVENT_READ, Route13DirectionsSign
	bg_event 30, 13, BGEVENT_ITEM, Route13HiddenCalcium

	db 5 ; object events
	object_event 42,  6, SPRITE_YOUNGSTER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 2, TrainerBirdKeeperPerry, -1
	object_event 43,  6, SPRITE_YOUNGSTER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 2, TrainerBirdKeeperBret, -1
	object_event 32,  8, SPRITE_POKEFAN_M, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 3, TrainerPokefanmJoshua, -1
	object_event 14, 10, SPRITE_POKEFAN_M, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 4, TrainerHikerKenny, -1
	object_event 25,  6, SPRITE_POKEFAN_M, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 4, TrainerPokefanmAlex, -1
