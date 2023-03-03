	object_const_def ; object_event constants
	const ROUTE32POKECENTER1F_NURSE
	const ROUTE32POKECENTER1F_FISHING_GURU
	const ROUTE32POKECENTER1F_COOLTRAINER_F

Route32Pokecenter1F_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

Route32Pokecenter1FNurseScript:
	jumpstd pokecenternurse

Route32Pokecenter1FFishingGuruScript:
	faceplayer
	opentext
	checkevent EVENT_GOT_OLD_ROD
	iftrue .GotOldRod
	writetext Route32Pokecenter1FFishingGuruText_Question
	yesorno
	iffalse .Refused
	writetext Route32Pokecenter1FFishingGuruText_Yes
	promptbutton
	verbosegiveitem OLD_ROD
	writetext Route32Pokecenter1FFishingGuruText_GiveOldRod
	waitbutton
	closetext
	setevent EVENT_GOT_OLD_ROD
	end

.Refused:
	writetext Route32Pokecenter1FFishingGuruText_No
	waitbutton
	closetext
	end

.GotOldRod:
	writetext Route32Pokecenter1FFishingGuruText_After
	waitbutton
	closetext
	end

Route32Pokecenter1FCooltrainerFScript:
	jumptextfaceplayer Route32Pokecenter1FCooltrainerFText

Route32Pokecenter1FFishingGuruText_Question:
	text "Éste es un buen"
	line "sitio para pescar."

	para "¿Has visto a"
	line "gente pescando?"
	cont "¿Y tú?"

	para "¿Quieres una de"
	line "mis CAÑAS?"
	done

Route32Pokecenter1FFishingGuruText_Yes:
	text "Eso está bien."

	para "¡Ahora ya puedes"
	line "pescar!"
	done

Route32Pokecenter1FFishingGuruText_GiveOldRod:
	text "¡Pescar es genial!"

	para "Si ves agua, ya"
	line "sea el mar o un"

	para "río, utiliza tu"
	line "CAÑA."
	done

Route32Pokecenter1FFishingGuruText_No:
	text "¡Vaya! Me has"
	line "decepcionado…"
	done

Route32Pokecenter1FFishingGuruText_After:
	text "Hola."
	line "¿Están picando?"
	done

Route32Pokecenter1FCooltrainerFText:
	text "¿Cómo equipar a"
	line "mi #MON?"

	para "Quizá con un"
	line "objeto que aumente"
	cont "su ATAQUE…"
	done

Route32Pokecenter1F_MapEvents:
	db 0, 0 ; filler

	db 3 ; warp events
	warp_event  3,  7, ROUTE_32, 1
	warp_event  4,  7, ROUTE_32, 1
	warp_event  0,  7, POKECENTER_2F, 1

	db 0 ; coord events

	db 0 ; bg events

	db 3 ; object events
	object_event  3,  1, SPRITE_NURSE, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, Route32Pokecenter1FNurseScript, -1
	object_event  1,  4, SPRITE_FISHING_GURU, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, Route32Pokecenter1FFishingGuruScript, -1
	object_event  6,  2, SPRITE_COOLTRAINER_F, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, Route32Pokecenter1FCooltrainerFScript, -1
