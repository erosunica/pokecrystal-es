BethAnswerPhoneText:
	text "Hola, soy"
	line "@"
	text_ram wStringBuffer3
	text "."

	para "Oh, <PLAY_G>."
	line "Buenos días."
	done

BethAnswerPhoneDayText:
	text "Hola, soy"
	line "@"
	text_ram wStringBuffer3
	text "."

	para "Oh. Hola, <PLAY_G>."
	done

BethAnswerPhoneNiteText:
	text "Hola, soy"
	line "@"
	text_ram wStringBuffer3
	text "."

	para "Oh, <PLAY_G>."
	line "Buenas noches."
	done

BethGreetText:
	text "¡Buenos días,"
	line "<PLAY_G>!"

	para "Soy @"
	text_ram wStringBuffer3
	text "."
	line "¿Dormías?"
	done

BethGreetDayText:
	text "¡<PLAY_G>, hola!"
	line "Soy @"
	text_ram wStringBuffer3
	text "."

	para "¿Tienes tiempo?"
	done

BethGreetNiteText:
	text "Hola, <PLAY_G>."
	line "Buenas noches."

	para "Soy @"
	text_ram wStringBuffer3
	text "."

	para "No estabas dur-"
	line "miendo, ¿verdad?"
	done

BethGenericText:
	text "¿Eres del tipo de"
	line "persona que va a"

	para "menudo a los"
	line "CENTROS #MON?"

	para "Yo voy todos los"
	line "días. Cuidar de"

	para "la salud de tus"
	line "#MON es uno de"

	para "los principios"
	line "básicos de"
	cont "entrenar #MON."
	done
