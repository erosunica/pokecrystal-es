ParryNothingCanMatchText:
	text "No hay nada como"
	line "mi @"
	text_ram wStringBuffer4
	text "."
	done

ParryDefeatedMonText:
	text "¡Noqueamos a un"
	line "@"
	text_ram wStringBuffer4
	text_start
	cont "salvaje!"

	para "Estuvo bien, pero"
	line "quería atraparlo…"
	done

ParryLostAMonText:
	text "Y ayer vimos a"
	line "un @"
	text_ram wStringBuffer4
	text_start

	para "salvaje. Nos pre-"
	line "guntábamos si de-"
	cont "bíamos atraparlo"
	cont "o golpearlo."

	para "¡Entonces llegó un"
	line "chico y lo atrapó!"
	cont "¿Qué te parece?"
	done

ParryBattleRematchText:
	text "Estás pensando que"
	line "te gustaría luchar"

	para "conmigo, ¿no es"
	line "cierto?"

	para "¡Sí! ¡Nos vemos en"
	line "@"
	text_ram wStringBuffer5
	text "!"
	done

ParryHangUpText:
	text "Vale, ¡vuelve a"
	line "llamarme!"
	done

ParryBattleWithMeText:
	text "Volveremos a"
	line "luchar, ¿verdad?"
	done

ParryHaventYouGottenToText:
	text "¿No has llegado a"
	line "@"
	text_ram wStringBuffer5
	text "?"

	para "¡Esperar aquí no"
	line "está tan mal, pero"
	cont "preferiría luchar!"
	done
