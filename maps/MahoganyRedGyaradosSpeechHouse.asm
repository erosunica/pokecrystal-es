	object_const_def ; object_event constants
	const MAHOGANYREDGYARADOSSPEECHHOUSE_BLACK_BELT
	const MAHOGANYREDGYARADOSSPEECHHOUSE_TEACHER

MahoganyRedGyaradosSpeechHouse_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

MahoganyRedGyaradosSpeechHouseBlackBeltScript:
	jumptextfaceplayer MahoganyRedGyaradosSpeechHouseBlackBeltText

MahoganyRedGyaradosSpeechHouseTeacherScript:
	faceplayer
	opentext
	checkflag ENGINE_ROCKETS_IN_RADIO_TOWER
	iftrue .RocketsInRadioTower
	writetext MahoganyRedGyaradosSpeechHouseTeacherText
	waitbutton
	closetext
	end

.RocketsInRadioTower:
	writetext MahoganyRedGyaradosSpeechHouseTeacherText_RocketsInRadioTower
	waitbutton
	closetext
	end

MahoganyRedGyaradosSpeechHouseUnusedBookshelf1:
; unused
	jumpstd picturebookshelf

MahoganyRedGyaradosSpeechHouseUnusedBookshelf2:
; unused
	jumpstd magazinebookshelf

MahoganyRedGyaradosSpeechHouseBlackBeltText:
	text "Dicen que ha"
	line "aparecido un"

	para "GYARADOS rojo en"
	line "el LAGO."

	para "¡Qué raro, porque"
	line "en el lago no son"

	para "frecuentes ni los"
	line "GYARADOS comunes!"
	done

MahoganyRedGyaradosSpeechHouseTeacherText:
	text "¿Mi programa de"
	line "radio favorito? La"
	cont "MÚSICA #MON."
	done

MahoganyRedGyaradosSpeechHouseTeacherText_RocketsInRadioTower:
	text "He estado oyendo"
	line "risas en la radio…"
	cont "Es espeluznante."
	done

MahoganyRedGyaradosSpeechHouse_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event  2,  7, MAHOGANY_TOWN, 2
	warp_event  3,  7, MAHOGANY_TOWN, 2

	db 0 ; coord events

	db 0 ; bg events

	db 2 ; object events
	object_event  2,  3, SPRITE_BLACK_BELT, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, MahoganyRedGyaradosSpeechHouseBlackBeltScript, -1
	object_event  6,  5, SPRITE_TEACHER, SPRITEMOVEDATA_WALK_UP_DOWN, 0, 1, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, MahoganyRedGyaradosSpeechHouseTeacherScript, -1
