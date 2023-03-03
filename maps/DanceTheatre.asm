	object_const_def ; object_event constants
	const DANCETHEATRE_KIMONO_GIRL1
	const DANCETHEATRE_KIMONO_GIRL2
	const DANCETHEATRE_KIMONO_GIRL3
	const DANCETHEATRE_KIMONO_GIRL4
	const DANCETHEATRE_KIMONO_GIRL5
	const DANCETHEATRE_GENTLEMAN
	const DANCETHEATRE_RHYDON
	const DANCETHEATRE_COOLTRAINER_M
	const DANCETHEATRE_GRANNY

DanceTheatre_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

TrainerKimonoGirlNaoko2:
	trainer KIMONO_GIRL, NAOKO2, EVENT_BEAT_KIMONO_GIRL_NAOKO, KimonoGirlNaoko2SeenText, KimonoGirlNaoko2BeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext KimonoGirlNaoko2AfterBattleText
	waitbutton
	closetext
	end

TrainerKimonoGirlSayo:
	trainer KIMONO_GIRL, SAYO, EVENT_BEAT_KIMONO_GIRL_SAYO, KimonoGirlSayoSeenText, KimonoGirlSayoBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext KimonoGirlSayoAfterBattleText
	waitbutton
	closetext
	end

TrainerKimonoGirlZuki:
	trainer KIMONO_GIRL, ZUKI, EVENT_BEAT_KIMONO_GIRL_ZUKI, KimonoGirlZukiSeenText, KimonoGirlZukiBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext KimonoGirlZukiAfterBattleText
	waitbutton
	closetext
	end

TrainerKimonoGirlKuni:
	trainer KIMONO_GIRL, KUNI, EVENT_BEAT_KIMONO_GIRL_KUNI, KimonoGirlKuniSeenText, KimonoGirlKuniBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext KimonoGirlKuniAfterBattleText
	waitbutton
	closetext
	end

TrainerKimonoGirlMiki:
	trainer KIMONO_GIRL, MIKI, EVENT_BEAT_KIMONO_GIRL_MIKI, KimonoGirlMikiSeenText, KimonoGirlMikiBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext KimonoGirlMikiAfterBattleText
	waitbutton
	closetext
	end

DanceTheaterSurfGuy:
	faceplayer
	opentext
	writetext SurfGuyNeverLeftAScratchText
	promptbutton
	checkevent EVENT_GOT_HM03_SURF
	iftrue SurfGuyAlreadyGaveSurf
	checkevent EVENT_BEAT_KIMONO_GIRL_NAOKO
	iffalse .KimonoGirlsUndefeated
	checkevent EVENT_BEAT_KIMONO_GIRL_SAYO
	iffalse .KimonoGirlsUndefeated
	checkevent EVENT_BEAT_KIMONO_GIRL_ZUKI
	iffalse .KimonoGirlsUndefeated
	checkevent EVENT_BEAT_KIMONO_GIRL_KUNI
	iffalse .KimonoGirlsUndefeated
	checkevent EVENT_BEAT_KIMONO_GIRL_MIKI
	iffalse .KimonoGirlsUndefeated
	sjump .GetSurf

.KimonoGirlsUndefeated:
	checkflag ENGINE_PLAYER_IS_FEMALE
	iftrue .PlayerIsFemale
	writetext SurfGuyLadGiftText
	waitbutton
	closetext
	end

.PlayerIsFemale:
	writetext SurfGuyLassieGiftText
	waitbutton
	closetext
	end

.GetSurf:
	writetext SurfGuyLikeADanceText
	promptbutton
	verbosegiveitem HM_SURF
	setevent EVENT_GOT_HM03_SURF
	writetext SurfGuySurfExplanationText
	waitbutton
	closetext
	end

SurfGuyAlreadyGaveSurf:
	writetext SurfGuyElegantKimonoGirlsText
	waitbutton
	closetext
	end

DanceTheaterRhydon:
	opentext
	writetext RhydonText
	cry RHYDON
	waitbutton
	closetext
	end

DanceTheatreCooltrainerMScript:
	jumptextfaceplayer DanceTheatreCooltrainerMText

DanceTheatreGrannyScript:
	jumptextfaceplayer DanceTheatreGrannyText

DanceTheatreFancyPanel:
	jumptext DanceTheatreFancyPanelText

KimonoGirlNaoko2SeenText:
	text "Tus #MON son"
	line "encantadores."
	cont "¿Cómo luchan?"
	done

KimonoGirlNaoko2BeatenText:
	text "¡Oh! ¡Eres muy"
	line "fuerte!"
	done

KimonoGirlNaoko2AfterBattleText:
	text "Me ha gustado el"
	line "combate. Espero"
	cont "volver a verte."
	done

KimonoGirlSayoSeenText:
	text "Yo siempre bailo"
	line "con mis #MON."

	para "Y también los"
	line "entreno, claro."
	done

KimonoGirlSayoBeatenText:
	text "¡Estuve cerca!"
	line "Por poco te venzo."
	done

KimonoGirlSayoAfterBattleText:
	text "El ritmo es muy"
	line "importante para la"

	para "danza y para los"
	line "#MON."
	done

KimonoGirlZukiSeenText:
	text "¿Te gusta mi"
	line "pasador?"

	para "¡Ah! ¿Un combate"
	line "#MON?"
	done

KimonoGirlZukiBeatenText:
	text "No me queda ningún"
	line "#MON…"
	done

KimonoGirlZukiAfterBattleText:
	text "Cada mes pongo una"
	line "flor nueva en mi"
	cont "pasador."
	done

KimonoGirlKuniSeenText:
	text "¡Oh! ¡Eres tan"
	line "guay!"
	cont "¿Quieres luchar?"
	done

KimonoGirlKuniBeatenText:
	text "Eres más fuerte de"
	line "lo que pareces."
	done

KimonoGirlKuniAfterBattleText:
	text "He entrenado mucho"
	line "y creía que tenía"

	para "posibilidades,"
	line "pero no."
	done

KimonoGirlMikiSeenText:
	text "¿Te gusta cómo"
	line "bailo? También"

	para "soy hábil con los"
	line "#MON."
	done

KimonoGirlMikiBeatenText:
	text "¡Oh! ¡Tú también"
	line "eres genial!"
	done

KimonoGirlMikiAfterBattleText:
	text "Sigo bailando"
	line "porque hay gente a"

	para "la que le gusta lo"
	line "que hago."

	para "Mis #MON me"
	line "animan."
	done

SurfGuyNeverLeftAScratchText:
	text "Las CHICAS KIMONO"
	line "no sólo bailan."

	para "También son"
	line "extraordinarias"
	cont "con los #MON."

	para "Yo siempre las"
	line "desafío pero nunca"

	para "les he hecho ni un"
	line "rasguño…"
	done

SurfGuyLadGiftText:
	text "¡Chaval! Si vences"
	line "a todas las CHICAS"

	para "KIMONO, te daré un"
	line "regalo."
	done

SurfGuyLassieGiftText:
	text "Chica, si vences a"
	line "todas las CHICAS"

	para "KIMONO, te daré un"
	line "regalo."
	done

SurfGuyLikeADanceText:
	text "Verte luchar ha"
	line "sido como ver una"
	cont "danza."

	para "¡Ha sido un"
	line "extraño combate!"

	para "Me gustaría darte"
	line "esto. Adelante,"
	cont "¡tuyo es!"
	done

SurfGuySurfExplanationText:
	text "Es SURF."

	para "Un movimiento que"
	line "permite nadar a"
	cont "los #MON."
	done

SurfGuyElegantKimonoGirlsText:
	text "Ojalá mis #MON"
	line "fueran tan"

	para "elegantes como las"
	line "CHICAS KIMONO…"
	done

RhydonText:
	text "RHYDON: ¡Rhydo,"
	line "rhydo!"
	done

DanceTheatreCooltrainerMText:
	text "Ese hombre siempre"
	line "va con su RHYDON."

	para "Dice que quiere un"
	line "#MON que baile"
	cont "y haga SURF."

	para "¿Intenta crear un"
	line "#MON que haga"

	para "natación"
	line "sincronizada?"
	done

DanceTheatreGrannyText:
	text "Las CHICAS KIMONO"
	line "son tan guapas…"

	para "Pero tienen que"
	line "entrenarse mucho."

	para "Y deben aprender"
	line "los distintos"

	para "bailes antes de"
	line "actuar."

	para "Pero si te gusta"
	line "algo, todo es"
	cont "posible."
	done

DanceTheatreFancyPanelText:
	text "Es un elegante"
	line "panel decorado con"
	cont "flores."
	done

DanceTheatre_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event  5, 13, ECRUTEAK_CITY, 8
	warp_event  6, 13, ECRUTEAK_CITY, 8

	db 0 ; coord events

	db 2 ; bg events
	bg_event  5,  6, BGEVENT_UP, DanceTheatreFancyPanel
	bg_event  6,  6, BGEVENT_UP, DanceTheatreFancyPanel

	db 9 ; object events
	object_event  0,  2, SPRITE_KIMONO_GIRL, SPRITEMOVEDATA_SPINCOUNTERCLOCKWISE, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_TRAINER, 0, TrainerKimonoGirlNaoko2, -1
	object_event  2,  1, SPRITE_KIMONO_GIRL, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 0, TrainerKimonoGirlSayo, -1
	object_event  6,  2, SPRITE_KIMONO_GIRL, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 0, TrainerKimonoGirlZuki, -1
	object_event  9,  1, SPRITE_KIMONO_GIRL, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 0, TrainerKimonoGirlKuni, -1
	object_event 11,  2, SPRITE_KIMONO_GIRL, SPRITEMOVEDATA_SPINCLOCKWISE, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_TRAINER, 0, TrainerKimonoGirlMiki, -1
	object_event  7, 10, SPRITE_GENTLEMAN, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, DanceTheaterSurfGuy, -1
	object_event  6,  8, SPRITE_RHYDON, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, DanceTheaterRhydon, -1
	object_event 10, 10, SPRITE_COOLTRAINER_M, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, DanceTheatreCooltrainerMScript, -1
	object_event  3,  6, SPRITE_GRANNY, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, DanceTheatreGrannyScript, -1
