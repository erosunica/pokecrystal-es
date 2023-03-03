	object_const_def ; object_event constants
	const MRPOKEMONSHOUSE_GENTLEMAN
	const MRPOKEMONSHOUSE_OAK

MrPokemonsHouse_MapScripts:
	db 2 ; scene scripts
	scene_script .MeetMrPokemon ; SCENE_DEFAULT
	scene_script .DummyScene ; SCENE_FINISHED

	db 0 ; callbacks

.MeetMrPokemon:
	prioritysjump .MrPokemonEvent
	end

.DummyScene:
	end

.MrPokemonEvent:
	showemote EMOTE_SHOCK, MRPOKEMONSHOUSE_GENTLEMAN, 15
	turnobject MRPOKEMONSHOUSE_GENTLEMAN, DOWN
	opentext
	writetext MrPokemonIntroText1
	waitbutton
	closetext
	applymovement PLAYER, MrPokemonsHouse_PlayerWalksToMrPokemon
	opentext
	writetext MrPokemonIntroText2
	promptbutton
	waitsfx
	giveitem MYSTERY_EGG
	writetext MrPokemonsHouse_GotEggText
	playsound SFX_KEY_ITEM
	waitsfx
	itemnotify
	setevent EVENT_GOT_MYSTERY_EGG_FROM_MR_POKEMON
	blackoutmod CHERRYGROVE_CITY
	writetext MrPokemonIntroText3
	promptbutton
	turnobject MRPOKEMONSHOUSE_GENTLEMAN, RIGHT
	writetext MrPokemonIntroText4
	promptbutton
	turnobject MRPOKEMONSHOUSE_GENTLEMAN, DOWN
	turnobject MRPOKEMONSHOUSE_OAK, LEFT
	writetext MrPokemonIntroText5
	waitbutton
	closetext
	sjump MrPokemonsHouse_OakScript

MrPokemonsHouse_MrPokemonScript:
	faceplayer
	opentext
	checkitem RED_SCALE
	iftrue .RedScale
	checkevent EVENT_GAVE_MYSTERY_EGG_TO_ELM
	iftrue .AlwaysNewDiscoveries
	writetext MrPokemonText_ImDependingOnYou
	waitbutton
	closetext
	end

.AlwaysNewDiscoveries:
	writetext MrPokemonText_AlwaysNewDiscoveries
	waitbutton
	closetext
	end

.RedScale:
	writetext MrPokemonText_GimmeTheScale
	yesorno
	iffalse .refused
	verbosegiveitem EXP_SHARE
	iffalse .full
	takeitem RED_SCALE
	sjump .AlwaysNewDiscoveries

.refused
	writetext MrPokemonText_Disappointed
	waitbutton
.full
	closetext
	end

MrPokemonsHouse_OakScript:
	playmusic MUSIC_PROF_OAK
	applymovement MRPOKEMONSHOUSE_OAK, MrPokemonsHouse_OakWalksToPlayer
	turnobject PLAYER, RIGHT
	opentext
	writetext MrPokemonsHouse_OakText1
	promptbutton
	waitsfx
	writetext MrPokemonsHouse_GetDexText
	playsound SFX_ITEM
	waitsfx
	setflag ENGINE_POKEDEX
	writetext MrPokemonsHouse_OakText2
	waitbutton
	closetext
	turnobject PLAYER, DOWN
	applymovement MRPOKEMONSHOUSE_OAK, MrPokemonsHouse_OakExits
	playsound SFX_EXIT_BUILDING
	disappear MRPOKEMONSHOUSE_OAK
	waitsfx
	special RestartMapMusic
	pause 15
	turnobject PLAYER, UP
	opentext
	writetext MrPokemonsHouse_MrPokemonHealText
	waitbutton
	closetext
	special FadeBlackQuickly
	special ReloadSpritesNoPalettes
	playmusic MUSIC_HEAL
	special StubbedTrainerRankings_Healings
	special HealParty
	pause 60
	special FadeInQuickly
	special RestartMapMusic
	opentext
	writetext MrPokemonText_ImDependingOnYou
	waitbutton
	closetext
	setevent EVENT_RIVAL_NEW_BARK_TOWN
	setevent EVENT_PLAYERS_HOUSE_1F_NEIGHBOR
	clearevent EVENT_PLAYERS_NEIGHBORS_HOUSE_NEIGHBOR
	setscene SCENE_FINISHED
	setmapscene CHERRYGROVE_CITY, SCENE_CHERRYGROVECITY_MEET_RIVAL
	setmapscene ELMS_LAB, SCENE_ELMSLAB_MEET_OFFICER
	specialphonecall SPECIALCALL_ROBBED
	clearevent EVENT_COP_IN_ELMS_LAB
	checkevent EVENT_GOT_TOTODILE_FROM_ELM
	iftrue .RivalTakesChikorita
	checkevent EVENT_GOT_CHIKORITA_FROM_ELM
	iftrue .RivalTakesCyndaquil
	setevent EVENT_TOTODILE_POKEBALL_IN_ELMS_LAB
	end

.RivalTakesChikorita:
	setevent EVENT_CHIKORITA_POKEBALL_IN_ELMS_LAB
	end

.RivalTakesCyndaquil:
	setevent EVENT_CYNDAQUIL_POKEBALL_IN_ELMS_LAB
	end

MrPokemonsHouse_ForeignMagazines:
	jumptext MrPokemonsHouse_ForeignMagazinesText

MrPokemonsHouse_BrokenComputer:
	jumptext MrPokemonsHouse_BrokenComputerText

MrPokemonsHouse_StrangeCoins:
	jumptext MrPokemonsHouse_StrangeCoinsText

MrPokemonsHouse_PlayerWalksToMrPokemon:
	step RIGHT
	step UP
	step_end

MrPokemonsHouse_OakWalksToPlayer:
	step DOWN
	step LEFT
	step LEFT
	step_end

MrPokemonsHouse_OakExits:
	step DOWN
	step LEFT
	turn_head DOWN
	step_sleep 2
	step_end

MrPokemonIntroText1:
	text "¡Hola, hola! Debes"
	line "de ser <PLAY_G>."

	para "El PROF. ELM me"
	line "dijo que vendrías."
	done

MrPokemonIntroText2:
	text "Esto es lo que"
	line "quiero que examine"
	cont "el PROF. ELM."
	done

MrPokemonsHouse_GotEggText:
	text "<PLAYER> recibió"
	line "un HUEVO MIST."
	done

MrPokemonIntroText3:
	text "Conozco a una"
	line "pareja que tiene"

	para "una GUARDERÍA"
	line "#MON."

	para "Ellos me dieron"
	line "ese HUEVO."

	para "Como me intrigaba,"
	line "le mandé una carta"
	cont "al PROF. ELM."

	para "El PROF. ELM es la"
	line "máxima autoridad"

	para "en evolución de"
	line "los #MON."
	done

MrPokemonIntroText4:
	text "Hasta el PROF. OAK"
	line "lo reconoce."
	done

MrPokemonIntroText5:
	text "Si tengo razón,"
	line "el PROF. ELM lo"
	cont "sabrá."
	done

MrPokemonsHouse_MrPokemonHealText:
	text "¿Vas a ir a ver"
	line "al PROF. ELM?"

	para "Toma. Tus #MON"
	line "deberían descansar"
	cont "un poco."
	done

MrPokemonText_ImDependingOnYou:
	text "¡Confío en ti!"
	done

MrPokemonText_AlwaysNewDiscoveries:
	text "¡La vida es"
	line "genial! ¡Siempre"

	para "quedan cosas por"
	line "descubrir!"
	done

MrPokemonsHouse_OakText1:
	text "OAK: ¡Ajá! ¡Así"
	line "que eres <PLAY_G>!"

	para "¡Soy OAK! Investi-"
	line "go a los #MON."

	para "Estaba visitando a"
	line "mi viejo amigo el"
	cont "SR. #MON."

	para "Oí que estabas"
	line "haciendo un recado"

	para "para el PROF. ELM,"
	line "así que te esperé"
	cont "aquí."

	para "¡Oh! ¿Qué es esto?"
	line "¡Un #MON raro!"

	para "Veamos…"

	para "Mmm… ¡Ya veo!"

	para "Ya entiendo por"
	line "qué el PROF. ELM"

	para "te dio un #MON"
	line "para este recado."

	para "Los investigadores"
	line "como el PROF. ELM"

	para "y yo somos amigos"
	line "de los #MON."

	para "Se dio cuenta de"
	line "que cuidarías a tu"

	para "#MON con amor"
	line "y cariño."

	para "¡Ah…!"

	para "Pareces ser muy"
	line "responsable."

	para "¿Querrías"
	line "ayudarme?"

	para "¿Ves? Ésta es la"
	line "última versión de"
	cont "la #DEX."

	para "Guarda automática-"
	line "mente datos de los"

	para "#MON que hayas"
	line "visto o capturado."

	para "¡Es una enciclo-"
	line "pedia de alta"
	cont "tecnología!"
	done

MrPokemonsHouse_GetDexText:
	text "¡<PLAYER> recibió"
	line "la #DEX!"
	done

MrPokemonsHouse_OakText2:
	text "¡Ve a conocer"
	line "todos los #MON"

	para "que puedas y com-"
	line "pleta esa #DEX!"

	para "Llevo demasiado"
	line "tiempo aquí."

	para "Tengo que ir a"
	line "CIUDAD TRIGAL por"

	para "mi programa de"
	line "radio."

	para "¡<PLAY_G>,"
	line "cuento contigo!"
	done

MrPokemonText_GimmeTheScale:
	text "¿Mmm? ¡Esa ESCAMA!"
	line "¿Qué es esto?"
	cont "¿Un GYARADOS rojo?"

	para "¡Qué raro! "
	line "Lo quiero…"

	para "¿<PLAY_G>, quieres"
	line "intercambiarlo?"

	para "Puedo ofrecerte"
	line "este REPARTIR EXP"

	para "que me dio el"
	line "PROF. OAK."
	done

MrPokemonText_Disappointed:
	text "Es una pena."
	line "Es realmente"
	cont "raro."
	done

MrPokemonsHouse_ForeignMagazinesText:
	text "Lleno de revistas"
	line "extranjeras."

	para "Ni siquiera puedo"
	line "leer los títulos."
	done

MrPokemonsHouse_BrokenComputerText:
	text "Es un ordenador"
	line "enorme. ¡Mmm!"
	cont "Está estropeado."
	done

MrPokemonsHouse_StrangeCoinsText:
	text "¡Un montón de"
	line "monedas extrañas!"

	para "Quizá sean de"
	line "otro país…"
	done

MrPokemonsHouse_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event  2,  7, ROUTE_30, 2
	warp_event  3,  7, ROUTE_30, 2

	db 0 ; coord events

	db 5 ; bg events
	bg_event  0,  1, BGEVENT_READ, MrPokemonsHouse_ForeignMagazines
	bg_event  1,  1, BGEVENT_READ, MrPokemonsHouse_ForeignMagazines
	bg_event  6,  1, BGEVENT_READ, MrPokemonsHouse_BrokenComputer
	bg_event  7,  1, BGEVENT_READ, MrPokemonsHouse_BrokenComputer
	bg_event  6,  4, BGEVENT_READ, MrPokemonsHouse_StrangeCoins

	db 2 ; object events
	object_event  3,  5, SPRITE_GENTLEMAN, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, MrPokemonsHouse_MrPokemonScript, -1
	object_event  6,  5, SPRITE_OAK, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, ObjectEvent, EVENT_MR_POKEMONS_HOUSE_OAK
