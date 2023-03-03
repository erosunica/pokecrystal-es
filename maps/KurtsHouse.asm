	object_const_def ; object_event constants
	const KURTSHOUSE_KURT1
	const KURTSHOUSE_TWIN1
	const KURTSHOUSE_SLOWPOKE
	const KURTSHOUSE_KURT2
	const KURTSHOUSE_TWIN2

KurtsHouse_MapScripts:
	db 0 ; scene scripts

	db 1 ; callbacks
	callback MAPCALLBACK_OBJECTS, .KurtCallback

.KurtCallback:
	checkevent EVENT_CLEARED_SLOWPOKE_WELL
	iffalse .Done
	checkevent EVENT_FOREST_IS_RESTLESS
	iftrue .Done
	checkflag ENGINE_KURT_MAKING_BALLS
	iftrue .MakingBalls
	disappear KURTSHOUSE_KURT2
	appear KURTSHOUSE_KURT1
	disappear KURTSHOUSE_TWIN2
	appear KURTSHOUSE_TWIN1
	return

.MakingBalls:
	disappear KURTSHOUSE_KURT1
	appear KURTSHOUSE_KURT2
	disappear KURTSHOUSE_TWIN1
	appear KURTSHOUSE_TWIN2
.Done:
	return

Kurt1:
	faceplayer
	opentext
	checkevent EVENT_KURT_GAVE_YOU_LURE_BALL
	iftrue .GotLureBall
	checkevent EVENT_CLEARED_SLOWPOKE_WELL
	iftrue .ClearedSlowpokeWell
	writetext KurtsHouseKurtMakingBallsMustWaitText
	waitbutton
	closetext
	special FadeOutMusic
	setevent EVENT_AZALEA_TOWN_SLOWPOKETAIL_ROCKET
	readvar VAR_FACING
	ifequal UP, .RunAround
	turnobject PLAYER, DOWN
	playsound SFX_FLY
	applymovement KURTSHOUSE_KURT1, KurtsHouseKurtExitHouseMovement
	playsound SFX_EXIT_BUILDING
	disappear KURTSHOUSE_KURT1
	waitsfx
	special RestartMapMusic
	end

.RunAround:
	turnobject PLAYER, DOWN
	playsound SFX_FLY
	applymovement KURTSHOUSE_KURT1, KurtsHouseKurtGoAroundPlayerThenExitHouseMovement
	playsound SFX_EXIT_BUILDING
	disappear KURTSHOUSE_KURT1
	waitsfx
	special RestartMapMusic
	end

.ClearedSlowpokeWell:
	writetext KurtsHouseKurtHonoredToMakeBallsText
	promptbutton
	verbosegiveitem LURE_BALL
	iffalse .NoRoomForBall
	setevent EVENT_KURT_GAVE_YOU_LURE_BALL
.GotLureBall:
	checkevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_1
	iftrue .WaitForApricorns
	checkevent EVENT_GAVE_KURT_RED_APRICORN
	iftrue .GiveLevelBall
	checkevent EVENT_GAVE_KURT_BLU_APRICORN
	iftrue .GiveLureBall
	checkevent EVENT_GAVE_KURT_YLW_APRICORN
	iftrue .GiveMoonBall
	checkevent EVENT_GAVE_KURT_GRN_APRICORN
	iftrue .GiveFriendBall
	checkevent EVENT_GAVE_KURT_WHT_APRICORN
	iftrue .GiveFastBall
	checkevent EVENT_GAVE_KURT_BLK_APRICORN
	iftrue .GiveHeavyBall
	checkevent EVENT_GAVE_KURT_PNK_APRICORN
	iftrue .GiveLoveBall
	checkevent EVENT_CAN_GIVE_GS_BALL_TO_KURT
	iftrue .CanGiveGSBallToKurt
.NoGSBall:
	checkevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_2
	iftrue .CheckApricorns
	checkevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_3
	iftrue .CheckApricorns
	writetext KurtsHouseKurtBallsFromApricornsText
	waitbutton
.CheckApricorns:
	checkitem RED_APRICORN
	iftrue .AskApricorn
	checkitem BLU_APRICORN
	iftrue .AskApricorn
	checkitem YLW_APRICORN
	iftrue .AskApricorn
	checkitem GRN_APRICORN
	iftrue .AskApricorn
	checkitem WHT_APRICORN
	iftrue .AskApricorn
	checkitem BLK_APRICORN
	iftrue .AskApricorn
	checkitem PNK_APRICORN
	iftrue .AskApricorn
	checkevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_2
	iftrue .ThatTurnedOutGreat
	checkevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_3
	iftrue .IMakeBallsFromApricorns
	closetext
	end

.IMakeBallsFromApricorns:
	writetext KurtsHouseKurtBallsFromApricornsText
	waitbutton
	closetext
	end

.AskApricorn:
	writetext KurtsHouseKurtAskYouHaveAnApricornText
	promptbutton
	setevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_3
	special SelectApricornForKurt
	ifequal FALSE, .Cancel
	ifequal BLU_APRICORN, .Blu
	ifequal YLW_APRICORN, .Ylw
	ifequal GRN_APRICORN, .Grn
	ifequal WHT_APRICORN, .Wht
	ifequal BLK_APRICORN, .Blk
	ifequal PNK_APRICORN, .Pnk
; .Red
	setevent EVENT_GAVE_KURT_RED_APRICORN
	sjump .GaveKurtApricorns

.Blu:
	setevent EVENT_GAVE_KURT_BLU_APRICORN
	sjump .GaveKurtApricorns

.Ylw:
	setevent EVENT_GAVE_KURT_YLW_APRICORN
	sjump .GaveKurtApricorns

.Grn:
	setevent EVENT_GAVE_KURT_GRN_APRICORN
	sjump .GaveKurtApricorns

.Wht:
	setevent EVENT_GAVE_KURT_WHT_APRICORN
	sjump .GaveKurtApricorns

.Blk:
	setevent EVENT_GAVE_KURT_BLK_APRICORN
	sjump .GaveKurtApricorns

.Pnk:
	setevent EVENT_GAVE_KURT_PNK_APRICORN
	sjump .GaveKurtApricorns

.GaveKurtApricorns:
	setevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_1
	setflag ENGINE_KURT_MAKING_BALLS
.WaitForApricorns:
	writetext KurtsHouseKurtItWillTakeADayText
	waitbutton
	closetext
	end

.Cancel:
	writetext KurtsHouseKurtThatsALetdownText
	waitbutton
	closetext
	end

._ThatTurnedOutGreat:
	setevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_2
.ThatTurnedOutGreat:
	writetext KurtsHouseKurtTurnedOutGreatText
	waitbutton
.NoRoomForBall:
	closetext
	end

.GiveLevelBall:
	checkflag ENGINE_KURT_MAKING_BALLS
	iftrue KurtMakingBallsScript
	writetext KurtsHouseKurtJustFinishedYourBallText
	promptbutton
	verbosegiveitemvar LEVEL_BALL, VAR_KURT_APRICORNS
	iffalse .NoRoomForBall
	clearevent EVENT_GAVE_KURT_RED_APRICORN
	sjump ._ThatTurnedOutGreat

.GiveLureBall:
	checkflag ENGINE_KURT_MAKING_BALLS
	iftrue KurtMakingBallsScript
	writetext KurtsHouseKurtJustFinishedYourBallText
	promptbutton
	verbosegiveitemvar LURE_BALL, VAR_KURT_APRICORNS
	iffalse .NoRoomForBall
	clearevent EVENT_GAVE_KURT_BLU_APRICORN
	sjump ._ThatTurnedOutGreat

.GiveMoonBall:
	checkflag ENGINE_KURT_MAKING_BALLS
	iftrue KurtMakingBallsScript
	writetext KurtsHouseKurtJustFinishedYourBallText
	promptbutton
	verbosegiveitemvar MOON_BALL, VAR_KURT_APRICORNS
	iffalse .NoRoomForBall
	clearevent EVENT_GAVE_KURT_YLW_APRICORN
	sjump ._ThatTurnedOutGreat

.GiveFriendBall:
	checkflag ENGINE_KURT_MAKING_BALLS
	iftrue KurtMakingBallsScript
	writetext KurtsHouseKurtJustFinishedYourBallText
	promptbutton
	verbosegiveitemvar FRIEND_BALL, VAR_KURT_APRICORNS
	iffalse .NoRoomForBall
	clearevent EVENT_GAVE_KURT_GRN_APRICORN
	sjump ._ThatTurnedOutGreat

.GiveFastBall:
	checkflag ENGINE_KURT_MAKING_BALLS
	iftrue KurtMakingBallsScript
	writetext KurtsHouseKurtJustFinishedYourBallText
	promptbutton
	verbosegiveitemvar FAST_BALL, VAR_KURT_APRICORNS
	iffalse .NoRoomForBall
	clearevent EVENT_GAVE_KURT_WHT_APRICORN
	sjump ._ThatTurnedOutGreat

.GiveHeavyBall:
	checkflag ENGINE_KURT_MAKING_BALLS
	iftrue KurtMakingBallsScript
	writetext KurtsHouseKurtJustFinishedYourBallText
	promptbutton
	verbosegiveitemvar HEAVY_BALL, VAR_KURT_APRICORNS
	iffalse .NoRoomForBall
	clearevent EVENT_GAVE_KURT_BLK_APRICORN
	sjump ._ThatTurnedOutGreat

.GiveLoveBall:
	checkflag ENGINE_KURT_MAKING_BALLS
	iftrue KurtMakingBallsScript
	writetext KurtsHouseKurtJustFinishedYourBallText
	promptbutton
	verbosegiveitemvar LOVE_BALL, VAR_KURT_APRICORNS
	iffalse .NoRoomForBall
	clearevent EVENT_GAVE_KURT_PNK_APRICORN
	sjump ._ThatTurnedOutGreat

.CanGiveGSBallToKurt:
	checkevent EVENT_GAVE_GS_BALL_TO_KURT
	iftrue .GaveGSBallToKurt
	checkitem GS_BALL
	iffalse .NoGSBall
	writetext KurtsHouseKurtWhatIsThatText
	waitbutton
	closetext
	setevent EVENT_GAVE_GS_BALL_TO_KURT
	takeitem GS_BALL
	setflag ENGINE_KURT_MAKING_BALLS
	end

.GaveGSBallToKurt:
	checkflag ENGINE_KURT_MAKING_BALLS
	iffalse .NotMakingBalls
	writetext KurtsHouseKurtImCheckingItNowText
	waitbutton
	writetext KurtsHouseKurtAhHaISeeText
	waitbutton
	closetext
	end

.NotMakingBalls:
	writetext KurtsHouseKurtThisBallStartedToShakeText
	waitbutton
	closetext
	setevent EVENT_FOREST_IS_RESTLESS
	clearevent EVENT_CAN_GIVE_GS_BALL_TO_KURT
	clearevent EVENT_GAVE_GS_BALL_TO_KURT
	special FadeOutMusic
	pause 20
	showemote EMOTE_SHOCK, KURTSHOUSE_KURT1, 30
	readvar VAR_FACING
	ifequal UP, .GSBallRunAround
	turnobject PLAYER, DOWN
	playsound SFX_FLY
	applymovement KURTSHOUSE_KURT1, KurtsHouseKurtExitHouseMovement
	sjump .KurtHasLeftTheBuilding

.GSBallRunAround:
	turnobject PLAYER, DOWN
	playsound SFX_FLY
	applymovement KURTSHOUSE_KURT1, KurtsHouseKurtGoAroundPlayerThenExitHouseMovement
.KurtHasLeftTheBuilding:
	playsound SFX_EXIT_BUILDING
	disappear KURTSHOUSE_KURT1
	clearevent EVENT_AZALEA_TOWN_KURT
	waitsfx
	special RestartMapMusic
	setmapscene AZALEA_TOWN, SCENE_AZALEATOWN_KURT_RETURNS_GS_BALL
	end

Kurt2:
	faceplayer
	opentext
	checkevent EVENT_GAVE_GS_BALL_TO_KURT
	iftrue KurtScript_ImCheckingItNow
KurtMakingBallsScript:
	checkevent EVENT_BUGGING_KURT_TOO_MUCH
	iffalse Script_FirstTimeBuggingKurt
	writetext KurtsHouseKurtDontBotherMeText
	waitbutton
	closetext
	turnobject KURTSHOUSE_KURT2, UP
	end

Script_FirstTimeBuggingKurt:
	writetext KurtsHouseKurtGranddaughterHelpingWorkFasterText
	waitbutton
	closetext
	turnobject KURTSHOUSE_KURT2, UP
	setevent EVENT_BUGGING_KURT_TOO_MUCH
	end

KurtScript_ImCheckingItNow:
	writetext KurtsHouseKurtImCheckingItNowText
	waitbutton
	turnobject KURTSHOUSE_KURT2, UP
	writetext KurtsHouseKurtAhHaISeeText
	waitbutton
	closetext
	end

KurtsGranddaughter1:
	faceplayer
	checkevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_1
	iftrue KurtsGranddaughter2Subscript
	checkevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_2
	iftrue KurtsGranddaughterFunScript
	checkevent EVENT_FOREST_IS_RESTLESS
	iftrue .Lonely
	checkevent EVENT_FAST_SHIP_FIRST_TIME
	iftrue .Dad
	checkevent EVENT_CLEARED_SLOWPOKE_WELL
	iftrue .SlowpokeBack
	checkevent EVENT_AZALEA_TOWN_SLOWPOKETAIL_ROCKET
	iftrue .Lonely
	opentext
	writetext KurtsGranddaughterSlowpokeGoneText
	waitbutton
	closetext
	end

.SlowpokeBack:
	opentext
	writetext KurtsGranddaughterSlowpokeBackText
	waitbutton
	closetext
	end

.Lonely:
	opentext
	writetext KurtsGranddaughterLonelyText
	waitbutton
	closetext
	end

.Dad:
	opentext
	writetext KurtsGranddaughterDadText
	waitbutton
	closetext
	end

KurtsGranddaughter2:
	faceplayer
KurtsGranddaughter2Subscript:
	opentext
	checkevent EVENT_GAVE_GS_BALL_TO_KURT
	iftrue .GSBall
	writetext KurtsGranddaughterHelpText
	waitbutton
	closetext
	turnobject KURTSHOUSE_TWIN2, RIGHT
	end

.GSBall:
	writetext KurtsGranddaughterGSBallText
	waitbutton
	closetext
	turnobject KURTSHOUSE_TWIN2, RIGHT
	end

KurtsGranddaughterFunScript:
	opentext
	writetext KurtsGranddaughterFunText
	waitbutton
	closetext
	end

KurtsHouseSlowpoke:
	faceplayer
	opentext
	writetext KurtsHouseSlowpokeText
	cry SLOWPOKE
	waitbutton
	closetext
	end

KurtsHouseOakPhoto:
	jumptext KurtsHouseOakPhotoText

KurtsHouseCelebiStatue:
	jumptext KurtsHouseCelebiStatueText

KurtsHouseBookshelf:
	jumpstd difficultbookshelf

KurtsHouseRadio:
	jumpstd radio2

KurtsHouseKurtExitHouseMovement:
	big_step DOWN
	big_step DOWN
	big_step DOWN
	big_step DOWN
	big_step DOWN
	step_end

KurtsHouseKurtGoAroundPlayerThenExitHouseMovement:
	big_step RIGHT
	big_step DOWN
	big_step DOWN
	big_step DOWN
	big_step DOWN
	big_step DOWN
	step_end

KurtsHouseKurtMakingBallsMustWaitText:
	text "¿Quién eres?"

	para "<PLAYER>,"
	line "¿quieres que haga"
	cont "alguna BALL?"

	para "Lo siento, pero"
	line "deberás esperar."

	para "¿Conoces al TEAM"
	line "ROCKET? ¡Bah!"

	para "No importa. Yo"
	line "te lo contaré."

	para "Se trata de una"
	line "banda malvada que"

	para "usa #MON para"
	line "el trabajo sucio."

	para "Se supone que se"
	line "separaron hace"
	cont "tres años."

	para "¡Pero están en el"
	line "POZO cortando"

	para "COLAS de SLOWPOKE"
	line "para venderlas!"

	para "¡Así que voy a"
	line "ir allí a darles"
	cont "una lección!"

	para "¡Resistid,"
	line "SLOWPOKE!"
	cont "¡CÉSAR os ayudará!"
	done

KurtsHouseKurtHonoredToMakeBallsText:
	text "CÉSAR: ¡<PLAYER>!"

	para "Te has portado"
	line "como nadie en el"
	cont "POZO."

	para "¡Tienes estilo!"

	para "Sería un honor"
	line "hacer alguna BALL"

	para "para alguien como"
	line "tú."

	para "Ahora sólo tengo"
	line "ésta. Tuya es."
	done

KurtsHouseKurtBallsFromApricornsText:
	text "CÉSAR: Fabrico las"
	line "BALL de los"
	cont "BONGURI."

	para "Recógelos de los"
	line "árboles y"
	cont "tráemelos."

	para "Los usaré para"
	line "hacer las BALL."
	done

KurtsHouseKurtAskYouHaveAnApricornText:
	text "CÉSAR: ¿Tienes"
	line "un BONGURI?"

	para "¡Vale! Te haré"
	line "una BALL."
	done

KurtsHouseKurtItWillTakeADayText:
	text "CÉSAR: Tardaré un"
	line "día en fabricar"

	para "una BALL. Vuelve"
	line "mañana a por ella."
	done

KurtsHouseKurtThatsALetdownText:
	text "CÉSAR: ¡Oh…!"
	line "¡Qué decepción!"
	done

KurtsHouseKurtDontBotherMeText:
	text "CÉSAR: ¡Estoy"
	line "trabajando! ¡Vete!"
	done

KurtsHouseKurtJustFinishedYourBallText:
	text "CÉSAR: ¡<PLAYER>!"
	line "Acabo de terminar"
	cont "tu BALL. Tuya es."
	done

KurtsHouseKurtTurnedOutGreatText:
	text "CÉSAR: Ha salido"
	line "muy bien."

	para "Intenta capturar"
	line "#MON con ella."
	done

KurtsHouseKurtGranddaughterHelpingWorkFasterText:
	text "CÉSAR: Ahora que"
	line "mi nieta me ayuda,"

	para "puedo trabajar"
	line "mucho más rápido."
	done

KurtsHouseKurtWhatIsThatText:
	text "¿Qué es eso?"

	para "Nunca lo había"
	line "visto."

	para "Se parece mucho a"
	line "una # BALL,"

	para "pero parece que"
	line "tiene algo más."

	para "Déjame que lo vea."
	done

KurtsHouseKurtImCheckingItNowText:
	text "Estoy viéndolo."
	done

KurtsHouseKurtAhHaISeeText:
	text "¡Ajá! ¡Ya veo!"
	line "Entonces…"
	done

KurtsHouseKurtThisBallStartedToShakeText:
	text "¡<PLAYER>!"

	para "Esta BALL comenzó"
	line "a agitarse cuando"
	cont "la examinaba."

	para "¡Tiene que haber"
	line "algo!"
	done

KurtsGranddaughterSlowpokeGoneText:
	text "Los SLOWPOKE se"
	line "han ido…"

	para "¿Se los ha llevado"
	line "la gente mala?"
	done

KurtsGranddaughterLonelyText:
	text "El abuelo se fue."
	line "Estoy tan sola…"
	done

KurtsGranddaughterSlowpokeBackText:
	text "¡El SLOWPOKE que"
	line "me regaló mi padre"
	cont "ha vuelto!"

	para "¡Y su COLA vuelve"
	line "a crecer!"
	done

KurtsGranddaughterDadText:
	text "Papá trabaja en"
	line "SILPH y estudia"
	cont "las # BALL."

	para "Tengo que quedarme"
	line "en casa con el"
	cont "abuelo y SLOWPOKE."
	done

KurtsGranddaughterHelpText:
	text "¡Estoy ayudando al"
	line "abuelo!"

	para "¡Haremos buenas"
	line "BALL para ti, así"
	cont "que espera!"
	done

KurtsGranddaughterFunText:
	text "¡Hacer BALL es"
	line "divertido!"
	done

KurtsGranddaughterGSBallText:
	text "El abuelo está"
	line "examinando una"
	cont "BALL."

	para "Estoy esperando"
	line "a que termine."
	done

KurtsHouseSlowpokeText:
	text "SLOWPOKE: ¡Mmm!"
	line "(Bostezo)."
	done

KurtsHouseOakPhotoText:
	text "¿Un joven PROF."
	line "OAK?"
	done

KurtsHouseCelebiStatueText:
	text "Es una estatua del"
	line "guardián del"
	cont "encinar."
	done

KurtsHouse_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event  3,  7, AZALEA_TOWN, 4
	warp_event  4,  7, AZALEA_TOWN, 4

	db 0 ; coord events

	db 7 ; bg events
	bg_event  6,  1, BGEVENT_READ, KurtsHouseRadio
	bg_event  8,  0, BGEVENT_READ, KurtsHouseOakPhoto
	bg_event  9,  0, BGEVENT_READ, KurtsHouseOakPhoto
	bg_event  5,  1, BGEVENT_READ, KurtsHouseBookshelf
	bg_event  2,  1, BGEVENT_READ, KurtsHouseBookshelf
	bg_event  3,  1, BGEVENT_READ, KurtsHouseBookshelf
	bg_event  4,  1, BGEVENT_READ, KurtsHouseCelebiStatue

	db 5 ; object events
	object_event  3,  2, SPRITE_KURT, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, Kurt1, EVENT_KURTS_HOUSE_KURT_1
	object_event  5,  3, SPRITE_TWIN, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, KurtsGranddaughter1, EVENT_KURTS_HOUSE_GRANDDAUGHTER_1
	object_event  6,  3, SPRITE_SLOWPOKE, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, KurtsHouseSlowpoke, EVENT_KURTS_HOUSE_SLOWPOKE
	object_event 14,  3, SPRITE_KURT, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, Kurt2, EVENT_KURTS_HOUSE_KURT_2
	object_event 11,  4, SPRITE_TWIN, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, KurtsGranddaughter2, EVENT_KURTS_HOUSE_GRANDDAUGHTER_2
