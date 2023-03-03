	object_const_def ; object_event constants
	const SLOWPOKEWELLB1F_ROCKET1
	const SLOWPOKEWELLB1F_ROCKET2
	const SLOWPOKEWELLB1F_ROCKET3
	const SLOWPOKEWELLB1F_ROCKET_GIRL
	const SLOWPOKEWELLB1F_SLOWPOKE1
	const SLOWPOKEWELLB1F_SLOWPOKE2
	const SLOWPOKEWELLB1F_KURT
	const SLOWPOKEWELLB1F_BOULDER
	const SLOWPOKEWELLB1F_POKE_BALL

SlowpokeWellB1F_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

SlowpokeWellB1FKurtScript:
	jumptextfaceplayer SlowpokeWellB1FKurtText

TrainerGruntM29:
	trainer GRUNTM, GRUNTM_29, EVENT_BEAT_ROCKET_GRUNTM_29, GruntM29SeenText, GruntM29BeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext GruntM29AfterBattleText
	waitbutton
	closetext
	end

TrainerGruntM1:
	trainer GRUNTM, GRUNTM_1, EVENT_BEAT_ROCKET_GRUNTM_1, GruntM1SeenText, GruntM1BeatenText, 0, .Script

.Script:
	opentext
	writetext TrainerGruntM1WhenTalkText
	waitbutton
	closetext
	special FadeBlackQuickly
	special ReloadSpritesNoPalettes
	disappear SLOWPOKEWELLB1F_ROCKET1
	disappear SLOWPOKEWELLB1F_ROCKET2
	disappear SLOWPOKEWELLB1F_ROCKET3
	disappear SLOWPOKEWELLB1F_ROCKET_GIRL
	pause 15
	special FadeInQuickly
	disappear SLOWPOKEWELLB1F_KURT
	moveobject SLOWPOKEWELLB1F_KURT, 11, 6
	appear SLOWPOKEWELLB1F_KURT
	applymovement SLOWPOKEWELLB1F_KURT, KurtSlowpokeWellVictoryMovementData
	turnobject PLAYER, RIGHT
	opentext
	writetext KurtLeaveSlowpokeWellText
	waitbutton
	closetext
	setevent EVENT_CLEARED_SLOWPOKE_WELL
	variablesprite SPRITE_AZALEA_ROCKET, SPRITE_SILVER
	setmapscene AZALEA_TOWN, SCENE_AZALEATOWN_RIVAL_BATTLE
	clearevent EVENT_ILEX_FOREST_APPRENTICE
	clearevent EVENT_ILEX_FOREST_FARFETCHD
	setevent EVENT_CHARCOAL_KILN_FARFETCH_D
	setevent EVENT_CHARCOAL_KILN_APPRENTICE
	setevent EVENT_SLOWPOKE_WELL_SLOWPOKES
	setevent EVENT_SLOWPOKE_WELL_KURT
	clearevent EVENT_AZALEA_TOWN_SLOWPOKES
	clearevent EVENT_KURTS_HOUSE_SLOWPOKE
	clearevent EVENT_KURTS_HOUSE_KURT_1
	special FadeOutPalettes
	special HealParty
	pause 15
	warp KURTS_HOUSE, 3, 3
	end

TrainerGruntM2:
	trainer GRUNTM, GRUNTM_2, EVENT_BEAT_ROCKET_GRUNTM_2, GruntM2SeenText, GruntM2BeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext GruntM2AfterBattleText
	waitbutton
	closetext
	end

TrainerGruntF1:
	trainer GRUNTF, GRUNTF_1, EVENT_BEAT_ROCKET_GRUNTF_1, GruntF1SeenText, GruntF1BeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext GruntF1AfterBattleText
	waitbutton
	closetext
	end

SlowpokeWellB1FSlowpokeWithMailScript:
	faceplayer
	opentext
	cry SLOWPOKE
	writetext SlowpokeWellB1FSlowpokeWithMailText
	yesorno
	iftrue .ReadMail
	closetext
	end

.ReadMail:
	writetext SlowpokeWellB1FSlowpokeMailText
	waitbutton
	closetext
	end

SlowpokeWellB1FTaillessSlowpokeScript:
	faceplayer
	opentext
	writetext SlowpokeWellB1FTaillessSlowpokeText
	cry SLOWPOKE
	waitbutton
	closetext
	end

SlowpokeWellB1FBoulder:
	jumpstd strengthboulder

SlowpokeWellB1FSuperPotion:
	itemball SUPER_POTION

KurtSlowpokeWellVictoryMovementData:
	step LEFT
	step LEFT
	step LEFT
	step LEFT
	step UP
	step_sleep 8
	step_sleep 8
	step_sleep 8
	step LEFT
	step UP
	step UP
	step_sleep 8
	step_sleep 8
	step_sleep 8
	turn_head LEFT
	step_end

SlowpokeWellB1FKurtText:
	text "CÉSAR: ¡Hola,"
	line "<PLAYER>!"

	para "Los guardias de"
	line "arriba huyeron en"
	cont "cuanto les grité."

	para "Pero entonces me"
	line "caí por el POZO."

	para "Me golpeé en la"
	line "espalda y ahora"
	cont "no puedo moverme."

	para "Si estuviera bien,"
	line "mis #MON"

	para "los habrían"
	line "machacado…"

	para "¡Bah! Pero no"
	line "puedo hacer nada."

	para "¡<PLAYER>,"
	line "demuéstrales lo"
	cont "que vales!"
	done

KurtLeaveSlowpokeWellText:
	text "CÉSAR: ¡Muy bien,"
	line "<PLAYER>!"

	para "El TEAM ROCKET"
	line "ha huido."

	para "Ya estoy mejor"
	line "de la espalda."
	cont "¡Salgamos de aquí!"
	done

GruntM29SeenText:
	text "¡Maldición! Estaba"
	line "de guardia arriba"

	para "cuando un viejo"
	line "memo me gritó."

	para "Me asusté tanto"
	line "que me caí aquí"
	cont "abajo."

	para "¡Creo que voy a"
	line "desahogar mi ira"

	para "luchando contra"
	line "ti!"
	done

GruntM29BeatenText:
	text "¡Arrg! ¡Hoy no"
	line "es mi día!"
	done

GruntM29AfterBattleText:
	text "Sí, hemos estado"
	line "cortando las colas"

	para "de los SLOWPOKE"
	line "y vendiéndolas."

	para "Lo hacemos sólo"
	line "por dinero."

	para "¡Así es! Somos"
	line "el TEAM ROCKET,"

	para "¡y haríamos lo que"
	line "fuera por dinero!"
	done

GruntM1SeenText:
	text "¿Qué quieres?"

	para "¡Si nos molestas,"
	line "no esperes"
	cont "misericordia!"
	done

GruntM1BeatenText:
	text "Lo hiciste bien"
	line "hoy, pero… ¡espera"
	cont "a la próxima vez!"
	done

TrainerGruntM1WhenTalkText:
	text "Sí, el TEAM ROCKET"
	line "se separó hace"
	cont "tres años."

	para "Pero seguimos"
	line "clandestinamente"

	para "con nuestras"
	line "actividades."

	para "¡Diviértete ahora"
	line "con nuestras"
	cont "fechorías!"
	done

GruntM2SeenText:
	text "¿Dejar de cortar"
	line "las COLAS de los"
	cont "SLOWPOKE?"

	para "¡Obedecerte"
	line "arruinaría la"

	para "reputación del"
	line "TEAM ROCKET!"
	done

GruntM2BeatenText:
	text "Simplemente…"
	line "Muy fuerte…"
	done

GruntM2AfterBattleText:
	text "Necesitamos pasta,"
	line "¿pero vendiendo"
	cont "COLAS de SLOWPOKE?"

	para "¡Es muy duro ser"
	line "un SOLDADO ROCKET!"
	done

GruntF1SeenText:
	text "¿No más COLAS?"

	para "¡Claro! ¡Intenta"
	line "vencernos a todos!"
	done

GruntF1BeatenText:
	text "¡Maldición!"
	done

GruntF1AfterBattleText:
	text "¡Las COLAS de los"
	line "SLOWPOKE se"
	cont "regeneran rápido!"

	para "¿Qué hay de malo"
	line "en venderlas?"
	done

SlowpokeWellB1FSlowpokeWithMailText:
	text "Un SLOWPOKE sin"
	line "COLA…"

	para "¿Qué? Tiene una"
	line "CARTA. ¿La lees?"
	done

SlowpokeWellB1FSlowpokeMailText:
	text "<PLAYER> lee"
	line "la CARTA."

	para "Sé buena y cuida"
	line "de la casa donde"

	para "están el abuelo y"
	line "SLOWPOKE."

	para "Te quiere, papá."
	done

SlowpokeWellB1FTaillessSlowpokeText:
	text "Un SLOWPOKE"
	line "sin COLA…"
	done

SlowpokeWellB1F_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event 17, 15, AZALEA_TOWN, 6
	warp_event  7, 11, SLOWPOKE_WELL_B2F, 1

	db 0 ; coord events

	db 0 ; bg events

	db 9 ; object events
	object_event 15,  7, SPRITE_ROCKET, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_TRAINER, 3, TrainerGruntM29, EVENT_SLOWPOKE_WELL_ROCKETS
	object_event  5,  2, SPRITE_ROCKET, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_TRAINER, 1, TrainerGruntM1, EVENT_SLOWPOKE_WELL_ROCKETS
	object_event  5,  6, SPRITE_ROCKET, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, 0, OBJECTTYPE_TRAINER, 2, TrainerGruntM2, EVENT_SLOWPOKE_WELL_ROCKETS
	object_event 10,  4, SPRITE_ROCKET_GIRL, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 4, TrainerGruntF1, EVENT_SLOWPOKE_WELL_ROCKETS
	object_event  7,  4, SPRITE_SLOWPOKE, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, SlowpokeWellB1FSlowpokeWithMailScript, EVENT_SLOWPOKE_WELL_SLOWPOKES
	object_event  6,  2, SPRITE_SLOWPOKE, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, SlowpokeWellB1FTaillessSlowpokeScript, EVENT_SLOWPOKE_WELL_SLOWPOKES
	object_event 16, 14, SPRITE_KURT, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, SlowpokeWellB1FKurtScript, EVENT_SLOWPOKE_WELL_KURT
	object_event  3,  2, SPRITE_BOULDER, SPRITEMOVEDATA_STRENGTH_BOULDER, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, SlowpokeWellB1FBoulder, -1
	object_event 10,  3, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, SlowpokeWellB1FSuperPotion, EVENT_SLOWPOKE_WELL_B1F_SUPER_POTION
