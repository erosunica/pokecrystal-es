	object_const_def ; object_event constants
	const PEWTERCITY_COOLTRAINER_F
	const PEWTERCITY_BUG_CATCHER
	const PEWTERCITY_GRAMPS
	const PEWTERCITY_FRUIT_TREE1
	const PEWTERCITY_FRUIT_TREE2

PewterCity_MapScripts:
	db 0 ; scene scripts

	db 1 ; callbacks
	callback MAPCALLBACK_NEWMAP, .FlyPoint

.FlyPoint:
	setflag ENGINE_FLYPOINT_PEWTER
	return

PewterCityCooltrainerFScript:
	jumptextfaceplayer PewterCityCooltrainerFText

PewterCityBugCatcherScript:
	jumptextfaceplayer PewterCityBugCatcherText

PewterCityGrampsScript:
	faceplayer
	opentext
	checkevent EVENT_GOT_SILVER_WING
	iftrue .GotSilverWing
	writetext PewterCityGrampsText
	promptbutton
	verbosegiveitem SILVER_WING
	setevent EVENT_GOT_SILVER_WING
	closetext
	end

.GotSilverWing:
	writetext PewterCityGrampsText_GotSilverWing
	waitbutton
	closetext
	end

PewterCitySign:
	jumptext PewterCitySignText

PewterGymSign:
	jumptext PewterGymSignText

PewterMuseumSign:
	jumptext PewterMuseumSignText

PewterCityMtMoonGiftShopSign:
	jumptext PewterCityMtMoonGiftShopSignText

PewterCityWelcomeSign:
	jumptext PewterCityWelcomeSignText

PewterCityPokecenterSign:
	jumpstd pokecentersign

PewterCityMartSign:
	jumpstd martsign

PewterCityFruitTree1:
	fruittree FRUITTREE_PEWTER_CITY_1

PewterCityFruitTree2:
	fruittree FRUITTREE_PEWTER_CITY_2

PewterCityCooltrainerFText:
	text "¿Has ido al"
	line "GIMNASIO de CIUDAD"
	cont "PLATEADA?"

	para "El LÍDER utiliza"
	line "#MON roca."
	done

PewterCityBugCatcherText:
	text "Por la noche, los"
	line "CLEFAIRY salen a"

	para "jugar al MT. MOON,"
	line "pero no todas las"
	cont "noches."
	done

PewterCityGrampsText:
	text "¡Vaya! ¿Vienes de"
	line "JOHTO?"

	para "Me trae muchos"
	line "recuerdos. Cuando"

	para "era joven, fui a"
	line "JOHTO a entrenar."

	para "Te pareces mucho"
	line "a mí cuando yo"
	cont "tenía tu edad."

	para "Me gustaría darte"
	line "este objeto que"
	cont "encontré en JOHTO."
	done

PewterCityGrampsText_GotSilverWing:
	text "Visitar nuevos"
	line "sitios y conocer"
	cont "gente nueva…"

	para "Eso es lo bueno"
	line "de viajar."
	done

PewterCitySignText:
	text "CIUDAD PLATEADA"
	line "La ciudad de"
	cont "piedra grisácea"
	done

PewterGymSignText:
	text "LÍDER DEL GIMNASIO"
	line "#MON DE CIUDAD"
	cont "PLATEADA: BROCK"

	para "El entrenador"
	line "#MON más fuerte"
	cont "que la roca"
	done

PewterMuseumSignText:
	text "Aquí hay una nota…"

	para "MUSEO DE LA"
	line "CIENCIA DE CIUDAD"

	para "PLATEADA: Cerrado"
	line "por obras…"
	done

PewterCityMtMoonGiftShopSignText:
	text "Aquí hay una nota…"

	para "¡TIENDA DE REGALOS"
	line "MT. MOON abierta!"
	done

PewterCityWelcomeSignText:
	text "¡Bienvenidos a"
	line "CIUDAD PLATEADA!"
	done

PewterCity_MapEvents:
	db 0, 0 ; filler

	db 5 ; warp events
	warp_event 29, 13, PEWTER_NIDORAN_SPEECH_HOUSE, 1
	warp_event 16, 17, PEWTER_GYM, 1
	warp_event 23, 17, PEWTER_MART, 2
	warp_event 13, 25, PEWTER_POKECENTER_1F, 1
	warp_event  7, 29, PEWTER_SNOOZE_SPEECH_HOUSE, 1

	db 0 ; coord events

	db 7 ; bg events
	bg_event 25, 23, BGEVENT_READ, PewterCitySign
	bg_event 11, 17, BGEVENT_READ, PewterGymSign
	bg_event 15,  9, BGEVENT_READ, PewterMuseumSign
	bg_event 33, 19, BGEVENT_READ, PewterCityMtMoonGiftShopSign
	bg_event 19, 29, BGEVENT_READ, PewterCityWelcomeSign
	bg_event 14, 25, BGEVENT_READ, PewterCityPokecenterSign
	bg_event 24, 17, BGEVENT_READ, PewterCityMartSign

	db 5 ; object events
	object_event 19, 11, SPRITE_COOLTRAINER_F, SPRITEMOVEDATA_WANDER, 2, 2, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, PewterCityCooltrainerFScript, -1
	object_event 14, 29, SPRITE_BUG_CATCHER, SPRITEMOVEDATA_WANDER, 2, 2, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, PewterCityBugCatcherScript, -1
	object_event 29, 17, SPRITE_GRAMPS, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 2, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, PewterCityGrampsScript, -1
	object_event 32,  3, SPRITE_FRUIT_TREE, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, PewterCityFruitTree1, -1
	object_event 30,  3, SPRITE_FRUIT_TREE, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, PewterCityFruitTree2, -1
