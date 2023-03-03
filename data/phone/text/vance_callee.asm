VanceAnswerPhoneText:
	text "¿Sí, diga?"
	line "¡Soy @"
	text_ram wStringBuffer3
	text "!"

	para "¡Hola, <PLAY_G>!"

	para "¿Estás usando"
	line "#MON pájaro?"
	done

VanceAnswerPhoneDayText:
	text "¿Sí, diga?"
	line "¡Soy @"
	text_ram wStringBuffer3
	text "!"

	para "¡Hola, <PLAY_G>!"

	para "¿Están tus #MON"
	line "pájaro volando?"
	done

VanceAnswerPhoneNiteText:
	text "¿Sí, diga?"
	line "¡Soy @"
	text_ram wStringBuffer3
	text "!"

	para "¡Buenas noches,"
	line "<PLAY_G>!"

	para "¿Les das a tus"
	line "#MON pájaro"
	cont "algo de acción?"
	done

VanceGreetText:
	text "¡Buenos días,"
	line "<PLAY_G>!"

	para "¡Soy @"
	text_ram wStringBuffer3
	text "!"
	done

VanceGreetDayText:
	text "¡Hola, <PLAY_G>!"

	para "¡Soy @"
	text_ram wStringBuffer3
	text "!"
	line "¿Me recuerdas?"
	done

VanceGreetNiteText:
	text "¡Buenas noches,"
	line "<PLAY_G>!"

	para "¡Soy @"
	text_ram wStringBuffer3
	text "!"
	line "¿Estás libre?"
	done

VanceGenericText:
	text "¿Estáis bien tus"
	line "#MON y tú?"

	para "¡Mi @"
	text_ram wStringBuffer4
	text_start
	line "parece que llegará"

	para "a ser tan duro"
	line "como para enfren-"
	cont "tarse y derrotar a"
	cont "los legendarios"
	cont "pájaros #MON!"
	done
