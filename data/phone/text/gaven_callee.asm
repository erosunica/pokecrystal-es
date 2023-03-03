GavenAnswerPhoneText:
	text "Hola, al habla"
	line "@"
	text_ram wStringBuffer3
	text "…"

	para "¡Hola, <PLAY_G>!"
	line "¡Buenos días!"
	done

GavenAnswerPhoneDayText:
	text "Hola, al habla"
	line "@"
	text_ram wStringBuffer3
	text "…"

	para "¡Hola, <PLAY_G>!"
	done

GavenAnswerPhoneNiteText:
	text "Hola, al habla"
	line "@"
	text_ram wStringBuffer3
	text "…"

	para "¡Hola, <PLAY_G>!"
	line "¡Buenas noches!"
	done

GavenGreetText:
	text "¡<PLAY_G>, buenos"
	line "días!"

	para "Soy yo, @"
	text_ram wStringBuffer3
	text "."
	line "¿Qué tal vas?"
	done

GavenGreetDayText:
	text "¡Hola, <PLAY_G>!"

	para "Soy yo, @"
	text_ram wStringBuffer3
	text "."
	line "¿Qué tal vas?"
	done

GavenGreetNiteText:
	text "¡<PLAY_G>, buenas"
	line "noches!"

	para "Soy yo, @"
	text_ram wStringBuffer3
	text "."
	line "¿Qué tal vas?"
	done

GavenGenericText:
	text "¿Qué tal van tus"
	line "#MON?"

	para "Mi @"
	text_ram wStringBuffer4
	text_start
	line "lo está haciendo"
	cont "mejor que nunca."

	para "¡Si seguimos así,"
	line "seremos CAMPEONES"
	cont "#MON!"
	done
