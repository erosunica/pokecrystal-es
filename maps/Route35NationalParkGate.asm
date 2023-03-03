	object_const_def ; object_event constants
	const ROUTE35NATIONALPARKGATE_OFFICER1
	const ROUTE35NATIONALPARKGATE_YOUNGSTER
	const ROUTE35NATIONALPARKGATE_OFFICER2

Route35NationalParkGate_MapScripts:
	db 3 ; scene scripts
	scene_script .DummyScene0 ; SCENE_ROUTE35NATIONALPARKGATE_NOTHING
	scene_script .DummyScene1 ; SCENE_ROUTE35NATIONALPARKGATE_UNUSED
	scene_script .LeaveContestEarly ; SCENE_ROUTE35NATIONALPARKGATE_LEAVE_CONTEST_EARLY

	db 2 ; callbacks
	callback MAPCALLBACK_NEWMAP, .CheckIfContestRunning
	callback MAPCALLBACK_OBJECTS, .CheckIfContestAvailable

.DummyScene0:
	end

.DummyScene1:
	end

.LeaveContestEarly:
	prioritysjump .LeavingContestEarly
	end

.CheckIfContestRunning:
	checkflag ENGINE_BUG_CONTEST_TIMER
	iftrue .BugContestIsRunning
	setscene SCENE_ROUTE35NATIONALPARKGATE_NOTHING
	return

.BugContestIsRunning:
	setscene SCENE_ROUTE35NATIONALPARKGATE_LEAVE_CONTEST_EARLY
	return

.CheckIfContestAvailable:
	readvar VAR_WEEKDAY
	ifequal TUESDAY, .SetContestOfficer
	ifequal THURSDAY, .SetContestOfficer
	ifequal SATURDAY, .SetContestOfficer
	checkflag ENGINE_BUG_CONTEST_TIMER
	iftrue .BugContestIsRunning
	disappear ROUTE35NATIONALPARKGATE_OFFICER1
	appear ROUTE35NATIONALPARKGATE_YOUNGSTER
	appear ROUTE35NATIONALPARKGATE_OFFICER2
	return

.SetContestOfficer:
	appear ROUTE35NATIONALPARKGATE_OFFICER1
	disappear ROUTE35NATIONALPARKGATE_YOUNGSTER
	disappear ROUTE35NATIONALPARKGATE_OFFICER2
	return

.LeavingContestEarly:
	applymovement PLAYER, Route35NationalParkGatePlayerApproachOfficer1Movement
	turnobject ROUTE35NATIONALPARKGATE_OFFICER1, RIGHT
	opentext
	readvar VAR_CONTESTMINUTES
	addval 1
	getnum STRING_BUFFER_3
	writetext Route35NationalParkGateOfficer1WantToFinishText
	yesorno
	iffalse .GoBackToContest
	writetext Route35NationalParkGateOfficer1WaitAtNorthGateText
	waitbutton
	closetext
	jumpstd bugcontestresultswarp

.GoBackToContest:
	writetext Route35NationalParkGateOfficer1OkGoFinishText
	waitbutton
	closetext
	scall Route35NationalParkGate_EnterContest
	playsound SFX_ENTER_DOOR
	special FadeOutPalettes
	waitsfx
	warpfacing UP, NATIONAL_PARK_BUG_CONTEST, 10, 47
	end

Route35OfficerScriptContest:
	readvar VAR_WEEKDAY
	ifequal SUNDAY, Route35NationalParkGate_NoContestToday
	ifequal MONDAY, Route35NationalParkGate_NoContestToday
	ifequal WEDNESDAY, Route35NationalParkGate_NoContestToday
	ifequal FRIDAY, Route35NationalParkGate_NoContestToday
	faceplayer
	opentext
	checkflag ENGINE_DAILY_BUG_CONTEST
	iftrue Route35NationalParkGate_ContestIsOver
	scall Route35NationalParkGate_GetDayOfWeek
	writetext Route35NationalParkGateOfficer1AskToParticipateText
	yesorno
	iffalse Route35NationalParkGate_DeclinedToParticipate
	readvar VAR_PARTYCOUNT
	ifgreater 1, Route35NationalParkGate_LeaveTheRestBehind
	special ContestDropOffMons
	clearevent EVENT_LEFT_MONS_WITH_CONTEST_OFFICER
Route35NationalParkGate_OkayToProceed:
	setflag ENGINE_BUG_CONTEST_TIMER
	special PlayMapMusic
	writetext Route35NationalParkGateOfficer1GiveParkBallsText
	promptbutton
	writetext Route35NationalParkGatePlayerReceivedParkBallsText
	playsound SFX_ITEM
	waitsfx
	writetext Route35NationalParkGateOfficer1ExplainsRulesText
	waitbutton
	closetext
	special GiveParkBalls
	scall Route35NationalParkGate_EnterContest
	playsound SFX_ENTER_DOOR
	special FadeOutPalettes
	waitsfx
	special SelectRandomBugContestContestants
	warpfacing UP, NATIONAL_PARK_BUG_CONTEST, 10, 47
	end

Route35NationalParkGate_EnterContest:
	readvar VAR_FACING
	ifequal LEFT, Route35NationalParkGate_FacingLeft
	applymovement PLAYER, Route35NationalParkGatePlayerGoAroundOfficerAndEnterParkMovement
	end

Route35NationalParkGate_FacingLeft:
	applymovement PLAYER, Route35NationalParkGatePlayerEnterParkMovement
	end

Route35NationalParkGate_LeaveTheRestBehind:
	readvar VAR_PARTYCOUNT
	ifless PARTY_LENGTH, Route35NationalParkGate_LessThanFullParty
	readvar VAR_BOXSPACE
	ifequal 0, Route35NationalParkGate_NoRoomInBox

Route35NationalParkGate_LessThanFullParty:
	special CheckFirstMonIsEgg
	ifequal TRUE, Route35NationalParkGate_FirstMonIsEgg
	writetext Route35NationalParkGateOfficer1AskToUseFirstMonText
	yesorno
	iffalse Route35NationalParkGate_DeclinedToLeaveMonsBehind
	special ContestDropOffMons
	iftrue Route35NationalParkGate_FirstMonIsFainted
	setevent EVENT_LEFT_MONS_WITH_CONTEST_OFFICER
	writetext Route35NationalParkGateOfficer1WellHoldYourMonText
	promptbutton
	writetext Route35NationalParkGatePlayersMonLeftWithHelperText
	playsound SFX_GOT_SAFARI_BALLS
	waitsfx
	promptbutton
	sjump Route35NationalParkGate_OkayToProceed

Route35NationalParkGate_DeclinedToParticipate:
	writetext Route35NationalParkGateOfficer1TakePartInFutureText
	waitbutton
	closetext
	end

Route35NationalParkGate_DeclinedToLeaveMonsBehind:
	writetext Route35NationalParkGateOfficer1ChooseMonAndComeBackText
	waitbutton
	closetext
	end

Route35NationalParkGate_FirstMonIsFainted:
	writetext Route35NationalParkGateOfficer1FirstMonCantBattleText
	waitbutton
	closetext
	end

Route35NationalParkGate_NoRoomInBox:
	writetext Route35NationalParkGateOfficer1MakeRoomText
	waitbutton
	closetext
	end

Route35NationalParkGate_FirstMonIsEgg:
	writetext Route35NationalParkGateOfficer1EggAsFirstMonText
	waitbutton
	closetext
	end

Route35NationalParkGate_ContestIsOver:
	writetext Route35NationalParkGateOfficer1ContestIsOverText
	waitbutton
	closetext
	end

Route35NationalParkGate_NoContestToday:
	jumptextfaceplayer Route35NationalParkGateOfficer1WeHoldContestsText

Route35NationalParkGateOfficerScript:
	faceplayer
	opentext
	checkflag ENGINE_DAILY_BUG_CONTEST
	iftrue Route35NationalParkGate_ContestIsOver
	writetext Route35NationalParkGateOfficer1WeHoldContestsText
	waitbutton
	closetext
	end

Route35NationalParkGateYoungsterScript:
	jumptextfaceplayer Route35NationalParkGateYoungsterText

BugCatchingContestExplanationSign:
	jumptext BugCatchingContestExplanationText

Route35NationalParkGate_GetDayOfWeek:
	jumpstd daytotext
	end

Route35NationalParkGatePlayerApproachOfficer1Movement:
	step DOWN
	turn_head LEFT
	step_end

Route35NationalParkGatePlayerGoAroundOfficerAndEnterParkMovement:
	step RIGHT
	step UP
	step UP
	step_end

Route35NationalParkGatePlayerEnterParkMovement:
	step UP
	step_end

Route35NationalParkGateOfficer1AskToParticipateText:
	text "Hoy es @"
	text_ram wStringBuffer3
	text "."
	line "Eso significa que"

	para "hoy es el Concurso"
	line "Captura de Bichos."

	para "Las reglas son"
	line "sencillas."

	para "Usa uno de tus"
	line "#MON y captura"

	para "un #MON bicho"
	line "para ganar."

	para "¿Te gustaría"
	line "intentarlo?"
	done

Route35NationalParkGateOfficer1GiveParkBallsText:
	text "Aquí tienes las"
	line "PARQUE BALL para"
	cont "el Concurso."
	done

Route35NationalParkGatePlayerReceivedParkBallsText:
	text "<PLAYER> recibió"
	line "20 PARQUE BALL."
	done

Route35NationalParkGateOfficer1ExplainsRulesText:
	text "Aquel que consiga"
	line "el #MON bicho"

	para "más fuerte será el"
	line "ganador."

	para "Tienes 20 minutos."

	para "Si te quedas sin"
	line "PARQUE BALL, ya no"
	cont "puedes seguir."

	para "Puedes quedarte"
	line "el último #MON"
	cont "que captures."

	para "¡Sal y captura"
	line "el #MON bicho"

	para "más fuerte que"
	line "encuentres!"
	done

Route35NationalParkGateOfficer1AskToUseFirstMonText:
	text "¡Oh, oh…!"

	para "Tienes más de un"
	line "#MON."

	para "Tendrás que usar"
	line "a @"
	text_ram wStringBuffer3
	text ","

	para "el primer #MON"
	line "de tu equipo."

	para "¿Te parece bien?"
	done

Route35NationalParkGateOfficer1WellHoldYourMonText:
	text "Bien, guardaremos"
	line "los otros #MON"
	cont "mientras compites."
	done

Route35NationalParkGatePlayersMonLeftWithHelperText:
	text "Los #MON de"
	line "<PLAYER> se quedan"
	cont "con el AYUDANTE."
	done

Route35NationalParkGateOfficer1ChooseMonAndComeBackText:
	text "Elige el #MON"
	line "que usarás en el"

	para "Concurso y luego"
	line "ven a verme."
	done

Route35NationalParkGateOfficer1TakePartInFutureText:
	text "Muy bien."
	line "Esperamos verte"
	cont "pronto por aquí."
	done

Route35NationalParkGateOfficer1FirstMonCantBattleText:
	text "¡Oh, oh…!"
	line "El primer #MON"

	para "de tu equipo no"
	line "puede luchar."

	para "Sustitúyelo por"
	line "el #MON que"

	para "quieras usar y"
	line "luego ven a verme."
	done

Route35NationalParkGateOfficer1MakeRoomText:
	text "¡Oh, oh…!"
	line "Tu equipo y tu"

	para "CAJA del PC están"
	line "llenos."

	para "No tienes sitio"
	line "para guardar el"
	cont "#MON bicho."

	para "Haz sitio en tu"
	line "equipo o en la"

	para "CAJA del PC y"
	line "luego ven a verme."
	done

Route35NationalParkGateOfficer1EggAsFirstMonText:
	text "¡Oh, oh…! Tienes"
	line "un HUEVO como"

	para "primer #MON"
	line "de tu equipo."

	para "Sustitúyelo por"
	line "el #MON que"

	para "quieras usar y"
	line "luego ven a verme."
	done

Route35NationalParkGateOfficer1WantToFinishText:
	text "Aún te quedan"
	line "@"
	text_ram wStringBuffer3
	text " minuto(s)."

	para "¿Quieres terminar"
	line "ahora?"
	done

Route35NationalParkGateOfficer1WaitAtNorthGateText:
	text "Bien. Espera en la"
	line "Puerta Norte a que"

	para "se anuncie a los"
	line "ganadores."
	done

Route35NationalParkGateOfficer1OkGoFinishText:
	text "Vale. Vuelve fuera"
	line "y termina el"
	cont "juego."
	done

Route35NationalParkGateOfficer1ContestIsOverText:
	text "El Concurso ha"
	line "acabado. Esperamos"

	para "volveros a ver"
	line "aquí pronto."
	done

Route35NationalParkGateOfficer1WeHoldContestsText:
	text "En el PARQUE se"
	line "suelen celebrar"

	para "muchos Concursos."
	line "Deberías probar."
	done

Route35NationalParkGateYoungsterText:
	text "¿Cuándo será el"
	line "próximo Concurso"
	cont "Captura de Bichos?"
	done

BugCatchingContestExplanationText:
	text "El Concurso de"
	line "Captura de Bichos"

	para "se celebra los"
	line "martes, jueves"
	cont "y sábados."

	para "No sólo ganarás un"
	line "premio por parti-"
	cont "cipar. Además,"
	cont "podrás quedarte"

	para "con el #MON"
	line "bicho que tengas"

	para "al final del"
	line "concurso."
	done

Route35NationalParkGate_MapEvents:
	db 0, 0 ; filler

	db 4 ; warp events
	warp_event  3,  0, NATIONAL_PARK, 3
	warp_event  4,  0, NATIONAL_PARK, 4
	warp_event  3,  7, ROUTE_35, 3
	warp_event  4,  7, ROUTE_35, 3

	db 0 ; coord events

	db 1 ; bg events
	bg_event  5,  0, BGEVENT_READ, BugCatchingContestExplanationSign

	db 3 ; object events
	object_event  2,  1, SPRITE_OFFICER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, Route35OfficerScriptContest, EVENT_ROUTE_35_NATIONAL_PARK_GATE_OFFICER_CONTEST_DAY
	object_event  6,  5, SPRITE_YOUNGSTER, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, Route35NationalParkGateYoungsterScript, EVENT_ROUTE_35_NATIONAL_PARK_GATE_YOUNGSTER
	object_event  0,  3, SPRITE_OFFICER, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, Route35NationalParkGateOfficerScript, EVENT_ROUTE_35_NATIONAL_PARK_GATE_OFFICER_NOT_CONTEST_DAY
