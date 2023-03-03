	object_const_def ; object_event constants
	const VIOLETCITY_EARL
	const VIOLETCITY_LASS
	const VIOLETCITY_SUPER_NERD
	const VIOLETCITY_GRAMPS
	const VIOLETCITY_YOUNGSTER
	const VIOLETCITY_FRUIT_TREE
	const VIOLETCITY_POKE_BALL1
	const VIOLETCITY_POKE_BALL2

VioletCity_MapScripts:
	db 0 ; scene scripts

	db 1 ; callbacks
	callback MAPCALLBACK_NEWMAP, .FlyPoint

.FlyPoint:
	setflag ENGINE_FLYPOINT_VIOLET
	return

VioletCityEarlScript:
	applymovement VIOLETCITY_EARL, VioletCitySpinningEarl_MovementData
	faceplayer
	opentext
	writetext Text_EarlAsksIfYouBeatFalkner
	yesorno
	iffalse .FollowEarl
	sjump .PointlessJump

.PointlessJump:
	writetext Text_VeryNiceIndeed
	waitbutton
	closetext
	end

.FollowEarl:
	writetext Text_FollowEarl
	waitbutton
	closetext
	playmusic MUSIC_SHOW_ME_AROUND
	follow VIOLETCITY_EARL, PLAYER
	applymovement VIOLETCITY_EARL, VioletCityFollowEarl_MovementData
	turnobject PLAYER, UP
	applymovement VIOLETCITY_EARL, VioletCitySpinningEarl_MovementData
	stopfollow
	special RestartMapMusic
	opentext
	writetext Text_HereTeacherIAm
	waitbutton
	closetext
	applymovement VIOLETCITY_EARL, VioletCitySpinningEarl_MovementData
	applymovement VIOLETCITY_EARL, VioletCityFinishFollowEarl_MovementData
	playsound SFX_ENTER_DOOR
	disappear VIOLETCITY_EARL
	clearevent EVENT_EARLS_ACADEMY_EARL
	waitsfx
	end

VioletCityLassScript:
	jumptextfaceplayer VioletCityLassText

VioletCitySuperNerdScript:
	jumptextfaceplayer VioletCitySuperNerdText

VioletCityGrampsScript:
	jumptextfaceplayer VioletCityGrampsText

VioletCityYoungsterScript:
	jumptextfaceplayer VioletCityYoungsterText

VioletCitySign:
	jumptext VioletCitySignText

VioletGymSign:
	jumptext VioletGymSignText

SproutTowerSign:
	jumptext SproutTowerSignText

EarlsPokemonAcademySign:
	jumptext EarlsPokemonAcademySignText

VioletCityPokecenterSign:
	jumpstd pokecentersign

VioletCityMartSign:
	jumpstd martsign

VioletCityPPUp:
	itemball PP_UP

VioletCityRareCandy:
	itemball RARE_CANDY

VioletCityFruitTree:
	fruittree FRUITTREE_VIOLET_CITY

VioletCityHiddenHyperPotion:
	hiddenitem HYPER_POTION, EVENT_VIOLET_CITY_HIDDEN_HYPER_POTION

VioletCityFollowEarl_MovementData:
	big_step DOWN
	big_step DOWN
	turn_head DOWN
	turn_head LEFT
	turn_head UP
	turn_head RIGHT
	turn_head DOWN
	turn_head LEFT
	turn_head UP
	turn_head RIGHT
	big_step RIGHT
	big_step RIGHT
	big_step RIGHT
	big_step RIGHT
	big_step RIGHT
	big_step RIGHT
	big_step RIGHT
	big_step RIGHT
	big_step RIGHT
	turn_head RIGHT
	turn_head DOWN
	turn_head LEFT
	turn_head UP
	turn_head RIGHT
	turn_head DOWN
	turn_head LEFT
	turn_head UP
	turn_head RIGHT
	turn_head DOWN
	big_step DOWN
	turn_head DOWN
	turn_head LEFT
	turn_head UP
	turn_head RIGHT
	turn_head DOWN
	turn_head LEFT
	turn_head UP
	turn_head RIGHT
	big_step RIGHT
	big_step RIGHT
	big_step RIGHT
	big_step RIGHT
	big_step RIGHT
	big_step RIGHT
	big_step RIGHT
	big_step RIGHT
	turn_head RIGHT
	turn_head DOWN
	turn_head LEFT
	turn_head UP
	turn_head RIGHT
	turn_head DOWN
	turn_head LEFT
	turn_head UP
	big_step UP
	turn_head DOWN
	step_end

VioletCityFinishFollowEarl_MovementData:
	step UP
	step_end

VioletCitySpinningEarl_MovementData:
	turn_head DOWN
	turn_head LEFT
	turn_head UP
	turn_head RIGHT
	turn_head DOWN
	turn_head LEFT
	turn_head UP
	turn_head RIGHT
	turn_head DOWN
	turn_head LEFT
	turn_head UP
	turn_head RIGHT
	turn_head DOWN
	step_end

Text_EarlAsksIfYouBeatFalkner:
	text "¡Hola! ¿Entrenas"
	line "#MON? ¿Has"

	para "ganado al LÍDER"
	line "del GIMNASIO?"
	done

Text_VeryNiceIndeed:
	text "¡Oh, la, la!"
	line "¡Muy bien!"
	done

Text_FollowEarl:
	text "¿Es verdad? ¡Pues"
	line "tú estudiarás!"
	cont "¡Sígueme!"
	done

Text_HereTeacherIAm:
	text "El profesor soy"
	line "yo. ¡Bien está"
	cont "que aquí estudies!"
	done

VioletCityLassText:
	text "Dicen que en la"
	line "TORRE BELLSPROUT"
	cont "hay fantasmas."

	para "Y que los #MON"
	line "de tipo normal no"

	para "afectan a los"
	line "fantasmas."
	done

VioletCitySuperNerdText:
	text "¿Entrenas #MON?"

	para "¡Si ganas a este"
	line "LÍDER de GIMNASIO,"

	para "estarás en el"
	line "camino del éxito!"
	done

VioletCityGrampsText:
	text "¡PEGASO, del"
	line "GIMNASIO #MON"

	para "de CIUDAD MALVA,"
	line "es magnífico!"

	para "Heredó el"
	line "gimnasio de su"

	para "padre y ha hecho"
	line "un gran trabajo."
	done

VioletCityYoungsterText:
	text "¡He visto un árbol"
	line "que se mueve!"

	para "¡Si lo tocas, se"
	line "retuerce y baila!"

	para "¡Es genial!"
	done

VioletCitySignText:
	text "CIUDAD MALVA"

	para "La ciudad de los"
	line "aromas nostálgicos"
	done

VioletGymSignText:
	text "LÍDER DEL GIMNASIO"
	line "#MON DE CIUDAD"
	cont "MALVA: PEGASO"

	para "El elegante"
	line "maestro de los"
	cont "#MON voladores"
	done

SproutTowerSignText:
	text "TORRE BELLSPROUT"

	para "Vive la vida"
	line "#MON"
	done

EarlsPokemonAcademySignText:
	text "ACADEMIA #MON"
	line "DE PRIMO"
	done

VioletCity_MapEvents:
	db 0, 0 ; filler

	db 9 ; warp events
	warp_event  9, 17, VIOLET_MART, 2
	warp_event 18, 17, VIOLET_GYM, 1
	warp_event 30, 17, EARLS_POKEMON_ACADEMY, 1
	warp_event  3, 15, VIOLET_NICKNAME_SPEECH_HOUSE, 1
	warp_event 31, 25, VIOLET_POKECENTER_1F, 1
	warp_event 21, 29, VIOLET_KYLES_HOUSE, 1
	warp_event 23,  5, SPROUT_TOWER_1F, 1
	warp_event 39, 24, ROUTE_31_VIOLET_GATE, 1
	warp_event 39, 25, ROUTE_31_VIOLET_GATE, 2

	db 0 ; coord events

	db 7 ; bg events
	bg_event 24, 20, BGEVENT_READ, VioletCitySign
	bg_event 15, 17, BGEVENT_READ, VioletGymSign
	bg_event 24,  8, BGEVENT_READ, SproutTowerSign
	bg_event 27, 17, BGEVENT_READ, EarlsPokemonAcademySign
	bg_event 32, 25, BGEVENT_READ, VioletCityPokecenterSign
	bg_event 10, 17, BGEVENT_READ, VioletCityMartSign
	bg_event 37, 14, BGEVENT_ITEM, VioletCityHiddenHyperPotion

	db 8 ; object events
	object_event 13, 16, SPRITE_FISHER, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, VioletCityEarlScript, EVENT_VIOLET_CITY_EARL
	object_event 28, 28, SPRITE_LASS, SPRITEMOVEDATA_WANDER, 2, 2, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, VioletCityLassScript, -1
	object_event 24, 14, SPRITE_SUPER_NERD, SPRITEMOVEDATA_WANDER, 1, 2, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, VioletCitySuperNerdScript, -1
	object_event 17, 20, SPRITE_GRAMPS, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 1, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, VioletCityGrampsScript, -1
	object_event  5, 18, SPRITE_YOUNGSTER, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, VioletCityYoungsterScript, -1
	object_event 14, 29, SPRITE_FRUIT_TREE, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, VioletCityFruitTree, -1
	object_event  4,  1, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, VioletCityPPUp, EVENT_VIOLET_CITY_PP_UP
	object_event 35,  5, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, VioletCityRareCandy, EVENT_VIOLET_CITY_RARE_CANDY
