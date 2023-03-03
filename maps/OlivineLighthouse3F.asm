	object_const_def ; object_event constants
	const OLIVINELIGHTHOUSE3F_SAILOR
	const OLIVINELIGHTHOUSE3F_GENTLEMAN
	const OLIVINELIGHTHOUSE3F_YOUNGSTER
	const OLIVINELIGHTHOUSE3F_POKE_BALL

OlivineLighthouse3F_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

TrainerBirdKeeperTheo:
	trainer BIRD_KEEPER, THEO, EVENT_BEAT_BIRD_KEEPER_THEO, BirdKeeperTheoSeenText, BirdKeeperTheoBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext BirdKeeperTheoAfterBattleText
	waitbutton
	closetext
	end

TrainerGentlemanPreston:
	trainer GENTLEMAN, PRESTON, EVENT_BEAT_GENTLEMAN_PRESTON, GentlemanPrestonSeenText, GentlemanPrestonBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext GentlemanPrestonAfterBattleText
	waitbutton
	closetext
	end

TrainerSailorTerrell:
	trainer SAILOR, TERRELL, EVENT_BEAT_SAILOR_TERRELL, SailorTerrellSeenText, SailorTerrellBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext SailorTerrellAfterBattleText
	waitbutton
	closetext
	end

OlivineLighthouse3FEther:
	itemball ETHER

BirdKeeperTheoSeenText:
	text "¿Qué haces aquí?"
	line "¿Sólo mirando?"

	para "¡Pues será mejor"
	line "que te vayas!"
	done

BirdKeeperTheoBeatenText:
	text "Te preocupas de"
	line "verdad…"
	done

BirdKeeperTheoAfterBattleText:
	text "¿Cómo diablos se"
	line "sube?"

	para "Quiero visitar"
	line "al #MON"

	para "enfermo, pero no"
	line "puedo subir…"
	done

SailorTerrellSeenText:
	text "Los marineros"
	line "somos fuertes y"
	cont "simpáticos. ¿Y tú?"
	done

SailorTerrellBeatenText:
	text "Eres fuerte y"
	line "amable…"
	done

SailorTerrellAfterBattleText:
	text "Siempre que vuelvo"
	line "a CIUDAD OLIVO"
	cont "voy al GIMNASIO."

	para "El tipo de #MON"
	line "de su LÍDER ha"

	para "cambiado sin darme"
	line "cuenta."
	done

GentlemanPrestonSeenText:
	text "Viajo por el mundo"
	line "para entrenar a"

	para "mis #MON."
	line "¿Quieres luchar?"
	done

GentlemanPrestonBeatenText:
	text "Ufffff…"
	line "Debo entrenar más."
	done

GentlemanPrestonAfterBattleText:
	text "YASMINA solía"
	line "utilizar #MON"
	cont "roca como ONIX."
	done

OlivineLighthouse3F_MapEvents:
	db 0, 0 ; filler

	db 9 ; warp events
	warp_event 13,  3, OLIVINE_LIGHTHOUSE_4F, 1
	warp_event  5,  3, OLIVINE_LIGHTHOUSE_2F, 2
	warp_event  9,  5, OLIVINE_LIGHTHOUSE_4F, 4
	warp_event 16, 11, OLIVINE_LIGHTHOUSE_2F, 5
	warp_event 17, 11, OLIVINE_LIGHTHOUSE_2F, 6
	warp_event 16,  9, OLIVINE_LIGHTHOUSE_4F, 5
	warp_event 17,  9, OLIVINE_LIGHTHOUSE_4F, 6
	warp_event  8,  3, OLIVINE_LIGHTHOUSE_4F, 7
	warp_event  9,  3, OLIVINE_LIGHTHOUSE_4F, 8

	db 0 ; coord events

	db 0 ; bg events

	db 4 ; object events
	object_event  9,  2, SPRITE_SAILOR, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 1, TrainerSailorTerrell, -1
	object_event 13,  5, SPRITE_GENTLEMAN, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 4, TrainerGentlemanPreston, -1
	object_event  3,  9, SPRITE_YOUNGSTER, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 3, TrainerBirdKeeperTheo, -1
	object_event  8,  2, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, OlivineLighthouse3FEther, EVENT_OLIVINE_LIGHTHOUSE_3F_ETHER
