	object_const_def ; object_event constants
	const WISETRIOSROOM_SAGE1
	const WISETRIOSROOM_SAGE2
	const WISETRIOSROOM_SAGE3
	const WISETRIOSROOM_SAGE4
	const WISETRIOSROOM_SAGE5
	const WISETRIOSROOM_SAGE6

WiseTriosRoom_MapScripts:
	db 2 ; scene scripts
	scene_script .DummyScene0 ; SCENE_DEFAULT
	scene_script .DummyScene1 ; SCENE_FINISHED

	db 1 ; callbacks
	callback MAPCALLBACK_OBJECTS, .WiseTrioCallback

.DummyScene0:
	end

.DummyScene1:
	end

.WiseTrioCallback:
	checkevent EVENT_FOUGHT_SUICUNE
	iftrue .NoWiseTrio
	checkevent EVENT_KOJI_ALLOWS_YOU_PASSAGE_TO_TIN_TOWER
	iftrue .WiseTrio2
	checkitem CLEAR_BELL
	iftrue .WiseTrio2
	clearevent EVENT_WISE_TRIOS_ROOM_WISE_TRIO_1
	setevent EVENT_WISE_TRIOS_ROOM_WISE_TRIO_2
	return

.WiseTrio2:
	setevent EVENT_WISE_TRIOS_ROOM_WISE_TRIO_1
	clearevent EVENT_WISE_TRIOS_ROOM_WISE_TRIO_2
	return

.NoWiseTrio:
	setevent EVENT_WISE_TRIOS_ROOM_WISE_TRIO_1
	setevent EVENT_WISE_TRIOS_ROOM_WISE_TRIO_2
	return

WiseTriosRoomSage1Script:
	jumptextfaceplayer WiseTriosRoomSage1Text

WiseTriosRoomSage2Script:
	jumptextfaceplayer WiseTriosRoomSage2Text

WiseTriosRoomSage3Script:
	jumptextfaceplayer WiseTriosRoomSage3Text

WiseTriosRoom_CannotEnterTinTowerScript:
	turnobject WISETRIOSROOM_SAGE3, UP
	turnobject PLAYER, DOWN
	showemote EMOTE_SHOCK, WISETRIOSROOM_SAGE3, 20
	follow PLAYER, WISETRIOSROOM_SAGE3
	applymovement PLAYER, MovementData_0x98622
	stopfollow
	turnobject PLAYER, RIGHT
	opentext
	writetext WiseTriosRoomSage3BlocksExitText
	waitbutton
	closetext
	applymovement WISETRIOSROOM_SAGE3, MovementData_0x98625
	turnobject WISETRIOSROOM_SAGE3, LEFT
	end

TrainerSageGaku:
	trainer SAGE, GAKU, EVENT_BEAT_SAGE_GAKU, SageGakuSeenText, SageGakuBeatenText, 0, .Script

.Script:
	opentext
	writetext SageGakuAfterBattleText
	waitbutton
	closetext
	end

TrainerSageMasa:
	trainer SAGE, MASA, EVENT_BEAT_SAGE_MASA, SageMasaSeenText, SageMasaBeatenText, 0, .Script

.Script:
	opentext
	writetext SageMasaAfterBattleText
	waitbutton
	closetext
	end

TrainerSageKoji:
	trainer SAGE, KOJI, EVENT_BEAT_SAGE_KOJI, SageKojiSeenText, SageKojiBeatenText, 0, .Script

.Script:
	checkevent EVENT_KOJI_ALLOWS_YOU_PASSAGE_TO_TIN_TOWER
	iftrue .KojiAllowsPassage
	pause 10
	showemote EMOTE_SHOCK, WISETRIOSROOM_SAGE6, 20
	opentext
	writetext SageKojiAfterBattleQuestionText
	promptbutton
	writetext SageKojiAfterBattleSpeechText
	waitbutton
	closetext
	applymovement WISETRIOSROOM_SAGE6, MovementData_0x98628
	turnobject WISETRIOSROOM_SAGE6, UP
	setevent EVENT_KOJI_ALLOWS_YOU_PASSAGE_TO_TIN_TOWER
	setscene SCENE_FINISHED
	end

.KojiAllowsPassage:
	opentext
	writetext SageKojiAfterBattleFinalText
	waitbutton
	closetext
	end

MovementData_0x98622:
	step LEFT
	step LEFT
	step_end

MovementData_0x98625:
	step RIGHT
	step DOWN
	step_end

MovementData_0x98628:
	step RIGHT
	step DOWN
	step_end

WiseTriosRoomSage1Text:
	text "Asombroso…"

	para "SUICUNE, ENTEI y"
	line "RAIKOU han salido"
	cont "de su letargo…"

	para "¿Se hará realidad"
	line "la leyenda?"
	done

WiseTriosRoomSage2Text:
	text "Nos entrenamos en"
	line "TORRE QUEMADA,"

	para "pero nunca oímos"
	line "hablar de que"

	para "hubiera ningún"
	line "agujero."

	para "Alguien lo debió"
	line "de hacer a"
	cont "propósito."
	done

WiseTriosRoomSage3BlocksExitText:
	text "Sólo pueden entrar"
	line "en la TORRE"

	para "HOJALATA aquellos"
	line "que lleven la"

	para "MEDALLA del"
	line "GIMNASIO IRIS."

	para "¡Aunque, ahora que"
	line "SUICUNE, RAIKOU"

	para "y ENTEI han des-"
	line "pertado, te pido"

	para "que te abstengas"
	line "de entrar!"
	done

WiseTriosRoomSage3Text:
	text "Nosotros, el TRÍO"
	line "DE SABIOS, somos"

	para "los protectores"
	line "del #MON"
	cont "legendario."
	done

SageGakuSeenText:
	text "Cuenta la leyenda"
	line "que cuando resurja"

	para "un entrenador con"
	line "la capacidad de"

	para "tocar las almas de"
	line "los #MON, un"

	para "#MON aparecerá"
	line "para retar al"

	para "entrenador en la"
	line "TORRE HOJALATA."

	para "¡La leyenda se ha"
	line "hecho realidad!"

	para "¡SUICUNE, el"
	line "#MON legenda-"
	cont "rio, ha llegado!"

	para "¡Nosotros, el TRÍO"
	line "DE SABIOS, vamos a"

	para "probarte antes de"
	line "que entres!"
	done

SageGakuBeatenText:
	text "¿Más fuerte que"
	line "nosotros? Quizá…"
	done

SageGakuAfterBattleText:
	text "Ah, entonces tú"
	line "eres quien dice"

	para "haber visto a"
	line "SUICUNE, ENTEI y"

	para "RAIKOU mientras"
	line "dormían…"

	para "¡Increíble!"

	para "La leyenda cuenta"
	line "que no se pueden"

	para "ver mientras"
	line "duermen…"
	done

SageMasaSeenText:
	text "¿Mereces conocer"
	line "la verdad?"

	para "Debo averiguar tu"
	line "valía."
	done

SageMasaBeatenText:
	text "Te contaré la"
	line "verdad…"
	done

SageMasaAfterBattleText:
	text "En el pasado, aquí"
	line "se alzaban dos"

	para "torres de nueve"
	line "pisos."

	para "La TORRE LATÓN, de"
	line "la cual se decía"

	para "despertaba a los"
	line "#MON, y la"

	para "TORRE HOJALATA,"
	line "en la que dormían"

	para "los #MON,"
	line "según parece."

	para "La vista desde las"
	line "TORRES debía"
	cont "ser magnífica."

	para "Se dice que, por"
	line "aquel entonces, un"

	para "inmenso #MON"
	line "plateado hizo su"

	para "nido sobre la"
	line "TORRE LATÓN."

	para "Pero…"

	para "Hace unos 150"
	line "años, un rayo"

	para "destruyó una de"
	line "las TORRES."

	para "La envolvió en"
	line "feroces llamas"

	para "durante tres días"
	line "y tres noches."

	para "Un aguacero"
	line "repentino acabó"
	cont "con el fuego."

	para "Y así es como pasó"
	line "a ser la TORRE"
	cont "QUEMADA."
	done

SageKojiSeenText:
	text "¡Déjame ver tu"
	line "poder!"
	done

SageKojiBeatenText:
	text "¡Muy fuerte!"
	line "¿Por qué?"
	done

SageKojiAfterBattleQuestionText:
	text "Tú… ¿Era a ti"
	line "a quien esperaba"

	para "el #MON legen-"
	line "dario?"
	done

SageKojiAfterBattleSpeechText:
	text "Ya veo…"

	para "Nosotros, el TRÍO"
	line "DE SABIOS, tenemos"

	para "la responsabilidad"
	line "de proteger al"

	para "#MON legenda-"
	line "rio. Sólo podemos"

	para "dejar pasar a"
	line "aquellos que"

	para "posean el poder y"
	line "un alma pura."

	para "Por favor, sigue"
	line "adelante hacia la"
	cont "TORRE HOJALATA."

	para "SUICUNE te pondrá"
	line "a prueba."
	done

SageKojiAfterBattleFinalText:
	text "Adelante."

	para "SUICUNE te pondrá"
	line "a prueba."
	done

WiseTriosRoom_MapEvents:
	db 0, 0 ; filler

	db 3 ; warp events
	warp_event  7,  4, ECRUTEAK_CITY, 4
	warp_event  7,  5, ECRUTEAK_CITY, 5
	warp_event  1,  4, ECRUTEAK_TIN_TOWER_ENTRANCE, 5

	db 1 ; coord events
	coord_event  7,  4, SCENE_DEFAULT, WiseTriosRoom_CannotEnterTinTowerScript

	db 0 ; bg events

	db 6 ; object events
	object_event  6,  2, SPRITE_SAGE, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, WiseTriosRoomSage1Script, EVENT_WISE_TRIOS_ROOM_WISE_TRIO_1
	object_event  6,  7, SPRITE_SAGE, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 1, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, WiseTriosRoomSage2Script, EVENT_WISE_TRIOS_ROOM_WISE_TRIO_1
	object_event  7,  5, SPRITE_SAGE, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, WiseTriosRoomSage3Script, EVENT_WISE_TRIOS_ROOM_WISE_TRIO_1
	object_event  4,  2, SPRITE_SAGE, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_TRAINER, 2, TrainerSageGaku, EVENT_WISE_TRIOS_ROOM_WISE_TRIO_2
	object_event  4,  6, SPRITE_SAGE, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, 0, OBJECTTYPE_TRAINER, 2, TrainerSageMasa, EVENT_WISE_TRIOS_ROOM_WISE_TRIO_2
	object_event  6,  4, SPRITE_SAGE, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, 0, OBJECTTYPE_TRAINER, 2, TrainerSageKoji, EVENT_WISE_TRIOS_ROOM_WISE_TRIO_2
