	object_const_def ; object_event constants
	const RADIOTOWER4F_FISHER
	const RADIOTOWER4F_TEACHER
	const RADIOTOWER4F_GROWLITHE
	const RADIOTOWER4F_ROCKET1
	const RADIOTOWER4F_ROCKET2
	const RADIOTOWER4F_ROCKET_GIRL
	const RADIOTOWER4F_SCIENTIST

RadioTower4F_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

RadioTower4FFisherScript:
	jumptextfaceplayer RadioTower4FFisherText

RadioTower4FDJMaryScript:
	faceplayer
	opentext
	checkevent EVENT_GOT_PINK_BOW_FROM_MARY
	iftrue .GotPinkBow
	checkevent EVENT_CLEARED_RADIO_TOWER
	iftrue .ClearedRockets
	writetext RadioTower4FDJMaryText
	waitbutton
	closetext
	end

.ClearedRockets:
	writetext RadioTower4FDJMaryText_ClearedRockets
	promptbutton
	verbosegiveitem PINK_BOW
	iffalse .NoRoom
	writetext RadioTower4FDJMaryText_GivePinkBow
	waitbutton
	closetext
	setevent EVENT_GOT_PINK_BOW_FROM_MARY
	end

.GotPinkBow:
	writetext RadioTower4FDJMaryText_After
	waitbutton
.NoRoom:
	closetext
	end

RadioTowerMeowth:
	opentext
	writetext RadioTowerMeowthText
	cry MEOWTH
	waitbutton
	closetext
	end

TrainerGruntM10:
	trainer GRUNTM, GRUNTM_10, EVENT_BEAT_ROCKET_GRUNTM_10, GruntM10SeenText, GruntM10BeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext GruntM10AfterBattleText
	waitbutton
	closetext
	end

TrainerExecutivem2:
	trainer EXECUTIVEM, EXECUTIVEM_2, EVENT_BEAT_ROCKET_EXECUTIVEM_2, Executivem2SeenText, Executivem2BeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext Executivem2AfterBattleText
	waitbutton
	closetext
	end

TrainerGruntF4:
	trainer GRUNTF, GRUNTF_4, EVENT_BEAT_ROCKET_GRUNTF_4, GruntF4SeenText, GruntF4BeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext GruntF4AfterBattleText
	waitbutton
	closetext
	end

TrainerScientistRich:
	trainer SCIENTIST, RICH, EVENT_BEAT_SCIENTIST_RICH, ScientistRichSeenText, ScientistRichBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext ScientistRichAfterBattleText
	waitbutton
	closetext
	end

RadioTower4FProductionSign:
	jumptext RadioTower4FProductionSignText

RadioTower4FStudio2Sign:
	jumptext RadioTower4FStudio2SignText

RadioTower4FFisherText:
	text "Mientras estaba en"
	line "las RUINAS oía la"
	cont "radio."

	para "Y escuché un"
	line "extraño programa."
	done

RadioTower4FDJMaryText:
	text "ROSA: ¿Por qué?"
	line "¿Por qué debo"
	cont "sufrir?"

	para "¡MEOWTH, ayúdame!"
	done

RadioTower4FDJMaryText_ClearedRockets:
	text "ROSA: ¡Oh! ¡Eres"
	line "mi salvación!"

	para "¿Aceptas esto como"
	line "agradecimiento?"
	done

RadioTower4FDJMaryText_GivePinkBow:
	text "ROSA: Es para los"
	line "#MON que"

	para "saben movimientos"
	line "de tipo normal."
	done

RadioTower4FDJMaryText_After:
	text "ROSA: Sintoniza"
	line "conmigo en la"

	para "HORA #MON"
	line "del PROF. OAK."
	done

RadioTowerMeowthText:
	text "MEOWTH: Meowth…"
	done

GruntM10SeenText:
	text "¿Quieres rescatar"
	line "al DIRECTOR?"

	para "¡Pues ya te puedes"
	line "ir olvidando de"

	para "eso, porque te"
	line "voy a ganar!"
	done

GruntM10BeatenText:
	text "¡No! ¡Increíble!"
	done

GruntM10AfterBattleText:
	text "¡Increíble!"
	line "¡He perdido!"
	done

Executivem2SeenText:
	text "¡Alto ahí!"
	line "¡Me llaman la"

	para "fortaleza del"
	line "TEAM ROCKET!"

	para "¡No des un paso"
	line "más!"
	done

Executivem2BeatenText:
	text "¡La fortaleza se"
	line "derrumbó!"
	done

Executivem2AfterBattleText:
	text "Te has ganado mi"
	line "respeto. ¡Te daré"
	cont "un consejo!"

	para "Aún estás a tiempo"
	line "de darte la"
	cont "vuelta."
	done

GruntF4SeenText:
	text "¿Son buenos mis"
	line "#MON?"

	para "¡Creeré que mis"
	line "#MON son buenos"

	para "cuando derroten a"
	line "los tuyos!"
	done

GruntF4BeatenText:
	text "¡Oh, no! ¡Son"
	line "tan inútiles!"
	done

GruntF4AfterBattleText:
	text "¡Me amo a mí"
	line "misma!"

	para "¿Qué importan los"
	line "#MON?"
	done

ScientistRichSeenText:
	text "¡Extraordinario!"

	para "Esta TORRE RADIO"
	line "completará nuestro"
	cont "gran plan."
	done

ScientistRichBeatenText:
	text "¡Mmmm…!"

	para "Todo gran plan"
	line "tiene sus pegas."
	done

ScientistRichAfterBattleText:
	text "¿De verdad crees"
	line "que puedes detener"
	cont "al TEAM ROCKET?"
	done

RadioTower4FProductionSignText:
	text "P3 PRODUCCIÓN"
	done

RadioTower4FStudio2SignText:
	text "P3 ESTUDIO 2"
	done

RadioTower4F_MapEvents:
	db 0, 0 ; filler

	db 4 ; warp events
	warp_event  0,  0, RADIO_TOWER_5F, 1
	warp_event  9,  0, RADIO_TOWER_3F, 2
	warp_event 12,  0, RADIO_TOWER_5F, 2
	warp_event 17,  0, RADIO_TOWER_3F, 3

	db 0 ; coord events

	db 2 ; bg events
	bg_event  7,  0, BGEVENT_READ, RadioTower4FProductionSign
	bg_event 15,  0, BGEVENT_READ, RadioTower4FStudio2Sign

	db 7 ; object events
	object_event  6,  4, SPRITE_FISHER, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, RadioTower4FFisherScript, EVENT_RADIO_TOWER_CIVILIANS_AFTER
	object_event 14,  6, SPRITE_TEACHER, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, RadioTower4FDJMaryScript, -1
	object_event 12,  7, SPRITE_GROWLITHE, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, RadioTowerMeowth, -1
	object_event  5,  6, SPRITE_ROCKET, SPRITEMOVEDATA_SPINCLOCKWISE, 0, 0, -1, -1, 0, OBJECTTYPE_TRAINER, 3, TrainerGruntM10, EVENT_RADIO_TOWER_ROCKET_TAKEOVER
	object_event 14,  1, SPRITE_ROCKET, SPRITEMOVEDATA_STANDING_LEFT, 2, 0, -1, -1, 0, OBJECTTYPE_TRAINER, 2, TrainerExecutivem2, EVENT_RADIO_TOWER_ROCKET_TAKEOVER
	object_event 12,  4, SPRITE_ROCKET_GIRL, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 1, TrainerGruntF4, EVENT_RADIO_TOWER_ROCKET_TAKEOVER
	object_event  4,  2, SPRITE_SCIENTIST, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 4, TrainerScientistRich, EVENT_RADIO_TOWER_ROCKET_TAKEOVER
