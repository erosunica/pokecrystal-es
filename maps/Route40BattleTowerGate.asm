	object_const_def ; object_event constants
	const ROUTE40BATTLETOWERGATE_ROCKER
	const ROUTE40BATTLETOWERGATE_TWIN

Route40BattleTowerGate_MapScripts:
	db 0 ; scene scripts

	db 1 ; callbacks
	callback MAPCALLBACK_OBJECTS, .ShowSailor

.ShowSailor:
	clearevent EVENT_BATTLE_TOWER_OUTSIDE_SAILOR
	return

Route40BattleTowerGateRockerScript:
	jumptextfaceplayer Route40BattleTowerGateRockerText

Route40BattleTowerGateTwinScript:
	jumptextfaceplayer Route40BattleTowerGateTwinText

UnknownText_0x9f66f:
	text "¿También has"
	line "venido a ver la"
	cont "TORRE BATALLA?"

	para "Pero imagino que"
	line "no puedes entrar"
	cont "todavía."
	done

UnknownText_0x9f6ba:
	text "TORRE BATALLA ha"
	line "abierto."

	para "Quiero ir, pero"
	line "todavía no he"

	para "ideado una frase"
	line "para cuando gane."
	done

Route40BattleTowerGateRockerText:
	text "¿Vas a la TORRE"
	line "BATALLA?"

	para "Es un secreto,"
	line "pero si ganas"

	para "muchas veces"
	line "podrás conseguir"

	para "regalos"
	line "especiales."
	done

UnknownText_0x9f783:
	text "Voy a entrenar mi"
	line "#MON y así"

	para "estaré listo para"
	line "la TORRE BATALLA."
	done

Route40BattleTowerGateTwinText:
	text "Los niveles de los"
	line "#MON que quiero"

	para "usar son todos"
	line "diferentes."

	para "¡Tengo que"
	line "entrenarlos ahora!"
	done

Route40BattleTowerGate_MapEvents:
	db 0, 0 ; filler

	db 4 ; warp events
	warp_event  4,  7, ROUTE_40, 1
	warp_event  5,  7, ROUTE_40, 1
	warp_event  4,  0, BATTLE_TOWER_OUTSIDE, 1
	warp_event  5,  0, BATTLE_TOWER_OUTSIDE, 2

	db 0 ; coord events

	db 0 ; bg events

	db 2 ; object events
	object_event  3,  3, SPRITE_ROCKER, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, Route40BattleTowerGateRockerScript, EVENT_BATTLE_TOWER_OUTSIDE_SAILOR
	object_event  7,  5, SPRITE_TWIN, SPRITEMOVEDATA_WALK_UP_DOWN, 0, 1, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, Route40BattleTowerGateTwinScript, -1
