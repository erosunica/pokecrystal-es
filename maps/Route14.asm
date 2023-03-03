	object_const_def ; object_event constants
	const ROUTE14_POKEFAN_M1
	const ROUTE14_YOUNGSTER
	const ROUTE14_POKEFAN_M2
	const ROUTE14_KIM

Route14_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

Kim:
	faceplayer
	opentext
	trade NPC_TRADE_KIM
	waitbutton
	closetext
	end

TrainerPokefanmCarter:
	trainer POKEFANM, CARTER, EVENT_BEAT_POKEFANM_CARTER, PokefanmCarterSeenText, PokefanmCarterBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext PokefanmCarterAfterBattleText
	waitbutton
	closetext
	end

TrainerBirdKeeperRoy:
	trainer BIRD_KEEPER, ROY, EVENT_BEAT_BIRD_KEEPER_ROY, BirdKeeperRoySeenText, BirdKeeperRoyBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext BirdKeeperRoyAfterBattleText
	waitbutton
	closetext
	end

TrainerPokefanmTrevor:
	trainer POKEFANM, TREVOR, EVENT_BEAT_POKEFANM_TREVOR, PokefanmTrevorSeenText, PokefanmTrevorBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext PokefanmTrevorAfterBattleText
	waitbutton
	closetext
	end

PokefanmCarterSeenText:
	text "Que sepas que me"
	line "costó mucho"

	para "atrapar a mis"
	line "queridos #MON."
	done

PokefanmCarterBeatenText:
	text "¡Auuuu!"
	done

PokefanmCarterAfterBattleText:
	text "SQUIRTLE, CHARMAN-"
	line "DER y BULBASAUR."

	para "Creo que es una"
	line "buena combinación."
	done

BirdKeeperRoySeenText:
	text "Mi sueño es volar"
	line "con mi querido"
	cont "#MON pájaro."
	done

BirdKeeperRoyBeatenText:
	text "Puedo soñar, pero"
	line "nunca podré volar."
	done

BirdKeeperRoyAfterBattleText:
	text "¿Tienes #MON"
	line "que conozcan la"

	para "MO VUELO? ¿Sí?"
	line "¡Qué envidia!"
	done

PokefanmTrevorSeenText:
	text "Hola."
	line "¿Sabes qué…?"

	para "Los #MON son"
	line "más amigables si"

	para "los entrenas en un"
	line "lugar que ellos"
	cont "recuerden."
	done

PokefanmTrevorBeatenText:
	text "¿Dónde conocí a"
	line "este PSYDUCK?"
	done

PokefanmTrevorAfterBattleText:
	text "Si hubiera un"
	line "sistema fácil de"

	para "identificar dónde"
	line "obtuve mi #MON…"
	done

Route14_MapEvents:
	db 0, 0 ; filler

	db 0 ; warp events

	db 0 ; coord events

	db 0 ; bg events

	db 4 ; object events
	object_event 11, 15, SPRITE_POKEFAN_M, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 3, TrainerPokefanmCarter, -1
	object_event 11, 27, SPRITE_YOUNGSTER, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 3, TrainerBirdKeeperRoy, -1
	object_event  6, 11, SPRITE_POKEFAN_M, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 3, TrainerPokefanmTrevor, -1
	object_event  7,  5, SPRITE_TEACHER, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 1, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 4, Kim, -1
