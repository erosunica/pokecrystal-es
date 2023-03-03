BeverlyAnswerPhoneText:
	text "Hola, soy"
	line "@"
	text_ram wStringBuffer3
	text "."

	para "¡Oh! Buenos días,"
	line "<PLAYER>."
	done

BeverlyAnswerPhoneDayText:
	text "Hola, soy"
	line "@"
	text_ram wStringBuffer3
	text "."

	para "¡Oh! ¿Qué tal,"
	line "<PLAYER>?"
	done

BeverlyAnswerPhoneNiteText:
	text "Hola, soy"
	line "@"
	text_ram wStringBuffer3
	text "."

	para "¡Oh! Buenas"
	line "noches, <PLAYER>."
	done

BeverlyGreetText:
	text "Hola, <PLAYER>."
	line "Buenos días."

	para "Soy @"
	text_ram wStringBuffer3
	text "."
	line "¿Estabas"
	cont "durmiendo?"
	done

BeverlyGreetDayText:
	text "Hola, <PLAYER>."
	line "Soy @"
	text_ram wStringBuffer3
	text "."

	para "¿Qué tal vas?"
	done

BeverlyGreetNiteText:
	text "Hola, <PLAYER>."
	line "Soy @"
	text_ram wStringBuffer3
	text "."

	para "¿Ya te has"
	line "despertado?"
	done

BeverlyGenericText:
	text "¿Son felices tus"
	line "#MON?"

	para "Mi @"
	text_ram wStringBuffer4
	text_start
	line "está sano."

	para "Come mucho todos"
	line "los días."
	done
