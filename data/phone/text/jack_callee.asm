JackAnswerPhoneText:
	text "Hola. Soy"
	line "@"
	text_ram wStringBuffer3
	text "…"

	para "¡Buenos días,"
	line "<PLAY_G>!"
	done

JackAnswerPhoneDayText:
	text "Hola. Soy"
	line "@"
	text_ram wStringBuffer3
	text "…"

	para "¿Qué tal vas,"
	line "<PLAY_G>?"
	done

JackAnswerPhoneNiteText:
	text "Hola. Soy"
	line "@"
	text_ram wStringBuffer3
	text "…"

	para "¡Buenas noches,"
	line "<PLAY_G>!"
	done

JackGreetText:
	text "¡<PLAY_G>,"
	line "buenos días!"

	para "Soy yo, @"
	text_ram wStringBuffer3
	text "."
	line "¿Qué tal estás?"
	done

JackGreetDayText:
	text "¡Hola, <PLAY_G>!"

	para "Soy yo, @"
	text_ram wStringBuffer3
	text "."
	line "¡Se está tan bien!"
	done

JackGreetNiteText:
	text "¡<PLAY_G>,"
	line "buenas noches!"

	para "Soy yo, @"
	text_ram wStringBuffer3
	text "."
	line "¿Tienes un minuto?"
	done

JackGenericText:
	text "¿Qué tal lo están"
	line "haciendo tus"
	cont "#MON?"

	para "Mi @"
	text_ram wStringBuffer4
	text " es"
	line "muy curioso, es un"

	para "problema. Quizá"
	line "es como yo…"
	done
