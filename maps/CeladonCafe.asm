	object_const_def ; object_event constants
	const CELADONCAFE_SUPER_NERD
	const CELADONCAFE_FISHER1
	const CELADONCAFE_FISHER2
	const CELADONCAFE_FISHER3
	const CELADONCAFE_TEACHER

CeladonCafe_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

CeladonCafeChef:
	faceplayer
	opentext
	writetext ChefText_Eatathon
	waitbutton
	closetext
	end

CeladonCafeFisher1:
	opentext
	writetext Fisher1Text_Snarfle
	waitbutton
	closetext
	faceplayer
	opentext
	writetext Fisher1Text_Concentration
	waitbutton
	closetext
	turnobject CELADONCAFE_FISHER1, LEFT
	end

CeladonCafeFisher2:
	opentext
	writetext Fisher2Text_GulpChew
	waitbutton
	closetext
	faceplayer
	opentext
	writetext Fisher2Text_Quantity
	waitbutton
	closetext
	turnobject CELADONCAFE_FISHER2, RIGHT
	end

CeladonCafeFisher3:
	opentext
	writetext Fisher3Text_MunchMunch
	waitbutton
	closetext
	faceplayer
	opentext
	writetext Fisher3Text_GoldenrodIsBest
	waitbutton
	closetext
	turnobject CELADONCAFE_FISHER3, RIGHT
	end

CeladonCafeTeacher:
	checkitem COIN_CASE
	iftrue .HasCoinCase
	opentext
	writetext TeacherText_CrunchCrunch
	waitbutton
	closetext
	faceplayer
	opentext
	writetext TeacherText_NoCoinCase
	waitbutton
	closetext
	turnobject CELADONCAFE_TEACHER, LEFT
	end

.HasCoinCase:
	opentext
	writetext TeacherText_KeepEating
	waitbutton
	closetext
	turnobject CELADONCAFE_TEACHER, RIGHT
	opentext
	writetext TeacherText_MoreChef
	waitbutton
	closetext
	turnobject CELADONCAFE_TEACHER, LEFT
	end

EatathonContestPoster:
	jumptext EatathonContestPosterText

CeladonCafeTrashcan:
	checkevent EVENT_FOUND_LEFTOVERS_IN_CELADON_CAFE
	iftrue .TrashEmpty
	giveitem LEFTOVERS
	iffalse .PackFull
	opentext
	getitemname STRING_BUFFER_3, LEFTOVERS
	writetext FoundLeftoversText
	playsound SFX_ITEM
	waitsfx
	itemnotify
	closetext
	setevent EVENT_FOUND_LEFTOVERS_IN_CELADON_CAFE
	end

.PackFull:
	opentext
	getitemname STRING_BUFFER_3, LEFTOVERS
	writetext FoundLeftoversText
	promptbutton
	writetext NoRoomForLeftoversText
	waitbutton
	closetext
	end

.TrashEmpty:
	jumpstd trashcan

ChefText_Eatathon:
	text "¡Hola!"

	para "Estamos celebrando"
	line "un concurso de"
	cont "tragones."

	para "Perdona. Ahora no"
	line "podemos atenderte."
	done

Fisher1Text_Snarfle:
	text "¡Ñam, ñam!"
	done

Fisher1Text_Concentration:
	text "¡No me hables!"

	para "¡Me vas a"
	line "desconcentrar!"
	done

Fisher2Text_GulpChew:
	text "¡Glup…! ¡Ñam!"
	done

Fisher2Text_Quantity:
	text "¡Mejor cantidad"
	line "que calidad!"

	para "¡Si estoy lleno,"
	line "estoy feliz!"
	done

Fisher3Text_MunchMunch:
	text "¡Ñam, ñam!"
	done

Fisher3Text_GoldenrodIsBest:
	text "La comida de aquí"
	line "es buena, pero en"

	para "CIUDAD TRIGAL es"
	line "aún mejor."
	done

TeacherText_CrunchCrunch:
	text "¡Ñam, ñam!"
	done

TeacherText_NoCoinCase:
	text "Aquí nadie te va"
	line "a dar un MONEDERO."

	para "Mejor que lo"
	line "busques en JOHTO."
	done

TeacherText_KeepEating:
	text "¡Ñam, ñam!"

	para "¡Sigo comiendo!"
	done

TeacherText_MoreChef:
	text "¡Más, JEFE!"
	done

EatathonContestPosterText:
	text "¡Concurso de"
	line "tragones! ¡Sin"

	para "tiempo! ¡Una lucha"
	line "sin fin! ¡El mayor"

	para "tragón podrá comer"
	line "gratis!"
	done

FoundLeftoversText:
	text "<PLAYER> encontró"
	line "@"
	text_ram wStringBuffer3
	text "."
	done

NoRoomForLeftoversText:
	text "Pero <PLAYER> no"
	line "tiene espacio…"
	done

CeladonCafe_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event  6,  7, CELADON_CITY, 9
	warp_event  7,  7, CELADON_CITY, 9

	db 0 ; coord events

	db 2 ; bg events
	bg_event  5,  0, BGEVENT_READ, EatathonContestPoster
	bg_event  7,  1, BGEVENT_READ, CeladonCafeTrashcan

	db 5 ; object events
	object_event  9,  3, SPRITE_SUPER_NERD, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, CeladonCafeChef, -1
	object_event  4,  6, SPRITE_FISHER, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, CeladonCafeFisher1, -1
	object_event  1,  7, SPRITE_FISHER, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, CeladonCafeFisher2, -1
	object_event  1,  2, SPRITE_FISHER, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, CeladonCafeFisher3, -1
	object_event  4,  3, SPRITE_TEACHER, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, CeladonCafeTeacher, -1
