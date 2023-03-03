	object_const_def ; object_event constants
	const VERMILIONCITY_TEACHER
	const VERMILIONCITY_GRAMPS
	const VERMILIONCITY_MACHOP
	const VERMILIONCITY_SUPER_NERD
	const VERMILIONCITY_BIG_SNORLAX
	const VERMILIONCITY_POKEFAN_M

VermilionCity_MapScripts:
	db 0 ; scene scripts

	db 1 ; callbacks
	callback MAPCALLBACK_NEWMAP, .FlyPoint

.FlyPoint:
	setflag ENGINE_FLYPOINT_VERMILION
	return

VermilionCityTeacherScript:
	jumptextfaceplayer VermilionCityTeacherText

VermilionMachopOwner:
	jumptextfaceplayer VermilionMachopOwnerText

VermilionMachop:
	opentext
	writetext VermilionMachopText1
	cry MACHOP
	waitbutton
	closetext
	earthquake 30
	opentext
	writetext VermilionMachopText2
	waitbutton
	closetext
	end

VermilionCitySuperNerdScript:
	jumptextfaceplayer VermilionCitySuperNerdText

VermilionSnorlax:
	opentext
	special SnorlaxAwake
	iftrue .Awake
	writetext VermilionCitySnorlaxSleepingText
	waitbutton
	closetext
	end

.Awake:
	writetext VermilionCityRadioNearSnorlaxText
	pause 15
	cry SNORLAX
	closetext
	loadvar VAR_BATTLETYPE, BATTLETYPE_FORCEITEM
	loadwildmon SNORLAX, 50
	startbattle
	disappear VERMILIONCITY_BIG_SNORLAX
	setevent EVENT_FOUGHT_SNORLAX
	reloadmapafterbattle
	end

VermilionGymBadgeGuy:
	faceplayer
	opentext
	checkevent EVENT_GOT_HP_UP_FROM_VERMILION_GUY
	iftrue .AlreadyGotItem
	readvar VAR_BADGES
	ifequal NUM_BADGES, .AllBadges
	ifgreater 13, .MostBadges
	ifgreater 9, .SomeBadges
	writetext VermilionCityBadgeGuyTrainerText
	waitbutton
	closetext
	end

.SomeBadges:
	writetext VermilionCityBadgeGuySomeBadgesText
	waitbutton
	closetext
	end

.MostBadges:
	writetext VermilionCityBadgeGuyMostBadgesText
	waitbutton
	closetext
	end

.AllBadges:
	writetext VermilionCityBadgeGuyAllBadgesText
	promptbutton
	verbosegiveitem HP_UP
	iffalse .Done
	setevent EVENT_GOT_HP_UP_FROM_VERMILION_GUY
.AlreadyGotItem:
	writetext VermilionCityBadgeGuyBattleEdgeText
	waitbutton
.Done:
	closetext
	end

VermilionCitySign:
	jumptext VermilionCitySignText

VermilionGymSign:
	jumptext VermilionGymSignText

PokemonFanClubSign:
	jumptext PokemonFanClubSignText

VermilionCityDiglettsCaveSign:
	jumptext VermilionCityDiglettsCaveSignText

VermilionCityPortSign:
	jumptext VermilionCityPortSignText

VermilionCityPokecenterSign:
	jumpstd pokecentersign

VermilionCityMartSign:
	jumpstd martsign

VermilionCityHiddenFullHeal:
	hiddenitem FULL_HEAL, EVENT_VERMILION_CITY_HIDDEN_FULL_HEAL

VermilionCityTeacherText:
	text "CIUDAD CARMÍN es"
	line "el puerto más"

	para "importante de"
	line "KANTO."

	para "En él atracan"
	line "lujosos"

	para "transatlánticos"
	line "de todo el mundo."
	done

VermilionMachopOwnerText:
	text "Mi #MON está"
	line "preparando el"

	para "terreno donde"
	line "edificar."

	para "Pero no tengo"
	line "dinero para el"
	cont "proyecto…"
	done

VermilionMachopText1:
	text "MACHOP: ¡Machop,"
	line "machop!"
	done

VermilionMachopText2:
	text "Un MACHOP gruñe"
	line "mientras pisotea"
	cont "el suelo."
	done

VermilionCitySuperNerdText:
	text "En KANTO hay ocho"
	line "GIMNASIOS."

	para "Ese gran edificio"
	line "es el GIMNASIO"

	para "#MON de CIUDAD"
	line "CARMÍN."
	done

VermilionCitySnorlaxSleepingText:
	text "SNORLAX duerme"
	line "plácidamente…"
	done

VermilionCityRadioNearSnorlaxText:
	text "El #GEAR está"
	line "cerca del SNORLAX"
	cont "dormido."

	para "…"

	para "¡SNORLAX se"
	line "despertó!"
	done

VermilionCityBadgeGuyTrainerText:
	text "Los entrenadores"
	line "expertos se reúnen"
	cont "en KANTO."

	para "Los LÍDERES de"
	line "GIMNASIO son muy"
	cont "fuertes."

	para "No serán fáciles"
	line "de vencer."
	done

VermilionCityBadgeGuySomeBadgesText:
	text "¿Has conseguido ya"
	line "alguna MEDALLA de"
	cont "GIMNASIO de KANTO?"

	para "¿A que los"
	line "entrenadores de"

	para "KANTO son muy"
	line "fuertes?"
	done

VermilionCityBadgeGuyMostBadgesText:
	text "Supongo que pronto"
	line "habrás conseguido"

	para "todas las MEDALLAS"
	line "de KANTO."

	para "Cuando tengas las"
	line "ocho MEDALLAS,"
	cont "dímelo."
	done

VermilionCityBadgeGuyAllBadgesText:
	text "¡Enhorabuena!"

	para "Tienes todas las"
	line "MEDALLAS de KANTO."

	para "Te recompensaré"
	line "por tu esfuerzo."
	done

VermilionCityBadgeGuyBattleEdgeText:
	text "Llevar distintos"
	line "tipos de #MON"

	para "te debería ayudar"
	line "en el combate."

	para "Seguro que las"
	line "MEDALLAS de KANTO"
	cont "te ayudarán."
	done

VermilionCitySignText:
	text "CIUDAD CARMÍN"

	para "El puerto de los"
	line "ocasos exquisitos"
	done

VermilionGymSignText:
	text "LÍDER DEL GIMNASIO"
	line "#MON DE CIUDAD"
	cont "CARMÍN: LT. SURGE"

	para "El rayo americano"
	done

PokemonFanClubSignText:
	text "CLUB DE FANS"
	line "DE #MON"
	cont "¡Bienvenidos!"
	done

VermilionCityDiglettsCaveSignText:
	text "CUEVA DIGLETT"
	done

VermilionCityPortSignText:
	text "ENTRADA AL PUERTO"
	line "CARMÍN"
	done

VermilionCity_MapEvents:
	db 0, 0 ; filler

	db 10 ; warp events
	warp_event  5,  5, VERMILION_FISHING_SPEECH_HOUSE, 1
	warp_event  9,  5, VERMILION_POKECENTER_1F, 1
	warp_event  7, 13, POKEMON_FAN_CLUB, 1
	warp_event 13, 13, VERMILION_MAGNET_TRAIN_SPEECH_HOUSE, 1
	warp_event 21, 13, VERMILION_MART, 2
	warp_event 21, 17, VERMILION_DIGLETTS_CAVE_SPEECH_HOUSE, 1
	warp_event 10, 19, VERMILION_GYM, 1
	warp_event 19, 31, VERMILION_PORT_PASSAGE, 1
	warp_event 20, 31, VERMILION_PORT_PASSAGE, 2
	warp_event 34,  7, DIGLETTS_CAVE, 1

	db 0 ; coord events

	db 8 ; bg events
	bg_event 25,  3, BGEVENT_READ, VermilionCitySign
	bg_event  5, 19, BGEVENT_READ, VermilionGymSign
	bg_event  5, 13, BGEVENT_READ, PokemonFanClubSign
	bg_event 33,  9, BGEVENT_READ, VermilionCityDiglettsCaveSign
	bg_event 27, 15, BGEVENT_READ, VermilionCityPortSign
	bg_event 10,  5, BGEVENT_READ, VermilionCityPokecenterSign
	bg_event 22, 13, BGEVENT_READ, VermilionCityMartSign
	bg_event 12, 19, BGEVENT_ITEM, VermilionCityHiddenFullHeal

	db 6 ; object events
	object_event 18,  9, SPRITE_TEACHER, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, VermilionCityTeacherScript, -1
	object_event 23,  6, SPRITE_GRAMPS, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, VermilionMachopOwner, -1
	object_event 26,  7, SPRITE_MACHOP, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, VermilionMachop, -1
	object_event 14, 16, SPRITE_SUPER_NERD, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, VermilionCitySuperNerdScript, -1
	object_event 34,  8, SPRITE_BIG_SNORLAX, SPRITEMOVEDATA_BIGDOLLSYM, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, VermilionSnorlax, EVENT_VERMILION_CITY_SNORLAX
	object_event 31, 12, SPRITE_POKEFAN_M, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, VermilionGymBadgeGuy, -1
