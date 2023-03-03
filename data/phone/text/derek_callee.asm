DerekAnswerPhoneText:
	text "Hola, ¿<PLAY_G>?"

	para "Buenos días, pika."
	line "¿Qué pasa, pika?"
	done

DerekAnswerPhoneDayText:
	text "Hola, ¿<PLAY_G>?"

	para "Buenos días, pika."
	line "¿Qué pasa, pika?"
	done

DerekAnswerPhoneNiteText:
	text "Hola, ¿<PLAY_G>?"

	para "Buenas noches,"
	line "pika."
	cont "¿Qué pasa, pika?"
	done

DerekGreetText:
	text "¡<PLAY_G>, pika!"
	line "¡Buenos días!"

	para "Soy @"
	text_ram wStringBuffer3
	text "."
	line "¿Cómo pika estás?"
	done

DerekGreetDayText:
	text "¡<PLAY_G>, pika!"
	line "¡Buenos pika días!"

	para "Soy @"
	text_ram wStringBuffer3
	text "."
	line "¿Cómo pika estás?"
	done

DerekGreetNiteText:
	text "¡<PLAY_G>, pika!"
	line "¡Buenas noches!"

	para "Soy @"
	text_ram wStringBuffer3
	text "."
	line "¿Cómo pika estás?"
	done

DerekGenericText:
	text "¡Tienes que oír"
	line "esto! ¡Mi adorable"

	para "@"
	text_ram wStringBuffer4
	text " me"
	line "miró y me sonrió!"

	para "¡Será porque"
	line "somos almas"
	cont "gemelas!"
	done
