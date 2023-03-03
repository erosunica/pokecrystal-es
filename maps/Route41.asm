	object_const_def ; object_event constants
	const ROUTE41_OLIVINE_RIVAL1
	const ROUTE41_OLIVINE_RIVAL2
	const ROUTE41_OLIVINE_RIVAL3
	const ROUTE41_OLIVINE_RIVAL4
	const ROUTE41_OLIVINE_RIVAL5
	const ROUTE41_SWIMMER_GIRL1
	const ROUTE41_SWIMMER_GIRL2
	const ROUTE41_SWIMMER_GIRL3
	const ROUTE41_SWIMMER_GIRL4
	const ROUTE41_SWIMMER_GIRL5

Route41_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

TrainerSwimmerfKaylee:
	trainer SWIMMERF, KAYLEE, EVENT_BEAT_SWIMMERF_KAYLEE, SwimmerfKayleeSeenText, SwimmerfKayleeBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext SwimmerfKayleeAfterBattleText
	waitbutton
	closetext
	end

TrainerSwimmerfSusie:
	trainer SWIMMERF, SUSIE, EVENT_BEAT_SWIMMERF_SUSIE, SwimmerfSusieSeenText, SwimmerfSusieBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext SwimmerfSusieAfterBattleText
	waitbutton
	closetext
	end

TrainerSwimmerfDenise:
	trainer SWIMMERF, DENISE, EVENT_BEAT_SWIMMERF_DENISE, SwimmerfDeniseSeenText, SwimmerfDeniseBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext SwimmerfDeniseAfterBattleText
	waitbutton
	closetext
	end

TrainerSwimmerfKara:
	trainer SWIMMERF, KARA, EVENT_BEAT_SWIMMERF_KARA, SwimmerfKaraSeenText, SwimmerfKaraBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext SwimmerfKaraAfterBattleText
	waitbutton
	closetext
	end

TrainerSwimmerfWendy:
	trainer SWIMMERF, WENDY, EVENT_BEAT_SWIMMERF_WENDY, SwimmerfWendySeenText, SwimmerfWendyBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext SwimmerfWendyAfterBattleText
	waitbutton
	closetext
	end

TrainerSwimmermCharlie:
	trainer SWIMMERM, CHARLIE, EVENT_BEAT_SWIMMERM_CHARLIE, SwimmermCharlieSeenText, SwimmermCharlieBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext SwimmermCharlieAfterBattleText
	waitbutton
	closetext
	end

TrainerSwimmermGeorge:
	trainer SWIMMERM, GEORGE, EVENT_BEAT_SWIMMERM_GEORGE, SwimmermGeorgeSeenText, SwimmermGeorgeBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext SwimmermGeorgeAfterBattleText
	waitbutton
	closetext
	end

TrainerSwimmermBerke:
	trainer SWIMMERM, BERKE, EVENT_BEAT_SWIMMERM_BERKE, SwimmermBerkeSeenText, SwimmermBerkeBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext SwimmermBerkeAfterBattleText
	waitbutton
	closetext
	end

TrainerSwimmermKirk:
	trainer SWIMMERM, KIRK, EVENT_BEAT_SWIMMERM_KIRK, SwimmermKirkSeenText, SwimmermKirkBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext SwimmermKirkAfterBattleText
	waitbutton
	closetext
	end

TrainerSwimmermMathew:
	trainer SWIMMERM, MATHEW, EVENT_BEAT_SWIMMERM_MATHEW, SwimmermMathewSeenText, SwimmermMathewBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext SwimmermMathewAfterBattleText
	waitbutton
	closetext
	end

Route41Rock:
; unused
	jumpstd smashrock

Route41HiddenMaxEther:
	hiddenitem MAX_ETHER, EVENT_ROUTE_41_HIDDEN_MAX_ETHER

SwimmermCharlieSeenText:
	text "Aquí el agua está"
	line "templada. Estoy"
	cont "muy a gusto."

	para "¡Claro que lucharé"
	line "contigo!"
	done

SwimmermCharlieBeatenText:
	text "¡Vaya! ¡Estoy"
	line "como una pasa!"
	done

SwimmermCharlieAfterBattleText:
	text "¡Qué relajante es"
	line "flotar así!"
	done

SwimmermGeorgeSeenText:
	text "Estoy cansado. Si"
	line "gano, ¿me prestas"
	cont "tus #MON?"
	done

SwimmermGeorgeBeatenText:
	text "Uf, uf…"
	done

SwimmermGeorgeAfterBattleText:
	text "CIUDAD ORQUÍDEA"
	line "está muy lejos."

	para "Pero tampoco es"
	line "fácil volver a"
	cont "CIUDAD OLIVO."

	para "¿Qué se puede"
	line "hacer?"
	done

SwimmermBerkeSeenText:
	text "¿Ves esas islas"
	line "aisladas por"
	cont "torbellinos?"

	para "¡Tiene que haber"
	line "un secreto!"
	done

SwimmermBerkeBeatenText:
	text "¿Cuál es tu"
	line "secreto?"
	done

SwimmermBerkeAfterBattleText:
	text "Era de noche"
	line "y llovía…"

	para "Vi un #MON"
	line "gigante volando"
	cont "desde las islas."

	para "Dejaba caer las"
	line "plumas de sus"
	cont "alas plateadas."
	done

SwimmermKirkSeenText:
	text "Aquí hay mucho"
	line "oleaje."

	para "Cuesta mucho"
	line "nadar."
	done

SwimmermKirkBeatenText:
	text "¡Me has vencido!"
	done

SwimmermKirkAfterBattleText:
	text "La corriente me"
	line "impide llegar"
	cont "a las islas."
	done

SwimmermMathewSeenText:
	text "¿Estás buscando el"
	line "secreto de las"
	cont "ISLAS REMOLINO?"
	done

SwimmermMathewBeatenText:
	text "¡Ooh, tienes una"
	line "gran resistencia!"
	done

SwimmermMathewAfterBattleText:
	text "Un secreto sobre"
	line "ISLAS REMOLINO…"

	para "¡Dentro está muy"
	line "oscuro!"
	done

SwimmerfKayleeSeenText:
	text "Voy hacia las"
	line "ISLAS REMOLINO."

	para "Voy a explorarlas"
	line "con unos amigos."
	done

SwimmerfKayleeBeatenText:
	text "¿Así es como lo"
	line "haces?"
	done

SwimmerfKayleeAfterBattleText:
	text "Dicen que hay un"
	line "gran #MON"

	para "bajo las"
	line "ISLAS REMOLINO."

	para "Me pregunto cómo"
	line "será…"
	done

SwimmerfSusieSeenText:
	text "Estás tan elegante"
	line "sobre tu #MON."
	done

SwimmerfSusieBeatenText:
	text "He perdido…"
	done

SwimmerfSusieAfterBattleText:
	text "¿No había una"
	line "canción famosa"

	para "sobre un niño que"
	line "montaba un LAPRAS?"
	done

SwimmerfDeniseSeenText:
	text "¡No me puedo creer"
	line "el buen día que"
	cont "hace!"
	done

SwimmerfDeniseBeatenText:
	text "¡Oooh!"
	done

SwimmerfDeniseAfterBattleText:
	text "El sol es muy malo"
	line "para la piel."

	para "Pero yo no uso"
	line "protección solar."

	para "No quiero ensuciar"
	line "el agua."
	done

SwimmerfKaraSeenText:
	text "Si necesitas"
	line "descansar, flota"
	cont "y déjate llevar"

	para "por el viento, así"
	line "no malgastarás tus"
	cont "fuerzas."
	done

SwimmerfKaraBeatenText:
	text "¡Oh! Tienes más"
	line "energía que yo."
	done

SwimmerfKaraAfterBattleText:
	text "He oído rugidos"
	line "procedentes de"
	cont "las ISLAS."
	done

SwimmerfWendySeenText:
	text "Por la noche, los"
	line "STARYU se reúnen"

	para "cerca de la"
	line "superficie."
	done

SwimmerfWendyBeatenText:
	text "¡Oh, vaya…!"
	done

SwimmerfWendyAfterBattleText:
	text "Los grupos de"
	line "STARYU se iluminan"
	cont "al mismo tiempo."

	para "Es muy bonito,"
	line "pero da miedo."
	done

Route41_MapEvents:
	db 0, 0 ; filler

	db 4 ; warp events
	warp_event 12, 17, WHIRL_ISLAND_NW, 1
	warp_event 36, 19, WHIRL_ISLAND_NE, 1
	warp_event 12, 37, WHIRL_ISLAND_SW, 1
	warp_event 36, 45, WHIRL_ISLAND_SE, 1

	db 0 ; coord events

	db 1 ; bg events
	bg_event  9, 35, BGEVENT_ITEM, Route41HiddenMaxEther

	db 10 ; object events
	object_event 32,  6, SPRITE_OLIVINE_RIVAL, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 3, TrainerSwimmermCharlie, -1
	object_event 46,  8, SPRITE_OLIVINE_RIVAL, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 3, TrainerSwimmermGeorge, -1
	object_event 20, 26, SPRITE_OLIVINE_RIVAL, SPRITEMOVEDATA_SPINCOUNTERCLOCKWISE, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 3, TrainerSwimmermBerke, -1
	object_event 32, 30, SPRITE_OLIVINE_RIVAL, SPRITEMOVEDATA_SPINCLOCKWISE, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 3, TrainerSwimmermKirk, -1
	object_event 19, 46, SPRITE_OLIVINE_RIVAL, SPRITEMOVEDATA_SPINCOUNTERCLOCKWISE, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 3, TrainerSwimmermMathew, -1
	object_event 17,  4, SPRITE_SWIMMER_GIRL, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_TRAINER, 3, TrainerSwimmerfKaylee, -1
	object_event 23, 19, SPRITE_SWIMMER_GIRL, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_TRAINER, 3, TrainerSwimmerfSusie, -1
	object_event 27, 34, SPRITE_SWIMMER_GIRL, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_TRAINER, 3, TrainerSwimmerfDenise, -1
	object_event 44, 28, SPRITE_SWIMMER_GIRL, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_TRAINER, 4, TrainerSwimmerfKara, -1
	object_event  9, 50, SPRITE_SWIMMER_GIRL, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_TRAINER, 2, TrainerSwimmerfWendy, -1
