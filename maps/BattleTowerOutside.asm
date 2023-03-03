	object_const_def ; object_event constants
	const BATTLETOWEROUTSIDE_STANDING_YOUNGSTER
	const BATTLETOWEROUTSIDE_BUENA
	const BATTLETOWEROUTSIDE_SAILOR
	const BATTLETOWEROUTSIDE_LASS

BattleTowerOutside_MapScripts:
	db 0 ; scene scripts

	db 2 ; callbacks
	callback MAPCALLBACK_TILES, .Callback1
	callback MAPCALLBACK_OBJECTS, .Callback2

.Callback1:
	return

.Callback2:
	clearevent EVENT_BATTLE_TOWER_OUTSIDE_SAILOR
	return

BattleTowerOutsideYoungsterScript:
	jumptextfaceplayer BattleTowerOutsideYoungsterText

BattleTowerOutsideBuenaScript:
	jumptextfaceplayer BattleTowerOutsideBuenaText

BattleTowerOutsideSailorScript:
	jumptextfaceplayer BattleTowerOutsideSailorText

BattleTowerOutsideSign:
	jumptext BattleTowerOutsideSignText

BattleTowerOutsideYoungsterText_NotYetOpen:
; unreferenced
	text "¡Guau, la TORRE es"
	line "inmensa!"

	para "Me duele el cuello"
	line "de alzar la vista."
	done

BattleTowerOutsideYoungsterText_Mobile:
; unreferenced
	text "¡Guau, la TORRE"
	line "BATALLA es enorme!"

	para "Habiendo tanto"
	line "entrenador ahí"

	para "dentro, también"
	line "debe de haber una"

	para "gran variedad de"
	line "#MON."
	done

BattleTowerOutsideYoungsterText:
	text "¡Guau, la TORRE"
	line "BATALLA es enorme!"

	para "¡Debe de haber"
	line "muchas clases de "
	cont "#MON dentro!"
	done

BattleTowerOutsideBuenaText_NotYetOpen:
; unreferenced
	text "¿Pero qué es lo"
	line "que hacen aquí?"

	para "Si es lo que dice"
	line "el nombre, me"

	para "imagino que serán"
	line "batallas #MON."
	done

BattleTowerOutsideBuenaText:
	text "Sólo puedes usar"
	line "tres #MON."

	para "Es tan difícil"
	line "decidir qué tres"

	para "deberían ir a la"
	line "batalla…"
	done

BattleTowerOutsideSailorText_Mobile:
; unreferenced
	text "Jejeje… Me"
	line "escapé del trabajo"
	cont "para venir."

	para "¡No abandonaré"
	line "hasta que consiga"
	cont "ser LÍDER!"
	done

BattleTowerOutsideSailorText:
	text "Je, je… Me escapé"
	line "del trabajo."

	para "¡No puedo achicar"
	line "agua hasta que"
	cont "haya ganado!"

	para "Tengo que ganarlo"
	line "todo. ¡Debo"
	cont "ganarlo!"
	done

BattleTowerOutsideSignText_NotYetOpen:
; unused; originally shown when the Battle Tower was closed
	text "TORRE BATALLA"
	done

BattleTowerOutsideSignText:
	text "TORRE BATALLA"

	para "¡Acepta el desafío"
	line "definitivo!"
	done

BattleTowerOutsideText_DoorsClosed:
; unused; originally shown when the Battle Tower was closed
	text "La TORRE BATALLA"
	line "está cerrada…"
	done

BattleTowerOutsideText_DoorsOpen:
; unused; originally shown after the Battle Tower opened
	text "¡Está abierta!"
	done

BattleTowerOutside_MapEvents:
	db 0, 0 ; filler

	db 4 ; warp events
	warp_event  8, 21, ROUTE_40_BATTLE_TOWER_GATE, 3
	warp_event  9, 21, ROUTE_40_BATTLE_TOWER_GATE, 4
	warp_event  8,  9, BATTLE_TOWER_1F, 1
	warp_event  9,  9, BATTLE_TOWER_1F, 2

	db 0 ; coord events

	db 1 ; bg events
	bg_event 10, 10, BGEVENT_READ, BattleTowerOutsideSign

	db 4 ; object events
	object_event  6, 12, SPRITE_STANDING_YOUNGSTER, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, BattleTowerOutsideYoungsterScript, -1
	object_event 13, 11, SPRITE_BUENA, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, BattleTowerOutsideBuenaScript, -1
	object_event 12, 18, SPRITE_SAILOR, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 1, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, BattleTowerOutsideSailorScript, EVENT_BATTLE_TOWER_OUTSIDE_SAILOR
	object_event 12, 24, SPRITE_LASS, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, ObjectEvent, -1
