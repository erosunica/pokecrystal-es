GinaAnswerPhoneText:
	text "¿Hola? Soy"
	line "@"
	text_ram wStringBuffer3
	text "…"

	para "¡Oh, <PLAY_G>!"
	line "¡Buenos días!"
	done

GinaAnswerPhoneDayText:
	text "¿Hola? Soy"
	line "@"
	text_ram wStringBuffer3
	text "…"

	para "¡Oh, <PLAY_G>!"
	line "¿Qué tal estás?"
	done

GinaAnswerPhoneNiteText:
	text "¿Hola? Soy"
	line "@"
	text_ram wStringBuffer3
	text "…"

	para "¡Oh, <PLAY_G>!"
	line "¡Buenas noches!"
	done

GinaGreetText:
	text "¿<PLAY_G>?"

	para "Soy @"
	text_ram wStringBuffer3
	text "."
	line "¡Buenos días!"
	done

GinaGreetDayText:
	text "¿<PLAY_G>?"

	para "Soy @"
	text_ram wStringBuffer3
	text "."
	line "¿Te pillo en mal"
	cont "momento?"
	done

GinaGreetNiteText:
	text "¿<PLAY_G>?"

	para "Soy @"
	text_ram wStringBuffer3
	text "."
	line "¿Tienes tiempo"
	cont "para hablar?"
	done

GinaGenericText:
	text "¿Tus #MON son"
	line "duros?"

	para "Yo me entreno"
	line "todos los días con"
	cont "@"
	text_ram wStringBuffer4
	text "."
	done
