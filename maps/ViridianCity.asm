	object_const_def ; object_event constants
	const VIRIDIANCITY_GRAMPS1
	const VIRIDIANCITY_GRAMPS2
	const VIRIDIANCITY_FISHER
	const VIRIDIANCITY_YOUNGSTER

ViridianCity_MapScripts:
	db 0 ; scene scripts

	db 1 ; callbacks
	callback MAPCALLBACK_NEWMAP, .FlyPoint

.FlyPoint:
	setflag ENGINE_FLYPOINT_VIRIDIAN
	return

ViridianCityCoffeeGramps:
	faceplayer
	opentext
	writetext ViridianCityCoffeeGrampsQuestionText
	yesorno
	iffalse .no
	writetext ViridianCityCoffeeGrampsBelievedText
	waitbutton
	closetext
	end

.no:
	writetext ViridianCityCoffeeGrampsDoubtedText
	waitbutton
	closetext
	end

ViridianCityGrampsNearGym:
	faceplayer
	opentext
	checkevent EVENT_BLUE_IN_CINNABAR
	iftrue .BlueReturned
	writetext ViridianCityGrampsNearGymText
	waitbutton
	closetext
	end

.BlueReturned:
	writetext ViridianCityGrampsNearGymBlueReturnedText
	waitbutton
	closetext
	end

ViridianCityDreamEaterFisher:
	faceplayer
	opentext
	checkevent EVENT_GOT_TM42_DREAM_EATER
	iftrue .GotDreamEater
	writetext ViridianCityDreamEaterFisherText
	promptbutton
	verbosegiveitem TM_DREAM_EATER
	iffalse .NoRoomForDreamEater
	setevent EVENT_GOT_TM42_DREAM_EATER
.GotDreamEater:
	writetext ViridianCityDreamEaterFisherGotDreamEaterText
	waitbutton
.NoRoomForDreamEater:
	closetext
	end

ViridianCityYoungsterScript:
	jumptextfaceplayer ViridianCityYoungsterText

ViridianCitySign:
	jumptext ViridianCitySignText

ViridianGymSign:
	jumptext ViridianGymSignText

ViridianCityWelcomeSign:
	jumptext ViridianCityWelcomeSignText

TrainerHouseSign:
	jumptext TrainerHouseSignText

ViridianCityPokecenterSign:
	jumpstd pokecentersign

ViridianCityMartSign:
	jumpstd martsign

ViridianCityCoffeeGrampsQuestionText:
	text "¡Hola! ¡Me acabo"
	line "de tomar un café"

	para "doble y estoy como"
	line "una moto!"

	para "¡Tengo que hablar"
	line "con alguien, así"
	cont "que te toca a ti!"

	para "Puede que ahora no"
	line "lo parezca, pero"

	para "yo era un experto"
	line "atrapando #MON."

	para "¿Me crees?"
	done

ViridianCityCoffeeGrampsBelievedText:
	text "Muy bien. Sí, yo"
	line "era algo fuera de"

	para "lo normal. ¡Déjame"
	line "contártelo!"
	done

ViridianCityCoffeeGrampsDoubtedText:
	text "¿Qué? ¡Serás"
	line "insolente!"

	para "Si fuera un poco"
	line "más joven, te"

	para "enseñaría un par"
	line "de cosas. ¡Vaya!"
	done

ViridianCityGrampsNearGymText:
	text "Este GIMNASIO no"
	line "ha tenido LÍDER"
	cont "hasta hace poco."

	para "Un joven de"
	line "PUEBLO PALETA se"

	para "convirtió en LÍDER"
	line "pero viaja mucho."
	done

ViridianCityGrampsNearGymBlueReturnedText:
	text "¿Vas a enfrentarte"
	line "al LÍDER?"

	para "¡Buena suerte! ¡La"
	line "vas a necesitar!"
	done

ViridianCityDreamEaterFisherText:
	text "¡Qué sueño!"

	para "Me habré quedado"
	line "dormido al sol."

	para "He soñado que un"
	line "DROWZEE se comía"
	cont "mi sueño."

	para "Es raro, ¿verdad?"

	para "¿Eh?"
	line "¿Qué es esto?"

	para "¿De dónde ha"
	line "salido esta MT?"

	para "¡Esto es muy"
	line "misterioso! Aquí"
	cont "tienes esta MT."
	done

ViridianCityDreamEaterFisherGotDreamEaterText:
	text "MT42 contiene"
	line "COME SUEÑOS…"

	para "¡Zzzzz…!"
	done

ViridianCityYoungsterText:
	text "Dicen que en el"
	line "suelo del BOSQUE"

	para "VERDE hay muchos"
	line "objetos."
	done

ViridianCitySignText:
	text "CIUDAD VERDE"

	para "El paraíso"
	line "eternamente verde"
	done

ViridianGymSignText:
	text "LÍDER DEL GIMNASIO"
	line "#MON DE CIUDAD"
	cont "VERDE:…"

	para "El resto del texto"
	line "es ilegible…"
	done

ViridianCityWelcomeSignText:
	text "Ésta es la CIUDAD"
	line "VERDE, la entrada"
	cont "a la MESETA AÑIL"
	done

TrainerHouseSignText:
	text "CASA DEL"
	line "ENTRENADOR"

	para "Club de Mejores"
	line "Entrenadores"
	done

ViridianCity_MapEvents:
	db 0, 0 ; filler

	db 5 ; warp events
	warp_event 32,  7, VIRIDIAN_GYM, 1
	warp_event 21,  9, VIRIDIAN_NICKNAME_SPEECH_HOUSE, 1
	warp_event 23, 15, TRAINER_HOUSE_1F, 1
	warp_event 29, 19, VIRIDIAN_MART, 2
	warp_event 23, 25, VIRIDIAN_POKECENTER_1F, 1

	db 0 ; coord events

	db 6 ; bg events
	bg_event 17, 17, BGEVENT_READ, ViridianCitySign
	bg_event 27,  7, BGEVENT_READ, ViridianGymSign
	bg_event 19,  1, BGEVENT_READ, ViridianCityWelcomeSign
	bg_event 21, 15, BGEVENT_READ, TrainerHouseSign
	bg_event 24, 25, BGEVENT_READ, ViridianCityPokecenterSign
	bg_event 30, 19, BGEVENT_READ, ViridianCityMartSign

	db 4 ; object events
	object_event 18,  5, SPRITE_GRAMPS, SPRITEMOVEDATA_WANDER, 2, 2, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, ViridianCityCoffeeGramps, -1
	object_event 30,  8, SPRITE_GRAMPS, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, ViridianCityGrampsNearGym, -1
	object_event  6, 23, SPRITE_FISHER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, ViridianCityDreamEaterFisher, -1
	object_event 17, 21, SPRITE_YOUNGSTER, SPRITEMOVEDATA_WANDER, 3, 3, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, ViridianCityYoungsterScript, -1
