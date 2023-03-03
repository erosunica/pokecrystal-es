ErinAnswerPhoneText:
	text "Sí, soy"
	line "@"
	text_ram wStringBuffer3
	text "…"

	para "¡Hola, <PLAY_G>!"
	line "¡Buenos días!"
	done

ErinAnswerPhoneDayText:
	text "Sí, soy"
	line "@"
	text_ram wStringBuffer3
	text "…"

	para "¡Hola, <PLAY_G>!"
	line "¡Yuju!"
	done

ErinAnswerPhoneNiteText:
	text "Sí, soy"
	line "@"
	text_ram wStringBuffer3
	text "…"

	para "¡Hola, <PLAY_G>!"
	done

ErinGreetText:
	text "¡<PLAY_G>!"

	para "¡Soy @"
	text_ram wStringBuffer3
	text "!"
	line "¡Buenos días!"
	done

ErinGreetDayText:
	text "¡<PLAY_G>!"

	para "¡Soy @"
	text_ram wStringBuffer3
	text "!"
	line "¿Trabajando mucho?"
	done

ErinGreetNiteText:
	text "¡<PLAY_G>!"

	para "¡Soy @"
	text_ram wStringBuffer3
	text "!"
	line "¿Dónde estás?"
	done

ErinGenericText:
	text "¿Estás mejorando"
	line "a tus #MON?"

	para "¡El @"
	text_ram wStringBuffer4
	text " de"
	line "@"
	text_ram wStringBuffer3
	text " está"
	cont "muy bien!"
	done
