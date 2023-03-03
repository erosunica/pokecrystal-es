BrentAnswerPhoneText:
	text "¿Sí? Soy @"
	text_ram wStringBuffer3
	text "…"

	para "Ah, <PLAYER>."
	line "¿Puedo ayudarte?"
	done

BrentAnswerPhoneDayText:
	text "¿Sí? Soy @"
	text_ram wStringBuffer3
	text "…"

	para "Ah, <PLAYER>."
	line "¿Puedo ayudarte?"
	done

BrentAnswerPhoneNiteText:
	text "¿Sí? Aquí @"
	text_ram wStringBuffer3
	text "…"

	para "Ah, <PLAYER>. ¿En"
	line "qué puedo ayudar-"
	cont "te?"
	done

BrentGreetText:
	text "Hola, <PLAYER>."
	line "¿Qué tal te va?"

	para "¡Eh! Soy yo,"
	line "@"
	text_ram wStringBuffer3
	text "."
	done

BrentGreetDayText:
	text "Hola, <PLAYER>."
	line "¿Qué tal te va?"

	para "¡Eh! Soy yo,"
	line "@"
	text_ram wStringBuffer3
	text "."
	done

BrentGreetNiteText:
	text "Hola, <PLAYER>."
	line "¿Qué tal te va?"

	para "¡Eh! Soy yo,"
	line "@"
	text_ram wStringBuffer3
	text "."
	done

BrentGenericText:
	text "Ah, sí. El otro"
	line "día vi como salías"

	para "de un CENTRO"
	line "#MON."

	para "Curas a tus #-"
	line "MON habitualmente,"

	para "¿verdad?"
	line "Me impresiona."

	para "Eh, mi @"
	text_ram wStringBuffer4
	text_start
	line "es tan duro, que"

	para "no necesita ir a"
	line "los CENTROS #-"
	cont "MON a menudo. ¡Je!"
	done
