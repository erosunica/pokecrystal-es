	object_const_def ; object_event constants
	const OLIVINELIGHTHOUSE4F_SAILOR
	const OLIVINELIGHTHOUSE4F_LASS

OlivineLighthouse4F_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

TrainerLassConnie:
	trainer LASS, CONNIE1, EVENT_BEAT_LASS_CONNIE, LassConnie1SeenText, LassConnie1BeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext LassConnie1AfterBattleText
	waitbutton
	closetext
	end

TrainerSailorKent:
	trainer SAILOR, KENT, EVENT_BEAT_SAILOR_KENT, SailorKentSeenText, SailorKentBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext SailorKentAfterBattleText
	waitbutton
	closetext
	end

SailorKentSeenText:
	text "YASMINA debe de"
	line "estar preocupada"
	cont "por ese #MON."

	para "Ni siquiera"
	line "sonríe."
	done

SailorKentBeatenText:
	text "Yo tampoco puedo"
	line "sonreír…"
	done

SailorKentAfterBattleText:
	text "Hablando de"
	line "enfermedades, hay"

	para "una FARMACIA en"
	line "CIUDAD ORQUÍDEA."
	done

LassConnie1SeenText:
	text "YASMINA es LÍDER"
	line "del GIMNASIO."

	para "Quiero que vuelva"
	line "conmigo."

	para "¡No he encontrado"
	line "a nadie mejor!"
	done

LassConnie1BeatenText:
	text "¡Ay! ¡Mi #MON!"
	done

LassConnie1AfterBattleText:
	text "Cualquiera estaría"
	line "preocupado si sus"

	para "#MON estuvieran"
	line "enfermos."

	para "Rezaré por ese"
	line "#MON, para que"

	para "YASMINA regrese al"
	line "GIMNASIO."
	done

OlivineLighthouse4F_MapEvents:
	db 0, 0 ; filler

	db 10 ; warp events
	warp_event 13,  3, OLIVINE_LIGHTHOUSE_3F, 1
	warp_event  3,  5, OLIVINE_LIGHTHOUSE_5F, 2
	warp_event  9,  7, OLIVINE_LIGHTHOUSE_5F, 3
	warp_event  9,  5, OLIVINE_LIGHTHOUSE_3F, 3
	warp_event 16,  9, OLIVINE_LIGHTHOUSE_3F, 6
	warp_event 17,  9, OLIVINE_LIGHTHOUSE_3F, 7
	warp_event  8,  3, OLIVINE_LIGHTHOUSE_3F, 8
	warp_event  9,  3, OLIVINE_LIGHTHOUSE_3F, 9
	warp_event 16,  7, OLIVINE_LIGHTHOUSE_5F, 4
	warp_event 17,  7, OLIVINE_LIGHTHOUSE_5F, 5

	db 0 ; coord events

	db 0 ; bg events

	db 2 ; object events
	object_event  7, 14, SPRITE_SAILOR, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 3, TrainerSailorKent, -1
	object_event 11,  2, SPRITE_LASS, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 1, TrainerLassConnie, -1
