	object_const_def ; object_event constants
	const GOLDENRODHAPPINESSRATER_TEACHER
	const GOLDENRODHAPPINESSRATER_POKEFAN_M
	const GOLDENRODHAPPINESSRATER_TWIN

GoldenrodHappinessRater_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

GoldenrodHappinessRaterTeacherScript:
	faceplayer
	opentext
	special GetFirstPokemonHappiness
	writetext GoldenrodHappinessRaterTeacherText
	promptbutton
	ifgreater 250 - 1, .LovesYouALot
	ifgreater 200 - 1, .ReallyTrustsYou
	ifgreater 150 - 1, .SortOfHappy
	ifgreater 100 - 1, .QuiteCute
	ifgreater  50 - 1, .NotUsedToYou
	sjump .LooksMean

.LovesYouALot:
	writetext GoldenrodHappinessRatingText_LovesYouALot
	waitbutton
	closetext
	end

.ReallyTrustsYou:
	writetext GoldenrodHappinessRatingText_ReallyTrustsYou
	waitbutton
	closetext
	end

.SortOfHappy:
	writetext GoldenrodHappinessRatingText_SortOfHappy
	waitbutton
	closetext
	end

.QuiteCute:
	writetext GoldenrodHappinessRatingText_QuiteCute
	waitbutton
	closetext
	end

.NotUsedToYou:
	writetext GoldenrodHappinessRatingText_NotUsedToYou
	waitbutton
	closetext
	end

.LooksMean:
	writetext GoldenrodHappinessRatingText_LooksMean
	waitbutton
	closetext
	end

GoldenrodHappinessRaterPokefanMScript:
	jumptextfaceplayer GoldenrodHappinessRaterPokefanMText

GoldenrodHappinessRaterTwinScript:
	jumptextfaceplayer GoldenrodHappinessRaterTwinText

HappinessRatersHouseBookshelf:
	jumpstd difficultbookshelf

HappinessRatersHouseRadio:
	jumpstd radio2

GoldenrodHappinessRaterTeacherText:
	text "Si tratas bien a"
	line "tus #MON,"
	cont "ellos te querrán."

	para "¿Eh? Déjame ver tu"
	line "@"
	text_ram wStringBuffer3
	text "…"
	done

GoldenrodHappinessRatingText_LovesYouALot:
	text "¡Parece muy feliz!"
	line "Te debe de querer"
	cont "mucho."
	done

GoldenrodHappinessRatingText_ReallyTrustsYou:
	text "Me parece que"
	line "confía mucho"
	cont "en ti."
	done

GoldenrodHappinessRatingText_SortOfHappy:
	text "Es cariñoso"
	line "contigo. Parece"
	cont "feliz."
	done

GoldenrodHappinessRatingText_QuiteCute:
	text "Es bastante mono."
	done

GoldenrodHappinessRatingText_NotUsedToYou:
	text "Deberías tratarlo"
	line "mejor. No está"
	cont "acostumbrado a ti."
	done

GoldenrodHappinessRatingText_LooksMean:
	text "Da la impresión de"
	line "que no le gustas."
	cont "Parece malvado."
	done

GoldenrodHappinessRaterPokefanMText:
	text "No dejo de perder"
	line "en los combates y"

	para "mis #MON acaban"
	line "desmayándose…"

	para "Quizá sea ésa la"
	line "razón por la que"
	cont "no les gusto…"
	done

GoldenrodHappinessRaterTwinText:
	text "¡Si uso un objeto"
	line "con mi #MON,"
	cont "se pone contento!"
	done

GoldenrodHappinessRater_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event  2,  7, GOLDENROD_CITY, 3
	warp_event  3,  7, GOLDENROD_CITY, 3

	db 0 ; coord events

	db 3 ; bg events
	bg_event  0,  1, BGEVENT_READ, HappinessRatersHouseBookshelf
	bg_event  1,  1, BGEVENT_READ, HappinessRatersHouseBookshelf
	bg_event  7,  1, BGEVENT_READ, HappinessRatersHouseRadio

	db 3 ; object events
	object_event  2,  4, SPRITE_TEACHER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, GoldenrodHappinessRaterTeacherScript, -1
	object_event  5,  3, SPRITE_POKEFAN_M, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, GoldenrodHappinessRaterPokefanMScript, -1
	object_event  5,  6, SPRITE_TWIN, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 1, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, GoldenrodHappinessRaterTwinScript, -1
