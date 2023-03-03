	object_const_def ; object_event constants
	const TEAMROCKETBASEB3F_LANCE
	const TEAMROCKETBASEB3F_ROCKET1
	const TEAMROCKETBASEB3F_MOLTRES
	const TEAMROCKETBASEB3F_ROCKET_GIRL
	const TEAMROCKETBASEB3F_ROCKET2
	const TEAMROCKETBASEB3F_SCIENTIST1
	const TEAMROCKETBASEB3F_SCIENTIST2
	const TEAMROCKETBASEB3F_ROCKET3
	const TEAMROCKETBASEB3F_SILVER
	const TEAMROCKETBASEB3F_POKE_BALL1
	const TEAMROCKETBASEB3F_POKE_BALL2
	const TEAMROCKETBASEB3F_POKE_BALL3
	const TEAMROCKETBASEB3F_POKE_BALL4
	const TEAMROCKETBASEB3F_POKE_BALL5

TeamRocketBaseB3F_MapScripts:
	db 4 ; scene scripts
	scene_script .LanceGetsPassword ; SCENE_DEFAULT
	scene_script .DummyScene1 ; SCENE_TEAMROCKETBASEB3F_RIVAL_ENCOUNTER
	scene_script .DummyScene2 ; SCENE_TEAMROCKETBASEB3F_ROCKET_BOSS
	scene_script .DummyScene3 ; SCENE_TEAMROCKETBASEB3F_NOTHING

	db 1 ; callbacks
	callback MAPCALLBACK_TILES, .CheckGiovanniDoor

.LanceGetsPassword:
	prioritysjump LanceGetPasswordScript
	end

.DummyScene1:
	end

.DummyScene2:
	end

.DummyScene3:
	end

.CheckGiovanniDoor:
	checkevent EVENT_OPENED_DOOR_TO_GIOVANNIS_OFFICE
	iftrue .OpenSesame
	return

.OpenSesame:
	changeblock 10, 8, $07 ; floor
	return

LanceGetPasswordScript:
	turnobject PLAYER, LEFT
	pause 5
	turnobject TEAMROCKETBASEB3F_MOLTRES, RIGHT
	pause 20
	applymovement TEAMROCKETBASEB3F_LANCE, MovementData_0x6e12a
	opentext
	writetext LanceGetPasswordText
	waitbutton
	closetext
	applymovement TEAMROCKETBASEB3F_LANCE, MovementData_0x6e12c
	disappear TEAMROCKETBASEB3F_LANCE
	setscene SCENE_TEAMROCKETBASEB3F_RIVAL_ENCOUNTER
	end

RocketBaseRival:
	turnobject PLAYER, LEFT
	showemote EMOTE_SHOCK, PLAYER, 15
	special FadeOutMusic
	appear TEAMROCKETBASEB3F_SILVER
	applymovement TEAMROCKETBASEB3F_SILVER, RocketBaseRivalEnterMovement
	turnobject PLAYER, LEFT
	playmusic MUSIC_RIVAL_ENCOUNTER
	opentext
	writetext RocketBaseRivalText
	waitbutton
	closetext
	playsound SFX_TACKLE
	applymovement PLAYER, RocketBaseRivalShovesPlayerMovement
	applymovement TEAMROCKETBASEB3F_SILVER, RocketBaseRivalLeaveMovement
	disappear TEAMROCKETBASEB3F_SILVER
	setscene SCENE_TEAMROCKETBASEB3F_ROCKET_BOSS
	special RestartMapMusic
	end

TeamRocketBaseB3FRocketScript:
	jumptextfaceplayer TeamRocketBaseB3FRocketText

RocketBaseBossLeft:
	applymovement PLAYER, MovementData_0x6e133
	sjump RocketBaseBoss

RocketBaseBossRight:
	applymovement PLAYER, MovementData_0x6e13a
RocketBaseBoss:
	pause 30
	showemote EMOTE_SHOCK, TEAMROCKETBASEB3F_ROCKET1, 15
	playmusic MUSIC_ROCKET_ENCOUNTER
	turnobject TEAMROCKETBASEB3F_ROCKET1, DOWN
	opentext
	writetext ExecutiveM4BeforeText
	waitbutton
	closetext
	applymovement TEAMROCKETBASEB3F_ROCKET1, MovementData_0x6e142
	winlosstext ExecutiveM4BeatenText, 0
	setlasttalked TEAMROCKETBASEB3F_ROCKET1
	loadtrainer EXECUTIVEM, EXECUTIVEM_4
	startbattle
	reloadmapafterbattle
	setevent EVENT_BEAT_ROCKET_EXECUTIVEM_4
	opentext
	writetext ExecutiveM4AfterText
	waitbutton
	closetext
	applymovement TEAMROCKETBASEB3F_ROCKET1, MovementData_0x6e144
	playsound SFX_TACKLE
	applymovement TEAMROCKETBASEB3F_ROCKET1, MovementData_0x6e147
	disappear TEAMROCKETBASEB3F_ROCKET1
	setscene SCENE_TEAMROCKETBASEB3F_NOTHING
	end

RocketBaseMurkrow:
	opentext
	writetext RocketBaseMurkrowText
	waitbutton
	closetext
	setevent EVENT_LEARNED_HAIL_GIOVANNI
	end

SlowpokeTailGrunt:
	trainer GRUNTF, GRUNTF_5, EVENT_BEAT_ROCKET_GRUNTF_5, GruntF5SeenText, GruntF5BeatenText, 0, GruntF5Script

GruntF5Script:
	endifjustbattled
	opentext
	writetext GruntF5AfterBattleText
	waitbutton
	closetext
	setevent EVENT_LEARNED_SLOWPOKETAIL
	end

RaticateTailGrunt:
	trainer GRUNTM, GRUNTM_28, EVENT_BEAT_ROCKET_GRUNTM_28, GruntM28SeenText, GruntM28BeatenText, 0, GruntM28Script

GruntM28Script:
	endifjustbattled
	opentext
	writetext GruntM28AfterBattleText
	waitbutton
	closetext
	setevent EVENT_LEARNED_RATICATE_TAIL
	end

TrainerScientistRoss:
	trainer SCIENTIST, ROSS, EVENT_BEAT_SCIENTIST_ROSS, ScientistRossSeenText, ScientistRossBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext ScientistRossAfterBattleText
	waitbutton
	closetext
	end

TrainerScientistMitch:
	trainer SCIENTIST, MITCH, EVENT_BEAT_SCIENTIST_MITCH, ScientistMitchSeenText, ScientistMitchBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext ScientistMitchAfterBattleText
	waitbutton
	closetext
	end

TeamRocketBaseB3FLockedDoor:
	conditional_event EVENT_OPENED_DOOR_TO_GIOVANNIS_OFFICE, .Script

.Script:
	opentext
	checkevent EVENT_LEARNED_SLOWPOKETAIL
	iffalse .NeedsPassword
	checkevent EVENT_LEARNED_RATICATE_TAIL
	iffalse .NeedsPassword
	sjump .OpenSesame

.NeedsPassword:
	writetext TeamRocketBaseB3FLockedDoorNeedsPasswordText
	waitbutton
	closetext
	end

.OpenSesame:
	writetext TeamRocketBaseB3FLockedDoorOpenSesameText
	waitbutton
	playsound SFX_ENTER_DOOR
	changeblock 10, 8, $07 ; floor
	reloadmappart
	closetext
	setevent EVENT_OPENED_DOOR_TO_GIOVANNIS_OFFICE
	waitsfx
	end

TeamRocketBaseB3FOathScript:
	jumpstd teamrocketoath

TeamRocketBaseB3FProtein:
	itemball PROTEIN

TeamRocketBaseB3FXSpecial:
	itemball X_SPECIAL

TeamRocketBaseB3FFullHeal:
	itemball FULL_HEAL

TeamRocketBaseB3FIceHeal:
	itemball ICE_HEAL

TeamRocketBaseB3FUltraBall:
	itemball ULTRA_BALL

MovementData_0x6e12a:
	step RIGHT
	step_end

MovementData_0x6e12c:
	step DOWN
	step LEFT
	step LEFT
	step LEFT
	step LEFT
	step LEFT
	step_end

MovementData_0x6e133:
	step UP
	step UP
	step UP
	step LEFT
	step LEFT
	turn_head UP
	step_end

MovementData_0x6e13a:
	step UP
	step UP
	step LEFT
	step UP
	step LEFT
	step LEFT
	turn_head UP
	step_end

MovementData_0x6e142:
	step DOWN
	step_end

MovementData_0x6e144:
	big_step RIGHT
	big_step RIGHT
	step_end

MovementData_0x6e147:
	fix_facing
	fast_jump_step LEFT
	remove_fixed_facing
	step_sleep 8
	step_sleep 8
	slow_step RIGHT
	big_step DOWN
	big_step DOWN
	big_step DOWN
	big_step RIGHT
	big_step DOWN
	big_step DOWN
	big_step DOWN
	big_step LEFT
	big_step LEFT
	big_step LEFT
	big_step LEFT
	big_step LEFT
	big_step UP
	big_step UP
	big_step UP
	big_step UP
	big_step UP
	big_step UP
	big_step UP
	big_step UP
	big_step LEFT
	big_step LEFT
	step_end

RocketBaseRivalEnterMovement:
	step DOWN
	step DOWN
	step DOWN
	step DOWN
	step DOWN
	step RIGHT
	step RIGHT
	step RIGHT
	step_end

RocketBaseRivalLeaveMovement:
	step LEFT
	step LEFT
	step UP
	step UP
	step UP
	step UP
	step UP
	step_end

RocketBaseRivalShovesPlayerMovement:
	fix_facing
	big_step RIGHT
	remove_fixed_facing
	step_end

LanceGetPasswordText:
	text "LANCE: Se necesi-"
	line "tan 2 contraseñas"

	para "para acceder al"
	line "cuarto del jefe."

	para "Esas contraseñas"
	line "sólo las conocen"
	cont "algunos ROCKET."

	para "Ese ROCKET de ahí"
	line "me lo dijo"
	cont "amablemente."

	para "<PLAY_G>, obtén"
	line "las contraseñas."
	done

TeamRocketBaseB3FRocketText:
	text "¡Urrgg…! El"
	line "chico de la capa"
	cont "es muy fuerte…"
	done

RocketBaseRivalText:
	text "…"

	para "¿No te había dicho"
	line "que iba a destruir"
	cont "al TEAM ROCKET?"

	para "Dime, ¿quién era"
	line "el chico de la"

	para "capa que usaba los"
	line "#MON dragón?"

	para "Mis #MON no"
	line "pudieron con él."

	para "No me importa"
	line "perder. Podría"

	para "ganarle con otros"
	line "#MON."

	para "Lo que me molestó"
	line "es lo que dijo…"

	para "Me dijo que no amo"
	line "ni confío lo"

	para "bastante en mis"
	line "#MON."

	para "Me enfurece haber"
	line "perdido contra un"
	cont "memo como él."

	para "¡Humph! ¡No tengo"
	line "tiempo para"
	cont "gente como tú!"
	done

ExecutiveM4BeforeText:
	text "¿Qué? ¿Quién eres?"
	line "Ésta es la oficina"

	para "de nuestro líder,"
	line "GIOVANNI."

	para "Lleva entrenándose"
	line "desde que el TEAM"

	para "ROCKET se separó"
	line "hace tres años."

	para "Pero seguro que"
	line "volverá algún día"

	para "para retomar el"
	line "mando."

	para "Por eso estamos"
	line "aquí de guardia."

	para "¡No permitiré que"
	line "nadie perturbe"
	cont "este lugar!"
	done

ExecutiveM4BeatenText:
	text "Yo… no pude"
	line "evitarlo…"

	para "GIOVANNI,"
	line "perdóname…"
	done

ExecutiveM4AfterText:
	text "No puedo dejar que"
	line "me afecte."

	para "Tengo que informar"
	line "a los otros…"
	done

RocketBaseMurkrowText:
	text "MURKROW: La"
	line "contraseña es…"

	para "VIVA GIOVANNI."
	done

GruntF5SeenText:
	text "¿Conozco yo la"
	line "contraseña?"

	para "A lo mejor."

	para "¡Pero nadie débil"
	line "la sabrá!"
	done

GruntF5BeatenText:
	text "Muy bien. Espera."
	line "Te la diré."
	done

GruntF5AfterBattleText:
	text "La contraseña de"
	line "la oficina del"
	cont "jefe es…"

	para "COLASLOWPOKE."

	para "Pero no te servirá"
	line "de nada si no"
	cont "tienes las dos."
	done

GruntM28SeenText:
	text "¡Je, je, je!"

	para "¿Me desafías a"
	line "un combate? ¡Bah!"

	para "¡Es una locura,"
	line "pero tienes"
	cont "agallas!"

	para "¡Eso me gusta!"

	para "¡Si me vences, te"
	line "diré la contraseña"

	para "de la oficina del"
	line "jefe!"
	done

GruntM28BeatenText:
	text "¡Ji, ji, ji!"
	line "¡Se te da bien!"
	done

GruntM28AfterBattleText:
	text "¡Ji, ji, ji!"

	para "La contraseña"
	line "de la oficina del"
	cont "jefe es…"

	para "¡Eh…! Creo que"
	line "es COLARATICATE."
	done

ScientistRossSeenText:
	text "Trabajaba para"
	line "SILPH, pero ahora"

	para "investigo para el"
	line "TEAM ROCKET."

	para "Ya está bien de"
	line "tantas preguntas,"
	cont "se acabó."
	done

ScientistRossBeatenText:
	text "Un error táctico"
	line "acabó conmigo…"
	done

ScientistRossAfterBattleText:
	text "Una señal de radio"
	line "que vuelve locos a"
	cont "los #MON…"

	para "Mi experimento es"
	line "todo un éxito."

	para "Mi ascenso está"
	line "asegurado. Esta"

	para "derrota no"
	line "significa nada."
	done

ScientistMitchSeenText:
	text "Me da igual que"
	line "los #MON sufran"

	para "debido a nuestros"
	line "experimentos."
	done

ScientistMitchBeatenText:
	text "Mi fuerte es"
	line "pensar, no pelear."
	done

ScientistMitchAfterBattleText:
	text "Si enviáramos"
	line "nuestra señal de"

	para "radio por todo el"
	line "país…"

	para "¡Me emociono sólo"
	line "de pensarlo!"
	done

TeamRocketBaseB3FLockedDoorNeedsPasswordText:
	text "La puerta está"
	line "cerrada…"

	para "Necesitas dos"
	line "contraseñas."
	done

TeamRocketBaseB3FLockedDoorOpenSesameText:
	text "La puerta está"
	line "cerrada…"

	para "<PLAYER> introdujo"
	line "dos contraseñas."

	para "¡Puerta abierta!"
	done

TeamRocketBaseB3F_MapEvents:
	db 0, 0 ; filler

	db 4 ; warp events
	warp_event  3,  2, TEAM_ROCKET_BASE_B2F, 2
	warp_event 27,  2, TEAM_ROCKET_BASE_B2F, 3
	warp_event  3,  6, TEAM_ROCKET_BASE_B2F, 4
	warp_event 27, 14, TEAM_ROCKET_BASE_B2F, 5

	db 3 ; coord events
	coord_event 10,  8, SCENE_TEAMROCKETBASEB3F_ROCKET_BOSS, RocketBaseBossLeft
	coord_event 11,  8, SCENE_TEAMROCKETBASEB3F_ROCKET_BOSS, RocketBaseBossRight
	coord_event  8, 10, SCENE_TEAMROCKETBASEB3F_RIVAL_ENCOUNTER, RocketBaseRival

	db 10 ; bg events
	bg_event 10,  9, BGEVENT_IFNOTSET, TeamRocketBaseB3FLockedDoor
	bg_event 11,  9, BGEVENT_IFNOTSET, TeamRocketBaseB3FLockedDoor
	bg_event 10,  1, BGEVENT_READ, TeamRocketBaseB3FOathScript
	bg_event 11,  1, BGEVENT_READ, TeamRocketBaseB3FOathScript
	bg_event 12,  1, BGEVENT_READ, TeamRocketBaseB3FOathScript
	bg_event 13,  1, BGEVENT_READ, TeamRocketBaseB3FOathScript
	bg_event  4, 13, BGEVENT_READ, TeamRocketBaseB3FOathScript
	bg_event  5, 13, BGEVENT_READ, TeamRocketBaseB3FOathScript
	bg_event  6, 13, BGEVENT_READ, TeamRocketBaseB3FOathScript
	bg_event  7, 13, BGEVENT_READ, TeamRocketBaseB3FOathScript

	db 14 ; object events
	object_event 25, 14, SPRITE_LANCE, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, LanceGetPasswordScript, EVENT_TEAM_ROCKET_BASE_B3F_LANCE_PASSWORDS
	object_event  8,  3, SPRITE_ROCKET, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, ObjectEvent, EVENT_TEAM_ROCKET_BASE_B3F_EXECUTIVE
	object_event  7,  2, SPRITE_MOLTRES, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, RocketBaseMurkrow, EVENT_TEAM_ROCKET_BASE_POPULATION
	object_event 21,  7, SPRITE_ROCKET_GIRL, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 0, SlowpokeTailGrunt, EVENT_TEAM_ROCKET_BASE_POPULATION
	object_event  5, 14, SPRITE_ROCKET, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, 0, OBJECTTYPE_TRAINER, 3, RaticateTailGrunt, EVENT_TEAM_ROCKET_BASE_POPULATION
	object_event 23, 11, SPRITE_SCIENTIST, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 0, TrainerScientistRoss, EVENT_TEAM_ROCKET_BASE_POPULATION
	object_event 11, 15, SPRITE_SCIENTIST, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 3, TrainerScientistMitch, EVENT_TEAM_ROCKET_BASE_POPULATION
	object_event 24, 14, SPRITE_ROCKET, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, TeamRocketBaseB3FRocketScript, EVENT_TEAM_ROCKET_BASE_POPULATION
	object_event  4,  5, SPRITE_SILVER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, ObjectEvent, EVENT_RIVAL_TEAM_ROCKET_BASE
	object_event  1, 12, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, TeamRocketBaseB3FProtein, EVENT_TEAM_ROCKET_BASE_B3F_PROTEIN
	object_event  3, 12, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, TeamRocketBaseB3FXSpecial, EVENT_TEAM_ROCKET_BASE_B3F_X_SPECIAL
	object_event 28,  9, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, TeamRocketBaseB3FFullHeal, EVENT_TEAM_ROCKET_BASE_B3F_FULL_HEAL
	object_event 17,  2, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, TeamRocketBaseB3FIceHeal, EVENT_TEAM_ROCKET_BASE_B3F_ICE_HEAL
	object_event 14, 10, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, TeamRocketBaseB3FUltraBall, EVENT_TEAM_ROCKET_BASE_B3F_ULTRA_BALL
