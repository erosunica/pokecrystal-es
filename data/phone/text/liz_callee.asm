LizAnswerPhoneText:
	text "Hola. @"
	text_ram wStringBuffer3
	text_start
	line "al habla."

	para "Oh, <PLAY_G>."
	line "Buenos días."
	done

LizAnswerPhoneDayText:
	text "Hola. @"
	text_ram wStringBuffer3
	text_start
	line "al habla."

	para "Oh, <PLAY_G>."
	line "¿Qué tal estás?"
	done

LizAnswerPhoneNiteText:
	text "Hola. @"
	text_ram wStringBuffer3
	text_start
	line "al habla."

	para "Oh, <PLAY_G>."
	line "Buenas noches."
	done

LizGreetText:
	text "Buenos días,"
	line "<PLAY_G>."

	para "Soy @"
	text_ram wStringBuffer3
	text "."
	line "¿Dormías?"
	done

LizGreetDayText:
	text "Hola, <PLAY_G>."
	line "Soy @"
	text_ram wStringBuffer3
	text "."

	para "¿Qué tal te van"
	line "las cosas?"
	done

LizGreetNiteText:
	text "Buenas noches,"
	line "<PLAY_G>."

	para "Soy @"
	text_ram wStringBuffer3
	text "."
	line "¿Aún sin dormir?"
	done

LizGenericText:
	text "Tenía algo de"
	line "tiempo, así que"
	cont "pensé en llamarte."

	para "De todos modos,"
	line "¿qué tal están tus"
	cont "#MON?"

	para "Yo llevo a mi"
	line "@"
	text_ram wStringBuffer4
	text " al"

	para "CENTRO #MON de"
	line "CIUDAD MALVA todos"

	para "los días, así que"
	line "está fantástico."

	para "¡Soy amiga de la"
	line "recepcionista!"
	done
