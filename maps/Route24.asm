	object_const_def ; object_event constants
	const ROUTE24_ROCKET

Route24_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

Route24RocketScript:
	faceplayer
	playmusic MUSIC_ROCKET_ENCOUNTER
	opentext
	writetext Route24RocketSeenText
	waitbutton
	closetext
	winlosstext Route24RocketBeatenText, -1
	loadtrainer GRUNTM, GRUNTM_31
	startbattle
	dontrestartmapmusic
	reloadmapafterbattle
	playmusic MUSIC_ROCKET_ENCOUNTER
	opentext
	writetext Route24RocketAfterBattleText
	promptbutton
	special FadeOutMusic
	writetext Route24RocketDisappearsText
	waitbutton
	closetext
	special FadeBlackQuickly
	special ReloadSpritesNoPalettes
	disappear ROUTE24_ROCKET
	pause 25
	special FadeInQuickly
	playmapmusic
	end

Route24RocketSeenText:
	text "¡Eh, tú! ¡Un"
	line "miembro del TEAM"
	cont "ROCKET ser yo!"

	para "Ser de otro país."
	line "Entrenador número"
	cont "uno, ¡yo ése!"

	para "Pensar hice. Si"
	line "cortar energía,"

	para "¡mucho pánico"
	line "aquí todos!"

	para "Misión secreta"
	line "es, ¡no contar"
	cont "a ti!"

	para "Pero, si ganar a"
	line "mí, un hombre"

	para "soy y secreto mío"
	line "a ti contar."

	para "¡Eh, tú!"
	line "¡Lucha empezar!"
	done

Route24RocketBeatenText:
	text "¡Ayyyy! ¡No, no,"
	line "no! ¡Creer no"
	cont "puedo!"

	para "¡Fuerte mucho"
	line "eres! ¡Rival"
	cont "para ti no soy!"
	done

Route24RocketAfterBattleText:
	text "Vale. Contar"
	line "secreto a ti."

	para "MAQUINARIA yo"
	line "robar, escondida"

	para "en GIMNASIO de"
	line "CELESTE."

	para "En agua yo poner."
	line "Mirar en centro de"
	cont "agua de GIMNASIO."

	para "¡Pero tú no"
	line "olvidar a mí!"

	para "TEAM ROCKET seguro"
	line "derrotar a ti."

	para "Míos amigos venir"
	line "de JOHTO, sí."
	cont "Vengar ellos a mí."
	done

Route24RocketDisappearsText:
	text "…"

	para "¿Dices que TEAM"
	line "ROCKET adiós?"

	para "¿Roto? ¿Eso dices?"

	para "¡Oh, no! ¿Debo ir"
	line "por cuenta mía"
	cont "ahora?"
	done

Route24_MapEvents:
	db 0, 0 ; filler

	db 0 ; warp events

	db 0 ; coord events

	db 0 ; bg events

	db 1 ; object events
	object_event  8,  7, SPRITE_ROCKET, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, Route24RocketScript, EVENT_ROUTE_24_ROCKET
