	object_const_def ; object_event constants
	const RADIOTOWER5F_DIRECTOR
	const RADIOTOWER5F_ROCKET
	const RADIOTOWER5F_ROCKET_GIRL
	const RADIOTOWER5F_ROCKER
	const RADIOTOWER5F_POKE_BALL

RadioTower5F_MapScripts:
	db 3 ; scene scripts
	scene_script .DummyScene0 ; SCENE_DEFAULT
	scene_script .DummyScene1 ; SCENE_RADIOTOWER5F_ROCKET_BOSS
	scene_script .DummyScene2 ; SCENE_RADIOTOWER5F_NOTHING

	db 0 ; callbacks

.DummyScene0:
	end

.DummyScene1:
	end

.DummyScene2:
	end

FakeDirectorScript:
	turnobject RADIOTOWER5F_DIRECTOR, UP
	showemote EMOTE_SHOCK, RADIOTOWER5F_DIRECTOR, 15
	opentext
	writetext FakeDirectorTextBefore1
	waitbutton
	closetext
	applymovement RADIOTOWER5F_DIRECTOR, FakeDirectorMovement
	playmusic MUSIC_ROCKET_ENCOUNTER
	opentext
	writetext FakeDirectorTextBefore2
	waitbutton
	closetext
	winlosstext FakeDirectorWinText, 0
	setlasttalked RADIOTOWER5F_DIRECTOR
	loadtrainer EXECUTIVEM, EXECUTIVEM_3
	startbattle
	reloadmapafterbattle
	opentext
	writetext FakeDirectorTextAfter
	promptbutton
	verbosegiveitem BASEMENT_KEY
	closetext
	setscene SCENE_RADIOTOWER5F_ROCKET_BOSS
	setevent EVENT_BEAT_ROCKET_EXECUTIVEM_3
	end

Director:
	faceplayer
	opentext
	checkevent EVENT_CLEARED_RADIO_TOWER
	iftrue .TrueDirector
	writetext FakeDirectorTextAfter
	waitbutton
	closetext
	end

.TrueDirector:
	writetext RadioTower5FDirectorText
	waitbutton
	closetext
	end

TrainerExecutivef1:
	trainer EXECUTIVEF, EXECUTIVEF_1, EVENT_BEAT_ROCKET_EXECUTIVEF_1, Executivef1SeenText, Executivef1BeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext Executivef1AfterBattleText
	waitbutton
	closetext
	end

RadioTower5FRocketBossScene:
	applymovement PLAYER, RadioTower5FPlayerTwoStepsLeftMovement
	playmusic MUSIC_ROCKET_ENCOUNTER
	turnobject RADIOTOWER5F_ROCKET, RIGHT
	opentext
	writetext RadioTower5FRocketBossBeforeText
	waitbutton
	closetext
	winlosstext RadioTower5FRocketBossWinText, 0
	setlasttalked RADIOTOWER5F_ROCKET
	loadtrainer EXECUTIVEM, EXECUTIVEM_1
	startbattle
	reloadmapafterbattle
	opentext
	writetext RadioTower5FRocketBossAfterText
	waitbutton
	closetext
	special FadeBlackQuickly
	special ReloadSpritesNoPalettes
	disappear RADIOTOWER5F_ROCKET
	disappear RADIOTOWER5F_ROCKET_GIRL
	pause 15
	special FadeInQuickly
	setevent EVENT_BEAT_ROCKET_EXECUTIVEM_1
	setevent EVENT_CLEARED_RADIO_TOWER
	clearflag ENGINE_ROCKETS_IN_RADIO_TOWER
	setevent EVENT_GOLDENROD_CITY_ROCKET_SCOUT
	setevent EVENT_GOLDENROD_CITY_ROCKET_TAKEOVER
	setevent EVENT_RADIO_TOWER_ROCKET_TAKEOVER
	clearevent EVENT_MAHOGANY_MART_OWNERS
	clearflag ENGINE_ROCKETS_IN_MAHOGANY
	clearevent EVENT_GOLDENROD_CITY_CIVILIANS
	clearevent EVENT_RADIO_TOWER_CIVILIANS_AFTER
	setevent EVENT_BLACKTHORN_CITY_SUPER_NERD_BLOCKS_GYM
	clearevent EVENT_BLACKTHORN_CITY_SUPER_NERD_DOES_NOT_BLOCK_GYM
	special PlayMapMusic
	disappear RADIOTOWER5F_DIRECTOR
	moveobject RADIOTOWER5F_DIRECTOR, 12, 0
	appear RADIOTOWER5F_DIRECTOR
	applymovement RADIOTOWER5F_DIRECTOR, RadioTower5FDirectorWalksIn
	turnobject PLAYER, RIGHT
	opentext
	writetext RadioTower5FDirectorThankYouText
	promptbutton
	verbosegiveitem CLEAR_BELL
	writetext RadioTower5FDirectorDescribeClearBellText
	waitbutton
	closetext
	setscene SCENE_RADIOTOWER5F_NOTHING
	setmapscene ECRUTEAK_TIN_TOWER_ENTRANCE, SCENE_DEFAULT
	setevent EVENT_GOT_CLEAR_BELL
	setevent EVENT_TEAM_ROCKET_DISBANDED
	sjump .UselessJump

.UselessJump:
	applymovement RADIOTOWER5F_DIRECTOR, RadioTower5FDirectorWalksOut
	playsound SFX_EXIT_BUILDING
	disappear RADIOTOWER5F_DIRECTOR
	end

Ben:
	jumptextfaceplayer BenText

RadioTower5FUltraBall:
	itemball ULTRA_BALL

RadioTower5FDirectorsOfficeSign:
	jumptext RadioTower5FDirectorsOfficeSignText

RadioTower5FStudio1Sign:
	jumptext RadioTower5FStudio1SignText

RadioTower5FBookshelf:
	jumpstd magazinebookshelf

FakeDirectorMovement:
	step LEFT
	step LEFT
	step LEFT
	step UP
	step UP
	step_end

RadioTower5FDirectorWalksIn:
	step DOWN
	step DOWN
	step RIGHT
	step RIGHT
	step RIGHT
	step RIGHT
	step DOWN
	step DOWN
	step DOWN
	step LEFT
	step_end

RadioTower5FDirectorWalksOut:
	step RIGHT
	step UP
	step UP
	step UP
	step LEFT
	step LEFT
	step LEFT
	step LEFT
	step UP
	step UP
	step_end

RadioTower5FPlayerTwoStepsLeftMovement:
	step LEFT
	step LEFT
	step_end

FakeDirectorTextBefore1:
	text "¡Tú! ¿Has venido"
	line "a rescatarme?"
	done

FakeDirectorTextBefore2:
	text "¿Es eso lo que"
	line "estabas esperando?"

	para "¡Pues no!"
	line "¡Soy un impostor!"

	para "Me hice pasar por"
	line "el DIRECTOR para"

	para "preparar nuestra"
	line "invasión."

	para "¿Quieres saber"
	line "dónde escondimos"
	cont "al DIRECTOR?"

	para "Te lo diré,"
	line "¡pero sólo si eres"
	cont "capaz de vencerme!"
	done

FakeDirectorWinText:
	text "Muy bien. Te diré"
	line "dónde está."
	done

FakeDirectorTextAfter:
	text "Escondimos al"
	line "auténtico DIRECTOR"

	para "en el ALMACÉN"
	line "SUBTERRÁNEO."

	para "Está al otro"
	line "extremo del"
	cont "SUBTERRÁNEO."

	para "Pero dudo que"
	line "llegues tan lejos."
	done

Executivef1SeenText:
	text "¿Me recuerdas del"
	line "ESCONDITE de"
	cont "PUEBLO CAOBA?"

	para "Entonces perdí,"
	line "pero esta vez no"
	cont "lo haré."
	done

Executivef1BeatenText:
	text "¡Esto no me puede"
	line "estar pasando!"

	para "He luchado y"
	line "he perdido…"
	done

Executivef1AfterBattleText:
	text "<PLAYER>, ¿verdad?"

	para "Alguien como tú"
	line "no aprecia la"

	para "magnificencia del"
	line "TEAM ROCKET."

	para "Una lástima."
	line "Admiro tu fuerza."
	done

RadioTower5FRocketBossBeforeText:
	text "¿Cómo has logrado"
	line "llegar tan lejos?"

	para "Debes de entrenar"
	line "muy bien."

	para "Queremos hacernos"
	line "con esta EMISORA"

	para "de RADIO para"
	line "anunciar nuestra"
	cont "vuelta."

	para "Eso debería hacer"
	line "regresar a"

	para "GIOVANNI de su"
	line "entrenamiento."

	para "Vamos a recuperar"
	line "la gloria perdida."

	para "Y no voy a"
	line "permitir que"

	para "interfieras en"
	line "nuestros planes."
	done

RadioTower5FRocketBossWinText:
	text "¡No! ¡Perdóname,"
	line "GIOVANNI!"
	done

RadioTower5FRocketBossAfterText:
	text "¿Qué ha pasado?"

	para "Nuestros sueños"
	line "hechos añicos."

	para "Creo que no he"
	line "estado a la"
	cont "altura."

	para "Como ya hiciera"
	line "GIOVANNI, hoy yo"

	para "desarticularé el"
	line "TEAM ROCKET."

	para "¡Adiós!"
	done

RadioTower5FDirectorThankYouText:
	text "DIRECTOR:"
	line "¡<PLAY_G>,"
	cont "muchas gracias!"

	para "Tus valerosas"
	line "acciones han"

	para "salvado a los"
	line "#MON."

	para "Sé que no es"
	line "mucho, pero coge"
	cont "esto, por favor."
	done

RadioTower5FDirectorDescribeClearBellText:
	text "Antiguamente,"
	line "había una torre en"

	para "CIUDAD TRIGAL,"
	line "justo aquí."

	para "Pero estaba vieja"
	line "y se caía."

	para "Así que la"
	line "reemplazamos por"

	para "nuestra TORRE"
	line "RADIO."

	para "Encontramos esta"
	line "campana durante"
	cont "la construcción."

	para "He oído que, en"
	line "el pasado, toda"

	para "clase de #MON"
	line "vivían en CIUDAD"
	cont "TRIGAL."

	para "Quizá…"

	para "Quizá esa campana"
	line "tenga alguna"

	para "conexión con la"
	line "TORRE HOJALATA de"
	cont "CIUDAD IRIS…"

	para "¡Ah!"

	para "Eso me recuerda…"

	para "He oído cuchichear"
	line "al TEAM ROCKET."

	para "Aparentemente,"
	line "algo pasa en la"
	cont "TORRE HOJALATA."

	para "No tengo ni idea"
	line "de qué ocurrirá,"

	para "pero debieras"
	line "echar un vistazo."

	para "Vale. Será mejor"
	line "que vaya a mi"
	cont "OFICINA."
	done

RadioTower5FDirectorText:
	text "DIRECTOR: ¡Hola,"
	line "<PLAY_G>!"

	para "Ya sabes que adoro"
	line "a los #MON."

	para "Construí esta"
	line "TORRE RADIO para"

	para "mostrar mi amor"
	line "por los #MON."

	para "Me encantaría que"
	line "nuestros programas"
	cont "gustaran."
	done

BenText:
	text "NARDO: ¿Escuchas"
	line "nuestra música?"
	done

RadioTower5FDirectorsOfficeSignText:
	text "P4 OFICINA"
	line "   DEL DIRECTOR"
	done

RadioTower5FStudio1SignText:
	text "P4 ESTUDIO 1"
	done

RadioTower5F_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event  0,  0, RADIO_TOWER_4F, 1
	warp_event 12,  0, RADIO_TOWER_4F, 3

	db 2 ; coord events
	coord_event  0,  3, SCENE_DEFAULT, FakeDirectorScript
	coord_event 16,  5, SCENE_RADIOTOWER5F_ROCKET_BOSS, RadioTower5FRocketBossScene

	db 5 ; bg events
	bg_event  3,  0, BGEVENT_READ, RadioTower5FDirectorsOfficeSign
	bg_event 11,  0, BGEVENT_READ, RadioTower5FStudio1Sign
	bg_event 15,  0, BGEVENT_READ, RadioTower5FStudio1Sign
	bg_event 16,  1, BGEVENT_READ, RadioTower5FBookshelf
	bg_event 17,  1, BGEVENT_READ, RadioTower5FBookshelf

	db 5 ; object events
	object_event  3,  6, SPRITE_GENTLEMAN, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, Director, -1
	object_event 13,  5, SPRITE_ROCKET, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, ObjectEvent, EVENT_RADIO_TOWER_ROCKET_TAKEOVER
	object_event 17,  2, SPRITE_ROCKET_GIRL, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 1, TrainerExecutivef1, EVENT_RADIO_TOWER_ROCKET_TAKEOVER
	object_event 13,  5, SPRITE_ROCKER, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, Ben, EVENT_RADIO_TOWER_CIVILIANS_AFTER
	object_event  8,  5, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, RadioTower5FUltraBall, EVENT_RADIO_TOWER_5F_ULTRA_BALL
