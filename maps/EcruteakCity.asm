	object_const_def ; object_event constants
	const ECRUTEAKCITY_GRAMPS1
	const ECRUTEAKCITY_GRAMPS2
	const ECRUTEAKCITY_LASS1
	const ECRUTEAKCITY_LASS2
	const ECRUTEAKCITY_FISHER
	const ECRUTEAKCITY_YOUNGSTER
	const ECRUTEAKCITY_GRAMPS3

EcruteakCity_MapScripts:
	db 0 ; scene scripts

	db 1 ; callbacks
	callback MAPCALLBACK_NEWMAP, .FlyPoint

.FlyPoint:
	setflag ENGINE_FLYPOINT_ECRUTEAK
	return

EcruteakCityGramps1Script:
	jumptextfaceplayer EcruteakCityGramps1Text

EcruteakCityGramps2Script:
	jumptextfaceplayer EcruteakCityGramps2Text

EcruteakCityGramps3Script:
	jumptextfaceplayer EcruteakCityGramps3Text

EcruteakCityLass1Script:
	jumptextfaceplayer EcruteakCityLass1Text

EcruteakCityLass2Script:
	faceplayer
	opentext
	checkevent EVENT_RELEASED_THE_BEASTS
	iftrue .ReleasedBeasts
	writetext EcruteakCityLass2Text
	waitbutton
	closetext
	end

.ReleasedBeasts:
	writetext EcruteakCityLass2Text_ReleasedBeasts
	waitbutton
	closetext
	end

EcruteakCityFisherScript:
	faceplayer
	opentext
	checkevent EVENT_JASMINE_RETURNED_TO_GYM
	iftrue .JasmineReturned
	writetext EcruteakCityFisherText
	waitbutton
	closetext
	end

.JasmineReturned:
	writetext EcruteakCityFisherText_JasmineReturned
	waitbutton
	closetext
	end

EcruteakCityYoungsterScript:
	jumptextfaceplayer EcruteakCityYoungsterText

EcruteakCitySign:
	jumptext EcruteakCitySignText

TinTowerSign:
	jumptext TinTowerSignText

EcruteakGymSign:
	jumptext EcruteakGymSignText

EcruteakDanceTheaterSign:
	jumptext EcruteakDanceTheaterSignText

BurnedTowerSign:
	jumptext BurnedTowerSignText

EcruteakCityPokecenterSign:
	jumpstd pokecentersign

EcruteakCityMartSign:
	jumpstd martsign

EcruteakCityHiddenHyperPotion:
	hiddenitem HYPER_POTION, EVENT_ECRUTEAK_CITY_HIDDEN_HYPER_POTION

UnusedMissingDaughterText:
; unused
	text "¡Oh, no! ¡Oh, no!"

	para "Mi hija se ha"
	line "perdido."

	para "No… No ha ido"
	line "a TORRE QUEMADA."

	para "Le dije que no se"
	line "acercara…"

	para "Dicen que la gente"
	line "desaparece…"

	para "¡Oh! ¿Qué puedo"
	line "hacer…?"
	done

EcruteakCityGramps1Text:
	text "En CIUDAD IRIS"
	line "había dos torres:"

	para "una en el Este y"
	line "otra en el Oeste."
	done

EcruteakCityGramps2Text:
	text "¡Ah, tú!"
	line "¿Has aprendido a"

	para "bailar como las"
	line "CHICAS KIMONO?"

	para "Si vas a su TEATRO"
	line "de DANZA, un raro"

	para "anciano te dará"
	line "algo bonito."

	para "Eso me han dicho."
	done

EcruteakCityLass1Text:
	text "Voy a practicar en"
	line "el TEATRO de"
	cont "DANZA."

	para "¿Vienes conmigo?"
	done

EcruteakCityLass2Text:
	text "La torre que"
	line "había aquí…"

	para "Mi abuela me dijo"
	line "que era mucho"
	cont "más alta."
	done

EcruteakCityLass2Text_ReleasedBeasts:
	text "Tres #MON"
	line "huyeron en tres"

	para "direcciones."
	line "¿Qué eran?"
	done

EcruteakCityFisherText:
	text "He oído un rumor"
	line "sobre el FARO"
	cont "de C. OLIVO."

	para "El #MON que"
	line "usan como luz ha"
	cont "caído enfermo."

	para "Parece que tienen"
	line "problemas."
	done

EcruteakCityFisherText_JasmineReturned:
	text "El #MON de"
	line "FARO OLIVO se ha"
	cont "curado."

	para "Los barcos pueden"
	line "volver a navegar"
	cont "seguros de noche."
	done

EcruteakCityYoungsterText:
	text "Los #MON están"
	line "causando estragos"

	para "en el LAGO DE LA"
	line "FURIA. Me gustaría"
	cont "verlo."
	done

EcruteakCityGramps3Text:
	text "Hace mucho, mucho"
	line "tiempo…"

	para "Esta torre ardió"
	line "por el fuego. Tres"

	para "#MON descono-"
	line "cidos perecieron"
	cont "en ella."

	para "Un #MON con los"
	line "colores del arco"

	para "iris bajó del"
	line "cielo y los"
	cont "resucitó…"

	para "Es una leyenda que"
	line "ha ido pasando de"

	para "LÍDER a LÍDER en"
	line "el GIMNASIO IRIS."

	para "¿Yo?"

	para "Yo sólo soy un"
	line "entrenador."
	cont "¡Jo, jo, jo!"
	done

EcruteakCitySignText:
	text "CIUDAD IRIS"
	line "Una ciudad donde"

	para "conviven el pasado"
	line "y el presente"
	done

TinTowerSignText:
	text "TORRE HOJALATA"

	para "Aquí duerme un"
	line "#MON"
	cont "legendario."
	done

EcruteakGymSignText:
	text "LÍDER DEL GIMNASIO"
	line "#MON DE CIUDAD"
	cont "IRIS: MORTI"

	para "El místico adivino"
	line "del futuro"
	done

EcruteakDanceTheaterSignText:
	text "TEATRO DE DANZA DE"
	line "CIUDAD IRIS"
	done

BurnedTowerSignText:
	text "TORRE QUEMADA"

	para "Destruida por un"
	line "misterioso"
	cont "incendio"

	para "¡Atención!"
	line "¡Peligro!"
	done

EcruteakCity_MapEvents:
	db 0, 0 ; filler

	db 15 ; warp events
	warp_event 35, 26, ROUTE_42_ECRUTEAK_GATE, 1
	warp_event 35, 27, ROUTE_42_ECRUTEAK_GATE, 2
	warp_event 18, 11, ECRUTEAK_TIN_TOWER_ENTRANCE, 1
	warp_event 20,  2, WISE_TRIOS_ROOM, 1
	warp_event 20,  3, WISE_TRIOS_ROOM, 2
	warp_event 23, 27, ECRUTEAK_POKECENTER_1F, 1
	warp_event  5, 21, ECRUTEAK_LUGIA_SPEECH_HOUSE, 1
	warp_event 23, 21, DANCE_THEATRE, 1
	warp_event 29, 21, ECRUTEAK_MART, 2
	warp_event  6, 27, ECRUTEAK_GYM, 1
	warp_event 13, 27, ECRUTEAK_ITEMFINDER_HOUSE, 1
	warp_event 37,  7, TIN_TOWER_1F, 1
	warp_event  5,  5, BURNED_TOWER_1F, 1
	warp_event  0, 18, ROUTE_38_ECRUTEAK_GATE, 3
	warp_event  0, 19, ROUTE_38_ECRUTEAK_GATE, 4

	db 0 ; coord events

	db 8 ; bg events
	bg_event 15, 21, BGEVENT_READ, EcruteakCitySign
	bg_event 38, 10, BGEVENT_READ, TinTowerSign
	bg_event  8, 28, BGEVENT_READ, EcruteakGymSign
	bg_event 21, 21, BGEVENT_READ, EcruteakDanceTheaterSign
	bg_event  2, 10, BGEVENT_READ, BurnedTowerSign
	bg_event 24, 27, BGEVENT_READ, EcruteakCityPokecenterSign
	bg_event 30, 21, BGEVENT_READ, EcruteakCityMartSign
	bg_event 23, 14, BGEVENT_ITEM, EcruteakCityHiddenHyperPotion

	db 7 ; object events
	object_event 18, 15, SPRITE_GRAMPS, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, EcruteakCityGramps1Script, -1
	object_event 20, 21, SPRITE_GRAMPS, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, EcruteakCityGramps2Script, -1
	object_event 21, 29, SPRITE_LASS, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 2, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, EcruteakCityLass1Script, -1
	object_event  3,  9, SPRITE_LASS, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, EcruteakCityLass2Script, -1
	object_event  9, 22, SPRITE_FISHER, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 1, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, EcruteakCityFisherScript, -1
	object_event 10, 14, SPRITE_YOUNGSTER, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, EcruteakCityYoungsterScript, -1
	object_event  3,  7, SPRITE_GRAMPS, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, EcruteakCityGramps3Script, EVENT_ECRUTEAK_CITY_GRAMPS
