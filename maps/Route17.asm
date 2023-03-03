	object_const_def ; object_event constants
	const ROUTE17_BIKER1
	const ROUTE17_BIKER2
	const ROUTE17_BIKER3
	const ROUTE17_BIKER4

Route17_MapScripts:
	db 0 ; scene scripts

	db 1 ; callbacks
	callback MAPCALLBACK_NEWMAP, .AlwaysOnBike

.AlwaysOnBike:
	setflag ENGINE_ALWAYS_ON_BIKE
	setflag ENGINE_DOWNHILL
	return

TrainerBikerCharles:
	trainer BIKER, CHARLES, EVENT_BEAT_BIKER_CHARLES, BikerCharlesSeenText, BikerCharlesBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext BikerCharlesAfterBattleText
	waitbutton
	closetext
	end

TrainerBikerRiley:
	trainer BIKER, RILEY, EVENT_BEAT_BIKER_RILEY, BikerRileySeenText, BikerRileyBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext BikerRileyAfterBattleText
	waitbutton
	closetext
	end

TrainerBikerJoel:
	trainer BIKER, JOEL, EVENT_BEAT_BIKER_JOEL, BikerJoelSeenText, BikerJoelBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext BikerJoelAfterBattleText
	waitbutton
	closetext
	end

TrainerBikerGlenn:
	trainer BIKER, GLENN, EVENT_BEAT_BIKER_GLENN, BikerGlennSeenText, BikerGlennBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext BikerGlennAfterBattleText
	waitbutton
	closetext
	end

Route17HiddenMaxEther:
	hiddenitem MAX_ETHER, EVENT_ROUTE_17_HIDDEN_MAX_ETHER

Route17HiddenMaxElixer:
	hiddenitem MAX_ELIXER, EVENT_ROUTE_17_HIDDEN_MAX_ELIXER

BikerRileySeenText:
	text "¡Eh, tú! Eres de"
	line "JOHTO, ¿verdad?"
	done

BikerRileyBeatenText:
	text "¡Venga, golpea!"
	done

BikerRileyAfterBattleText:
	text "¡No te pases, que"
	line "esto no es JOHTO!"
	done

BikerJoelSeenText:
	text "¡Uau! ¡Qué BICI"
	line "más guay!"
	done

BikerJoelBeatenText:
	text "Pero tú no"
	line "pareces guay…"
	done

BikerJoelAfterBattleText:
	text "Soy guay, pero"
	line "estoy débil. Por"
	cont "eso no lo parezco."

	para "Debería entrenar"
	line "mucho más…"
	done

BikerGlennSeenText:
	text "¡Eh! ¿Un combate"
	line "rapidito?"
	done

BikerGlennBeatenText:
	text "¡Vaya!"
	line "¡Qué vitalidad!"
	done

BikerGlennAfterBattleText:
	text "Montar sin manos"
	line "en el CAMINO de"
	cont "BICIS es muy guay."
	done

BikerCharlesSeenText:
	text "¡Somos estrellas"
	line "de la carretera!"
	done

BikerCharlesBeatenText:
	text "¡Arrrg! ¡Chocar y"
	line "arder!"
	done

BikerCharlesAfterBattleText:
	text "¡Conducir de forma"
	line "imprudente causa"

	para "accidentes! ¡Ten"
	line "cuidado!"
	done

Route17_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event 17, 82, ROUTE_17_ROUTE_18_GATE, 1
	warp_event 17, 83, ROUTE_17_ROUTE_18_GATE, 2

	db 0 ; coord events

	db 2 ; bg events
	bg_event  9, 54, BGEVENT_ITEM, Route17HiddenMaxEther
	bg_event  8, 77, BGEVENT_ITEM, Route17HiddenMaxElixer

	db 4 ; object events
	object_event  4, 17, SPRITE_BIKER, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_TRAINER, 4, TrainerBikerRiley, -1
	object_event  9, 68, SPRITE_BIKER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_TRAINER, 1, TrainerBikerJoel, -1
	object_event  3, 53, SPRITE_BIKER, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_TRAINER, 3, TrainerBikerGlenn, -1
	object_event  6, 80, SPRITE_BIKER, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_TRAINER, 4, TrainerBikerCharles, -1
