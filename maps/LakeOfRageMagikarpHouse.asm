	object_const_def ; object_event constants
	const LAKEOFRAGEMAGIKARPHOUSE_FISHING_GURU

LakeOfRageMagikarpHouse_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

MagikarpLengthRaterScript:
	faceplayer
	opentext
	checkevent EVENT_LAKE_OF_RAGE_ELIXIR_ON_STANDBY
	iftrue .GetReward
	checkevent EVENT_LAKE_OF_RAGE_ASKED_FOR_MAGIKARP
	iftrue .AskedForMagikarp
	checkevent EVENT_CLEARED_ROCKET_HIDEOUT
	iftrue .ClearedRocketHideout
	checkevent EVENT_LAKE_OF_RAGE_EXPLAINED_WEIRD_MAGIKARP
	iftrue .ExplainedHistory
	writetext MagikarpLengthRaterText_LakeOfRageHistory
	waitbutton
	closetext
	setevent EVENT_LAKE_OF_RAGE_EXPLAINED_WEIRD_MAGIKARP
	end

.ExplainedHistory:
	writetext MagikarpLengthRaterText_MenInBlack
	waitbutton
	closetext
	end

.ClearedRocketHideout:
	writetext MagikarpLengthRaterText_WorldsLargestMagikarp
	waitbutton
	closetext
	setevent EVENT_LAKE_OF_RAGE_ASKED_FOR_MAGIKARP
	end

.AskedForMagikarp:
	setval MAGIKARP
	special FindPartyMonThatSpecies
	iffalse .ClearedRocketHideout
	writetext MagikarpLengthRaterText_YouHaveAMagikarp
	waitbutton
	special CheckMagikarpLength
	ifequal MAGIKARPLENGTH_NOT_MAGIKARP, .NotMagikarp
	ifequal MAGIKARPLENGTH_REFUSED, .Refused
	ifequal MAGIKARPLENGTH_TOO_SHORT, .TooShort
	; MAGIKARPLENGTH_BEAT_RECORD
	sjump .GetReward

.GetReward:
	writetext MagikarpLengthRaterText_Memento
	promptbutton
	verbosegiveitem ELIXER
	iffalse .NoRoom
	writetext MagikarpLengthRaterText_Bonus
	waitbutton
	closetext
	clearevent EVENT_LAKE_OF_RAGE_ELIXIR_ON_STANDBY
	end

.NoRoom:
	closetext
	setevent EVENT_LAKE_OF_RAGE_ELIXIR_ON_STANDBY
	end

.TooShort:
	writetext MagikarpLengthRaterText_TooShort
	waitbutton
	closetext
	end

.NotMagikarp:
	writetext MagikarpLengthRaterText_NotMagikarp
	waitbutton
	closetext
	end

.Refused:
	writetext MagikarpLengthRaterText_Refused
	waitbutton
	closetext
	end

LakeOfRageMagikarpHouseUnusedRecordSign:
; unused
	jumptext LakeOfRageMagikarpHouseUnusedRecordText

MagikarpHouseBookshelf:
	jumpstd difficultbookshelf

MagikarpLengthRaterText_LakeOfRageHistory:
	text "El LAGO DE LA"
	line "FURIA es un cráter"

	para "obra de violentos"
	line "GYARADOS."

	para "El cráter se llenó"
	line "de agua de lluvia"

	para "y se formó el"
	line "LAGO."

	para "Esta historia la"
	line "contó por primera"

	para "vez el tatarabuelo"
	line "de mi abuelo."

	para "Antes se podían"
	line "pescar MAGIKARP"
	cont "en el lago, pero…"

	para "No entiendo lo que"
	line "ocurre ahora."
	done

MagikarpLengthRaterText_MenInBlack:
	text "En el LAGO pasan"
	line "cosas raras desde"

	para "que llegaron esos"
	line "hombres de negro."
	done

MagikarpLengthRaterText_WorldsLargestMagikarp:
	text "La normalidad ha"
	line "vuelto al LAGO DE"

	para "LA FURIA. Vuelve a"
	line "haber MAGIKARP."

	para "Quizá se cumpla mi"
	line "sueño de ver al"

	para "MAGIKARP más"
	line "grande del mundo."

	para "¿Tienes una CAÑA?"
	line "Si tienes una,"
	cont "ayúdame por favor."
	done

MagikarpLengthRaterText_YouHaveAMagikarp:
	text "¡Ah, tienes un"
	line "MAGIKARP! A ver lo"

	para "grande que es ese"
	line "bebé."
	done

MagikarpLengthRaterText_Memento:
	text "¡Uau! ¡Éste es"
	line "impresionante!"

	para "¡Me quito el"
	line "sombrero ante ti!"

	para "¡Toma esto como"
	line "recuerdo!"
	done

MagikarpLengthRaterText_Bonus:
	text "Lo importante es"
	line "el récord. ¡Piensa"

	para "en él como una"
	line "bonificación!"
	done

MagikarpLengthRaterText_TooShort:
	text "¡Uau! ¡Éste es"
	line "impresionante!"

	para "Ojalá no tuviera"
	line "que decirlo, pero"

	para "he visto uno más"
	line "grande antes."
	done

MagikarpLengthRaterText_NotMagikarp:
	text "¿Qué? ¡Eso no es"
	line "un MAGIKARP!"
	done

MagikarpLengthRaterText_Refused:
	text "¿No tienes ninguno"
	line "bueno que"

	para "enseñarme? Quizá"
	line "la próxima vez."
	done

LakeOfRageMagikarpHouseUnusedRecordText:
	text "RÉCORD ACTUAL"

	para "@"
	text_ram wStringBuffer3
	text " cm, atrapado"
	line "por @"
	text_ram wStringBuffer4
	text ".@"
	text_end

LakeOfRageMagikarpHouse_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event  2,  7, LAKE_OF_RAGE, 2
	warp_event  3,  7, LAKE_OF_RAGE, 2

	db 0 ; coord events

	db 2 ; bg events
	bg_event  0,  1, BGEVENT_READ, MagikarpHouseBookshelf
	bg_event  1,  1, BGEVENT_READ, MagikarpHouseBookshelf

	db 1 ; object events
	object_event  2,  3, SPRITE_FISHING_GURU, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, MagikarpLengthRaterScript, -1
