JoseAnswerPhoneText:
	text "Hola, soy"
	line "@"
	text_ram wStringBuffer3
	text "…"

	para "Oh, ¿<PLAY_G>?"
	line "¡Buenos días!"
	done

JoseAnswerPhoneDayText:
	text "Hola, soy"
	line "@"
	text_ram wStringBuffer3
	text "…"

	para "Oh, ¿<PLAY_G>?"
	line "¡Hola!"
	done

JoseAnswerPhoneNiteText:
	text "Hola, soy"
	line "@"
	text_ram wStringBuffer3
	text "…"

	para "Oh, ¿<PLAY_G>?"
	line "¡Buenas noches!"
	done

JoseGreetText:
	text "Oh, ¿<PLAY_G>?"

	para "¡Genial! Sí, soy"
	line "yo, @"
	text_ram wStringBuffer3
	text "."
	done

JoseGreetDayText:
	text "Oh, ¿<PLAY_G>?"

	para "¡Genial! Sí, soy"
	line "yo, @"
	text_ram wStringBuffer3
	text "."
	done

JoseGreetNiteText:
	text "Oh, ¿<PLAY_G>?"

	para "¡Genial! Sí, soy"
	line "yo, @"
	text_ram wStringBuffer3
	text "."
	done

JoseGenericText:
	text "Tus #MON,"
	line "¿aún se entrenan?"

	para "Mi @"
	text_ram wStringBuffer4
	text_start
	line "tiene mucha"
	cont "energía."

	para "Cuando despega, no"
	line "vuelve en un rato."
	done
