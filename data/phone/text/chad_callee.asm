ChadAnswerPhoneText:
	text "Hola, soy"
	line "@"
	text_ram wStringBuffer3
	text "…"

	para "¡Hola, <PLAY_G>!"
	line "¡Buenos días!"
	done

ChadAnswerPhoneDayText:
	text "Hola, soy"
	line "@"
	text_ram wStringBuffer3
	text "…"

	para "¡Hola, <PLAY_G>!"
	done

ChadAnswerPhoneNiteText:
	text "Hola, soy"
	line "@"
	text_ram wStringBuffer3
	text "…"

	para "¡Hola, <PLAY_G>!"
	line "¡Buenas noches!"
	done

ChadGreetText:
	text "Hola, <PLAY_G>."
	line "¡Buenos días!"

	para "Soy @"
	text_ram wStringBuffer3
	text "."
	line "¿Qué tal estás?"
	done

ChadGreetDayText:
	text "Hola, <PLAY_G>."
	line "¡Muy buenos días!"

	para "Soy @"
	text_ram wStringBuffer3
	text "."
	line "¿Qué tal estás?"
	done

ChadGreetNiteText:
	text "Hola, <PLAY_G>."
	line "¡Buenas noches!"

	para "Soy @"
	text_ram wStringBuffer3
	text "."
	line "¿Qué tal estás?"
	done

ChadGenericText:
	text "¿Qué tal van tus"
	line "#MON?"

	para "¡Conoces al PROF."
	line "OAK, entonces tus"

	para "#MON deben de"
	line "estar bien!"

	para "Mis #MON"
	line "también van bien."

	para "Pero bueno, es"
	line "lógico teniendo en"

	para "cuenta que estoy"
	line "intentando ser un"
	cont "profesor #MON."
	done
