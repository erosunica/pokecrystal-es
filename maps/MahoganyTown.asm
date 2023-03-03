MAHOGANYTOWN_RAGECANDYBAR_PRICE EQU 300

	object_const_def ; object_event constants
	const MAHOGANYTOWN_POKEFAN_M
	const MAHOGANYTOWN_GRAMPS
	const MAHOGANYTOWN_FISHER
	const MAHOGANYTOWN_LASS

MahoganyTown_MapScripts:
	db 2 ; scene scripts
	scene_script .DummyScene0 ; SCENE_DEFAULT
	scene_script .DummyScene1 ; SCENE_FINISHED

	db 1 ; callbacks
	callback MAPCALLBACK_NEWMAP, .FlyPoint

.DummyScene0:
	end

.DummyScene1:
	end

.FlyPoint:
	setflag ENGINE_FLYPOINT_MAHOGANY
	return

MahoganyTownTryARageCandyBarScript:
	showemote EMOTE_SHOCK, MAHOGANYTOWN_POKEFAN_M, 15
	applymovement MAHOGANYTOWN_POKEFAN_M, MovementData_0x1900a9
	follow PLAYER, MAHOGANYTOWN_POKEFAN_M
	applymovement PLAYER, MovementData_0x1900a7
	stopfollow
	turnobject PLAYER, RIGHT
	scall RageCandyBarMerchantScript
	applymovement MAHOGANYTOWN_POKEFAN_M, MovementData_0x1900ad
	end

MahoganyTownPokefanMScript:
	faceplayer
RageCandyBarMerchantScript:
	checkevent EVENT_CLEARED_ROCKET_HIDEOUT
	iftrue .ClearedRocketHideout
	scall .SellRageCandyBars
	end

.ClearedRocketHideout:
	opentext
	writetext RageCandyBarMerchantSoldOutText
	waitbutton
	closetext
	end

.SellRageCandyBars:
	opentext
	writetext RageCandyBarMerchantTryOneText
	special PlaceMoneyTopRight
	yesorno
	iffalse .Refused
	checkmoney YOUR_MONEY, MAHOGANYTOWN_RAGECANDYBAR_PRICE
	ifequal HAVE_LESS, .NotEnoughMoney
	giveitem RAGECANDYBAR
	iffalse .NoRoom
	waitsfx
	playsound SFX_TRANSACTION
	takemoney YOUR_MONEY, MAHOGANYTOWN_RAGECANDYBAR_PRICE
	special PlaceMoneyTopRight
	writetext RageCandyBarMerchantSavorItText
	waitbutton
	closetext
	end

.NotEnoughMoney:
	writetext RageCandyBarMerchantNotEnoughMoneyText
	waitbutton
	closetext
	end

.Refused:
	writetext RageCandyBarMerchantRefusedText
	waitbutton
	closetext
	end

.NoRoom:
	writetext RageCandyBarMerchantNoRoomText
	waitbutton
	closetext
	end

MahoganyTownGrampsScript:
	faceplayer
	opentext
	checkevent EVENT_CLEARED_ROCKET_HIDEOUT
	iftrue .ClearedRocketHideout
	writetext MahoganyTownGrampsText
	waitbutton
	closetext
	end

.ClearedRocketHideout:
	writetext MahoganyTownGrampsText_ClearedRocketHideout
	waitbutton
	closetext
	end

MahoganyTownFisherScript:
	jumptextfaceplayer MahoganyTownFisherText

MahoganyTownLassScript:
	jumptextfaceplayer MahoganyTownLassText

MahoganyTownSign:
	jumptext MahoganyTownSignText

MahoganyTownRagecandybarSign:
	jumptext MahoganyTownRagecandybarSignText

MahoganyGymSign:
	jumptext MahoganyGymSignText

MahoganyTownPokecenterSign:
	jumpstd pokecentersign

MovementData_0x1900a4:
	step DOWN
	big_step UP
	turn_head DOWN
MovementData_0x1900a7:
	step LEFT
	step_end

MovementData_0x1900a9:
	step RIGHT
	step DOWN
	turn_head LEFT
	step_end

MovementData_0x1900ad:
	step UP
	turn_head DOWN
	step_end

RageCandyBarMerchantTryOneText:
	text "¿Qué tal, joven?"

	para "Veo que no eres de"
	line "CIUDAD CAOBA."

	para "¡Por no ser de"
	line "aquí, deberías"

	para "probar el CARAMELO"
	line "FURIA!"

	para "¡Puede ser tuyo"
	line "por sólo 300¥!"
	cont "¿Quieres uno?"
	done

RageCandyBarMerchantSavorItText:
	text "¡Bien! ¡Saboréalo!"
	done

RageCandyBarMerchantNotEnoughMoneyText:
	text "No tienes bastante"
	line "dinero."
	done

RageCandyBarMerchantRefusedText:
	text "¡Oh, de acuerdo…!"
	done

RageCandyBarMerchantNoRoomText:
	text "No tienes espacio"
	line "para esto."
	done

RageCandyBarMerchantSoldOutText:
	text "CARAMELOS FURIA"
	line "agotados."

	para "Estoy haciendo las"
	line "maletas. No me"
	cont "molestes, joven."
	done

MahoganyTownGrampsText:
	text "¿Vas al LAGO a ver"
	line "a los violentos"
	cont "GYARADOS?"
	done

MahoganyTownGrampsText_ClearedRocketHideout:
	text "Los MAGIKARP han"
	line "vuelto al LAGO DE"
	cont "LA FURIA."

	para "Son buenas"
	line "noticias para"
	cont "los pescadores."
	done

MahoganyTownFisherText:
	text "Has venido de muy"
	line "lejos. Tómate"

	para "tiempo para ver el"
	line "paisaje."

	para "Deberías ir hacia"
	line "el Norte y ver lo"

	para "que pasa en el"
	line "LAGO DE LA FURIA."
	done

MahoganyTownLassText:
	text "Visita la Tienda"
	line "de la Abuela. Hay"

	para "cosas que sólo"
	line "ella tiene."
	done

MahoganyTownSignText:
	text "PUEBLO CAOBA"

	para "El hogar de"
	line "los Ninja"
	done

MahoganyTownRagecandybarSignText:
	text "¡Si visitas PUEBLO"
	line "CAOBA, prueba un"
	cont "CARAMELO FURIA!"
	done

MahoganyGymSignText:
	text "LÍDER DEL GIMNASIO"
	line "#MON DE PUEBLO"
	cont "CAOBA: FREDO"

	para "El maestro del"
	line "crudo invierno"
	done

MahoganyTown_MapEvents:
	db 0, 0 ; filler

	db 5 ; warp events
	warp_event 11,  7, MAHOGANY_MART_1F, 1
	warp_event 17,  7, MAHOGANY_RED_GYARADOS_SPEECH_HOUSE, 1
	warp_event  6, 13, MAHOGANY_GYM, 1
	warp_event 15, 13, MAHOGANY_POKECENTER_1F, 1
	warp_event  9,  1, ROUTE_43_MAHOGANY_GATE, 3

	db 2 ; coord events
	coord_event 19,  8, SCENE_DEFAULT, MahoganyTownTryARageCandyBarScript
	coord_event 19,  9, SCENE_DEFAULT, MahoganyTownTryARageCandyBarScript

	db 4 ; bg events
	bg_event  1,  5, BGEVENT_READ, MahoganyTownSign
	bg_event  9,  7, BGEVENT_READ, MahoganyTownRagecandybarSign
	bg_event  3, 13, BGEVENT_READ, MahoganyGymSign
	bg_event 16, 13, BGEVENT_READ, MahoganyTownPokecenterSign

	db 4 ; object events
	object_event 19,  8, SPRITE_POKEFAN_M, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, MahoganyTownPokefanMScript, EVENT_MAHOGANY_TOWN_POKEFAN_M_BLOCKS_EAST
	object_event  6,  9, SPRITE_GRAMPS, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 1, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, MahoganyTownGrampsScript, -1
	object_event  6, 14, SPRITE_FISHER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, MahoganyTownFisherScript, EVENT_MAHOGANY_TOWN_POKEFAN_M_BLOCKS_GYM
	object_event 12,  8, SPRITE_LASS, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, MahoganyTownLassScript, EVENT_MAHOGANY_MART_OWNERS
