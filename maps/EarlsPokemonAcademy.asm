	object_const_def ; object_event constants
	const EARLSPOKEMONACADEMY_EARL
	const EARLSPOKEMONACADEMY_YOUNGSTER1
	const EARLSPOKEMONACADEMY_GAMEBOY_KID1
	const EARLSPOKEMONACADEMY_GAMEBOY_KID2
	const EARLSPOKEMONACADEMY_YOUNGSTER2
	const EARLSPOKEMONACADEMY_POKEDEX

EarlsPokemonAcademy_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

AcademyEarl:
	applymovement EARLSPOKEMONACADEMY_EARL, AcademyEarlSpinMovement
	faceplayer
	opentext
	writetext AcademyEarlIntroText
	yesorno
	iffalse .Part1
	writetext AcademyEarlTeachHowToWinText
	yesorno
	iffalse .Done
.Part1:
	writetext AcademyEarlTeachMoreText
	yesorno
	iffalse .Done
	writetext AcademyEarlTeachHowToRaiseWellText
	waitbutton
	closetext
	end

.Done:
	writetext AcademyEarlNoMoreToTeachText
	waitbutton
	closetext
	end

EarlsPokemonAcademyYoungster1Script:
	jumptextfaceplayer EarlsPokemonAcademyYoungster1Text

EarlsPokemonAcademyGameboyKid1Script:
	faceplayer
	opentext
	writetext EarlsPokemonAcademyGameboyKid1Text
	waitbutton
	closetext
	turnobject EARLSPOKEMONACADEMY_GAMEBOY_KID1, DOWN
	end

EarlsPokemonAcademyGameboyKid2Script:
	faceplayer
	opentext
	writetext EarlsPokemonAcademyGameboyKid2Text
	waitbutton
	closetext
	turnobject EARLSPOKEMONACADEMY_GAMEBOY_KID2, DOWN
	end

EarlsPokemonAcademyYoungster2Script:
	jumptextfaceplayer EarlsPokemonAcademyYoungster2Text

AcademyBlackboard:
	opentext
	writetext AcademyBlackboardText
.Loop:
	loadmenu .BlackboardMenuHeader
	_2dmenu
	closewindow
	ifequal 1, .Poison
	ifequal 2, .Paralysis
	ifequal 3, .Sleep
	ifequal 4, .Burn
	ifequal 5, .Freeze
	closetext
	end

.Poison:
	writetext AcademyPoisonText
	waitbutton
	sjump .Loop

.Paralysis:
	writetext AcademyParalysisText
	waitbutton
	sjump .Loop

.Sleep:
	writetext AcademySleepText
	waitbutton
	sjump .Loop

.Burn:
	writetext AcademyBurnText
	waitbutton
	sjump .Loop

.Freeze:
	writetext AcademyFreezeText
	waitbutton
	sjump .Loop

.BlackboardMenuHeader:
	db MENU_BACKUP_TILES ; flags
	menu_coords 0, 0, 12, 8
	dw .MenuData
	db 1 ; default option

.MenuData:
	db STATICMENU_CURSOR ; flags
	dn 3, 2 ; rows, columns
	db 5 ; spacing
	dba .Text
	dbw BANK(AcademyBlackboard), 0

.Text:
	db "ENV@"
	db "PAR@"
	db "DOR@"
	db "QUE@"
	db "CON@"
	db "SALIR@"

AcademyNotebook:
	opentext
	writetext AcademyNotebookText
	yesorno
	iffalse .Done
	writetext AcademyNotebookText1
	yesorno
	iffalse .Done
	writetext AcademyNotebookText2
	yesorno
	iffalse .Done
	writetext AcademyNotebookText3
	waitbutton
.Done:
	closetext
	end

AcademyStickerMachine:
; unused
	jumptext AcademyStickerMachineText

AcademyBookshelf:
	jumpstd difficultbookshelf

AcademyEarlSpinMovement:
	turn_head DOWN
	turn_head LEFT
	turn_head UP
	turn_head RIGHT
	turn_head DOWN
	turn_head LEFT
	turn_head UP
	turn_head RIGHT
	turn_head DOWN
	turn_head LEFT
	turn_head UP
	turn_head RIGHT
	turn_head DOWN
	step_end

AcademyEarlIntroText:
	text "¡Soy yo, PRIMO!"

	para "¡Fantásticos son"
	line "los #MON!"

	para "¡A ti yo te ense-"
	line "ñaré a ser mejor!"

	para "¿Quieres saber"
	line "cómo ganar?"
	done

AcademyEarlTeachHowToWinText:
	text "¡Bien! ¡A ti yo"
	line "te enseñaré!"

	para "¡En combate, los"
	line "primeros #MON"
	cont "salen antes!"

	para "¡Quizá sea más"
	line "fácil si cambias"
	cont "el orden!"

	para "¿Quieres que te"
	line "cuente más cosas?"
	done

AcademyEarlTeachMoreText:
	text "¿Quieres saber"
	line "cómo educar bien"
	cont "a los #MON?"
	done

AcademyEarlTeachHowToRaiseWellText:
	text "¡Bien! ¡A ti yo"
	line "te enseñaré!"

	para "Si un #MON"
	line "sale al combate,"

	para "aunque brevemente,"
	line "gana puntos EXP."

	para "¡Pon arriba los"
	line "#MON débiles,"

	para "y cámbialos rápido"
	line "en el combate!"

	para "¡Así se harán más"
	line "fuertes los"
	cont "#MON débiles!"
	done

AcademyEarlNoMoreToTeachText:
	text "¡Oh! ¡Muy inteli-"
	line "gente eres! ¡Nada"
	cont "más quieres saber!"

	para "¡Genial en #MON"
	line "debes de ser!"
	done

EarlsPokemonAcademyYoungster1Text:
	text "Estoy tomando"
	line "apuntes de lo que"
	cont "dice el profesor."

	para "Y debería copiar"
	line "también lo escrito"
	cont "en la pizarra."
	done

EarlsPokemonAcademyGameboyKid1Text:
	text "He cambiado a mis"
	line "mejores #MON"
	cont "con mi compañero."
	done

EarlsPokemonAcademyGameboyKid2Text:
	text "¡El #MON que"
	line "he conseguido va"
	cont "equipado con algo!"
	done

EarlsPokemonAcademyYoungster2Text:
	text "Si un #MON va"
	line "equipado con una"

	para "BAYA, se curará él"
	line "solo en combate."

	para "Los #MON pueden"
	line "ir equipados con"
	cont "muchos objetos…"

	para "Es muy duro tomar"
	line "apuntes…"
	done

AcademyBlackboardText:
	text "La pizarra indica"
	line "cómo cambian de"

	para "estado los #MON"
	line "en combate."
	done

AcademyBlackboardText2:
; unused
	text "¿Qué tema quieres"
	line "leer?"
	done

AcademyPoisonText:
	text "Si un #MON es"
	line "envenenado,"
	cont "perderá PS."

	para "El envenenamiento"
	line "continúa tras el"

	para "combate y al"
	line "caminar seguirá"
	cont "perdiendo PS."

	para "Para curarlo, usa"
	line "ANTÍDOTO."
	done

AcademyParalysisText:
	text "La parálisis baja"
	line "la VELOCIDAD y"

	para "puede impedir el"
	line "movimiento."

	para "Permanece tras el"
	line "combate, así que"
	cont "usa ANTIPARALIZ."
	done

AcademySleepText:
	text "Si tu #MON"
	line "se queda dormido"

	para "no podrá realizar"
	line "ningún movimiento."

	para "Un #MON dormido"
	line "no se despierta"
	cont "tras el combate."

	para "Despiértalo con"
	line "DESPERTAR."
	done

AcademyBurnText:
	text "Las quemaduras"
	line "consumen PS,"

	para "reducen el poder"
	line "del ataque y"

	para "permanecen tras"
	line "el combate."

	para "Usa ANTIQUEMAR"
	line "como cura."
	done

AcademyFreezeText:
	text "Si tu #MON está"
	line "congelado, no"
	cont "podrá hacer nada."

	para "Seguirá congelado"
	line "tras el combate."

	para "Descongélalo con"
	line "ANTIHIELO."
	done

AcademyNotebookText:
	text "Es el cuaderno de"
	line "este niño…"

	para "Captura #MON"
	line "usando # BALL."

	para "Tu equipo puede"
	line "tener hasta seis."

	para "¿Sigues leyendo?"
	done

AcademyNotebookText1:
	text "Antes de lanzar la"
	line "# BALL, debes"
	cont "debilitarlo."

	para "Atrapar un #MON"
	line "quemado o envene-"
	cont "nado es mucho más"
	cont "fácil."

	para "¿Sigues leyendo?"
	done

AcademyNotebookText2:
	text "Algunos ataques"
	line "causan confusión."

	para "Un #MON confuso"
	line "puede atacarse a"
	cont "sí mismo."

	para "Retirarlo del"
	line "combate, eliminará"
	cont "su confusión."

	para "¿Sigues leyendo?"
	done

AcademyNotebookText3:
	text "Quienes atrapan"
	line "#MON y los usan"

	para "para luchar son"
	line "entrenadores."

	para "Su misión es ir"
	line "a los GIMNASIOS"

	para "y vencer a otros"
	line "entrenadores."

	para "La hoja siguiente"
	line "está… ¡vacía!"

	para "Niño: Eh, eh…"

	para "No he escrito nada"
	line "más…"
	done

AcademyStickerMachineText:
	text "¡Esta supermáquina"
	line "imprime los datos"
	cont "como pegatinas!"
	done

EarlsPokemonAcademy_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event  3, 15, VIOLET_CITY, 3
	warp_event  4, 15, VIOLET_CITY, 3

	db 0 ; coord events

	db 4 ; bg events
	bg_event  0,  1, BGEVENT_READ, AcademyBookshelf
	bg_event  1,  1, BGEVENT_READ, AcademyBookshelf
	bg_event  3,  0, BGEVENT_READ, AcademyBlackboard
	bg_event  4,  0, BGEVENT_READ, AcademyBlackboard

	db 6 ; object events
	object_event  4,  2, SPRITE_FISHER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, AcademyEarl, EVENT_EARLS_ACADEMY_EARL
	object_event  2,  5, SPRITE_YOUNGSTER, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, EarlsPokemonAcademyYoungster1Script, -1
	object_event  3, 11, SPRITE_GAMEBOY_KID, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, EarlsPokemonAcademyGameboyKid1Script, -1
	object_event  4, 11, SPRITE_GAMEBOY_KID, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, EarlsPokemonAcademyGameboyKid2Script, -1
	object_event  4,  7, SPRITE_YOUNGSTER, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, EarlsPokemonAcademyYoungster2Script, -1
	object_event  2,  4, SPRITE_POKEDEX, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, AcademyNotebook, -1
