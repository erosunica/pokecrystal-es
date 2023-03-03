	object_const_def ; object_event constants
	const GOLDENRODDEPTSTORE5F_CLERK
	const GOLDENRODDEPTSTORE5F_LASS
	const GOLDENRODDEPTSTORE5F_MIKE
	const GOLDENRODDEPTSTORE5F_POKEFAN_M
	const GOLDENRODDEPTSTORE5F_CARRIE
	const GOLDENRODDEPTSTORE5F_RECEPTIONIST

GoldenrodDeptStore5F_MapScripts:
	db 0 ; scene scripts

	db 1 ; callbacks
	callback MAPCALLBACK_OBJECTS, .CheckIfSunday

.CheckIfSunday:
	readvar VAR_WEEKDAY
	ifequal SUNDAY, .yes
	disappear GOLDENRODDEPTSTORE5F_RECEPTIONIST
	return

.yes
	appear GOLDENRODDEPTSTORE5F_RECEPTIONIST
	return

GoldenrodDeptStore5FClerkScript:
	faceplayer
	opentext
	checkevent EVENT_GOT_TM02_HEADBUTT
	iftrue .headbutt
	checkevent EVENT_GOT_TM08_ROCK_SMASH
	iftrue .onlyrocksmash
	sjump .neither

.headbutt
	checkevent EVENT_GOT_TM08_ROCK_SMASH
	iftrue .both
	sjump .onlyheadbutt

.neither
	pokemart MARTTYPE_STANDARD, MART_GOLDENROD_5F_1
	closetext
	end

.onlyheadbutt
	pokemart MARTTYPE_STANDARD, MART_GOLDENROD_5F_2
	closetext
	end

.onlyrocksmash
	pokemart MARTTYPE_STANDARD, MART_GOLDENROD_5F_3
	closetext
	end

.both
	pokemart MARTTYPE_STANDARD, MART_GOLDENROD_5F_4
	closetext
	end

GoldenrodDeptStore5FReceptionistScript:
	faceplayer
	opentext
	readvar VAR_WEEKDAY
	ifnotequal SUNDAY, .EventIsOver
	checkflag ENGINE_GOLDENROD_DEPT_STORE_TM27_RETURN
	iftrue .EventIsOver
	special GetFirstPokemonHappiness
	writetext GoldenrodDeptStore5FReceptionistOhYourMonDotDotDotText
	promptbutton
	ifgreater 150 - 1, .VeryHappy
	ifgreater 50 - 1, .SomewhatHappy
	sjump .NotVeryHappy

.VeryHappy:
	writetext GoldenrodDeptStore5FReceptionistThisMoveShouldBePerfectText
	promptbutton
	verbosegiveitem TM_RETURN
	iffalse .Done
	setflag ENGINE_GOLDENROD_DEPT_STORE_TM27_RETURN
	closetext
	end

.SomewhatHappy:
	writetext GoldenrodDeptStore5FReceptionistItsAdorableText
	waitbutton
	closetext
	end

.NotVeryHappy:
	writetext GoldenrodDeptStore5FReceptionistItLooksEvilHowAboutThisTMText
	promptbutton
	verbosegiveitem TM_FRUSTRATION
	iffalse .Done
	setflag ENGINE_GOLDENROD_DEPT_STORE_TM27_RETURN
	closetext
	end

.EventIsOver:
	writetext GoldenrodDeptStore5FReceptionistThereAreTMsPerfectForMonText
	waitbutton
.Done:
	closetext
	end

Carrie:
	faceplayer
	opentext
	special GameboyCheck
	ifnotequal GBCHECK_CGB, .NotGBC ; This is a dummy check from Gold/Silver
	writetext GoldenrodDeptStore5FCarrieMysteryGiftExplanationText
	waitbutton
	closetext
	special UnlockMysteryGift
	end

.NotGBC:
	writetext GoldenrodDeptStore5FCarrieMysteryGiftRequiresGBCText
	waitbutton
	closetext
	end

GoldenrodDeptStore5FLassScript:
	jumptextfaceplayer GoldenrodDeptStore5FLassText

Mike:
	faceplayer
	opentext
	trade NPC_TRADE_MIKE
	waitbutton
	closetext
	end

GoldenrodDeptStore5FPokefanMScript:
	jumptextfaceplayer GoldenrodDeptStore5FPokefanMText

GoldenrodDeptStore5FDirectory:
	jumptext GoldenrodDeptStore5FDirectoryText

GoldenrodDeptStore5FElevatorButton:
	jumpstd elevatorbutton

GoldenrodDeptStore5FReceptionistOhYourMonDotDotDotText:
	text "Hola. ¡Oh, tu"
	line "#MON…!"
	done

GoldenrodDeptStore5FReceptionistThisMoveShouldBePerfectText:
	text "Está muy unido a"
	line "ti."

	para "Este movimiento"
	line "sería perfecto"
	cont "para vosotros."
	done

GoldenrodDeptStore5FReceptionistItsAdorableText:
	text "¡Es adorable!"

	para "Enséñale unas"
	line "potentes MT."
	done

GoldenrodDeptStore5FReceptionistItLooksEvilHowAboutThisTMText:
	text "Parece malvado."
	line "¿Qué te parece"
	cont "esta MT para él?"
	done

GoldenrodDeptStore5FReceptionistThereAreTMsPerfectForMonText:
	text "Seguro que hay MT"
	line "que serían"

	para "perfectas para tus"
	line "#MON."
	done

GoldenrodDeptStore5FCarrieMysteryGiftExplanationText:
	text "REGALO MISTERIOSO."

	para "Con un simple bip,"
	line "recibes un regalo."

	para "Búscalo en el"
	line "menú."
	done

GoldenrodDeptStore5FCarrieMysteryGiftRequiresGBCText:
	text "La opción REGALO"
	line "MISTERIOSO es para"
	cont "Game Boy Color."
	done

GoldenrodDeptStore5FLassText:
	text "Los domingos, una"
	line "señora viene a ver"
	cont "#MON."

	para "¡Incluso regala"
	line "MT!"
	done

GoldenrodDeptStore5FPokefanMText:
	text "No puedes cambiar"
	line "el nombre de un"

	para "#MON que has"
	line "intercambiado."

	para "El nombre refleja"
	line "los sentimientos"

	para "del entrenador"
	line "original."
	done

GoldenrodDeptStore5FDirectoryText:
	text "Personaliza a tus"
	line "#MON"

	para "P4 TIENDA DE MT"
	done

GoldenrodDeptStore5F_MapEvents:
	db 0, 0 ; filler

	db 3 ; warp events
	warp_event 12,  0, GOLDENROD_DEPT_STORE_4F, 1
	warp_event 15,  0, GOLDENROD_DEPT_STORE_6F, 1
	warp_event  2,  0, GOLDENROD_DEPT_STORE_ELEVATOR, 1

	db 0 ; coord events

	db 2 ; bg events
	bg_event 14,  0, BGEVENT_READ, GoldenrodDeptStore5FDirectory
	bg_event  3,  0, BGEVENT_READ, GoldenrodDeptStore5FElevatorButton

	db 6 ; object events
	object_event  8,  5, SPRITE_CLERK, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, GoldenrodDeptStore5FClerkScript, -1
	object_event  3,  6, SPRITE_LASS, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, GoldenrodDeptStore5FLassScript, -1
	object_event  6,  3, SPRITE_COOLTRAINER_M, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, Mike, -1
	object_event 13,  5, SPRITE_POKEFAN_M, SPRITEMOVEDATA_WANDER, 2, 2, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, GoldenrodDeptStore5FPokefanMScript, -1
	object_event  9,  1, SPRITE_TWIN, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, Carrie, -1
	object_event  7,  5, SPRITE_RECEPTIONIST, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, GoldenrodDeptStore5FReceptionistScript, EVENT_GOLDENROD_DEPT_STORE_5F_HAPPINESS_EVENT_LADY
