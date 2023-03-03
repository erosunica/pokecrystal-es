	object_const_def ; object_event constants
	const CIANWOODGYM_CHUCK
	const CIANWOODGYM_BLACK_BELT1
	const CIANWOODGYM_BLACK_BELT2
	const CIANWOODGYM_BLACK_BELT3
	const CIANWOODGYM_BLACK_BELT4
	const CIANWOODGYM_BOULDER1
	const CIANWOODGYM_BOULDER2
	const CIANWOODGYM_BOULDER3
	const CIANWOODGYM_BOULDER4

CianwoodGym_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

CianwoodGymChuckScript:
	faceplayer
	opentext
	checkevent EVENT_BEAT_CHUCK
	iftrue .FightDone
	writetext ChuckIntroText1
	waitbutton
	closetext
	turnobject CIANWOODGYM_CHUCK, RIGHT
	opentext
	writetext ChuckIntroText2
	waitbutton
	closetext
	applymovement CIANWOODGYM_BOULDER1, CianwoodGymMovement_ChuckChucksBoulder
	playsound SFX_STRENGTH
	earthquake 80
	disappear CIANWOODGYM_BOULDER1
	pause 30
	faceplayer
	opentext
	writetext ChuckIntroText3
	waitbutton
	closetext
	winlosstext ChuckLossText, 0
	loadtrainer CHUCK, CHUCK1
	startbattle
	reloadmapafterbattle
	setevent EVENT_BEAT_CHUCK
	opentext
	writetext GetStormBadgeText
	playsound SFX_GET_BADGE
	waitsfx
	setflag ENGINE_STORMBADGE
	readvar VAR_BADGES
	scall CianwoodGymActivateRockets
.FightDone:
	checkevent EVENT_GOT_TM01_DYNAMICPUNCH
	iftrue .AlreadyGotTM
	setevent EVENT_BEAT_BLACKBELT_YOSHI
	setevent EVENT_BEAT_BLACKBELT_LAO
	setevent EVENT_BEAT_BLACKBELT_NOB
	setevent EVENT_BEAT_BLACKBELT_LUNG
	writetext ChuckExplainBadgeText
	promptbutton
	verbosegiveitem TM_DYNAMICPUNCH
	iffalse .BagFull
	setevent EVENT_GOT_TM01_DYNAMICPUNCH
	writetext ChuckExplainTMText
	waitbutton
	closetext
	end

.AlreadyGotTM:
	writetext ChuckAfterText
	waitbutton
.BagFull:
	closetext
	end

CianwoodGymActivateRockets:
	ifequal 7, .RadioTowerRockets
	ifequal 6, .GoldenrodRockets
	end

.GoldenrodRockets:
	jumpstd goldenrodrockets

.RadioTowerRockets:
	jumpstd radiotowerrockets

TrainerBlackbeltYoshi:
	trainer BLACKBELT_T, YOSHI, EVENT_BEAT_BLACKBELT_YOSHI, BlackbeltYoshiSeenText, BlackbeltYoshiBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext BlackbeltYoshiAfterText
	waitbutton
	closetext
	end

TrainerBlackbeltLao:
	trainer BLACKBELT_T, LAO, EVENT_BEAT_BLACKBELT_LAO, BlackbeltLaoSeenText, BlackbeltLaoBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext BlackbeltLaoAfterText
	waitbutton
	closetext
	end

TrainerBlackbeltNob:
	trainer BLACKBELT_T, NOB, EVENT_BEAT_BLACKBELT_NOB, BlackbeltNobSeenText, BlackbeltNobBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext BlackbeltNobAfterText
	waitbutton
	closetext
	end

TrainerBlackbeltLung:
	trainer BLACKBELT_T, LUNG, EVENT_BEAT_BLACKBELT_LUNG, BlackbeltLungSeenText, BlackbeltLungBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext BlackbeltLungAfterText
	waitbutton
	closetext
	end

CianwoodGymBoulder:
	jumpstd strengthboulder

CianwoodGymStatue:
	checkflag ENGINE_STORMBADGE
	iftrue .Beaten
	jumpstd gymstatue1
.Beaten:
	gettrainername STRING_BUFFER_4, CHUCK, CHUCK1
	jumpstd gymstatue2

CianwoodGymMovement_ChuckChucksBoulder:
	set_sliding
	big_step LEFT
	big_step UP
	fast_jump_step RIGHT
	remove_sliding
	step_end

ChuckIntroText1:
	text "¡UAUUUU!"

	para "¡Has llegado hasta"
	line "aquí!"

	para "¡Que sepas que soy"
	line "muy fuerte!"

	para "¡Mis #MON"
	line "aplastarán piedras"
	cont "y romperán huesos!"

	para "¡Atención!"
	done

ChuckIntroText2:
	text "ANÍBAL: ¡Urgg!"
	line "¡Urgg…!"

	para "¡Oooarrg!"
	done

ChuckIntroText3:
	text "¿Qué? Ahora tienes"
	line "miedo, ¿no?"

	para "¿Qué? ¿No tiene"
	line "nada que ver con"

	para "los #MON?"
	line "¡Es cierto!"

	para "Venga. ¡Luchemos!"
	done

ChuckLossText:
	text "¿Qué? ¿Cómo?"
	line "¿He perdido?"

	para "¡Muy bien!"
	line "¡Te mereces la"
	cont "MEDALLA TORMENTA!"
	done

GetStormBadgeText:
	text "<PLAYER> recibió la"
	line "MEDALLA TORMENTA."
	done

ChuckExplainBadgeText:
	text "Con MED. TORMENTA,"
	line "te obedecerán los"

	para "#MON hasta el"
	line "nivel 70."

	para "Y permitirá a tus"
	line "#MON usar VUELO"

	para "cuando no estén"
	line "luchando."

	para "¡Toma esto"
	line "también!"
	done

ChuckExplainTMText:
	text "Se trata de"
	line "PUÑODINÁMICO."

	para "¡No siempre golpea"
	line "pero cuando lo"

	para "hace produce"
	line "confusión!"
	done

ChuckAfterText:
	text "¡UAJAJAA! ¡Ha sido"
	line "muy divertido!"

	para "¡Pero una derrota"
	line "es una derrota!"

	para "¡Desde ahora, voy"
	line "a entrenarme 24"
	cont "horas al día!"
	done

BlackbeltYoshiSeenText:
	text "A mis #MON y"
	line "a mí nos une una"
	cont "gran amistad."

	para "¡Nuestro vínculo"
	line "nunca se romperá!"
	done

BlackbeltYoshiBeatenText:
	text "¡No puede ser!"
	done

BlackbeltYoshiAfterText:
	text "¡Parece que tú y"
	line "tus #MON estáis"
	cont "muy unidos!"
	done

BlackbeltLaoSeenText:
	text "¡Los expertos en"
	line "artes marciales no"
	cont "tememos a nada!"
	done

BlackbeltLaoBeatenText:
	text "¡Es increíble!"
	done

BlackbeltLaoAfterText:
	text "Los #MON de"
	line "lucha temen a los"
	cont "psíquicos…"
	done

BlackbeltNobSeenText:
	text "Las palabras no"
	line "sirven. ¡Deja que"
	cont "hablen tus puños!"
	done

BlackbeltNobBeatenText:
	text "…"
	done

BlackbeltNobAfterText:
	text "¡He perdido!"
	line "¡No sé qué decir!"
	done

BlackbeltLungSeenText:
	text "¡Mis furiosos"
	line "puños destrozarán"
	cont "a tus #MON!"
	done

BlackbeltLungBeatenText:
	text "¡Me has aplastado!"
	done

BlackbeltLungAfterText:
	text "¡Mis #MON han"
	line "perdido! Has"
	cont "herido mi orgullo."
	done

CianwoodGym_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event  4, 17, CIANWOOD_CITY, 2
	warp_event  5, 17, CIANWOOD_CITY, 2

	db 0 ; coord events

	db 2 ; bg events
	bg_event  3, 15, BGEVENT_READ, CianwoodGymStatue
	bg_event  6, 15, BGEVENT_READ, CianwoodGymStatue

	db 9 ; object events
	object_event  4,  1, SPRITE_CHUCK, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, CianwoodGymChuckScript, -1
	object_event  2, 12, SPRITE_BLACK_BELT, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_TRAINER, 3, TrainerBlackbeltYoshi, -1
	object_event  7, 12, SPRITE_BLACK_BELT, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_TRAINER, 3, TrainerBlackbeltLao, -1
	object_event  3,  9, SPRITE_BLACK_BELT, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_TRAINER, 2, TrainerBlackbeltNob, -1
	object_event  5,  5, SPRITE_BLACK_BELT, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_TRAINER, 1, TrainerBlackbeltLung, -1
	object_event  5,  1, SPRITE_BOULDER, SPRITEMOVEDATA_STRENGTH_BOULDER, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, CianwoodGymBoulder, -1
	object_event  3,  7, SPRITE_BOULDER, SPRITEMOVEDATA_STRENGTH_BOULDER, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, CianwoodGymBoulder, -1
	object_event  4,  7, SPRITE_BOULDER, SPRITEMOVEDATA_STRENGTH_BOULDER, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, CianwoodGymBoulder, -1
	object_event  5,  7, SPRITE_BOULDER, SPRITEMOVEDATA_STRENGTH_BOULDER, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, CianwoodGymBoulder, -1
