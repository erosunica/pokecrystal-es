	object_const_def ; object_event constants
	const BLUESHOUSE_DAISY

BluesHouse_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

DaisyScript:
	faceplayer
	opentext
	readvar VAR_HOUR
	ifequal 15, .ThreePM
	writetext DaisyHelloText
	waitbutton
	closetext
	end

.ThreePM:
	checkflag ENGINE_DAISYS_GROOMING
	iftrue .AlreadyGroomedMon
	writetext DaisyOfferGroomingText
	yesorno
	iffalse .Refused
	writetext DaisyWhichMonText
	waitbutton
	special DaisysGrooming
	ifequal $0, .Refused
	ifequal $1, .CantGroomEgg
	setflag ENGINE_DAISYS_GROOMING
	writetext DaisyAlrightText
	waitbutton
	closetext
	special FadeOutPalettes
	playmusic MUSIC_HEAL
	pause 60
	special FadeInPalettes
	special RestartMapMusic
	opentext
	writetext GroomedMonLooksContentText
	special PlayCurMonCry
	promptbutton
	writetext DaisyAllDoneText
	waitbutton
	closetext
	end

.AlreadyGroomedMon:
	writetext DaisyAlreadyGroomedText
	waitbutton
	closetext
	end

.Refused:
	writetext DaisyRefusedText
	waitbutton
	closetext
	end

.CantGroomEgg:
	writetext DaisyCantGroomEggText
	waitbutton
	closetext
	end

DaisyHelloText:
	text "DALIA: ¡Hola! Mi"
	line "hermano es LÍDER"

	para "del GIMNASIO de"
	line "CIUDAD VERDE."

	para "Pero sale tanto de"
	line "la ciudad que trae"

	para "problemas a los"
	line "entrenadores."
	done

DaisyOfferGroomingText:
	text "DALIA: ¡Llegas"
	line "a tiempo! Iba a"
	cont "tomar un té."

	para "¿Quieres"
	line "tomarte uno?"

	para "Tus #MON están"
	line "un poco sucios."

	para "¿Quieres que"
	line "limpie a uno?"
	done

DaisyWhichMonText:
	text "DALIA: ¿Qué"
	line "#MON limpio?"
	done

DaisyAlrightText:
	text "DALIA: Vale, haré"
	line "que mejore su"
	cont "aspecto enseguida."
	done

GroomedMonLooksContentText:
	text_ram wStringBuffer3
	text_start
	line "parece contento."
	done

DaisyAllDoneText:
	text "DALIA: ¡Ya está!"
	line "¡Listo!"

	para "¿Qué? ¿Tiene buen"
	line "aspecto o no?"

	para "¡Qué #MON"
	line "más mono!"
	done

DaisyAlreadyGroomedText:
	text "DALIA: Siempre"
	line "tomo té a esta"

	para "hora. Ven cuando"
	line "quieras."
	done

DaisyRefusedText:
	text "DALIA: ¿No quieres"
	line "que limpie a un"

	para "#MON? Vale, tan"
	line "sólo tomaremos té."
	done

DaisyCantGroomEggText:
	text "DALIA: Lo siento."
	line "No puedo limpiar"
	cont "un HUEVO."
	done

BluesHouse_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event  2,  7, PALLET_TOWN, 2
	warp_event  3,  7, PALLET_TOWN, 2

	db 0 ; coord events

	db 0 ; bg events

	db 1 ; object events
	object_event  2,  3, SPRITE_DAISY, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, DaisyScript, -1
