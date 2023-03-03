	object_const_def ; object_event constants
	const LAVRADIOTOWER1F_RECEPTIONIST
	const LAVRADIOTOWER1F_OFFICER
	const LAVRADIOTOWER1F_SUPER_NERD1
	const LAVRADIOTOWER1F_GENTLEMAN
	const LAVRADIOTOWER1F_SUPER_NERD2

LavRadioTower1F_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

LavRadioTower1FReceptionistScript:
	jumptextfaceplayer LavRadioTower1FReceptionistText

LavRadioTower1FOfficerScript:
	jumptextfaceplayer LavRadioTower1FOfficerText

LavRadioTower1FSuperNerd1Script:
	jumptextfaceplayer LavRadioTower1FSuperNerd1Text

LavRadioTower1FGentlemanScript:
	faceplayer
	opentext
	checkflag ENGINE_EXPN_CARD
	iftrue .GotExpnCard
	checkevent EVENT_RETURNED_MACHINE_PART
	iftrue .ReturnedMachinePart
	writetext LavRadioTower1FGentlemanText
	waitbutton
	closetext
	end

.ReturnedMachinePart:
	writetext LavRadioTower1FGentlemanText_ReturnedMachinePart
	promptbutton
	getstring STRING_BUFFER_4, .expncardname
	scall .receiveitem
	setflag ENGINE_EXPN_CARD
.GotExpnCard:
	writetext LavRadioTower1FGentlemanText_GotExpnCard
	waitbutton
	closetext
	end

.receiveitem:
	jumpstd receiveitem
	end

.expncardname
	db "TAR. EXPN@"

LavRadioTower1FSuperNerd2Script:
	faceplayer
	opentext
	checkflag ENGINE_EXPN_CARD
	iftrue .GotExpnCard
	writetext LavRadioTower1FSuperNerd2Text
	waitbutton
	closetext
	end

.GotExpnCard:
	writetext LavRadioTower1FSuperNerd2Text_GotExpnCard
	waitbutton
	closetext
	end

LavRadioTower1FDirectory:
	jumptext LavRadioTower1FDirectoryText

LavRadioTower1FPokeFluteSign:
	jumptext LavRadioTower1FPokeFluteSignText

LavRadioTower1FReferenceLibrary:
; unreferenced
	jumptext LavRadioTower1FReferenceLibraryText

LavRadioTower1FReceptionistText:
	text "¿Qué tal? Mira por"
	line "donde quieras en"
	cont "esta planta."
	done

LavRadioTower1FOfficerText:
	text "Lo siento, pero"
	line "sólo puedes dar"

	para "una vuelta por la"
	line "planta baja."

	para "Desde que una"
	line "banda criminal"

	para "asaltó la TORRE"
	line "RADIO de JOHTO,"

	para "tuvimos que incre-"
	line "mentar las medidas"
	cont "de seguridad."
	done

LavRadioTower1FSuperNerd1Text:
	text "En la TORRE RADIO"
	line "hay mucha gente"

	para "que trabaja"
	line "duramente."

	para "Seguro que están"
	line "haciendo todo lo"

	para "posible por emitir"
	line "buenos programas."
	done

LavRadioTower1FGentlemanText:
	text "¡Oh, no, no, no!"

	para "No hemos emitido"
	line "desde que cerró la"
	cont "CENTRAL ENERGÍA."

	para "Si no emitimos, de"
	line "nada servirá el"

	para "esfuerzo realizado"
	line "por la emisora."

	para "¡Me arruinaré!"
	done

LavRadioTower1FGentlemanText_ReturnedMachinePart:
	text "¡Ah! Así que tú,"
	line "<PLAY_G>, arreglas-"
	cont "te el problema de"
	cont "la CENTRAL"
	cont "ENERGÍA…"

	para "Gracias a ti, no"
	line "perdí mi empleo."

	para "¡Me has salvado"
	line "la vida!"

	para "Acepta esto como"
	line "muestra de mi"
	cont "gratitud."
	done

LavRadioTower1FGentlemanText_GotExpnCard:
	text "Con eso podrás"
	line "sintonizar los"

	para "programas de"
	line "radio de KANTO."

	para "¡Jajajaja!"
	done

LavRadioTower1FSuperNerd2Text:
	text "¡Oye, joven!"

	para "¡Soy el DIRECTOR"
	line "de MÚSICA!"

	para "¡Vaya! Tu #GEAR"
	line "no sintoniza mis"

	para "programas de"
	line "música. ¡Qué pena!"

	para "Si consigues una"
	line "TARJETA EXPN, los"

	para "podrás oír. ¡Hazte"
	line "con una!"
	done

LavRadioTower1FSuperNerd2Text_GotExpnCard:
	text "¡Oye, joven!"

	para "¡Soy el DIRECTOR"
	line "de MÚSICA!"

	para "Soy el encargado"
	line "de las fantásticas"

	para "melodías que se"
	line "emiten aquí."

	para "No seas anticuado."
	line "¡Atrapa la música"
	cont "de las ondas!"
	done

LavRadioTower1FDirectoryText:
	text "PB RECEPCIÓN"
	line "P1 VENTAS"

	para "P2 PERSONAL"
	line "P3 PRODUCCIÓN"

	para "P4 DESPACHO DEL"
	line "   DIRECTOR"
	done

LavRadioTower1FPokeFluteSignText:
	text "Anima a los #-"
	line "MON con la melodía"

	para "de la # FLAUTA"
	line "del CANAL 20"
	done

LavRadioTower1FReferenceLibraryText:
	text "¡Uau! Un estante"
	line "lleno de CD y"
	cont "vídeos de #MON."

	para "Debe de ser una"
	line "biblioteca."
	done

LavRadioTower1F_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event  2,  7, LAVENDER_TOWN, 7
	warp_event  3,  7, LAVENDER_TOWN, 7

	db 0 ; coord events

	db 2 ; bg events
	bg_event 11,  0, BGEVENT_READ, LavRadioTower1FDirectory
	bg_event  5,  0, BGEVENT_READ, LavRadioTower1FPokeFluteSign

	db 5 ; object events
	object_event  6,  6, SPRITE_RECEPTIONIST, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, LavRadioTower1FReceptionistScript, -1
	object_event 15,  1, SPRITE_OFFICER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, LavRadioTower1FOfficerScript, -1
	object_event  1,  3, SPRITE_SUPER_NERD, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, LavRadioTower1FSuperNerd1Script, -1
	object_event  9,  1, SPRITE_GENTLEMAN, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, LavRadioTower1FGentlemanScript, -1
	object_event 14,  6, SPRITE_SUPER_NERD, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, LavRadioTower1FSuperNerd2Script, -1
