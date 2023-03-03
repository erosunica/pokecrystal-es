	object_const_def ; object_event constants
	const OAKSLAB_OAK
	const OAKSLAB_SCIENTIST1
	const OAKSLAB_SCIENTIST2
	const OAKSLAB_SCIENTIST3

OaksLab_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

.DummyScene:
	end

Oak:
	faceplayer
	opentext
	checkevent EVENT_OPENED_MT_SILVER
	iftrue .CheckPokedex
	checkevent EVENT_TALKED_TO_OAK_IN_KANTO
	iftrue .CheckBadges
	writetext OakWelcomeKantoText
	promptbutton
	setevent EVENT_TALKED_TO_OAK_IN_KANTO
.CheckBadges:
	readvar VAR_BADGES
	ifequal NUM_BADGES, .OpenMtSilver
	ifequal NUM_JOHTO_BADGES, .Complain
	sjump .AhGood

.CheckPokedex:
	writetext OakLabDexCheckText
	waitbutton
	special ProfOaksPCBoot
	writetext OakLabGoodbyeText
	waitbutton
	closetext
	end

.OpenMtSilver:
	writetext OakOpenMtSilverText
	promptbutton
	setevent EVENT_OPENED_MT_SILVER
	sjump .CheckPokedex

.Complain:
	writetext OakNoKantoBadgesText
	promptbutton
	sjump .CheckPokedex

.AhGood:
	writetext OakYesKantoBadgesText
	promptbutton
	sjump .CheckPokedex

OaksAssistant1Script:
	jumptextfaceplayer OaksAssistant1Text

OaksAssistant2Script:
	jumptextfaceplayer OaksAssistant2Text

OaksAssistant3Script:
	jumptextfaceplayer OaksAssistant3Text

OaksLabBookshelf:
	jumpstd difficultbookshelf

OaksLabPoster1:
	jumptext OaksLabPoster1Text

OaksLabPoster2:
	jumptext OaksLabPoster2Text

OaksLabTrashcan:
	jumptext OaksLabTrashcanText

OaksLabPC:
	jumptext OaksLabPCText

OakWelcomeKantoText:
	text "OAK: ¡<PLAY_G>!"
	line "Qué bueno que"

	para "hayas venido hasta"
	line "KANTO."

	para "¿Qué piensas de"
	line "los entrenadores"

	para "de aquí?"
	line "Fuertes, ¿no?"
	done

OakLabDexCheckText:
	text "¿Qué tal va tu"
	line "#DEX?"

	para "Veamos…"
	done

OakLabGoodbyeText:
	text "Si pasas por aquí,"
	line "espero que vengas"
	cont "a visitarme."
	done

OakOpenMtSilverText:
	text "OAK: ¡Guau! ¡Es"
	line "excelente!"

	para "Conseguiste las"
	line "MEDALLAS de"

	para "GIMNASIO de KANTO."
	line "¡Bien hecho!"

	para "Mi opinión sobre"
	line "ti terminó siendo"
	cont "acertada."

	para "¿Sabes qué,"
	line "<PLAY_G>? Lo"

	para "arreglaré para"
	line "que puedas ir al"
	cont "MT. PLATEADO."

	para "El MT. PLATEADO es"
	line "una gran montaña,"

	para "hogar de muchos"
	line "#MON salvajes."

	para "Es demasiado"
	line "peligroso para un"

	para "entrenador medio."
	line "Pero contigo"

	para "podemos hacer una"
	line "excepción,"
	cont "<PLAY_G>."

	para "Ve a la MESETA"
	line "AÑIL. Puedes"

	para "acceder al MT."
	line "PLATEADO por allí."
	done

OakNoKantoBadgesText:
	text "OAK: ¿Cómo? ¿No"
	line "has conseguido las"
	cont "MEDALLAS DE KANTO?"

	para "Los LÍDERES de los"
	line "GIMNASIOS de KANTO"

	para "son tan fuertes"
	line "como los de JOHTO."

	para "Te aconsejo que"
	line "te enfrentes a"
	cont "ellos."
	done

OakYesKantoBadgesText:
	text "OAK: Ah, estás"
	line "coleccionando las"

	para "MEDALLAS de"
	line "GIMNASIO de KANTO."

	para "Me imagino que es"
	line "duro, pero la"

	para "experiencia te"
	line "será de ayuda."

	para "Ven a verme cuando"
	line "las tengas todas."

	para "Te tengo preparado"
	line "un regalo."

	para "¡Sigue así,"
	line "<PLAY_G>!"
	done

OaksAssistant1Text:
	text "El programa de"
	line "la HORA #MON"

	para "del PROF. OAK"
	line "no se emite aquí,"
	cont "en KANTO."

	para "¡Qué pena! ¡Me"
	line "gustaría oírlo!"
	done

OaksAssistant2Text:
	text "Gracias a tu"
	line "#DEX, la"

	para "investigación del"
	line "profesor está"
	cont "avanzando."
	done

OaksAssistant3Text:
	text "No se lo digas a"
	line "nadie, pero la"

	para "HORA DE OAK no es"
	line "en directo."
	done

OaksLabPoster1Text:
	text "Pulsa START para"
	line "acceder al MENÚ."
	done

OaksLabPoster2Text:
	text "La opción GUARDAR"
	line "está en el MENÚ."

	para "Utilízala con"
	line "frecuencia."
	done

OaksLabTrashcanText:
	text "Aquí no hay nada…"
	done

OaksLabPCText:
	text "Hay un e-mail en"
	line "el PC."

	para "…"

	para "PROF. OAK, ¿cómo"
	line "siguen sus"
	cont "investigaciones?"

	para "Yo sigo perseve-"
	line "rando en lo mío."

	para "He oído rumores"
	line "de que <PLAY_G>"

	para "se está labrando"
	line "buena reputación."

	para "Estoy encantado"
	line "de oír eso."

	para "ELM, de PUEBLO"
	line "PRIMAVERA 8-)"
	done

OaksLab_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event  4, 11, PALLET_TOWN, 3
	warp_event  5, 11, PALLET_TOWN, 3

	db 0 ; coord events

	db 16 ; bg events
	bg_event  6,  1, BGEVENT_READ, OaksLabBookshelf
	bg_event  7,  1, BGEVENT_READ, OaksLabBookshelf
	bg_event  8,  1, BGEVENT_READ, OaksLabBookshelf
	bg_event  9,  1, BGEVENT_READ, OaksLabBookshelf
	bg_event  0,  7, BGEVENT_READ, OaksLabBookshelf
	bg_event  1,  7, BGEVENT_READ, OaksLabBookshelf
	bg_event  2,  7, BGEVENT_READ, OaksLabBookshelf
	bg_event  3,  7, BGEVENT_READ, OaksLabBookshelf
	bg_event  6,  7, BGEVENT_READ, OaksLabBookshelf
	bg_event  7,  7, BGEVENT_READ, OaksLabBookshelf
	bg_event  8,  7, BGEVENT_READ, OaksLabBookshelf
	bg_event  9,  7, BGEVENT_READ, OaksLabBookshelf
	bg_event  4,  0, BGEVENT_READ, OaksLabPoster1
	bg_event  5,  0, BGEVENT_READ, OaksLabPoster2
	bg_event  9,  3, BGEVENT_READ, OaksLabTrashcan
	bg_event  0,  1, BGEVENT_READ, OaksLabPC

	db 4 ; object events
	object_event  4,  2, SPRITE_OAK, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, Oak, -1
	object_event  1,  8, SPRITE_SCIENTIST, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 1, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, OaksAssistant1Script, -1
	object_event  8,  9, SPRITE_SCIENTIST, SPRITEMOVEDATA_WALK_UP_DOWN, 0, 1, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, OaksAssistant2Script, -1
	object_event  1,  4, SPRITE_SCIENTIST, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, OaksAssistant3Script, -1
