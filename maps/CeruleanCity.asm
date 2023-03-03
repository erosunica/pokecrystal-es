	object_const_def ; object_event constants
	const CERULEANCITY_COOLTRAINER_M
	const CERULEANCITY_SUPER_NERD
	const CERULEANCITY_SLOWPOKE
	const CERULEANCITY_COOLTRAINER_F
	const CERULEANCITY_FISHER
	const CERULEANCITY_YOUNGSTER

CeruleanCity_MapScripts:
	db 0 ; scene scripts

	db 1 ; callbacks
	callback MAPCALLBACK_NEWMAP, .FlyPoint

.FlyPoint:
	setflag ENGINE_FLYPOINT_CERULEAN
	return

CeruleanCityCooltrainerMScript:
	faceplayer
	opentext
	checkevent EVENT_RETURNED_MACHINE_PART
	iftrue .ReturnedMachinePart
	writetext CeruleanCityCooltrainerMText1
	waitbutton
	closetext
	end

.ReturnedMachinePart:
	writetext CeruleanCityCooltrainerMText2
	waitbutton
	closetext
	end

CeruleanCitySuperNerdScript:
	jumptextfaceplayer CeruleanCitySuperNerdText

CeruleanCitySlowbro:
	opentext
	writetext CeruleanCitySlowbroText
	cry SLOWBRO
	waitbutton
	closetext
	end

CeruleanCityCooltrainerFScript:
	faceplayer
	opentext
	writetext CeruleanCityCooltrainerFText1
	waitbutton
	closetext
	turnobject CERULEANCITY_COOLTRAINER_F, LEFT
	opentext
	writetext CeruleanCityCooltrainerFText2
	waitbutton
	closetext
	opentext
	writetext CeruleanCitySlowbroText
	cry SLOWBRO
	waitbutton
	closetext
	opentext
	writetext CeruleanCityCooltrainerFText3
	waitbutton
	closetext
	end

CeruleanCityFisherScript:
	faceplayer
	opentext
	checkevent EVENT_RETURNED_MACHINE_PART
	iftrue .ReturnedMachinePart
	checkevent EVENT_MET_ROCKET_GRUNT_AT_CERULEAN_GYM
	iftrue .MetCeruleanRocket
.ReturnedMachinePart:
	writetext CeruleanCityFisherText
	waitbutton
	closetext
	end

.MetCeruleanRocket:
	writetext CeruleanCityFisherRocketTipText
	waitbutton
	closetext
	end

CeruleanCityYoungsterScript:
	faceplayer
	opentext
	writetext CeruleanCityYoungsterText1
	waitbutton
	closetext
	checkevent EVENT_FOUND_BERSERK_GENE_IN_CERULEAN_CITY
	iffalse .BerserkGenePingsItemfinder
	end

.BerserkGenePingsItemfinder:
	waitsfx
	playsound SFX_SECOND_PART_OF_ITEMFINDER
	waitsfx
	playsound SFX_TRANSACTION
	waitsfx
	playsound SFX_SECOND_PART_OF_ITEMFINDER
	waitsfx
	playsound SFX_TRANSACTION
	waitsfx
	playsound SFX_SECOND_PART_OF_ITEMFINDER
	waitsfx
	playsound SFX_TRANSACTION
	waitsfx
	playsound SFX_SECOND_PART_OF_ITEMFINDER
	waitsfx
	playsound SFX_TRANSACTION
	waitsfx
	showemote EMOTE_SHOCK, CERULEANCITY_YOUNGSTER, 15
	turnobject CERULEANCITY_YOUNGSTER, LEFT
	opentext
	writetext CeruleanCityYoungsterText2
	waitbutton
	closetext
	end

CeruleanCitySign:
	jumptext CeruleanCitySignText

CeruleanGymSign:
	jumptext CeruleanGymSignText

CeruleanBikeShopSign:
	jumptext CeruleanBikeShopSignText

CeruleanPoliceSign:
	jumptext CeruleanPoliceSignText

CeruleanCapeSign:
	jumptext CeruleanCapeSignText

CeruleanLockedDoor:
	jumptext CeruleanLockedDoorText

CeruleanCityPokecenterSign:
	jumpstd pokecentersign

CeruleanCityMartSign:
	jumpstd martsign

CeruleanCityHiddenBerserkGene:
	hiddenitem BERSERK_GENE, EVENT_FOUND_BERSERK_GENE_IN_CERULEAN_CITY

CeruleanCityCooltrainerMText1:
	text "¿La CENTRAL"
	line "ENERGÍA de KANTO?"

	para "Está al final de"
	line "la RUTA 9, el"

	para "camino que hay"
	line "al este de aquí."

	para "Creo que hubo"
	line "algún tipo de"
	cont "accidente allí."
	done

CeruleanCityCooltrainerMText2:
	text "¿Vas a atrapar"
	line "todos los tipos de"
	cont "#MON?"

	para "Parece un gran"
	line "desafío, pero será"
	cont "divertido."
	done

CeruleanCitySuperNerdText:
	text "El CABO que está"
	line "al norte es ideal"

	para "para una cita a"
	line "ciegas."
	cont "¡Es tan romántico!"
	done

CeruleanCitySlowbroText:
	text "SLOWBRO: ¿Slow?"
	done

CeruleanCityCooltrainerFText1:
	text "¡Mi SLOWBRO y yo"
	line "formamos un equipo"
	cont "impresionante!"
	done

CeruleanCityCooltrainerFText2:
	text "¡SLOWBRO, enséñame"
	line "tu CONFUSIÓN!"
	done

CeruleanCityCooltrainerFText3:
	text "…"
	done

CeruleanCityFisherText:
	text "Soy un gran segui-"
	line "dor de MISTY, la"

	para "LÍDER de GIMNASIO"
	line "de CIUDAD CELESTE."
	done

CeruleanCityFisherRocketTipText:
	text "Vi a ese tipo"
	line "sospechoso de"

	para "camino al CABO de"
	line "CIUDAD CELESTE."
	done

CeruleanCityYoungsterText1:
	text "Antes había una"
	line "cueva aquí que"

	para "tenía #MON"
	line "realmente fuertes."
	done

CeruleanCityYoungsterText2:
	text "¡Caray!"

	para "Mi BUSCAOBJETOS"
	line "responde…"
	done

CeruleanCitySignText:
	text "CIUDAD CELESTE"

	para "Una misteriosa"
	line "aura azulada la"
	cont "rodea"
	done

CeruleanGymSignText:
	text "LÍDER DEL GIMNASIO"
	line "#MON DE CIUDAD"
	cont "CELESTE: MISTY"

	para "La sirena poco"
	line "femenina"
	done

CeruleanBikeShopSignText:
	text "Aquí hay una nota…"

	para "La TIENDA DE BICIS"
	line "se ha trasladado a"

	para "CIUDAD TRIGAL, en"
	line "JOHTO…"
	done

CeruleanPoliceSignText:
	text "Aquí hay una nota…"

	para "¡Acaba con los"
	line "ladrones y haz que"

	para "la ciudad sea más"
	line "grata y alegre!"

	para "POLICÍA C. CELESTE"
	done

CeruleanCapeSignText:
	text "Hacia el"
	line "CABO CELESTE"
	done

CeruleanLockedDoorText:
	text "Está cerrado…"
	done

CeruleanCity_MapEvents:
	db 0, 0 ; filler

	db 6 ; warp events
	warp_event  7, 15, CERULEAN_GYM_BADGE_SPEECH_HOUSE, 1
	warp_event 28, 17, CERULEAN_POLICE_STATION, 1
	warp_event 13, 19, CERULEAN_TRADE_SPEECH_HOUSE, 1
	warp_event 19, 21, CERULEAN_POKECENTER_1F, 1
	warp_event 30, 23, CERULEAN_GYM, 1
	warp_event 25, 29, CERULEAN_MART, 2

	db 0 ; coord events

	db 9 ; bg events
	bg_event 23, 23, BGEVENT_READ, CeruleanCitySign
	bg_event 27, 25, BGEVENT_READ, CeruleanGymSign
	bg_event 11, 29, BGEVENT_READ, CeruleanBikeShopSign
	bg_event 25, 17, BGEVENT_READ, CeruleanPoliceSign
	bg_event 23,  7, BGEVENT_READ, CeruleanCapeSign
	bg_event 14, 29, BGEVENT_READ, CeruleanLockedDoor
	bg_event 20, 21, BGEVENT_READ, CeruleanCityPokecenterSign
	bg_event 26, 29, BGEVENT_READ, CeruleanCityMartSign
	bg_event  2, 12, BGEVENT_ITEM, CeruleanCityHiddenBerserkGene

	db 6 ; object events
	object_event 15, 23, SPRITE_COOLTRAINER_M, SPRITEMOVEDATA_WANDER, 2, 2, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, CeruleanCityCooltrainerMScript, -1
	object_event 23, 15, SPRITE_SUPER_NERD, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, CeruleanCitySuperNerdScript, -1
	object_event 20, 24, SPRITE_SLOWPOKE, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, CeruleanCitySlowbro, -1
	object_event 21, 24, SPRITE_COOLTRAINER_F, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, CeruleanCityCooltrainerFScript, -1
	object_event 30, 26, SPRITE_FISHER, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 1, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, CeruleanCityFisherScript, -1
	object_event  6, 12, SPRITE_YOUNGSTER, SPRITEMOVEDATA_SPINRANDOM_SLOW, 1, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, CeruleanCityYoungsterScript, -1
