	object_const_def ; object_event constants
	const FASTSHIPB1F_SAILOR1
	const FASTSHIPB1F_SAILOR2
	const FASTSHIPB1F_SAILOR3
	const FASTSHIPB1F_LASS
	const FASTSHIPB1F_SUPER_NERD
	const FASTSHIPB1F_SAILOR4
	const FASTSHIPB1F_FISHER
	const FASTSHIPB1F_BLACK_BELT
	const FASTSHIPB1F_SAILOR5
	const FASTSHIPB1F_TEACHER
	const FASTSHIPB1F_YOUNGSTER1
	const FASTSHIPB1F_YOUNGSTER2

FastShipB1F_MapScripts:
	db 2 ; scene scripts
	scene_script .DummyScene0 ; SCENE_DEFAULT
	scene_script .DummyScene1 ; SCENE_FINISHED

	db 0 ; callbacks

.DummyScene0:
	end

.DummyScene1:
	end

FastShipB1FSailorBlocksLeft:
	checkevent EVENT_FAST_SHIP_B1F_SAILOR_RIGHT
	iftrue FastShipB1FAlreadyBlocked
	applymovement FASTSHIPB1F_SAILOR2, FastShipB1FSailorBlocksLeftMovement
	moveobject FASTSHIPB1F_SAILOR1, 30, 6
	appear FASTSHIPB1F_SAILOR1
	pause 5
	disappear FASTSHIPB1F_SAILOR2
	end

FastShipB1FSailorBlocksRight:
	checkevent EVENT_FAST_SHIP_B1F_SAILOR_LEFT
	iftrue FastShipB1FAlreadyBlocked
	applymovement FASTSHIPB1F_SAILOR1, FastShipB1FSailorBlocksRightMovement
	moveobject FASTSHIPB1F_SAILOR2, 31, 6
	appear FASTSHIPB1F_SAILOR2
	pause 5
	disappear FASTSHIPB1F_SAILOR1
	end

FastShipB1FAlreadyBlocked:
	end

FastShipB1FSailorScript:
	faceplayer
	opentext
	checkevent EVENT_FAST_SHIP_FIRST_TIME
	iftrue .FirstTime
	checkevent EVENT_FAST_SHIP_LAZY_SAILOR
	iftrue .LazySailor
	checkevent EVENT_FAST_SHIP_INFORMED_ABOUT_LAZY_SAILOR
	iftrue .AlreadyInformed
	writetext FastShipB1FOnDutySailorText
	waitbutton
	closetext
	setevent EVENT_FAST_SHIP_INFORMED_ABOUT_LAZY_SAILOR
	clearevent EVENT_FAST_SHIP_CABINS_NNW_NNE_NE_SAILOR
	end

.AlreadyInformed:
	writetext FastShipB1FOnDutySailorRefusedText
	waitbutton
	closetext
	end

.LazySailor:
	writetext FastShipB1FOnDutySailorThanksText
	checkevent EVENT_FAST_SHIP_FOUND_GIRL
	iffalse .NotFoundGirl
	waitbutton
	closetext
	end

.NotFoundGirl:
	promptbutton
	writetext FastShipB1FOnDutySailorSawLittleGirlText
	waitbutton
	closetext
	end

.FirstTime:
	writetext FastShipB1FOnDutySailorDirectionsText
	waitbutton
	closetext
	end

TrainerSailorJeff:
	trainer SAILOR, JEFF, EVENT_BEAT_SAILOR_JEFF, SailorJeffSeenText, SailorJeffBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext SailorJeffAfterBattleText
	waitbutton
	closetext
	end

TrainerPicnickerDebra:
	trainer PICNICKER, DEBRA, EVENT_BEAT_PICNICKER_DEBRA, PicnickerDebraSeenText, PicnickerDebraBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext PicnickerDebraAfterBattleText
	waitbutton
	closetext
	end

TrainerJugglerFritz:
	trainer JUGGLER, FRITZ, EVENT_BEAT_JUGGLER_FRITZ, JugglerFritzSeenText, JugglerFritzBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext JugglerFritzAfterBattleText
	waitbutton
	closetext
	end

TrainerSailorGarrett:
	trainer SAILOR, GARRETT, EVENT_BEAT_SAILOR_GARRETT, SailorGarrettSeenText, SailorGarrettBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext SailorGarrettAfterBattleText
	waitbutton
	closetext
	end

TrainerFisherJonah:
	trainer FISHER, JONAH, EVENT_BEAT_FISHER_JONAH, FisherJonahSeenText, FisherJonahBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext FisherJonahAfterBattleText
	waitbutton
	closetext
	end

TrainerBlackbeltWai:
	trainer BLACKBELT_T, WAI, EVENT_BEAT_BLACKBELT_WAI, BlackbeltWaiSeenText, BlackbeltWaiBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext BlackbeltWaiAfterBattleText
	waitbutton
	closetext
	end

TrainerSailorKenneth:
	trainer SAILOR, KENNETH, EVENT_BEAT_SAILOR_KENNETH, SailorKennethSeenText, SailorKennethBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext SailorKennethAfterBattleText
	waitbutton
	closetext
	end

TrainerTeacherShirley:
	trainer TEACHER, SHIRLEY, EVENT_BEAT_TEACHER_SHIRLEY, TeacherShirleySeenText, TeacherShirleyBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext TeacherShirleyAfterBattleText
	waitbutton
	closetext
	end

TrainerSchoolboyNate:
	trainer SCHOOLBOY, NATE, EVENT_BEAT_SCHOOLBOY_NATE, SchoolboyNateSeenText, SchoolboyNateBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext SchoolboyNateAfterBattleText
	waitbutton
	closetext
	end

TrainerSchoolboyRicky:
	trainer SCHOOLBOY, RICKY, EVENT_BEAT_SCHOOLBOY_RICKY, SchoolboyRickySeenText, SchoolboyRickyBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext SchoolboyRickyAfterBattleText
	waitbutton
	closetext
	end

FastShipB1FTrashcan:
	jumpstd trashcan

FastShipB1FSailorBlocksRightMovement:
	fix_facing
	big_step RIGHT
	remove_fixed_facing
	turn_head DOWN
	step_end

FastShipB1FSailorBlocksLeftMovement:
	fix_facing
	big_step LEFT
	remove_fixed_facing
	turn_head DOWN
	step_end

FastShipB1FOnDutySailorText:
	text "¡Eh! ¿Podrías"
	line "buscar a mi"
	cont "compañero?"

	para "¡Está haciendo de"
	line "las suyas en algún"

	para "sitio!"
	line "¡El muy vago!"

	para "Me gustaría ir a"
	line "buscarle, pero"
	cont "estoy de servicio."
	done

FastShipB1FOnDutySailorRefusedText:
	text "¡Oh…!"

	para "El CAPITÁN se"
	line "pondrá furioso…"
	done

FastShipB1FOnDutySailorThanksText:
	text "¡Gracias, joven!"
	line "¡Le he echado una"

	para "buena bronca y se"
	line "ha tranquilizado!"
	done

FastShipB1FOnDutySailorSawLittleGirlText:
	text "¿Una niña pequeña?"

	para "Puede que la haya"
	line "visto por aquí."
	done

FastShipB1FOnDutySailorDirectionsText:
	text "El comedor está"
	line "ahí delante."

	para "Las escaleras del"
	line "fondo conducen al"

	para "camarote del"
	line "CAPITÁN."
	done

SailorJeffSeenText:
	text "No hay nada mejor"
	line "que un combate en"
	cont "mi tiempo libre."
	done

SailorJeffBeatenText:
	text "¡Gane o pierda, se"
	line "acabó el descanso!"
	done

SailorJeffAfterBattleText:
	text "Supongo que no"
	line "ganaré si no me"
	cont "lo tomo en serio."
	done

PicnickerDebraSeenText:
	text "Me aburro tanto…"
	line "¿Quieres luchar?"
	done

PicnickerDebraBeatenText:
	text "¡Uau! ¡Eres"
	line "demasiado fuerte!"
	done

PicnickerDebraAfterBattleText:
	text "AZAFRÁN…"
	line "AZULONA…"

	para "Dicen que hay"
	line "muchas ciudades"
	cont "grandes en KANTO."
	done

JugglerFritzSeenText:
	text "¡Urrf…!"
	line "¡Estoy mareado!"
	done

JugglerFritzBeatenText:
	text "No me puedo mover…"
	done

JugglerFritzAfterBattleText:
	text "No vuelvo a ir en"
	line "barco. La próxima"

	para "vez viajaré en el"
	line "MAGNETOTRÉN."
	done

SailorGarrettSeenText:
	text "¡Aquí es donde"
	line "trabajamos!"
	done

SailorGarrettBeatenText:
	text "He perdido en mi"
	line "propio campo…"
	done

SailorGarrettAfterBattleText:
	text "Llevamos a muchos"
	line "pasajeros desde"

	para "CIUDAD CARMÍN a"
	line "CIUDAD OLIVO."
	done

FisherJonahSeenText:
	text "¡Aunque estemos en"
	line "el mar, no puedo"
	cont "pescar!"

	para "¡Qué aburrido!"
	line "¡Luchemos!"
	done

FisherJonahBeatenText:
	text "Ya… Ya no"
	line "me aburro…"
	done

FisherJonahAfterBattleText:
	text "Voy a pescar en"
	line "los muelles de"
	cont "CIUDAD CARMÍN."
	done

BlackbeltWaiSeenText:
	text "¡Fortalezco mis"
	line "piernas nadando en"

	para "la estela del"
	line "barco!"
	done

BlackbeltWaiBeatenText:
	text "¡Bailemos el Rock"
	line "and Roll!"
	done

BlackbeltWaiAfterBattleText:
	text "No pude encontrar"
	line "al REY del KARATE"
	cont "en JOHTO."

	para "Dicen que se está"
	line "entrenando en"
	cont "alguna cueva."
	done

SailorKennethSeenText:
	text "¡Soy marinero!"

	para "Pero entreno"
	line "#MON para"
	cont "ser el CAMPEÓN."
	done

SailorKennethBeatenText:
	text "Me falta"
	line "entrenamiento…"
	done

SailorKennethAfterBattleText:
	text "¡Ocho MEDALLAS!"
	line "Eso demuestra que"

	para "has vencido a los"
	line "LÍDERES de"
	cont "GIMNASIO."

	para "¡No me extraña que"
	line "seas tan fuerte!"
	done

TeacherShirleySeenText:
	text "¡No toques a mis"
	line "alumnos!"
	done

TeacherShirleyBeatenText:
	text "¡Aaah!"
	done

TeacherShirleyAfterBattleText:
	text "Vamos de excursión"
	line "a las RUINAS de"

	para "las afueras de"
	line "CIUDAD MALVA."
	done

SchoolboyNateSeenText:
	text "¿Conoces las"
	line "RUINAS ALFA?"
	done

SchoolboyNateBeatenText:
	text "¡Aarg!"
	done

SchoolboyNateAfterBattleText:
	text "Las radios captan"
	line "señales extrañas"
	cont "en las RUINAS."
	done

SchoolboyRickySeenText:
	text "En las RUINAS"
	line "ALFA hay unos"

	para "extraños paneles"
	line "de piedra."
	done

SchoolboyRickyBeatenText:
	text "¡Estoy agotado!"
	done

SchoolboyRickyAfterBattleText:
	text "He leído que hay"
	line "cuatro paneles de"
	cont "piedra como ésos."
	done

FastShipB1F_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event  5, 11, FAST_SHIP_1F, 11
	warp_event 31, 13, FAST_SHIP_1F, 12

	db 2 ; coord events
	coord_event 30,  7, SCENE_DEFAULT, FastShipB1FSailorBlocksLeft
	coord_event 31,  7, SCENE_DEFAULT, FastShipB1FSailorBlocksRight

	db 1 ; bg events
	bg_event 27,  9, BGEVENT_READ, FastShipB1FTrashcan

	db 12 ; object events
	object_event 30,  6, SPRITE_SAILOR, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, FastShipB1FSailorScript, EVENT_FAST_SHIP_B1F_SAILOR_LEFT
	object_event 31,  6, SPRITE_SAILOR, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, FastShipB1FSailorScript, EVENT_FAST_SHIP_B1F_SAILOR_RIGHT
	object_event  9, 11, SPRITE_SAILOR, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 3, TrainerSailorJeff, EVENT_FAST_SHIP_PASSENGERS_FIRST_TRIP
	object_event  6,  4, SPRITE_LASS, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_TRAINER, 1, TrainerPicnickerDebra, EVENT_FAST_SHIP_PASSENGERS_FIRST_TRIP
	object_event 26,  9, SPRITE_SUPER_NERD, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 1, TrainerJugglerFritz, EVENT_FAST_SHIP_PASSENGERS_FIRST_TRIP
	object_event 17,  4, SPRITE_SAILOR, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 4, TrainerSailorGarrett, EVENT_FAST_SHIP_PASSENGERS_EASTBOUND
	object_event 25,  8, SPRITE_FISHER, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_TRAINER, 3, TrainerFisherJonah, EVENT_FAST_SHIP_PASSENGERS_EASTBOUND
	object_event 15, 11, SPRITE_BLACK_BELT, SPRITEMOVEDATA_SPINCLOCKWISE, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_TRAINER, 3, TrainerBlackbeltWai, EVENT_FAST_SHIP_PASSENGERS_EASTBOUND
	object_event 23,  4, SPRITE_SAILOR, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 4, TrainerSailorKenneth, EVENT_FAST_SHIP_PASSENGERS_WESTBOUND
	object_event  9, 11, SPRITE_TEACHER, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 3, TrainerTeacherShirley, EVENT_FAST_SHIP_PASSENGERS_WESTBOUND
	object_event 14,  9, SPRITE_YOUNGSTER, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 1, TrainerSchoolboyNate, EVENT_FAST_SHIP_PASSENGERS_WESTBOUND
	object_event 14, 11, SPRITE_YOUNGSTER, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 1, TrainerSchoolboyRicky, EVENT_FAST_SHIP_PASSENGERS_WESTBOUND
