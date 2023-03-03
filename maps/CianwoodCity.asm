	object_const_def ; object_event constants
	const CIANWOODCITY_STANDING_YOUNGSTER
	const CIANWOODCITY_POKEFAN_M
	const CIANWOODCITY_LASS
	const CIANWOODCITY_ROCK1
	const CIANWOODCITY_ROCK2
	const CIANWOODCITY_ROCK3
	const CIANWOODCITY_ROCK4
	const CIANWOODCITY_ROCK5
	const CIANWOODCITY_ROCK6
	const CIANWOODCITY_POKEFAN_F
	const CIANWOODCITY_EUSINE
	const CIANWOODCITY_SUICUNE

CianwoodCity_MapScripts:
	db 2 ; scene scripts
	scene_script .DummyScene0 ; SCENE_CIANWOODCITY_NOTHING
	scene_script .DummyScene1 ; SCENE_CIANWOODCITY_SUICUNE_AND_EUSINE

	db 1 ; callbacks
	callback MAPCALLBACK_NEWMAP, .FlyPointAndSuicune

.DummyScene0:
	end

.DummyScene1:
	end

.FlyPointAndSuicune:
	setflag ENGINE_FLYPOINT_CIANWOOD
	setevent EVENT_EUSINE_IN_BURNED_TOWER
	checkevent EVENT_FOUGHT_EUSINE
	iffalse .Done
	disappear CIANWOODCITY_EUSINE
.Done:
	return

CianwoodCitySuicuneAndEusine:
	turnobject PLAYER, UP
	showemote EMOTE_SHOCK, PLAYER, 15
	pause 15
	playsound SFX_WARP_FROM
	applymovement CIANWOODCITY_SUICUNE, CianwoodCitySuicuneApproachMovement
	turnobject PLAYER, DOWN
	pause 15
	playsound SFX_WARP_FROM
	applymovement CIANWOODCITY_SUICUNE, CianwoodCitySuicuneDepartMovement
	disappear CIANWOODCITY_SUICUNE
	pause 10
	setscene SCENE_CIANWOODCITY_NOTHING
	clearevent EVENT_SAW_SUICUNE_ON_ROUTE_42
	setmapscene ROUTE_42, SCENE_ROUTE42_SUICUNE
	checkevent EVENT_FOUGHT_EUSINE
	iftrue .Done
	setevent EVENT_FOUGHT_EUSINE
	playmusic MUSIC_MYSTICALMAN_ENCOUNTER
	appear CIANWOODCITY_EUSINE
	applymovement CIANWOODCITY_EUSINE, CianwoodCityEusineApproachMovement
	opentext
	writetext EusineSuicuneText
	waitbutton
	closetext
	winlosstext EusineBeatenText, 0
	setlasttalked CIANWOODCITY_EUSINE
	loadtrainer MYSTICALMAN, EUSINE
	startbattle
	dontrestartmapmusic
	reloadmapafterbattle
	playmusic MUSIC_MYSTICALMAN_ENCOUNTER
	opentext
	writetext EusineAfterText
	waitbutton
	closetext
	applymovement CIANWOODCITY_EUSINE, CianwoodCityEusineDepartMovement
	disappear CIANWOODCITY_EUSINE
	pause 20
	special FadeOutMusic
	playmapmusic
	pause 10
.Done:
	end

CianwoodCityChucksWife:
	faceplayer
	opentext
	checkevent EVENT_GOT_HM02_FLY
	iftrue .GotFly
	writetext ChucksWifeEasierToFlyText
	promptbutton
	checkevent EVENT_BEAT_CHUCK
	iftrue .BeatChuck
	writetext ChucksWifeBeatChuckText
	waitbutton
	closetext
	end

.BeatChuck:
	writetext ChucksWifeGiveHMText
	promptbutton
	verbosegiveitem HM_FLY
	iffalse .Done
	setevent EVENT_GOT_HM02_FLY
	writetext ChucksWifeFlySpeechText
	promptbutton
.GotFly:
	writetext ChucksWifeChubbyText
	waitbutton
.Done:
	closetext
	end

CianwoodCityYoungster:
	jumptextfaceplayer CianwoodCityYoungsterText

CianwoodCityPokefanM:
	jumptextfaceplayer CianwoodCityPokefanMText

CianwoodCityLass:
	jumptextfaceplayer CianwoodCityLassText

CianwoodCityUnusedScript:
; unreferenced
	jumptextfaceplayer CianwoodCityUnusedText

CianwoodCitySign:
	jumptext CianwoodCitySignText

CianwoodGymSign:
	jumptext CianwoodGymSignText

CianwoodPharmacySign:
	jumptext CianwoodPharmacySignText

CianwoodPhotoStudioSign:
	jumptext CianwoodPhotoStudioSignText

CianwoodPokeSeerSign:
	jumptext CianwoodPokeSeerSignText

CianwoodPokecenterSign:
	jumpstd pokecentersign

CianwoodCityRock:
	jumpstd smashrock

CianwoodCityHiddenRevive:
	hiddenitem REVIVE, EVENT_CIANWOOD_CITY_HIDDEN_REVIVE

CianwoodCityHiddenMaxEther:
	hiddenitem MAX_ETHER, EVENT_CIANWOOD_CITY_HIDDEN_MAX_ETHER

CianwoodCitySuicuneApproachMovement:
	set_sliding
	fast_jump_step DOWN
	fast_jump_step DOWN
	fast_jump_step RIGHT
	remove_sliding
	step_end

CianwoodCitySuicuneDepartMovement:
	set_sliding
	fast_jump_step RIGHT
	fast_jump_step UP
	fast_jump_step RIGHT
	fast_jump_step RIGHT
	remove_sliding
	step_end

CianwoodCityEusineApproachMovement:
	step UP
	step UP
	step UP
	step UP
	step_end

CianwoodCityEusineDepartMovement:
	step DOWN
	step DOWN
	step DOWN
	step DOWN
	step_end

ChucksWifeEasierToFlyText:
	text "¿Has cruzado el"
	line "mar para llegar"

	para "hasta aquí? ¡Habrá"
	line "sido duro!"

	para "Todo sería mucho"
	line "más fácil si tus"

	para "#MON supieran"
	line "VUELO…"
	done

ChucksWifeBeatChuckText:
	text "Pero no puedes"
	line "usar VUELO sin la"

	para "MEDALLA de esta"
	line "ciudad."

	para "Si vences al LÍDER"
	line "de este GIMNASIO,"
	cont "ven a verme."

	para "Te daré un bonito"
	line "regalo."
	done

ChucksWifeGiveHMText:
	text "¡Es la MEDALLA de"
	line "CIUDAD ORQUÍDEA!"

	para "¡Toma esta MO!"
	done

ChucksWifeFlySpeechText:
	text "Enseña VUELO a tus"
	line "#MON."

	para "En un instante"
	line "podrás VOLAR a"

	para "cualquier lugar al"
	line "que ya hayas ido."
	done

ChucksWifeChubbyText:
	text "Mi marido perdió"
	line "contra ti. Debería"
	cont "entrenarse más."

	para "Menos mal, porque"
	line "ya estaba"
	cont "engordando."
	done

CianwoodCityYoungsterText:
	text "Si usas VUELO,"
	line "podrás volver a"

	para "CIUDAD OLIVO"
	line "enseguida."
	done

CianwoodCityPokefanMText:
	text "Las piedras del"
	line "norte del pueblo"
	cont "se pueden romper."

	para "Quizá escondan"
	line "algo."

	para "Tus #MON pueden"
	line "usar el GOLPE ROCA"
	cont "para romperlas."
	done

CianwoodCityLassText:
	text "ANÍBAL, el LÍDER"
	line "del GIMNASIO,"

	para "pelea con sus"
	line "#MON de lucha."
	done

CianwoodCityUnusedText:
; unused
	text "De aquí a CIUDAD"
	line "OLIVO hay varias"
	cont "islas."

	para "Dicen que ahí"
	line "vive una criatura"
	cont "mítica marina."
	done

EusineSuicuneText:
	text "EUSINE: Hola,"
	line "<PLAYER>."

	para "¿No se trataba"
	line "de SUICUNE?"

	para "Sólo pude fijarme"
	line "un poco, pero creí"

	para "haber visto a un"
	line "SUICUNE corriendo"
	cont "sobre las olas."

	para "SUICUNE es bello"
	line "y grandioso."

	para "Corre por los"
	line "pueblos y caminos"

	para "a unas velocidades"
	line "increíbles."

	para "Es maravilloso…"

	para "Quiero ver un"
	line "SUICUNE de cerca…"

	para "Estoy decidido."

	para "¡Lucharé contra ti"
	line "para ganarme el"

	para "respeto de"
	line "SUICUNE!"

	para "Venga, <PLAYER>."
	line "¡Luchemos!"
	done

EusineBeatenText:
	text "Odio admitirlo,"
	line "pero ganaste."
	done

EusineAfterText:
	text "¡Eres increíble,"
	line "<PLAYER>!"

	para "¡Ahora entiendo"
	line "por qué los"

	para "#MON te quieren"
	line "tanto!"

	para "Ya lo cojo."

	para "Voy a seguir"
	line "buscando a"
	cont "SUICUNE."

	para "Estoy seguro de"
	line "que nos volveremos"
	cont "a ver."

	para "¡Hasta la vista!"
	done

CianwoodCitySignText:
	text "CIUDAD ORQUÍDEA"

	para "Un puerto rodeado"
	line "de agitadas aguas"
	done

CianwoodGymSignText:
	text "LÍDER DEL GIMNASIO"
	line "#MON DE CIUDAD"
	cont "ORQUÍDEA: ANÍBAL"

	para "Sus puños hablan"
	line "por él"
	done

CianwoodPharmacySignText:
	text "500 años de"
	line "tradición"

	para "FARMACIA DE"
	line "CIUDAD ORQUÍDEA"

	para "Aceptamos pedidos"
	done

CianwoodPhotoStudioSignText:
	text "ESTUD. FOTOGRÁFICO"
	line "DE CIUDAD ORQUÍDEA"

	para "¡Hazte una foto"
	line "de recuerdo!"
	done

CianwoodPokeSeerSignText:
	text "#VIDENTE"
	line "MÁS ADELANTE"
	done

CianwoodCity_MapEvents:
	db 0, 0 ; filler

	db 7 ; warp events
	warp_event 17, 41, MANIAS_HOUSE, 1
	warp_event  8, 43, CIANWOOD_GYM, 1
	warp_event 23, 43, CIANWOOD_POKECENTER_1F, 1
	warp_event 15, 47, CIANWOOD_PHARMACY, 1
	warp_event  9, 31, CIANWOOD_PHOTO_STUDIO, 1
	warp_event 15, 37, CIANWOOD_LUGIA_SPEECH_HOUSE, 1
	warp_event  5, 17, POKE_SEERS_HOUSE, 1

	db 1 ; coord events
	coord_event 11, 16, SCENE_CIANWOODCITY_SUICUNE_AND_EUSINE, CianwoodCitySuicuneAndEusine

	db 8 ; bg events
	bg_event 20, 34, BGEVENT_READ, CianwoodCitySign
	bg_event  7, 45, BGEVENT_READ, CianwoodGymSign
	bg_event 24, 43, BGEVENT_READ, CianwoodPokecenterSign
	bg_event 19, 47, BGEVENT_READ, CianwoodPharmacySign
	bg_event  8, 32, BGEVENT_READ, CianwoodPhotoStudioSign
	bg_event  8, 24, BGEVENT_READ, CianwoodPokeSeerSign
	bg_event  4, 19, BGEVENT_ITEM, CianwoodCityHiddenRevive
	bg_event  5, 29, BGEVENT_ITEM, CianwoodCityHiddenMaxEther

	db 12 ; object events
	object_event 21, 37, SPRITE_STANDING_YOUNGSTER, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, CianwoodCityYoungster, -1
	object_event 17, 33, SPRITE_POKEFAN_M, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 1, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, CianwoodCityPokefanM, -1
	object_event 14, 42, SPRITE_LASS, SPRITEMOVEDATA_WALK_UP_DOWN, 0, 2, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, CianwoodCityLass, -1
	object_event  8, 16, SPRITE_ROCK, SPRITEMOVEDATA_SMASHABLE_ROCK, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, CianwoodCityRock, -1
	object_event  9, 17, SPRITE_ROCK, SPRITEMOVEDATA_SMASHABLE_ROCK, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, CianwoodCityRock, -1
	object_event  4, 25, SPRITE_ROCK, SPRITEMOVEDATA_SMASHABLE_ROCK, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, CianwoodCityRock, -1
	object_event  5, 29, SPRITE_ROCK, SPRITEMOVEDATA_SMASHABLE_ROCK, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, CianwoodCityRock, -1
	object_event 10, 27, SPRITE_ROCK, SPRITEMOVEDATA_SMASHABLE_ROCK, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, CianwoodCityRock, -1
	object_event  4, 19, SPRITE_ROCK, SPRITEMOVEDATA_SMASHABLE_ROCK, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, CianwoodCityRock, -1
	object_event 10, 46, SPRITE_POKEFAN_F, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 1, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, CianwoodCityChucksWife, -1
	object_event 11, 21, SPRITE_SUPER_NERD, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, ObjectEvent, EVENT_CIANWOOD_CITY_EUSINE
	object_event 10, 14, SPRITE_SUICUNE, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, ObjectEvent, EVENT_SAW_SUICUNE_AT_CIANWOOD_CITY
