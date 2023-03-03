	object_const_def ; object_event constants
	const GOLDENRODCITY_POKEFAN_M1
	const GOLDENRODCITY_YOUNGSTER1
	const GOLDENRODCITY_COOLTRAINER_F1
	const GOLDENRODCITY_COOLTRAINER_F2
	const GOLDENRODCITY_YOUNGSTER2
	const GOLDENRODCITY_LASS
	const GOLDENRODCITY_GRAMPS
	const GOLDENRODCITY_ROCKETSCOUT
	const GOLDENRODCITY_ROCKET1
	const GOLDENRODCITY_ROCKET2
	const GOLDENRODCITY_ROCKET3
	const GOLDENRODCITY_ROCKET4
	const GOLDENRODCITY_ROCKET5
	const GOLDENRODCITY_ROCKET6
	const GOLDENRODCITY_MOVETUTOR

GoldenrodCity_MapScripts:
	db 0 ; scene scripts

	db 2 ; callbacks
	callback MAPCALLBACK_NEWMAP, .FlyPointAndFloria
	callback MAPCALLBACK_OBJECTS, .MoveTutor

.FlyPointAndFloria:
	setflag ENGINE_FLYPOINT_GOLDENROD
	setflag ENGINE_REACHED_GOLDENROD
	checkevent EVENT_MET_FLORIA
	iftrue .FloriaDone
	clearevent EVENT_FLORIA_AT_SUDOWOODO
.FloriaDone:
	return

.MoveTutor:
	checkevent EVENT_BEAT_ELITE_FOUR
	iffalse .MoveTutorDone
	checkitem COIN_CASE
	iffalse .MoveTutorDisappear
	readvar VAR_WEEKDAY
	ifequal WEDNESDAY, .MoveTutorAppear
	ifequal SATURDAY, .MoveTutorAppear
.MoveTutorDisappear:
	disappear GOLDENRODCITY_MOVETUTOR
	return

.MoveTutorAppear:
	checkflag ENGINE_DAILY_MOVE_TUTOR
	iftrue .MoveTutorDone
	appear GOLDENRODCITY_MOVETUTOR
.MoveTutorDone:
	return

MoveTutorScript:
	faceplayer
	opentext
	writetext GoldenrodCityMoveTutorAskTeachAMoveText
	yesorno
	iffalse .Refused
	special DisplayCoinCaseBalance
	writetext GoldenrodCityMoveTutorAsk4000CoinsOkayText
	yesorno
	iffalse .Refused2
	checkcoins 4000
	ifequal HAVE_LESS, .NotEnoughMoney
	writetext GoldenrodCityMoveTutorWhichMoveShouldITeachText
	loadmenu .MoveMenuHeader
	verticalmenu
	closewindow
	ifequal MOVETUTOR_FLAMETHROWER, .Flamethrower
	ifequal MOVETUTOR_THUNDERBOLT, .Thunderbolt
	ifequal MOVETUTOR_ICE_BEAM, .IceBeam
	sjump .Incompatible

.Flamethrower:
	setval MOVETUTOR_FLAMETHROWER
	writetext GoldenrodCityMoveTutorMoveText
	special MoveTutor
	ifequal FALSE, .TeachMove
	sjump .Incompatible

.Thunderbolt:
	setval MOVETUTOR_THUNDERBOLT
	writetext GoldenrodCityMoveTutorMoveText
	special MoveTutor
	ifequal FALSE, .TeachMove
	sjump .Incompatible

.IceBeam:
	setval MOVETUTOR_ICE_BEAM
	writetext GoldenrodCityMoveTutorMoveText
	special MoveTutor
	ifequal FALSE, .TeachMove
	sjump .Incompatible

.MoveMenuHeader:
	db MENU_BACKUP_TILES ; flags
	menu_coords 0, 2, 15, TEXTBOX_Y - 1
	dw .MenuData
	db 1 ; default option

.MenuData:
	db STATICMENU_CURSOR ; flags
	db 4 ; items
	db "LANZALLAMAS@"
	db "RAYO@"
	db "RAYO HIELO@"
	db "SALIR@"

.Refused:
	writetext GoldenrodCityMoveTutorAwwButTheyreAmazingText
	waitbutton
	closetext
	end

.Refused2:
	writetext GoldenrodCityMoveTutorHmTooBadText
	waitbutton
	closetext
	end

.TeachMove:
	writetext GoldenrodCityMoveTutorIfYouUnderstandYouveMadeItText
	promptbutton
	takecoins 4000
	waitsfx
	playsound SFX_TRANSACTION
	special DisplayCoinCaseBalance
	writetext GoldenrodCityMoveTutorFarewellKidText
	waitbutton
	closetext
	readvar VAR_FACING
	ifequal LEFT, .WalkAroundPlayer
	applymovement GOLDENRODCITY_MOVETUTOR, GoldenrodCityMoveTutorEnterGameCornerMovement
	sjump .GoInside

.WalkAroundPlayer:
	applymovement GOLDENRODCITY_MOVETUTOR, GoldenrodCityMoveTutorWalkAroundPlayerThenEnterGameCornerMovement
.GoInside:
	playsound SFX_ENTER_DOOR
	disappear GOLDENRODCITY_MOVETUTOR
	clearevent EVENT_GOLDENROD_GAME_CORNER_MOVE_TUTOR
	setflag ENGINE_DAILY_MOVE_TUTOR
	waitsfx
	end

.Incompatible:
	writetext GoldenrodCityMoveTutorBButText
	waitbutton
	closetext
	end

.NotEnoughMoney:
	writetext GoldenrodCityMoveTutorYouDontHaveEnoughCoinsText
	waitbutton
	closetext
	end

GoldenrodCityPokefanMScript:
	jumptextfaceplayer GoldenrodCityPokefanMText

GoldenrodCityYoungster1Script:
	jumptextfaceplayer GoldenrodCityYoungster1Text

GoldenrodCityCooltrainerF1Script:
	faceplayer
	opentext
	checkevent EVENT_CLEARED_RADIO_TOWER
	iftrue .ClearedRadioTower
	writetext GoldenrodCityCooltrainerF1Text
	waitbutton
	closetext
	end

.ClearedRadioTower:
	writetext GoldenrodCityCooltrainerF1Text_ClearedRadioTower
	waitbutton
	closetext
	end

GoldenrodCityCooltrainerF2Script:
	faceplayer
	opentext
	checkflag ENGINE_RADIO_CARD
	iftrue .GotRadioCard
	writetext GoldenrodCityCooltrainerF2Text
	waitbutton
	closetext
	end

.GotRadioCard:
	writetext GoldenrodCityCooltrainerF2Text_GotRadioCard
	waitbutton
	closetext
	end

GoldenrodCityYoungster2Script:
	jumptextfaceplayer GoldenrodCityYoungster2Text

GoldenrodCityLassScript:
	jumptextfaceplayer GoldenrodCityLassText

GoldenrodCityGrampsScript:
	jumptextfaceplayer GoldenrodCityGrampsText

GoldenrodCityRocketScoutScript:
	opentext
	writetext GoldenrodCityRocketScoutText1
	promptbutton
	faceplayer
	writetext GoldenrodCityRocketScoutText2
	waitbutton
	closetext
	turnobject GOLDENRODCITY_ROCKETSCOUT, UP
	end

GoldenrodCityRocket1Script:
	jumptextfaceplayer GoldenrodCityRocket1Text

GoldenrodCityRocket2Script:
	jumptextfaceplayer GoldenrodCityRocket2Text

GoldenrodCityRocket3Script:
	jumptextfaceplayer GoldenrodCityRocket3Text

GoldenrodCityRocket4Script:
	jumptextfaceplayer GoldenrodCityRocket4Text

GoldenrodCityRocket5Script:
	jumptextfaceplayer GoldenrodCityRocket5Text

GoldenrodCityRocket6Script:
	jumptextfaceplayer GoldenrodCityRocket6Text

GoldenrodCityStationSign:
	jumptext GoldenrodCityStationSignText

GoldenrodCityRadioTowerSign:
	jumptext GoldenrodCityRadioTowerSignText

GoldenrodDeptStoreSign:
	jumptext GoldenrodDeptStoreSignText

GoldenrodGymSign:
	jumptext GoldenrodGymSignText

GoldenrodCitySign:
	jumptext GoldenrodCitySignText

GoldenrodCityBikeShopSign:
	jumptext GoldenrodCityBikeShopSignText

GoldenrodCityGameCornerSign:
	jumptext GoldenrodCityGameCornerSignText

GoldenrodCityNameRaterSign:
	jumptext GoldenrodCityNameRaterSignText

GoldenrodCityUndergroundSignNorth:
	jumptext GoldenrodCityUndergroundSignNorthText

GoldenrodCityUndergroundSignSouth:
	jumptext GoldenrodCityUndergroundSignSouthText

GoldenrodCityPokecenterSign:
	jumpstd pokecentersign

GoldenrodCityFlowerShopSign:
	jumptext GoldenrodCityFlowerShopSignText

GoldenrodCityMoveTutorEnterGameCornerMovement:
	step RIGHT
	step RIGHT
	step UP
	step_end

GoldenrodCityMoveTutorWalkAroundPlayerThenEnterGameCornerMovement:
	step DOWN
	step RIGHT
	step RIGHT
	step UP
	step UP
	step_end

GoldenrodCityPokefanMText:
	text "Han construido una"
	line "TORRE RADIO nueva"

	para "que sustituye a"
	line "la antigua."
	done

GoldenrodCityYoungster1Text:
	text "Sé que hay una"
	line "nueva TIENDA DE"

	para "BICIS, pero no la"
	line "encuentro."
	done

GoldenrodCityCooltrainerF1Text:
	text "¿Ese hombre de"
	line "negro se ha"

	para "vestido como uno"
	line "del TEAM ROCKET?"
	cont "¡Qué tonto!"
	done

GoldenrodCityCooltrainerF1Text_ClearedRadioTower:
	text "¿Pertenecía ese"
	line "hombre de negro al"

	para "TEAM ROCKET?"
	line "¡Es increíble!"
	done

GoldenrodCityCooltrainerF2Text:
	text "La TORRE RADIO de"
	line "CIUDAD TRIGAL es"
	cont "muy importante."

	para "Ahora están en"
	line "una campaña"
	cont "promocional."

	para "Modificarán tu"
	line "#GEAR para"

	para "que te sirva"
	line "también de radio."
	done

GoldenrodCityCooltrainerF2Text_GotRadioCard:
	text "¡Oh, tu #GEAR"
	line "sirve de radio!"
	done

GoldenrodCityYoungster2Text:
	text "¡Je, je, je…!"

	para "Me he metido en"
	line "líos por jugar en"

	para "el sótano del"
	line "CENTRO COMERCIAL."
	done

GoldenrodCityLassText:
	text "El hombre de esa"
	line "casa evalúa los"

	para "nombres de tus"
	line "#MON."

	para "Y puede cambiar el"
	line "nombre de tus"
	cont "#MON."
	done

GoldenrodCityGrampsText:
	text "¡Uau! Esta ciudad"
	line "es muy grande."

	para "No sé dónde están"
	line "las cosas."
	done

GoldenrodCityRocketScoutText1:
	text "Así que ésta es la"
	line "TORRE RADIO…"
	done

GoldenrodCityRocketScoutText2:
	text "¿Qué quieres, eh?"
	line "¡Fuera!"
	done

GoldenrodCityRocket1Text:
	text "¡Fuera de mi"
	line "camino! ¡Vete!"
	done

GoldenrodCityRocket2Text:
	text "Asaltemos la TORRE"
	line "RADIO…"

	para "¿Qué? ¡Y a ti qué"
	line "te importa!"
	done

GoldenrodCityRocket3Text:
	text "¿Los #MON?"
	line "¡Sólo son"

	para "herramientas para"
	line "ganar dinero!"
	done

GoldenrodCityRocket4Text:
	text "Nuestro sueño se"
	line "cumplirá pronto…"

	para "Ha sido una lucha"
	line "tan larga…"
	done

GoldenrodCityRocket5Text:
	text "¡Eh, tú! ¡No"
	line "recuerdo tu cara!"
	cont "¡Lárgate!"
	done

GoldenrodCityRocket6Text:
	text "¡Prueba el"
	line "verdadero terror"
	cont "del TEAM ROCKET!"
	done

GoldenrodCityStationSignText:
	text "ESTACIÓN DE"
	line "CIUDAD TRIGAL"
	done

GoldenrodCityRadioTowerSignText:
	text "TORRE RADIO"
	line "DE CIUDAD TRIGAL"
	done

GoldenrodDeptStoreSignText:
	text "¡Una gran gama de"
	line "artículos #MON!"

	para "CENTRO COMERCIAL"
	line "DE CIUDAD TRIGAL"
	done

GoldenrodGymSignText:
	text "LÍDER DEL GIMNASIO"
	line "#MON DE CIUDAD"
	cont "TRIGAL: BLANCA"

	para "¡La increíble y"
	line "bella señorita!"
	done

GoldenrodCitySignText:
	text "CIUDAD TRIGAL"

	para "La alegre ciudad"
	line "de rico encanto"
	done

GoldenrodCityBikeShopSignText:
	text "¡El mundo es un"
	line "camino de bicis!"
	cont "TIENDA DE BICIS"
	done

GoldenrodCityGameCornerSignText:
	text "¡Tu zona de juego!"

	para "CASINO DE"
	line "CIUDAD TRIGAL"
	done

GoldenrodCityNameRaterSignText:
	text "INSPECTOR DE MOTES"

	para "Evalúa los motes"
	line "de tus #MON"
	done

GoldenrodCityUndergroundSignNorthText:
	text "ENTRADA"
	line "SUBTERRÁNEA"
	done

GoldenrodCityUndergroundSignSouthText:
	text "ENTRADA"
	line "SUBTERRÁNEA"
	done

GoldenrodCityPokeComCenterSignText:
; unused
	text "¡Consejos móviles!"
	line "CENTRO #COM"
	done

GoldenrodCityFlowerShopSignText:
	text "Un bello florecer"
	line "FLORISTERÍA"
	done

GoldenrodCityMoveTutorAskTeachAMoveText:
	text "Si quieres, puedo"
	line "enseñar increíbles"

	para "movimientos a tus"
	line "#MON."

	para "¿Le enseño un"
	line "nuevo movimiento?"
	done

GoldenrodCityMoveTutorAsk4000CoinsOkayText:
	text "Te costará 4000"
	line "fichas. ¿Vale?"
	done

GoldenrodCityMoveTutorAwwButTheyreAmazingText:
	text "Auu… Pero"
	line "son increíbles…"
	done

GoldenrodCityMoveTutorWhichMoveShouldITeachText:
	text "¡Uajajaja! ¡No lo"
	line "lamentarás!"

	para "¿Qué movimiento"
	line "debo enseñar?"
	done

GoldenrodCityMoveTutorHmTooBadText:
	text "Mm, qué mal."
	line "Tendré que coger"

	para "algo de dinero de"
	line "casa…"
	done

GoldenrodCityMoveTutorIfYouUnderstandYouveMadeItText:
	text "Si comprendes lo"
	line "increíble de este"

	para "movimiento, tu"
	line "entrenamiento será"
	cont "de alto nivel."
	done

GoldenrodCityMoveTutorFarewellKidText:
	text "¡Uajajaja!"
	line "¡Adiós!"
	done

GoldenrodCityMoveTutorBButText:
	text "Pe… Pero…"
	done

GoldenrodCityMoveTutorYouDontHaveEnoughCoinsText:
	text "…No tienes sufi-"
	line "cientes fichas…"
	done

GoldenrodCityMoveTutorMoveText:
	text_start
	done

GoldenrodCity_MapEvents:
	db 0, 0 ; filler

	db 15 ; warp events
	warp_event 24,  7, GOLDENROD_GYM, 1
	warp_event 29, 29, GOLDENROD_BIKE_SHOP, 1
	warp_event 31, 21, GOLDENROD_HAPPINESS_RATER, 1
	warp_event  5, 25, BILLS_FAMILYS_HOUSE, 1
	warp_event  9, 13, GOLDENROD_MAGNET_TRAIN_STATION, 2
	warp_event 29,  5, GOLDENROD_FLOWER_SHOP, 1
	warp_event 33,  9, GOLDENROD_PP_SPEECH_HOUSE, 1
	warp_event 15,  7, GOLDENROD_NAME_RATER, 1
	warp_event 24, 27, GOLDENROD_DEPT_STORE_1F, 1
	warp_event 14, 21, GOLDENROD_GAME_CORNER, 1
	warp_event  5, 15, RADIO_TOWER_1F, 1
	warp_event 19,  1, ROUTE_35_GOLDENROD_GATE, 3
	warp_event  9,  5, GOLDENROD_UNDERGROUND_SWITCH_ROOM_ENTRANCES, 8
	warp_event 11, 29, GOLDENROD_UNDERGROUND_SWITCH_ROOM_ENTRANCES, 5
	warp_event 15, 27, GOLDENROD_POKECENTER_1F, 1

	db 0 ; coord events

	db 12 ; bg events
	bg_event 10, 14, BGEVENT_READ, GoldenrodCityStationSign
	bg_event  4, 17, BGEVENT_READ, GoldenrodCityRadioTowerSign
	bg_event 26, 27, BGEVENT_READ, GoldenrodDeptStoreSign
	bg_event 26,  9, BGEVENT_READ, GoldenrodGymSign
	bg_event 22, 18, BGEVENT_READ, GoldenrodCitySign
	bg_event 28, 30, BGEVENT_READ, GoldenrodCityBikeShopSign
	bg_event 16, 22, BGEVENT_READ, GoldenrodCityGameCornerSign
	bg_event 12,  7, BGEVENT_READ, GoldenrodCityNameRaterSign
	bg_event  8,  6, BGEVENT_READ, GoldenrodCityUndergroundSignNorth
	bg_event 12, 30, BGEVENT_READ, GoldenrodCityUndergroundSignSouth
	bg_event 16, 27, BGEVENT_UP, GoldenrodCityPokecenterSign
	bg_event 30,  6, BGEVENT_READ, GoldenrodCityFlowerShopSign

	db 15 ; object events
	object_event  7, 18, SPRITE_POKEFAN_M, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, GoldenrodCityPokefanMScript, EVENT_GOLDENROD_CITY_CIVILIANS
	object_event 30, 17, SPRITE_YOUNGSTER, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, GoldenrodCityYoungster1Script, EVENT_GOLDENROD_CITY_CIVILIANS
	object_event 12, 16, SPRITE_COOLTRAINER_F, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, GoldenrodCityCooltrainerF1Script, EVENT_GOLDENROD_CITY_CIVILIANS
	object_event 20, 26, SPRITE_COOLTRAINER_F, SPRITEMOVEDATA_WANDER, 1, 2, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, GoldenrodCityCooltrainerF2Script, EVENT_GOLDENROD_CITY_CIVILIANS
	object_event 19, 17, SPRITE_YOUNGSTER, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, GoldenrodCityYoungster2Script, EVENT_GOLDENROD_CITY_CIVILIANS
	object_event 17, 10, SPRITE_LASS, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 2, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, GoldenrodCityLassScript, EVENT_GOLDENROD_CITY_CIVILIANS
	object_event 11, 27, SPRITE_GRAMPS, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 1, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, GoldenrodCityGrampsScript, EVENT_GOLDENROD_CITY_CIVILIANS
	object_event  4, 16, SPRITE_ROCKET, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, GoldenrodCityRocketScoutScript, EVENT_GOLDENROD_CITY_ROCKET_SCOUT
	object_event 28, 20, SPRITE_ROCKET, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, GoldenrodCityRocket1Script, EVENT_GOLDENROD_CITY_ROCKET_TAKEOVER
	object_event  8, 15, SPRITE_ROCKET, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, GoldenrodCityRocket2Script, EVENT_GOLDENROD_CITY_ROCKET_TAKEOVER
	object_event 16, 23, SPRITE_ROCKET, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, GoldenrodCityRocket3Script, EVENT_RADIO_TOWER_ROCKET_TAKEOVER
	object_event 29, 20, SPRITE_ROCKET, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, GoldenrodCityRocket4Script, EVENT_RADIO_TOWER_ROCKET_TAKEOVER
	object_event 29,  7, SPRITE_ROCKET, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, GoldenrodCityRocket5Script, EVENT_RADIO_TOWER_ROCKET_TAKEOVER
	object_event 31, 10, SPRITE_ROCKET, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, GoldenrodCityRocket6Script, EVENT_RADIO_TOWER_ROCKET_TAKEOVER
	object_event 12, 22, SPRITE_POKEFAN_M, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, MoveTutorScript, EVENT_GOLDENROD_CITY_MOVE_TUTOR
