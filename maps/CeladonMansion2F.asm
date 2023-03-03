CeladonMansion2F_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

CeladonMansion2FComputer:
	jumptext CeladonMansion2FComputerText

CeladonMansion2FMeetingRoomSign:
	jumptext CeladonMansion2FMeetingRoomSignText

CeladonMansion2FBookshelf:
	jumpstd difficultbookshelf

CeladonMansion2FComputerText:
	text "<PLAYER> encendió"
	line "el PC."

	para "…"

	para "Alguien estaba"
	line "escribiendo un"
	cont "e-mail."

	para "Espero que vengas"
	line "a KANTO."

	para "Te sorprenderás de"
	line "cuánto han"

	para "cambiado las"
	line "cosas por aquí."

	para "También verás"
	line "muchos #MON"

	para "que no son nativos"
	line "de JOHTO."

	para "Al PRODUCTOR"

	para "…"
	done

CeladonMansion2FMeetingRoomSignText:
	text "SALA DE REUNIONES"
	line "DE GAME FREAK"
	done

CeladonMansion2F_MapEvents:
	db 0, 0 ; filler

	db 4 ; warp events
	warp_event  0,  0, CELADON_MANSION_1F, 4
	warp_event  1,  0, CELADON_MANSION_3F, 2
	warp_event  6,  0, CELADON_MANSION_3F, 3
	warp_event  7,  0, CELADON_MANSION_1F, 5

	db 0 ; coord events

	db 3 ; bg events
	bg_event  0,  3, BGEVENT_READ, CeladonMansion2FComputer
	bg_event  5,  8, BGEVENT_UP, CeladonMansion2FMeetingRoomSign
	bg_event  2,  3, BGEVENT_READ, CeladonMansion2FBookshelf

	db 0 ; object events
