	object_const_def ; object_event constants
	const SAFFRONMAGNETTRAINSTATION_OFFICER
	const SAFFRONMAGNETTRAINSTATION_GYM_GUY
	const SAFFRONMAGNETTRAINSTATION_TEACHER
	const SAFFRONMAGNETTRAINSTATION_LASS

SaffronMagnetTrainStation_MapScripts:
	db 1 ; scene scripts
	scene_script .DummyScene ; SCENE_DEFAULT

	db 0 ; callbacks

.DummyScene:
	end

SaffronMagnetTrainStationOfficerScript:
	faceplayer
	opentext
	checkevent EVENT_RESTORED_POWER_TO_KANTO
	iftrue .MagnetTrainToGoldenrod
	writetext SaffronMagnetTrainStationOfficerTrainIsntOperatingText
	waitbutton
	closetext
	end

.MagnetTrainToGoldenrod:
	writetext SaffronMagnetTrainStationOfficerAreYouComingOnBoardText
	yesorno
	iffalse .DecidedNotToRide
	checkitem PASS
	iffalse .PassNotInBag
	writetext SaffronMagnetTrainStationOfficerRightThisWayText
	waitbutton
	closetext
	applymovement SAFFRONMAGNETTRAINSTATION_OFFICER, SaffronMagnetTrainStationOfficerApproachTrainDoorMovement
	applymovement PLAYER, SaffronMagnetTrainStationPlayerApproachAndEnterTrainMovement
	setval TRUE
	special MagnetTrain
	warpcheck
	newloadmap MAPSETUP_TRAIN
	applymovement PLAYER, .MovementBoardTheTrain
	wait 20
	end

.MovementBoardTheTrain:
	turn_head DOWN
	step_end

.PassNotInBag:
	writetext SaffronMagnetTrainStationOfficerYouDontHaveAPassText
	waitbutton
	closetext
	end

.DecidedNotToRide:
	writetext SaffronMagnetTrainStationOfficerHopeToSeeYouAgainText
	waitbutton
	closetext
	end

Script_ArriveFromGoldenrod:
	applymovement SAFFRONMAGNETTRAINSTATION_OFFICER, SaffronMagnetTrainStationOfficerApproachTrainDoorMovement
	applymovement PLAYER, SaffronMagnetTrainStationPlayerLeaveTrainAndEnterStationMovement
	applymovement SAFFRONMAGNETTRAINSTATION_OFFICER, SaffronMagnetTrainStationOfficerReturnToBoardingGateMovement
	opentext
	writetext SaffronMagnetTrainStationOfficerArrivedInSaffronText
	waitbutton
	closetext
	end

SaffronMagnetTrainStationGymGuyScript:
	faceplayer
	opentext
	checkevent EVENT_RETURNED_MACHINE_PART
	iftrue .ReturnedMachinePart
	writetext SaffronMagnetTrainStationGymGuyText
	waitbutton
	closetext
	end

.ReturnedMachinePart:
	writetext SaffronMagnetTrainStationGymGuyText_ReturnedMachinePart
	waitbutton
	closetext
	end

SaffronMagnetTrainStationTeacherScript:
	jumptextfaceplayer SaffronMagnetTrainStationTeacherText

SaffronMagnetTrainStationLassScript:
	jumptextfaceplayer SaffronMagnetTrainStationLassText

SaffronMagnetTrainStationOfficerApproachTrainDoorMovement:
	step UP
	step UP
	step RIGHT
	turn_head LEFT
	step_end

SaffronMagnetTrainStationOfficerReturnToBoardingGateMovement:
	step LEFT
	step DOWN
	step DOWN
	step_end

SaffronMagnetTrainStationPlayerApproachAndEnterTrainMovement:
	step UP
	step UP
	step UP
	step LEFT
	step LEFT
	step LEFT
	step UP
	step UP
	step_end

SaffronMagnetTrainStationPlayerLeaveTrainAndEnterStationMovement:
	step LEFT
	step LEFT
	step DOWN
	step DOWN
	step DOWN
	step DOWN
	turn_head UP
	step_end

SaffronMagnetTrainStationOfficerTrainIsntOperatingText:
	text "Lo siento, pero el"
	line "MAGNETOTRÉN no"
	cont "funciona ahora."
	done

SaffronMagnetTrainStationOfficerAreYouComingOnBoardText:
	text "Pronto saldremos"
	line "hacia CIUDAD"
	cont "TRIGAL."

	para "¿Quiere subir?"
	done

SaffronMagnetTrainStationOfficerRightThisWayText:
	text "¿Por favor, puedo"
	line "ver su PASE?"

	para "Bien. Ya puede"
	line "pasar, joven."
	done

SaffronMagnetTrainStationOfficerYouDontHaveAPassText:
	text "Lo siento, pero"
	line "no tiene PASE."
	done

SaffronMagnetTrainStationOfficerHopeToSeeYouAgainText:
	text "Siempre a su"
	line "servicio."
	done

SaffronMagnetTrainStationOfficerArrivedInSaffronText:
	text "Hemos llegado a"
	line "CIUDAD AZAFRÁN."

	para "Siempre a su"
	line "servicio."
	done

SaffronMagnetTrainStationGymGuyText:
	text "El MAGNETOTRÉN es"
	line "un tren ultra-"
	cont "moderno, accionado"
	cont "por electricidad"
	cont "e imanes."

	para "Su velocidad es"
	line "increíble."

	para "Sin embargo, si no"
	line "hay electricidad…"
	done

SaffronMagnetTrainStationGymGuyText_ReturnedMachinePart:
	text "¡Caramba…!"

	para "¡Cuántas veces he"
	line "ido de KANTO a"

	para "JOHTO y de JOHTO"
	line "a KANTO!"
	done

SaffronMagnetTrainStationTeacherText:
	text "Antes de que se"
	line "construyera la"

	para "ESTACIÓN, ahí"
	line "había una casa."

	para "Y en ella vivía"
	line "una niña llamada"
	cont "COPIONA."
	done

SaffronMagnetTrainStationLassText:
	text "Hola. ¿Tienes un"
	line "PASE para el tren?"

	para "Tengo uno. Todos"
	line "los de AZAFRÁN que"

	para "toman el"
	line "MAGNETOTRÉN"
	cont "tienen PASES."
	done

SaffronMagnetTrainStation_MapEvents:
	db 0, 0 ; filler

	db 4 ; warp events
	warp_event  8, 17, SAFFRON_CITY, 6
	warp_event  9, 17, SAFFRON_CITY, 6
	warp_event  6,  5, GOLDENROD_MAGNET_TRAIN_STATION, 4
	warp_event 11,  5, GOLDENROD_MAGNET_TRAIN_STATION, 3

	db 1 ; coord events
	coord_event 11,  6, SCENE_DEFAULT, Script_ArriveFromGoldenrod

	db 0 ; bg events

	db 4 ; object events
	object_event  9,  9, SPRITE_OFFICER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, SaffronMagnetTrainStationOfficerScript, -1
	object_event 10, 14, SPRITE_GYM_GUY, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, SaffronMagnetTrainStationGymGuyScript, -1
	object_event  6, 11, SPRITE_TEACHER, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, SaffronMagnetTrainStationTeacherScript, EVENT_SAFFRON_TRAIN_STATION_POPULATION
	object_event  6, 10, SPRITE_LASS, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, SaffronMagnetTrainStationLassScript, EVENT_SAFFRON_TRAIN_STATION_POPULATION
