WadeAnswerPhoneText:
	text "¿Diga? Al habla"
	line "@"
	text_ram wStringBuffer3
	text "."

	para "¡Hola, <PLAY_G>!"
	line "¡Buenos días!"
	done

WadeAnswerPhoneDayText:
	text "¿Diga? Al habla"
	line "@"
	text_ram wStringBuffer3
	text "."

	para "¡Hola, <PLAY_G>!"
	done

WadeAnswerPhoneNiteText:
	text "¿Hola? Al habla"
	line "@"
	text_ram wStringBuffer3
	text "."

	para "¡Hola, <PLAY_G>!"
	line "¡Buenas noches!"
	done

WadeGreetText:
	text "¡<PLAY_G>, buenos"
	line "días!"

	para "Soy yo, @"
	text_ram wStringBuffer3
	text "."
	line "¿A que hace un día"
	cont "estupendo?"
	done

WadeGreetDayText:
	text "¡Hola, <PLAY_G>!"

	para "Soy yo, @"
	text_ram wStringBuffer3
	text "."
	line "¿A que hace un día"
	cont "estupendo?"
	done

WadeGreetNiteText:
	text "¡Buenas noches,"
	line "<PLAY_G>!"

	para "Soy yo, @"
	text_ram wStringBuffer3
	text "."
	line "¿Estabas"
	cont "durmiendo?"
	done

WadeGenericText:
	text "¿Qué tal están tus"
	line "#MON?"

	para "Mis #MON tienen"
	line "demasiada energía."

	para "Puede llegar a ser"
	line "un problema."

	para "De todos mis #-"
	line "MON, @"
	text_ram wStringBuffer4
	text " es"

	para "el más difícil de"
	line "controlar."

	para "Trabajar con él"
	line "cansa mucho."
	done
