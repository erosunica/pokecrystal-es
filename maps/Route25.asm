	object_const_def ; object_event constants
	const ROUTE25_MISTY
	const ROUTE25_COOLTRAINER_M1
	const ROUTE25_YOUNGSTER1
	const ROUTE25_LASS1
	const ROUTE25_YOUNGSTER2
	const ROUTE25_LASS2
	const ROUTE25_YOUNGSTER3
	const ROUTE25_LASS3
	const ROUTE25_SUPER_NERD
	const ROUTE25_COOLTRAINER_M2
	const ROUTE25_POKE_BALL

Route25_MapScripts:
	db 2 ; scene scripts
	scene_script .DummyScene0 ; SCENE_ROUTE25_NOTHING
	scene_script .DummyScene1 ; SCENE_ROUTE25_MISTYS_DATE

	db 0 ; callbacks

.DummyScene0:
	end

.DummyScene1:
	end

Route25MistyDate1Script:
	showemote EMOTE_HEART, ROUTE25_MISTY, 15
	pause 30
	showemote EMOTE_SHOCK, ROUTE25_COOLTRAINER_M1, 10
	turnobject ROUTE25_MISTY, DOWN
	applymovement ROUTE25_COOLTRAINER_M1, MovementData_0x19efe8
	disappear ROUTE25_COOLTRAINER_M1
	pause 15
	playmusic MUSIC_BEAUTY_ENCOUNTER
	turnobject ROUTE25_MISTY, UP
	pause 10
	applymovement ROUTE25_MISTY, MovementData_0x19efed
	opentext
	writetext Route25MistyDateText
	waitbutton
	closetext
	turnobject PLAYER, DOWN
	applymovement ROUTE25_MISTY, MovementData_0x19effa
	turnobject PLAYER, LEFT
	applymovement ROUTE25_MISTY, MovementData_0x19f000
	disappear ROUTE25_MISTY
	clearevent EVENT_TRAINERS_IN_CERULEAN_GYM
	setscene SCENE_ROUTE25_NOTHING
	special RestartMapMusic
	end

Route25MistyDate2Script:
	showemote EMOTE_HEART, ROUTE25_MISTY, 15
	pause 30
	showemote EMOTE_SHOCK, ROUTE25_COOLTRAINER_M1, 10
	turnobject ROUTE25_MISTY, DOWN
	applymovement ROUTE25_COOLTRAINER_M1, MovementData_0x19efea
	disappear ROUTE25_COOLTRAINER_M1
	pause 15
	playmusic MUSIC_BEAUTY_ENCOUNTER
	turnobject ROUTE25_MISTY, UP
	pause 10
	applymovement ROUTE25_MISTY, MovementData_0x19eff4
	opentext
	writetext Route25MistyDateText
	waitbutton
	closetext
	turnobject PLAYER, UP
	applymovement ROUTE25_MISTY, MovementData_0x19effd
	turnobject PLAYER, LEFT
	applymovement ROUTE25_MISTY, MovementData_0x19f000
	disappear ROUTE25_MISTY
	clearevent EVENT_TRAINERS_IN_CERULEAN_GYM
	setscene SCENE_ROUTE25_NOTHING
	special RestartMapMusic
	end

TrainerSchoolboyDudley:
	trainer SCHOOLBOY, DUDLEY, EVENT_BEAT_SCHOOLBOY_DUDLEY, SchoolboyDudleySeenText, SchoolboyDudleyBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext SchoolboyDudleyAfterBattleText
	waitbutton
	closetext
	end

TrainerLassEllen:
	trainer LASS, ELLEN, EVENT_BEAT_LASS_ELLEN, LassEllenSeenText, LassEllenBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext LassEllenAfterBattleText
	waitbutton
	closetext
	end

TrainerSchoolboyJoe:
	trainer SCHOOLBOY, JOE, EVENT_BEAT_SCHOOLBOY_JOE, SchoolboyJoeSeenText, SchoolboyJoeBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext SchoolboyJoeAfterBattleText
	waitbutton
	closetext
	end

TrainerLassLaura:
	trainer LASS, LAURA, EVENT_BEAT_LASS_LAURA, LassLauraSeenText, LassLauraBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext LassLauraAfterBattleText
	waitbutton
	closetext
	end

TrainerCamperLloyd:
	trainer CAMPER, LLOYD, EVENT_BEAT_CAMPER_LLOYD, CamperLloydSeenText, CamperLloydBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext CamperLloydAfterBattleText
	waitbutton
	closetext
	end

TrainerLassShannon:
	trainer LASS, SHANNON, EVENT_BEAT_LASS_SHANNON, LassShannonSeenText, LassShannonBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext LassShannonAfterBattleText
	waitbutton
	closetext
	end

TrainerSupernerdPat:
	trainer SUPER_NERD, PAT, EVENT_BEAT_SUPER_NERD_PAT, SupernerdPatSeenText, SupernerdPatBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext SupernerdPatAfterBattleText
	waitbutton
	closetext
	end

TrainerCooltrainermKevin:
	faceplayer
	opentext
	checkevent EVENT_BEAT_COOLTRAINERM_KEVIN
	iftrue .AfterBattle
	checkevent EVENT_CLEARED_NUGGET_BRIDGE
	iftrue .AfterNuggetBridge
	writetext CooltrainermKevinNuggetText
	promptbutton
	verbosegiveitem NUGGET
	iffalse .NoRoomForNugget
	setevent EVENT_CLEARED_NUGGET_BRIDGE
.AfterNuggetBridge:
	writetext CooltrainermKevinSeenText
	waitbutton
	closetext
	winlosstext CooltrainermKevinBeatenText, 0
	loadtrainer COOLTRAINERM, KEVIN
	startbattle
	reloadmapafterbattle
	setevent EVENT_BEAT_COOLTRAINERM_KEVIN
	opentext
.AfterBattle:
	writetext CooltrainermKevinAfterBattleText
	waitbutton
.NoRoomForNugget:
	closetext
	end

BillsHouseSign:
	jumptext BillsHouseSignText

Route25Protein:
	itemball PROTEIN

Route25HiddenPotion:
	hiddenitem POTION, EVENT_ROUTE_25_HIDDEN_POTION

MovementData_0x19efe8:
	big_step DOWN
	step_end

MovementData_0x19efea:
	big_step DOWN
	big_step DOWN
	step_end

MovementData_0x19efed:
	step UP
	step UP
	step UP
	step LEFT
	step LEFT
	step LEFT
	step_end

MovementData_0x19eff4:
	step UP
	step UP
	step LEFT
	step LEFT
	step LEFT
	step_end

MovementData_0x19effa:
	step DOWN
	step LEFT
	step_end

MovementData_0x19effd:
	step UP
	step LEFT
	step_end

MovementData_0x19f000:
	step LEFT
	step LEFT
	step LEFT
	step LEFT
	step LEFT
	step_end

Route25MistyDateText:
	text "MISTY: ¡Auuu!"
	line "¿Por qué has"

	para "tenido que venir a"
	line "molestarnos?"

	para "¿Sabes cómo te"
	line "llama la gente?"

	para "¡Pelma! ¿Me oyes"
	line "bien, pelma?"

	para "…"

	para "¿Eh…?"
	line "Esas MEDALLAS…"

	para "¿Son MEDALLAS de"
	line "GIMNASIO de JOHTO?"

	para "Si tienes ocho, no"
	line "eres moco de pavo."

	para "Entonces, vale."
	line "Ven al GIMNASIO de"
	cont "CELESTE."

	para "Soy MISTY, la"
	line "LÍDER de GIMNASIO"
	cont "de CIUDAD CELESTE."
	done

SchoolboyDudleySeenText:
	text "¡Véncenos a los"
	line "seis para ganar"

	para "un fantástico"
	line "premio!"

	para "¿Lo conseguirás?"
	done

SchoolboyDudleyBeatenText:
	text "¡Uau! Muy bien."
	done

SchoolboyDudleyAfterBattleText:
	text "Hice lo que pude."
	line "No me arrepiento."
	done

LassEllenSeenText:
	text "Ahora me toca a"
	line "mí. ¡En guardia!"
	done

LassEllenBeatenText:
	text "¿Cómo he podido"
	line "perder?"
	done

LassEllenAfterBattleText:
	text "Hice lo que pude."
	line "No me arrepiento."
	done

SchoolboyJoeSeenText:
	text "¡Soy el tercero!"
	line "Y no será fácil."
	done

SchoolboyJoeBeatenText:
	text "¡Au! ¡Se acabó!"
	done

SchoolboyJoeAfterBattleText:
	text "Hice lo que pude."
	line "No me arrepiento."
	done

LassLauraSeenText:
	text "¡Yo soy la cuarta!"
	line "¿No puedes más?"
	done

LassLauraBeatenText:
	text "He perdido…"
	done

LassLauraAfterBattleText:
	text "Hice lo que pude."
	line "No me arrepiento."
	done

CamperLloydSeenText:
	text "Yo soy el quinto."
	line "¡Te machacaré!"
	done

CamperLloydBeatenText:
	text "¡Uau! Demasiado."
	done

CamperLloydAfterBattleText:
	text "Hice lo que pude."
	line "No me arrepiento."
	done

LassShannonSeenText:
	text "Y por último yo,"
	line "pero te lo aviso,"
	cont "¡soy la mejor!"
	done

LassShannonBeatenText:
	text "¿Estás bromeando?"
	done

LassShannonAfterBattleText:
	text "Hice lo que pude."
	line "No me arrepiento."
	done

SupernerdPatSeenText:
	text "¡Mufufufu…!"

	para "No tengo nada que"
	line "ver con los otros"
	cont "seis entrenadores."

	para "Pero he esperado a"
	line "que estés débil"

	para "de tanto pelear"
	line "para vencerte."
	done

SupernerdPatBeatenText:
	text "¿No sientes"
	line "cansancio?"
	done

SupernerdPatAfterBattleText:
	text "Lo siento… No"
	line "haré más trampas."
	done

CooltrainermKevinNuggetText:
	text "Tuviste que luchar"
	line "una vez más, pero"
	cont "ganaste."

	para "Como te prometí,"
	line "el premio es tuyo."
	done

CooltrainermKevinSeenText:
	text "Pero después de"
	line "verte luchar, me"

	para "gustaría saber"
	line "cómo me iría a mí."

	para "Déjame luchar"
	line "contra ti."
	done

CooltrainermKevinBeatenText:
	text "¡Nunca había visto"
	line "nada igual!"
	done

CooltrainermKevinAfterBattleText:
	text "¡Ha sido"
	line "fantástico!"

	para "Tus #MON y tú"
	line "sois realmente"
	cont "buenos."
	done

BillsHouseSignText:
	text "CASA DEL MAR"
	line "CASA DE BILL"
	done

; unused
	text "CASA DE BILL"
	done

Route25_MapEvents:
	db 0, 0 ; filler

	db 1 ; warp events
	warp_event 47,  5, BILLS_HOUSE, 1

	db 2 ; coord events
	coord_event 42,  6, SCENE_ROUTE25_MISTYS_DATE, Route25MistyDate1Script
	coord_event 42,  7, SCENE_ROUTE25_MISTYS_DATE, Route25MistyDate2Script

	db 2 ; bg events
	bg_event 45,  5, BGEVENT_READ, BillsHouseSign
	bg_event  4,  5, BGEVENT_ITEM, Route25HiddenPotion

	db 11 ; object events
	object_event 46,  9, SPRITE_MISTY, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, ObjectEvent, EVENT_ROUTE_25_MISTY_BOYFRIEND
	object_event 46, 10, SPRITE_COOLTRAINER_M, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, ObjectEvent, EVENT_ROUTE_25_MISTY_BOYFRIEND
	object_event 12,  8, SPRITE_YOUNGSTER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 3, TrainerSchoolboyDudley, -1
	object_event 16, 11, SPRITE_LASS, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 3, TrainerLassEllen, -1
	object_event 21,  8, SPRITE_YOUNGSTER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 1, TrainerSchoolboyJoe, -1
	object_event 22,  6, SPRITE_LASS, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 3, TrainerLassLaura, -1
	object_event 25,  4, SPRITE_YOUNGSTER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_TRAINER, 2, TrainerCamperLloyd, -1
	object_event 28, 11, SPRITE_LASS, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 1, TrainerLassShannon, -1
	object_event 31,  7, SPRITE_SUPER_NERD, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_TRAINER, 1, TrainerSupernerdPat, -1
	object_event 37,  8, SPRITE_COOLTRAINER_M, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, TrainerCooltrainermKevin, -1
	object_event 32,  4, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, Route25Protein, EVENT_ROUTE_25_PROTEIN
