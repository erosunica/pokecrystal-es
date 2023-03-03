AlanAnswerPhoneText:
	text "¡Soy @"
	text_ram wStringBuffer3
	text "!"

	para "¿Eres <PLAY_G>?"
	line "¡Buenos días!"
	done

AlanAnswerPhoneDayText:
	text "¡Soy @"
	text_ram wStringBuffer3
	text "!"

	para "¿Eres <PLAY_G>?"
	done

AlanAnswerPhoneNiteText:
	text "¡Soy @"
	text_ram wStringBuffer3
	text "!"

	para "¿Eres <PLAY_G>?"
	line "¡Buenas noches!"
	done

AlanGreetText:
	text "¡Hola! ¡Soy yo,"
	line "@"
	text_ram wStringBuffer3
	text "!"
	done

AlanGreetDayText:
	text "¡Hola! ¡Soy yo,"
	line "@"
	text_ram wStringBuffer3
	text "!"
	done

AlanGreetNiteText:
	text "¡Hola! ¡Soy yo,"
	line "@"
	text_ram wStringBuffer3
	text "!"
	done

AlanGenericText:
	text "<PLAY_G>… ¿estás"
	line "cuidando de tus"

	para "#MON"
	line "adecuadamente?"

	para "He leído en un"
	line "libro que debes"

	para "cuidar a los"
	line "#MON que cojas"
	cont "con amor y cariño."
	done
