DanaAnswerPhoneText:
	text "Hola, al habla"
	line "@"
	text_ram wStringBuffer3
	text "."

	para "¡Eh! ¡Pero si es"
	line "<PLAY_G>!"
	done

DanaAnswerPhoneDayText:
	text "Hola, al habla"
	line "@"
	text_ram wStringBuffer3
	text "."

	para "¡Ya sé!"
	line "¡Eres <PLAY_G>!"
	done

DanaAnswerPhoneNiteText:
	text "Hola, al habla"
	line "@"
	text_ram wStringBuffer3
	text "."

	para "¿<PLAY_G>?"
	line "¿Qué pasa?"
	done

DanaGreetText:
	text "Uh… ¿<PLAY_G>?"

	para "¡Soy yo!"
	line "¡Soy @"
	text_ram wStringBuffer3
	text "!"
	done

DanaGreetDayText:
	text "Uh… ¿<PLAY_G>?"

	para "¡Soy yo!"
	line "¡Soy @"
	text_ram wStringBuffer3
	text "!"
	done

DanaGreetNiteText:
	text "Uh… ¿<PLAY_G>?"

	para "¡Soy yo!"
	line "¡Soy, @"
	text_ram wStringBuffer3
	text "!"
	done

DanaGenericText:
	text "Mi @"
	text_ram wStringBuffer4
	text_start
	line "está tan lleno de"

	para "energía que da un"
	line "poco de miedo."

	para "¿Qué tal van tus"
	line "#MON?"
	done
