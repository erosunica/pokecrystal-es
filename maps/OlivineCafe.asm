	object_const_def ; object_event constants
	const OLIVINECAFE_SAILOR1
	const OLIVINECAFE_FISHING_GURU
	const OLIVINECAFE_SAILOR2

OlivineCafe_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

OlivineCafeStrengthSailorScript:
	faceplayer
	opentext
	checkevent EVENT_GOT_HM04_STRENGTH
	iftrue .GotStrength
	writetext OlivineCafeStrengthSailorText
	promptbutton
	verbosegiveitem HM_STRENGTH
	setevent EVENT_GOT_HM04_STRENGTH
.GotStrength:
	writetext OlivineCafeStrengthSailorText_GotStrength
	waitbutton
	closetext
	end

OlivineCafeFishingGuruScript:
	jumptextfaceplayer OlivineCafeFishingGuruText

OlivineCafeSailorScript:
	jumptextfaceplayer OlivineCafeSailorText

OlivineCafeStrengthSailorText:
	text "¡Ja! ¡Tus #MON"
	line "parecen ser muy"
	cont "enclenques!"

	para "No tienen el poder"
	line "para desplazar"
	cont "rocas."

	para "Mira, ¡usa esto y"
	line "enséñales FUERZA!"
	done

OlivineCafeStrengthSailorText_GotStrength:
	text "¡En el mar sólo"
	line "puedes confiar en"
	cont "ti mismo!"

	para "¡Y yo estoy en"
	line "plena forma!"
	done

OlivineCafeFishingGuruText:
	text "¡El menú del CAFÉ"
	line "OLIVO está repleto"

	para "de buena comida"
	line "para fornidos"
	cont "MARINEROS!"
	done

OlivineCafeSailorText:
	text "Cuando estoy de"
	line "paso, siempre"

	para "visito el CAFÉ"
	line "OLIVO."

	para "Todo lo del menú"
	line "me hace sentir más"

	para "fuerte. ¡No puedo"
	line "parar de comer!"
	done

OlivineCafe_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event  2,  7, OLIVINE_CITY, 7
	warp_event  3,  7, OLIVINE_CITY, 7

	db 0 ; coord events

	db 0 ; bg events

	db 3 ; object events
	object_event  4,  3, SPRITE_SAILOR, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, OlivineCafeStrengthSailorScript, -1
	object_event  7,  3, SPRITE_FISHING_GURU, SPRITEMOVEDATA_WALK_UP_DOWN, 0, 1, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, OlivineCafeFishingGuruScript, -1
	object_event  6,  6, SPRITE_SAILOR, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, OlivineCafeSailorScript, -1
