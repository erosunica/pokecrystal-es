	object_const_def ; object_event constants
	const GOLDENRODUNDERGROUNDWAREHOUSE_ROCKET1
	const GOLDENRODUNDERGROUNDWAREHOUSE_ROCKET2
	const GOLDENRODUNDERGROUNDWAREHOUSE_ROCKET3
	const GOLDENRODUNDERGROUNDWAREHOUSE_GENTLEMAN
	const GOLDENRODUNDERGROUNDWAREHOUSE_POKE_BALL1
	const GOLDENRODUNDERGROUNDWAREHOUSE_POKE_BALL2
	const GOLDENRODUNDERGROUNDWAREHOUSE_POKE_BALL3

GoldenrodUndergroundWarehouse_MapScripts:
	db 0 ; scene scripts

	db 1 ; callbacks
	callback MAPCALLBACK_NEWMAP, .ResetSwitches

.ResetSwitches:
	clearevent EVENT_SWITCH_1
	clearevent EVENT_SWITCH_2
	clearevent EVENT_SWITCH_3
	clearevent EVENT_EMERGENCY_SWITCH
	clearevent EVENT_SWITCH_4
	clearevent EVENT_SWITCH_5
	clearevent EVENT_SWITCH_6
	clearevent EVENT_SWITCH_7
	clearevent EVENT_SWITCH_8
	clearevent EVENT_SWITCH_9
	clearevent EVENT_SWITCH_10
	clearevent EVENT_SWITCH_11
	clearevent EVENT_SWITCH_12
	clearevent EVENT_SWITCH_13
	clearevent EVENT_SWITCH_14
	setval 0
	writemem wUndergroundSwitchPositions
	return

TrainerGruntM24:
	trainer GRUNTM, GRUNTM_24, EVENT_BEAT_ROCKET_GRUNTM_24, GruntM24SeenText, GruntM24BeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext GruntM24AfterBattleText
	waitbutton
	closetext
	end

TrainerGruntM14:
	trainer GRUNTM, GRUNTM_14, EVENT_BEAT_ROCKET_GRUNTM_14, GruntM14SeenText, GruntM14BeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext GruntM14AfterBattleText
	waitbutton
	closetext
	end

TrainerGruntM15:
	trainer GRUNTM, GRUNTM_15, EVENT_BEAT_ROCKET_GRUNTM_15, GruntM15SeenText, GruntM15BeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext GruntM15AfterBattleText
	waitbutton
	closetext
	end

GoldenrodUndergroundWarehouseDirectorScript:
	faceplayer
	opentext
	checkevent EVENT_RECEIVED_CARD_KEY
	iftrue .GotCardKey
	writetext DirectorIntroText
	promptbutton
	verbosegiveitem CARD_KEY
	setevent EVENT_RECEIVED_CARD_KEY
	setevent EVENT_GOLDENROD_DEPT_STORE_B1F_LAYOUT_1
	clearevent EVENT_GOLDENROD_DEPT_STORE_B1F_LAYOUT_2
	clearevent EVENT_GOLDENROD_DEPT_STORE_B1F_LAYOUT_3
	writetext DirectorCardKeyText
	promptbutton
.GotCardKey:
	writetext DirectorAfterText
	waitbutton
	closetext
	end

GoldenrodUndergroundWarehouseMaxEther:
	itemball MAX_ETHER

GoldenrodUndergroundWarehouseTMSleepTalk:
	itemball TM_SLEEP_TALK

GoldenrodUndergroundWarehouseUltraBall:
	itemball ULTRA_BALL

GruntM24SeenText:
	text "¿Cómo has llegado"
	line "hasta aquí?"

	para "Supongo que no"
	line "pudieron evitarlo."
	cont "¡Acabaré contigo!"
	done

GruntM24BeatenText:
	text "Acabó conmigo…"
	done

GruntM24AfterBattleText:
	text "El TEAM ROCKET"
	line "seguirá esperando"

	para "el regreso de"
	line "GIOVANNI."

	para "Haremos lo que"
	line "sea necesario."
	done

GruntM14SeenText:
	text "¡No vas a ir más"
	line "lejos!"

	para "¡Soy implacable"
	line "con mis enemigos"

	para "y con cualquier"
	line "joven!"
	done

GruntM14BeatenText:
	text "¡Maldición!"
	done

GruntM14AfterBattleText:
	text "He perdido…"

	para "¡Perdóname,"
	line "GIOVANNI!"
	done

GruntM15SeenText:
	text "¡Ji, ji, ji!"
	line "¡Te recuerdo!"

	para "¡Me diste bien en"
	line "la guarida!"
	done

GruntM15BeatenText:
	text "¡Ji, ji, ji!"
	line "¿Así funcionas?"
	done

GruntM15AfterBattleText:
	text "¡Ji, ji, ji!"
	line "¡Vaya combate!"
	cont "¡No te olvidaré!"
	done

DirectorIntroText:
	text "DIRECTOR: ¿Quién?"
	line "¿Qué? ¿Has venido"
	cont "a rescatarme?"

	para "¡Gracias!"

	para "La TORRE RADIO."

	para "¿Qué está pasando"
	line "ahí dentro?"

	para "¿Invadida por el"
	line "TEAM ROCKET?"

	para "Mira. Toma esta"
	line "LLAVE MAGNÉTICA."
	done

DirectorCardKeyText:
	text "DIRECTOR: Úsala"
	line "para abrir las"
	cont "puertas de la P2."
	done

DirectorAfterText:
	text "Te ruego que me"
	line "ayudes."

	para "¡Quién sabe lo que"
	line "harían si se"

	para "apoderaran de la"
	line "emisora!"

	para "¡Podrían hasta"
	line "controlar a los"

	para "#MON usando una"
	line "señal especial!"

	para "Sólo tú puedes"
	line "ayudarme."

	para "Salva la TORRE"
	line "RADIO…"

	para "¡Y a todos los"
	line "#MON del mundo!"
	done

GoldenrodUndergroundWarehouse_MapEvents:
	db 0, 0 ; filler

	db 3 ; warp events
	warp_event  2, 12, GOLDENROD_UNDERGROUND_SWITCH_ROOM_ENTRANCES, 2
	warp_event  3, 12, GOLDENROD_UNDERGROUND_SWITCH_ROOM_ENTRANCES, 3
	warp_event 17,  2, GOLDENROD_DEPT_STORE_B1F, 1

	db 0 ; coord events

	db 0 ; bg events

	db 7 ; object events
	object_event  9,  8, SPRITE_ROCKET, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, 0, OBJECTTYPE_TRAINER, 3, TrainerGruntM24, EVENT_RADIO_TOWER_ROCKET_TAKEOVER
	object_event  8, 15, SPRITE_ROCKET, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, 0, OBJECTTYPE_TRAINER, 3, TrainerGruntM14, EVENT_RADIO_TOWER_ROCKET_TAKEOVER
	object_event 14,  3, SPRITE_ROCKET, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, 0, OBJECTTYPE_TRAINER, 4, TrainerGruntM15, EVENT_RADIO_TOWER_ROCKET_TAKEOVER
	object_event 12,  8, SPRITE_GENTLEMAN, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, GoldenrodUndergroundWarehouseDirectorScript, EVENT_RADIO_TOWER_ROCKET_TAKEOVER
	object_event 18, 15, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, GoldenrodUndergroundWarehouseMaxEther, EVENT_GOLDENROD_UNDERGROUND_WAREHOUSE_MAX_ETHER
	object_event 13,  9, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, GoldenrodUndergroundWarehouseTMSleepTalk, EVENT_GOLDENROD_UNDERGROUND_WAREHOUSE_TM_SLEEP_TALK
	object_event  2,  1, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, GoldenrodUndergroundWarehouseUltraBall, EVENT_GOLDENROD_UNDERGROUND_WAREHOUSE_ULTRA_BALL
