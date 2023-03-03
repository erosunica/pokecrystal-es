	object_const_def ; object_event constants
	const ROUTE9_YOUNGSTER1
	const ROUTE9_LASS1
	const ROUTE9_YOUNGSTER2
	const ROUTE9_LASS2
	const ROUTE9_POKEFAN_M1
	const ROUTE9_POKEFAN_M2

Route9_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

TrainerCamperDean:
	trainer CAMPER, DEAN, EVENT_BEAT_CAMPER_DEAN, CamperDeanSeenText, CamperDeanBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext CamperDeanAfterBattleText
	waitbutton
	closetext
	end

TrainerPicnickerHeidi:
	trainer PICNICKER, HEIDI, EVENT_BEAT_PICNICKER_HEIDI, PicnickerHeidiSeenText, PicnickerHeidiBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext PicnickerHeidiAfterBattleText
	waitbutton
	closetext
	end

TrainerCamperSid:
	trainer CAMPER, SID, EVENT_BEAT_CAMPER_SID, CamperSidSeenText, CamperSidBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext CamperSidAfterBattleText
	waitbutton
	closetext
	end

TrainerPicnickerEdna:
	trainer PICNICKER, EDNA, EVENT_BEAT_PICNICKER_EDNA, PicnickerEdnaSeenText, PicnickerEdnaBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext PicnickerEdnaAfterBattleText
	waitbutton
	closetext
	end

TrainerHikerTim:
	trainer HIKER, TIM, EVENT_BEAT_HIKER_TIM, HikerTimSeenText, HikerTimBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext HikerTimAfterBattleText
	waitbutton
	closetext
	end

TrainerHikerSidney:
	trainer HIKER, SIDNEY, EVENT_BEAT_HIKER_SIDNEY, HikerSidneySeenText, HikerSidneyBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext HikerSidneyAfterBattleText
	waitbutton
	closetext
	end

Route9Sign:
	jumptext Route9SignText

Route9HiddenEther:
	hiddenitem ETHER, EVENT_ROUTE_9_HIDDEN_ETHER

CamperDeanSeenText:
	text "He venido a"
	line "explorar el"
	cont "TÚNEL ROCA."
	done

CamperDeanBeatenText:
	text "¡Uau! Peligro."
	done

CamperDeanAfterBattleText:
	text "Hirieron a mis"
	line "#MON antes de"

	para "entrar al TÚNEL"
	line "ROCA."

	para "Será mejor que los"
	line "lleve ahora mismo"

	para "a un CENTRO"
	line "#MON."
	done

PicnickerHeidiSeenText:
	text "¿Has ido alguna"
	line "vez de picnic?"
	cont "¡Es muy divertido!"
	done

PicnickerHeidiBeatenText:
	text "¡Ohhhh!"
	done

PicnickerHeidiAfterBattleText:
	text "Hacemos dulces y"
	line "los repartimos"

	para "entre todos."
	line "¡Son deliciosos!"
	done

CamperSidSeenText:
	text "¡Eh, tú!"
	line "¡No tires basura!"
	done

CamperSidBeatenText:
	text "Sólo estaba"
	line "diciendo que…"
	done

CamperSidAfterBattleText:
	text "Perdón. No estabas"
	line "tirando basura."
	cont "Me he equivocado."
	done

PicnickerEdnaSeenText:
	text "La gente no"
	line "debería dejar la"
	cont "basura por ahí."
	done

PicnickerEdnaBeatenText:
	text "¡Ohh…! Perdí…"
	done

PicnickerEdnaAfterBattleText:
	text "Ahorrar energía es"
	line "importante, pero"

	para "el entorno aún lo"
	line "es más."
	done

HikerTimSeenText:
	text "Cuando venga, lo"
	line "hará por MT."
	cont "PLATEADO…"

	para "MT. PLATEADO está"
	line "en JOHTO, ¿verdad?"
	done

HikerTimBeatenText:
	text "Estaba ocupado"
	line "cantando…"
	done

HikerTimAfterBattleText:
	text "Los combates son"
	line "cuestión de"
	cont "concentración."
	done

HikerSidneySeenText:
	text "Te contaré un"
	line "secreto."

	para "Pero primero,"
	line "¡luchemos!"
	done

HikerSidneyBeatenText:
	text "¡Caray!"
	line "He perdido…"
	done

HikerSidneyAfterBattleText:
	text "La CENTRAL ENERGÍA"
	line "está al otro lado"
	cont "de un riachuelo."
	done

Route9SignText:
	text "RUTA 9"

	para "CIUDAD CELESTE -"
	line "TÚNEL ROCA"
	done

Route9_MapEvents:
	db 0, 0 ; filler

	db 1 ; warp events
	warp_event 48, 15, ROCK_TUNNEL_1F, 1

	db 0 ; coord events

	db 2 ; bg events
	bg_event 15,  7, BGEVENT_READ, Route9Sign
	bg_event 41, 15, BGEVENT_ITEM, Route9HiddenEther

	db 6 ; object events
	object_event 23, 11, SPRITE_YOUNGSTER, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_TRAINER, 3, TrainerCamperDean, -1
	object_event 39,  8, SPRITE_LASS, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_TRAINER, 3, TrainerPicnickerHeidi, -1
	object_event 11,  4, SPRITE_YOUNGSTER, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_TRAINER, 5, TrainerCamperSid, -1
	object_event 12, 15, SPRITE_LASS, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_TRAINER, 1, TrainerPicnickerEdna, -1
	object_event 28,  3, SPRITE_POKEFAN_M, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_TRAINER, 2, TrainerHikerTim, -1
	object_event 36, 15, SPRITE_POKEFAN_M, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_TRAINER, 4, TrainerHikerSidney, -1
