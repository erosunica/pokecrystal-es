	object_const_def ; object_event constants
	const RADIOTOWER2F_SUPER_NERD
	const RADIOTOWER2F_TEACHER
	const RADIOTOWER2F_ROCKET1
	const RADIOTOWER2F_ROCKET2
	const RADIOTOWER2F_ROCKET3
	const RADIOTOWER2F_ROCKET_GIRL
	const RADIOTOWER2F_BLACK_BELT1
	const RADIOTOWER2F_BLACK_BELT2
	const RADIOTOWER2F_JIGGLYPUFF
	const RADIOTOWER2F_BUENA
	const RADIOTOWER2F_RECEPTIONIST

RadioTower2F_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

RadioTower2FUnusedDummyScene:
; unused
	end

RadioTower2FSuperNerdScript:
	jumptextfaceplayer RadioTower2FSuperNerdText

RadioTower2FTeacherScript:
	faceplayer
	opentext
	checkflag ENGINE_ROCKETS_IN_RADIO_TOWER
	iftrue .Rockets
	writetext RadioTower2FTeacherText
	waitbutton
	closetext
	end

.Rockets:
	writetext RadioTower2FTeacherText_Rockets
	waitbutton
	closetext
	end

RadioTowerJigglypuff:
	opentext
	writetext RadioTowerJigglypuffText
	cry JIGGLYPUFF
	waitbutton
	closetext
	end

RadioTower2FBlackBelt1Script:
	jumptextfaceplayer RadioTower2FBlackBelt1Text

RadioTower2FBlackBelt2Script:
	jumptextfaceplayer RadioTower2FBlackBelt2Text

TrainerGruntM4:
	trainer GRUNTM, GRUNTM_4, EVENT_BEAT_ROCKET_GRUNTM_4, GruntM4SeenText, GruntM4BeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext GruntM4AfterBattleText
	waitbutton
	closetext
	end

TrainerGruntM5:
	trainer GRUNTM, GRUNTM_5, EVENT_BEAT_ROCKET_GRUNTM_5, GruntM5SeenText, GruntM5BeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext GruntM5AfterBattleText
	waitbutton
	closetext
	end

TrainerGruntM6:
	trainer GRUNTM, GRUNTM_6, EVENT_BEAT_ROCKET_GRUNTM_6, GruntM6SeenText, GruntM6BeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext GruntM6AfterBattleText
	waitbutton
	closetext
	end

TrainerGruntF2:
	trainer GRUNTF, GRUNTF_2, EVENT_BEAT_ROCKET_GRUNTF_2, GruntF2SeenText, GruntF2BeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext GruntF2AfterBattleText
	waitbutton
	closetext
	end

Buena:
	faceplayer
	opentext
	checkflag ENGINE_ROCKETS_IN_RADIO_TOWER
	iftrue .MidRocketTakeover
	checkevent EVENT_MET_BUENA
	iffalse .Introduction
	checkflag ENGINE_BUENAS_PASSWORD_2
	iftrue .PlayedAlready
	readvar VAR_HOUR
	ifless 18, .TooEarly
	checkflag ENGINE_BUENAS_PASSWORD
	iffalse .TuneIn
	checkitem BLUE_CARD
	iffalse .NoBlueCard
	readvar VAR_BLUECARDBALANCE
	ifequal 30, .BlueCardCapped0
	playmusic MUSIC_BUENAS_PASSWORD
	writetext RadioTower2FBuenaDoYouKnowPasswordText
	special AskRememberPassword
	iffalse .ForgotPassword
	writetext RadioTower2FBuenaJoinTheShowText
	waitbutton
	closetext
	turnobject RADIOTOWER2F_BUENA, RIGHT
	readvar VAR_FACING
	ifnotequal RIGHT, .DontNeedToMove
	applymovement PLAYER, RadioTower2FPlayerWalksToMicrophoneMovement
.DontNeedToMove:
	turnobject PLAYER, RIGHT
	opentext
	writetext RadioTower2FBuenaEveryoneSayPasswordText
	waitbutton
	closetext
	turnobject RADIOTOWER2F_BUENA, DOWN
	refreshscreen
	special BuenasPassword
	closetext
	iffalse .WrongAnswer
	opentext
	writetext RadioTower2FBuenaCorrectAnswerText
	waitbutton
	closetext
	readvar VAR_BLUECARDBALANCE
	addval 1
	writevar VAR_BLUECARDBALANCE
	waitsfx
	playsound SFX_TRANSACTION
	setflag ENGINE_BUENAS_PASSWORD_2
	pause 20
	turnobject RADIOTOWER2F_BUENA, RIGHT
	opentext
	writetext RadioTower2FBuenaThanksForComingText
	waitbutton
	closetext
	special FadeOutMusic
	pause 20
	special RestartMapMusic
	readvar VAR_BLUECARDBALANCE
	ifequal 30, .BlueCardCapped1
	end

.Introduction:
	writetext RadioTower2FBuenaShowIntroductionText
	promptbutton
	setevent EVENT_MET_BUENA
	verbosegiveitem BLUE_CARD
.TuneIn:
	writetext RadioTower2FBuenaTuneInToMyShowText
	waitbutton
	closetext
	checkcellnum PHONE_BUENA
	iftrue .Registered0
	checkevent EVENT_BUENA_OFFERED_HER_PHONE_NUMBER
	iftrue .OfferedNumberBefore
.Registered0:
	turnobject RADIOTOWER2F_BUENA, RIGHT
	end

.ForgotPassword:
	writetext RadioTower2FBuenaComeBackAfterListeningText
	waitbutton
	closetext
	turnobject RADIOTOWER2F_BUENA, RIGHT
	special FadeOutMusic
	pause 20
	special RestartMapMusic
	end

.PlayedAlready:
	writetext RadioTower2FBuenaAlreadyPlayedText
	waitbutton
	closetext
	checkcellnum PHONE_BUENA
	iftrue .Registered1
	checkevent EVENT_BUENA_OFFERED_HER_PHONE_NUMBER
	iftrue .OfferedNumberBefore
.Registered1:
	turnobject RADIOTOWER2F_BUENA, RIGHT
	pause 10
	end

.WrongAnswer:
	setflag ENGINE_BUENAS_PASSWORD_2
	opentext
	writetext RadioTower2FBuenaDidYouForgetText
	waitbutton
	closetext
	turnobject RADIOTOWER2F_BUENA, RIGHT
	pause 20
	opentext
	writetext RadioTower2FBuenaThanksForComingText
	waitbutton
	closetext
	turnobject RADIOTOWER2F_BUENA, RIGHT
	special FadeOutMusic
	pause 20
	special RestartMapMusic
	end

.MidRocketTakeover:
	writetext RadioTower2FBuenaPasswordIsHelpText
	waitbutton
	closetext
	end

.NoBlueCard:
	writetext RadioTower2FBuenaNoBlueCardText
	waitbutton
	closetext
	checkcellnum PHONE_BUENA
	iftrue .Registered2
	checkevent EVENT_BUENA_OFFERED_HER_PHONE_NUMBER_NO_BLUE_CARD
	iftrue .OfferedNumberBefore
.Registered2:
	turnobject RADIOTOWER2F_BUENA, RIGHT
	end

.BlueCardCapped0:
	writetext RadioTower2FBuenaCardIsFullText
	waitbutton
	closetext
	checkcellnum PHONE_BUENA
	iftrue .Registered3
	checkevent EVENT_BUENA_OFFERED_HER_PHONE_NUMBER_NO_BLUE_CARD
	iftrue .OfferedNumberBefore
.Registered3:
	turnobject RADIOTOWER2F_BUENA, RIGHT
	end

.TooEarly:
	writetext RadioTower2FBuenaTuneInAfterSixText
	waitbutton
	closetext
	checkcellnum PHONE_BUENA
	iftrue .Registered4
	checkevent EVENT_BUENA_OFFERED_HER_PHONE_NUMBER
	iftrue .OfferedNumberBefore
.Registered4:
	end

.BlueCardCapped1:
	checkcellnum PHONE_BUENA
	iftrue .HasNumber
	pause 20
	turnobject RADIOTOWER2F_BUENA, DOWN
	pause 15
	turnobject PLAYER, UP
	pause 15
	checkevent EVENT_BUENA_OFFERED_HER_PHONE_NUMBER_NO_BLUE_CARD
	iftrue .OfferedNumberBefore
	showemote EMOTE_SHOCK, RADIOTOWER2F_BUENA, 15
	setevent EVENT_BUENA_OFFERED_HER_PHONE_NUMBER_NO_BLUE_CARD
	setevent EVENT_BUENA_OFFERED_HER_PHONE_NUMBER
	opentext
	writetext RadioTower2FBuenaOfferPhoneNumberText
	sjump .AskForNumber

.OfferedNumberBefore:
	opentext
	writetext RadioTower2FBuenaOfferNumberAgainText
.AskForNumber:
	askforphonenumber PHONE_BUENA
	ifequal PHONE_CONTACTS_FULL, .PhoneFull
	ifequal PHONE_CONTACT_REFUSED, .NumberDeclined
	writetext RadioTower2FRegisteredBuenasNumberText
	playsound SFX_REGISTER_PHONE_NUMBER
	waitsfx
	promptbutton
	writetext RadioTower2FBuenaCallMeText
	waitbutton
	closetext
	turnobject RADIOTOWER2F_BUENA, RIGHT
	addcellnum PHONE_BUENA
	end

.NumberDeclined:
	writetext RadioTower2FBuenaSadRejectedText
	waitbutton
	closetext
	turnobject RADIOTOWER2F_BUENA, RIGHT
	end

.PhoneFull:
	writetext RadioTower2FBuenaYourPhoneIsFullText
	waitbutton
	closetext
	turnobject RADIOTOWER2F_BUENA, RIGHT
.HasNumber:
	end

RadioTowerBuenaPrizeReceptionist:
	faceplayer
	opentext
	checkitem BLUE_CARD
	iffalse .NoCard
	writetext RadioTower2FBuenaReceptionistPointsForPrizesText
	promptbutton
	special BuenaPrize
	closetext
	end

.NoCard:
	writetext RadioTower2FBuenaReceptionistNoCardText
	waitbutton
	closetext
	end

RadioTower2FSalesSign:
	jumptext RadioTower2FSalesSignText

RadioTower2FOaksPKMNTalkSign:
	jumptext RadioTower2FOaksPKMNTalkSignText

RadioTower2FPokemonRadioSign:
	jumptext RadioTower2FPokemonRadioSignText

RadioTower2FBookshelf:
	jumpstd magazinebookshelf

RadioTower2FPlayerWalksToMicrophoneMovement:
	slow_step DOWN
	slow_step RIGHT
	step_end

RadioTower2FSuperNerdText:
	text "Puedes oír la"
	line "radio donde sea."
	cont "¡Sintonízala!"
	done

RadioTower2FTeacherText:
	text "Las nanas de la"
	line "radio duermen a"
	cont "los #MON."
	done

RadioTower2FTeacherText_Rockets:
	text "¿Por qué querrían"
	line "apoderarse de la"
	cont "TORRE RADIO?"
	done

RadioTowerJigglypuffText:
	text "JIGGLYPUFF:"
	line "Jiggly…"
	done

RadioTower2FBlackBelt1Text:
	text "¡Aviso!"
	line "Prohibido entrar"
	cont "sin autorización."

	para "Antes no era así."

	para "Debe de haber"
	line "algún problema con"
	cont "el DIRECTOR…"
	done

RadioTower2FBlackBelt2Text:
	text "Puedes mirar por"
	line "todas partes."

	para "El DIRECTOR ya no"
	line "está enfadado."
	done

GruntM4SeenText:
	text "Hace tres años, el"
	line "TEAM ROCKET tuvo"
	cont "que separarse."

	para "¡Pero nos estamos"
	line "volviendo a"
	cont "reunir aquí!"
	done

GruntM4BeatenText:
	text "¡Bah! ¡No vayas de"
	line "perdonavidas!"
	done

GruntM4AfterBattleText:
	text "¡No permitiremos"
	line "que arruines"
	cont "nuestros planes!"
	done

GruntM5SeenText:
	text "¡Somos el"
	line "TEAM ROCKET,"

	para "explotadores de"
	line "los #MON!"

	para "¡Nos gusta ser"
	line "malos! ¿Damos"
	cont "miedo?"
	done

GruntM5BeatenText:
	text "¿Te crees"
	line "invencible?"
	done

GruntM5AfterBattleText:
	text "No siempre somos"
	line "malos. Hacemos lo"
	cont "que queremos."
	done

GruntM6SeenText:
	text "¡Oye! ¡Fuera de"
	line "nuestro camino!"
	done

GruntM6BeatenText:
	text "¡Arggh! Me rindo."
	done

GruntM6AfterBattleText:
	text "Nuestros"
	line "EJECUTIVOS quieren"

	para "hacerse con este"
	line "lugar."

	para "Tienen grandes"
	line "planes."
	cont "¿Cuáles serán?"
	done

GruntF2SeenText:
	text "¡Ja, ja, ja!"

	para "¡Qué aburrimiento!"
	line "¡Fue tan sencillo"

	para "apoderarse de este"
	line "lugar!"

	para "¡Venga,"
	line "entretenme!"
	done

GruntF2BeatenText:
	text "¿Quién eres tú?"
	done

GruntF2AfterBattleText:
	text "¡Me venciste y no"
	line "pienso olvidarlo!"
	done

RadioTower2FBuenaShowIntroductionText:
	text "BUENA: ¡Hola!"
	line "¡Soy BUENA!"

	para "¿Conoces un"
	line "programa de radio"
	cont "llamado CÓDIGO?"

	para "Si puedes decirme"
	line "el código del"

	para "programa, ganarás"
	line "puntos."

	para "¡Acumula puntos y"
	line "cámbiaselos a esa"

	para "dulce jovencita de"
	line "ahí para recibir"
	cont "regalos!"

	para "¡Allá vamos!"

	para "¡Es tu propia"
	line "tarjeta de puntos!"
	done

RadioTower2FBuenaTuneInToMyShowText:
	text "BUENA: ¡Sintoniza"
	line "mi SHOW CÓDIGO!"
	done

RadioTower2FBuenaDoYouKnowPasswordText:
	text "BUENA: ¡Hola!"
	line "¿Sintonizaste mi"
	cont "programa de radio?"

	para "¿Recuerdas el"
	line "código de hoy?"
	done

RadioTower2FBuenaJoinTheShowText:
	text "BUENA: ¡Oh, guau!"
	line "¡Gracias!"

	para "¿Cómo decías que"
	line "te llamabas?"

	para "…"
	line "¡<PLAY_G>, vale!"

	para "Venga, <PLAY_G>."
	line "Únete al show."
	done

RadioTower2FBuenaEveryoneSayPasswordText:
	text "BUENA: ¿Todos"
	line "preparados?"

	para "¡Quiero oírte"
	line "decir el código"

	para "de hoy, <PLAY_G>!"
	done

RadioTower2FBuenaComeBackAfterListeningText:
	text "BUENA: Vuelve"
	line "tras escuchar mi"

	para "show, ¿vale?"
	line "¡Hasta luego!"
	done

RadioTower2FBuenaAlreadyPlayedText:
	text "BUENA: Lo siento…"

	para "Sólo tienes una"
	line "oportunidad por"
	cont "día."

	para "¡Vuelve mañana"
	line "para otro intento!"
	done

RadioTower2FBuenaCorrectAnswerText:
	text "BUENA: ¡YUUUUPI!"
	line "¡Correcto!"

	para "¡Me habías oído!"
	line "¡Estoy muy feliz!"

	para "¡Ganaste un punto!"
	line "¡Felicidades!"
	done

RadioTower2FBuenaDidYouForgetText:
	text "BUENA: Ooooh…"
	line "Incorrecto…"

	para "¿Has olvidado el"
	line "código?"
	done

RadioTower2FBuenaThanksForComingText:
	text "BUENA: Hemos"
	line "concursado con"

	para "<PLAY_G>. ¡Gracias"
	line "por venir!"

	para "¡Espero que todos"
	line "los oyentes vengan"

	para "también!"
	line "¡Estaré esperando!"
	done

RadioTower2FBuenaPasswordIsHelpText:
	text "BUENA: ¿Eh?"
	line "¿El código de hoy?"

	para "¡AYUDA,"
	line "por supuesto!"
	done

RadioTower2FBuenaCardIsFullText:
	text "BUENA: Tu TARJETA"
	line "AZUL está llena."

	para "¡Consigue algún"
	line "premio fabuloso!"
	done

RadioTower2FBuenaTuneInAfterSixText:
	text "BUENA: ¡Sintoniza"
	line "con CÓDIGO todos"

	para "los días desde las"
	line "seis de la tarde"
	cont "hasta medianoche!"

	para "¡Sintoniza y luego"
	line "ven a visitarnos!"
	done

RadioTower2FBuenaNoBlueCardText:
	text "BUENA: ¿Eh?"
	line "¿Olvidaste traer"
	cont "tu TARJETA AZUL?"

	para "No puedo darte"
	line "puntos si no la"
	cont "tienes."
	done

RadioTower2FBuenaOfferPhoneNumberText:
	text "BUENA: ¡Oh! ¡Tu"
	line "TARJETA AZUL ha"

	para "llegado hoy hasta"
	line "los 30 puntos!"
	cont "¡Increíble!"

	para "Mmm… No hay ningún"
	line "premio por llegar"

	para "a los 30 puntos,"
	line "pero…"

	para "Has venido muy a"
	line "menudo, <PLAY_G>."

	para "¡Te ofreceré algo"
	line "especial!"

	para "¿Quieres mi número"
	line "de teléfono?"
	done

RadioTower2FBuenaOfferNumberAgainText:
	text "BUENA: <PLAY_G>,"
	line "¿quieres registrar"

	para "mi número de"
	line "teléfono?"
	done

RadioTower2FRegisteredBuenasNumberText:
	text "<PLAYER> registró"
	line "el número de"
	cont "teléfono de BUENA."
	done

RadioTower2FBuenaCallMeText:
	text "BUENA: ¡Llámame"
	line "cuando quieras!"
	done

RadioTower2FBuenaSadRejectedText:
	text "BUENA: Ooh… Es un"
	line "premio especial…"
	done

RadioTower2FBuenaYourPhoneIsFullText:
	text "BUENA: <PLAY_G>, no"
	line "queda espacio en"

	para "tu agenda para mi"
	line "número…"
	done

RadioTower2FBuenaReceptionistPointsForPrizesText:
	text "¡Puedes cambiar"
	line "los puntos guarda-"
	cont "dos por el premio"
	cont "de tu elección!"
	done

RadioTower2FBuenaReceptionistNoCardText:
	text "No puedes cambiar"
	line "puntos sin tu"
	cont "TARJETA AZUL."

	para "¡No olvides tu"
	line "TARJETA AZUL!"
	done

RadioTower2FSalesSignText:
	text "P1 VENTAS"
	done

RadioTower2FOaksPKMNTalkSignText:
	text "La HORA #MON"
	line "del PROF. OAK."

	para "¡El mejor programa"
	line "de la radio!"
	done

RadioTower2FPokemonRadioSignText:
	text "Radio #MON."
	line "A cualquier hora"
	cont "y en todas partes."
	done

RadioTower2F_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event  0,  0, RADIO_TOWER_3F, 1
	warp_event 15,  0, RADIO_TOWER_1F, 3

	db 0 ; coord events

	db 6 ; bg events
	bg_event  3,  0, BGEVENT_READ, RadioTower2FSalesSign
	bg_event  5,  0, BGEVENT_READ, RadioTower2FOaksPKMNTalkSign
	bg_event  9,  1, BGEVENT_READ, RadioTower2FBookshelf
	bg_event 10,  1, BGEVENT_READ, RadioTower2FBookshelf
	bg_event 11,  1, BGEVENT_READ, RadioTower2FBookshelf
	bg_event 13,  0, BGEVENT_READ, RadioTower2FPokemonRadioSign

	db 11 ; object events
	object_event  6,  6, SPRITE_SUPER_NERD, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, RadioTower2FSuperNerdScript, EVENT_GOLDENROD_CITY_CIVILIANS
	object_event 17,  2, SPRITE_TEACHER, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 1, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, RadioTower2FTeacherScript, -1
	object_event  1,  4, SPRITE_ROCKET, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, 0, OBJECTTYPE_TRAINER, 3, TrainerGruntM4, EVENT_RADIO_TOWER_ROCKET_TAKEOVER
	object_event  8,  4, SPRITE_ROCKET, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_TRAINER, 3, TrainerGruntM5, EVENT_RADIO_TOWER_ROCKET_TAKEOVER
	object_event  4,  1, SPRITE_ROCKET, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_TRAINER, 2, TrainerGruntM6, EVENT_RADIO_TOWER_ROCKET_TAKEOVER
	object_event 10,  5, SPRITE_ROCKET_GIRL, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 3, TrainerGruntF2, EVENT_RADIO_TOWER_ROCKET_TAKEOVER
	object_event  0,  1, SPRITE_BLACK_BELT, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, RadioTower2FBlackBelt1Script, EVENT_RADIO_TOWER_BLACKBELT_BLOCKS_STAIRS
	object_event  1,  1, SPRITE_BLACK_BELT, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, RadioTower2FBlackBelt2Script, EVENT_RADIO_TOWER_CIVILIANS_AFTER
	object_event 12,  1, SPRITE_JIGGLYPUFF, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, RadioTowerJigglypuff, -1
	object_event 14,  5, SPRITE_BUENA, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, Buena, -1
	object_event 12,  7, SPRITE_RECEPTIONIST, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, RadioTowerBuenaPrizeReceptionist, EVENT_GOLDENROD_CITY_CIVILIANS
