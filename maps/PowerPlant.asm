	object_const_def ; object_event constants
	const POWERPLANT_OFFICER1
	const POWERPLANT_GYM_GUY1
	const POWERPLANT_GYM_GUY2
	const POWERPLANT_OFFICER2
	const POWERPLANT_GYM_GUY3
	const POWERPLANT_MANAGER
	const POWERPLANT_FOREST

PowerPlant_MapScripts:
	db 2 ; scene scripts
	scene_script .DummyScene0 ; SCENE_POWERPLANT_NOTHING
	scene_script .DummyScene1 ; SCENE_POWERPLANT_GUARD_GETS_PHONE_CALL

	db 0 ; callbacks

.DummyScene0:
	end

.DummyScene1:
	end

PowerPlantGuardPhoneScript:
	playsound SFX_CALL
	showemote EMOTE_SHOCK, POWERPLANT_OFFICER1, 15
	waitsfx
	pause 30
	applymovement POWERPLANT_OFFICER1, PowerPlantOfficer1ApproachGymGuy2Movement
	turnobject POWERPLANT_GYM_GUY1, DOWN
	turnobject POWERPLANT_GYM_GUY2, DOWN
	opentext
	writetext PowerPlantOfficer1CeruleanShadyCharacterText
	waitbutton
	closetext
	turnobject POWERPLANT_OFFICER1, LEFT
	turnobject PLAYER, RIGHT
	opentext
	writetext PowerPlantOfficer1CouldIAskForYourCooperationText
	waitbutton
	closetext
	turnobject PLAYER, DOWN
	applymovement POWERPLANT_OFFICER1, PowerPlantOfficer1ReturnToPostMovement
	setscene SCENE_POWERPLANT_NOTHING
	end

PowerPlantOfficerScript:
	faceplayer
	opentext
	checkevent EVENT_RETURNED_MACHINE_PART
	iftrue .ReturnedMachinePart
	checkevent EVENT_MET_MANAGER_AT_POWER_PLANT
	iftrue .MetManager
	writetext PowerPlantOfficer1AThiefBrokeInText
	waitbutton
	closetext
	end

.MetManager:
	writetext PowerPlantOfficer1CouldIAskForYourCooperationText
	waitbutton
	closetext
	end

.ReturnedMachinePart:
	writetext PowerPlantOfficer1HaveToBeefUpSecurityText
	waitbutton
	closetext
	end

PowerPlantGymGuy1Script:
	faceplayer
	opentext
	checkevent EVENT_RETURNED_MACHINE_PART
	iftrue .ReturnedMachinePart
	writetext PowerPlantGymGuy1SomeoneStoleAPartText
	waitbutton
	closetext
	end

.ReturnedMachinePart:
	writetext PowerPlantGymGuy1GeneratorUpAndRunningText
	waitbutton
	closetext
	end

PowerPlantGymGuy2Script:
	faceplayer
	opentext
	checkevent EVENT_RETURNED_MACHINE_PART
	iftrue .ReturnedMachinePart
	writetext PowerPlantGymGuy2PowerPlantUpAndRunningText
	waitbutton
	closetext
	end

.ReturnedMachinePart:
	writetext PowerPlantGymGuy2GeneratorIsRunningAgainText
	waitbutton
	closetext
	end

PowerPlantOfficer2Script:
	faceplayer
	opentext
	checkevent EVENT_RETURNED_MACHINE_PART
	iftrue .ReturnedMachinePart
	writetext PowerPlantOfficer2ManagerHasBeenSadAndFuriousText
	waitbutton
	closetext
	end

.ReturnedMachinePart:
	writetext PowerPlantOfficer2ManagerHasBeenCheerfulText
	waitbutton
	closetext
	end

PowerPlantGymGuy4Script:
	faceplayer
	opentext
	checkevent EVENT_RETURNED_MACHINE_PART
	iftrue .ReturnedMachinePart
	writetext PowerPlantGymGuy4MagnetTrainConsumesElectricityText
	waitbutton
	closetext
	end

.ReturnedMachinePart:
	writetext PowerPlantGymGuy4WeCanGetMagnetTrainRunningText
	waitbutton
	closetext
	end

PowerPlantManager:
	faceplayer
	opentext
	checkevent EVENT_RETURNED_MACHINE_PART
	iftrue .ReturnedMachinePart
	checkitem MACHINE_PART
	iftrue .FoundMachinePart
	checkevent EVENT_MET_MANAGER_AT_POWER_PLANT
	iftrue .MetManager
	writetext PowerPlantManagerWhoWouldRuinMyGeneratorText
	waitbutton
	closetext
	setevent EVENT_MET_MANAGER_AT_POWER_PLANT
	clearevent EVENT_CERULEAN_GYM_ROCKET
	clearevent EVENT_FOUND_MACHINE_PART_IN_CERULEAN_GYM
	setmapscene CERULEAN_GYM, SCENE_CERULEANGYM_GRUNT_RUNS_OUT
	setscene SCENE_POWERPLANT_GUARD_GETS_PHONE_CALL
	end

.MetManager:
	writetext PowerPlantManagerIWontForgiveCulpritText
	waitbutton
	closetext
	end

.FoundMachinePart:
	writetext PowerPlantManagerThatsThePartText
	promptbutton
	takeitem MACHINE_PART
	setevent EVENT_RETURNED_MACHINE_PART
	clearevent EVENT_SAFFRON_TRAIN_STATION_POPULATION
	setevent EVENT_ROUTE_5_6_POKEFAN_M_BLOCKS_UNDERGROUND_PATH
	setevent EVENT_ROUTE_24_ROCKET
	setevent EVENT_RESTORED_POWER_TO_KANTO
	clearevent EVENT_GOLDENROD_TRAIN_STATION_GENTLEMAN
.ReturnedMachinePart:
	checkevent EVENT_GOT_TM07_ZAP_CANNON
	iftrue .GotZapCannon
	writetext PowerPlantManagerTakeThisTMText
	promptbutton
	verbosegiveitem TM_ZAP_CANNON
	iffalse .NoRoom
	setevent EVENT_GOT_TM07_ZAP_CANNON
	writetext PowerPlantManagerTM07IsZapCannonText
	waitbutton
.NoRoom:
	closetext
	end

.GotZapCannon:
	writetext PowerPlantManagerMyBelovedGeneratorText
	waitbutton
	closetext
	end

Forest:
	faceplayer
	opentext
	trade NPC_TRADE_FOREST
	waitbutton
	closetext
	end

PowerPlantBookshelf:
	jumpstd difficultbookshelf

PowerPlantOfficer1ApproachGymGuy2Movement:
	step RIGHT
	step RIGHT
	step UP
	step UP
	step_end

PowerPlantOfficer1ReturnToPostMovement:
	step DOWN
	step DOWN
	step LEFT
	step LEFT
	turn_head DOWN
	step_end

PowerPlantOfficer1AThiefBrokeInText:
	text "Entró un ladrón en"
	line "la CENTRAL"
	cont "ENERGÍA…"

	para "¿Adónde vamos a ir"
	line "a parar?"
	done

PowerPlantOfficer1CeruleanShadyCharacterText:
	text "Tengo noticias de"
	line "CIUDAD CELESTE."

	para "Parece que ha"
	line "estado merodeando"

	para "por allí un hombre"
	line "muy sospechoso."
	done

PowerPlantOfficer1CouldIAskForYourCooperationText:
	text "¿Puedo pedirte"
	line "ayuda?"
	done

PowerPlantOfficer1HaveToBeefUpSecurityText:
	text "Tendremos que"
	line "reforzar las"

	para "medidas de"
	line "seguridad."
	done

PowerPlantGymGuy1SomeoneStoleAPartText:
	text "Alguien ha robado"
	line "una pieza que"

	para "necesitamos para"
	line "el generador."

	para "¡Sin ella, el"
	line "nuevo generador no"
	cont "sirve para nada!"
	done

PowerPlantGymGuy1GeneratorUpAndRunningText:
	text "El generador ya"
	line "funciona y está"

	para "produciendo mucha"
	line "electricidad."
	done

PowerPlantGymGuy2PowerPlantUpAndRunningText:
	text "Esta CENTRAL"
	line "ENERGÍA había"

	para "sido abandonada"
	line "hace mucho tiempo."

	para "Volvimos a ponerla"
	line "en funcionamiento"

	para "para poder usar"
	line "el MAGNETOTRÉN."
	done

PowerPlantGymGuy2GeneratorIsRunningAgainText:
	text "¡El generador ya"
	line "funciona!"
	done

PowerPlantOfficer2ManagerHasBeenSadAndFuriousText:
	text "El DIRECTOR de la"
	line "CENTRAL ENERGÍA"
	cont "está ahí delante."

	para "Pero está triste y"
	line "enfadado porque"

	para "alguien ha"
	line "estropeado el"
	cont "generador…"
	done

PowerPlantOfficer2ManagerHasBeenCheerfulText:
	text "El DIRECTOR está"
	line "contento porque el"

	para "generador ya está"
	line "arreglado."
	done

PowerPlantGymGuy4MagnetTrainConsumesElectricityText:
	text "El MAGNETOTRÉN"
	line "consume mucha"
	cont "electricidad."

	para "No se puede mover"
	line "si el nuevo"

	para "generador no"
	line "funciona."
	done

PowerPlantGymGuy4WeCanGetMagnetTrainRunningText:
	text "¡Muy bien!"
	line "El MAGNETOTRÉN"

	para "puede volver a"
	line "funcionar."
	done

PowerPlantManagerWhoWouldRuinMyGeneratorText:
	text "DIRECTOR: ¡Me voy"
	line "a enfadar con"
	cont "alguien!"

	para "¿Quién ha roto mi"
	line "generador?"

	para "¡Con el tiempo que"
	line "le he dedicado!"

	para "¡Como lo atrape,"
	line "va a saber lo"

	para "que es mi"
	line "ELECTROCAÑÓN!"
	done

PowerPlantManagerIWontForgiveCulpritText:
	text "DIRECTOR: ¡Nunca"
	line "le perdonaré!"

	para "Aunque el culpable"
	line "llore y suplique"

	para "perdón, ¡le"
	line "machacaré!"

	para "¡Ja, ja, ja!"
	done

PowerPlantManagerThatsThePartText:
	text "DIRECTOR: ¡Sí!"

	para "¡Ésa es la pieza"
	line "que le faltaba a"

	para "mi generador! ¿La"
	line "encontraste tú?"
	done

PowerPlantManagerTakeThisTMText:
	text "¡Yuju! ¡Gracias!"

	para "¡Toma esta MT"
	line "como recompensa!"
	done

PowerPlantManagerTM07IsZapCannonText:
	text "DIRECTOR: La MT07"
	line "es mi ELECTRO-"
	cont "CAÑÓN. ¡Es muy"
	cont "potente!"

	para "Aunque presenta"
	line "el inconveniente"

	para "de no ser muy"
	line "precisa."
	done

PowerPlantManagerMyBelovedGeneratorText:
	text "DIRECTOR: ¡Mi"
	line "querido generador!"

	para "¡Sigue produciendo"
	line "electricidad!"
	done

PowerPlant_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event  2, 17, ROUTE_10_NORTH, 2
	warp_event  3, 17, ROUTE_10_NORTH, 2

	db 1 ; coord events
	coord_event  5, 12, SCENE_POWERPLANT_GUARD_GETS_PHONE_CALL, PowerPlantGuardPhoneScript

	db 2 ; bg events
	bg_event  0,  1, BGEVENT_READ, PowerPlantBookshelf
	bg_event  1,  1, BGEVENT_READ, PowerPlantBookshelf

	db 7 ; object events
	object_event  4, 14, SPRITE_OFFICER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, PowerPlantOfficerScript, -1
	object_event  2,  9, SPRITE_GYM_GUY, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, PowerPlantGymGuy1Script, -1
	object_event  6, 11, SPRITE_GYM_GUY, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, PowerPlantGymGuy2Script, -1
	object_event  9,  3, SPRITE_OFFICER, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, PowerPlantOfficer2Script, -1
	object_event  7,  2, SPRITE_GYM_GUY, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 1, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, PowerPlantGymGuy4Script, -1
	object_event 14, 10, SPRITE_FISHER, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, PowerPlantManager, -1
	object_event  5,  5, SPRITE_GYM_GUY, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, Forest, -1
