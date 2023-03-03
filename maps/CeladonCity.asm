	object_const_def ; object_event constants
	const CELADONCITY_FISHER
	const CELADONCITY_POLIWAG
	const CELADONCITY_TEACHER1
	const CELADONCITY_GRAMPS1
	const CELADONCITY_GRAMPS2
	const CELADONCITY_YOUNGSTER1
	const CELADONCITY_YOUNGSTER2
	const CELADONCITY_TEACHER2
	const CELADONCITY_LASS

CeladonCity_MapScripts:
	db 0 ; scene scripts

	db 1 ; callbacks
	callback MAPCALLBACK_NEWMAP, .FlyPoint

.FlyPoint:
	setflag ENGINE_FLYPOINT_CELADON
	return

CeladonCityFisherScript:
	jumptextfaceplayer CeladonCityFisherText

CeladonCityPoliwrath:
	opentext
	writetext CeladonCityPoliwrathText
	cry POLIWRATH
	waitbutton
	closetext
	end

CeladonCityTeacher1Script:
	jumptextfaceplayer CeladonCityTeacher1Text

CeladonCityGramps1Script:
	jumptextfaceplayer CeladonCityGramps1Text

CeladonCityGramps2Script:
	jumptextfaceplayer CeladonCityGramps2Text

CeladonCityYoungster1Script:
	jumptextfaceplayer CeladonCityYoungster1Text

CeladonCityYoungster2Script:
	jumptextfaceplayer CeladonCityYoungster2Text

CeladonCityTeacher2Script:
	jumptextfaceplayer CeladonCityTeacher2Text

CeladonCityLassScript:
	jumptextfaceplayer CeladonCityLassText

CeladonCitySign:
	jumptext CeladonCitySignText

CeladonGymSign:
	jumptext CeladonGymSignText

CeladonCityDeptStoreSign:
	jumptext CeladonCityDeptStoreSignText

CeladonCityMansionSign:
	jumptext CeladonCityMansionSignText

CeladonCityGameCornerSign:
	jumptext CeladonCityGameCornerSignText

CeladonCityTrainerTips:
	jumptext CeladonCityTrainerTipsText

CeladonCityPokecenterSign:
	jumpstd pokecentersign

CeladonCityHiddenPpUp:
	hiddenitem PP_UP, EVENT_CELADON_CITY_HIDDEN_PP_UP

CeladonCityFisherText:
	text "Este POLIWRATH es"
	line "mi compañero."

	para "Me pregunto si"
	line "algún día"

	para "evolucionará en"
	line "una rana #MON."
	done

CeladonCityPoliwrathText:
	text "POLIWRATH: ¡Polii!"
	done

CeladonCityTeacher1Text:
	text "Volví a perder en"
	line "las tragaperras."

	para "Las chicas también"
	line "jugamos a las"

	para "tragaperras."
	line "Prueba tú también."
	done

CeladonCityGramps1Text:
	text "Últimamente han"
	line "aparecido GRIMER."

	para "¿Ves esa charca"
	line "que hay delante de"

	para "la casa? Ahí viven"
	line "GRIMER."

	para "¿De dónde han"
	line "venido? Es un"
	cont "grave problema…"
	done

CeladonCityGramps2Text:
	text "¡Bravo! ¡Este"
	line "GIMNASIO es"

	para "genial! ¡Es sólo"
	line "para chicas!"
	done

CeladonCityYoungster1Text:
	text "¿Te cuento un"
	line "secreto?"

	para "La MANSIÓN AZULONA"
	line "tiene una puerta"
	cont "trasera secreta."
	done

CeladonCityYoungster2Text:
	text "Hay un concurso"
	line "de tragones en el"
	cont "restaurante."

	para "Sólo verlo hace"
	line "que me sienta"
	cont "lleno…"
	done

CeladonCityTeacher2Text:
	text "El C. COMERCIAL"
	line "de CIUDAD AZULONA"

	para "dispone de los"
	line "mejores artículos."

	para "Si no encuentras"
	line "algo aquí, no lo"

	para "encontrarás en"
	line "ningún otro sitio."

	para "¡Vaya…! Parezco"
	line "una vendedora."
	done

CeladonCityLassText_Mobile:
; unused
	text "¡Me encanta estar"
	line "rodeada de grandes"
	cont "edificios!"

	para "¿No es cierto que"
	line "el CENTRO #MON"

	para "de TRIGAL es ahora"
	line "mucho más grande?"

	para "¡Está tan cuidado!"
	line "Ojalá tuviéramos"

	para "un lugar igual en"
	line "KANTO…"
	done

CeladonCityLassText:
	text "Mirar al suelo"
	line "mientras camino"
	cont "me marea."
	done

CeladonCitySignText:
	text "CIUDAD AZULONA"

	para "La ciudad de los"
	line "sueños de arco"
	cont "iris"
	done

CeladonGymSignText:
	text "LÍDER DEL GIMNASIO"
	line "#MON DE CIUDAD"
	cont "AZULONA: ERIKA"

	para "La princesa amante"
	line "de la naturaleza"
	done

CeladonCityDeptStoreSignText:
	text "¡Encuentra lo que"
	line "necesitas en el"

	para "CENTRO COMERCIAL"
	line "de CIUDAD AZULONA!"
	done

CeladonCityMansionSignText:
	text "MANSIÓN AZULONA"
	done

CeladonCityGameCornerSignText:
	text "CASINO DE CIUDAD"
	line "AZULONA: Zona de"
	cont "juego para todos"
	done

CeladonCityTrainerTipsText:
	text "PISTAS ENTRENADOR"

	para "PROTEC. ESP"
	line "protege a los"

	para "#MON de"
	line "ATAQUES ESPECIALES"
	cont "como fuego y agua."

	para "¡Consigue los"
	line "objetos en el"

	para "CENTRO COMERCIAL"
	line "de CIUDAD AZULONA!"
	done

CeladonCity_MapEvents:
	db 0, 0 ; filler

	db 9 ; warp events
	warp_event  4,  9, CELADON_DEPT_STORE_1F, 1
	warp_event 16,  9, CELADON_MANSION_1F, 1
	warp_event 16,  3, CELADON_MANSION_1F, 3
	warp_event 17,  3, CELADON_MANSION_1F, 3
	warp_event 29,  9, CELADON_POKECENTER_1F, 1
	warp_event 18, 19, CELADON_GAME_CORNER, 1
	warp_event 23, 19, CELADON_GAME_CORNER_PRIZE_ROOM, 1
	warp_event 10, 29, CELADON_GYM, 1
	warp_event 25, 29, CELADON_CAFE, 1

	db 0 ; coord events

	db 8 ; bg events
	bg_event 23, 21, BGEVENT_READ, CeladonCitySign
	bg_event 11, 31, BGEVENT_READ, CeladonGymSign
	bg_event  6,  9, BGEVENT_READ, CeladonCityDeptStoreSign
	bg_event 13,  9, BGEVENT_READ, CeladonCityMansionSign
	bg_event 19, 21, BGEVENT_READ, CeladonCityGameCornerSign
	bg_event 29, 21, BGEVENT_READ, CeladonCityTrainerTips
	bg_event 30,  9, BGEVENT_READ, CeladonCityPokecenterSign
	bg_event 37, 21, BGEVENT_ITEM, CeladonCityHiddenPpUp

	db 9 ; object events
	object_event 26, 11, SPRITE_FISHER, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, CeladonCityFisherScript, -1
	object_event 27, 11, SPRITE_POLIWAG, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, CeladonCityPoliwrath, -1
	object_event 20, 24, SPRITE_TEACHER, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 2, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, CeladonCityTeacher1Script, -1
	object_event 14, 16, SPRITE_GRAMPS, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, CeladonCityGramps1Script, -1
	object_event  8, 31, SPRITE_GRAMPS, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, CeladonCityGramps2Script, -1
	object_event 18, 13, SPRITE_YOUNGSTER, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 2, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, CeladonCityYoungster1Script, -1
	object_event 24, 33, SPRITE_YOUNGSTER, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, CeladonCityYoungster2Script, -1
	object_event  6, 14, SPRITE_TEACHER, SPRITEMOVEDATA_WANDER, 2, 2, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, CeladonCityTeacher2Script, -1
	object_event  7, 22, SPRITE_LASS, SPRITEMOVEDATA_WALK_UP_DOWN, 0, 2, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, CeladonCityLassScript, -1
