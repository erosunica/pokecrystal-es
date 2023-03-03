	object_const_def ; object_event constants
	const ECRUTEAKPOKECENTER1F_NURSE
	const ECRUTEAKPOKECENTER1F_POKEFAN_M
	const ECRUTEAKPOKECENTER1F_COOLTRAINER_F
	const ECRUTEAKPOKECENTER1F_GYM_GUY
	const ECRUTEAKPOKECENTER1F_BILL

EcruteakPokecenter1F_MapScripts:
	db 2 ; scene scripts
	scene_script .MeetBill ; SCENE_DEFAULT
	scene_script .DummyScene ; SCENE_FINISHED

	db 0 ; callbacks

.MeetBill:
	prioritysjump .BillActivatesTimeCapsule
	end

.DummyScene:
	end

.BillActivatesTimeCapsule:
	pause 30
	playsound SFX_EXIT_BUILDING
	appear ECRUTEAKPOKECENTER1F_BILL
	waitsfx
	applymovement ECRUTEAKPOKECENTER1F_BILL, EcruteakPokecenter1FBillMovement1
	applymovement PLAYER, EcruteakPokecenter1FPlayerMovement1
	turnobject ECRUTEAKPOKECENTER1F_NURSE, UP
	pause 10
	turnobject ECRUTEAKPOKECENTER1F_NURSE, DOWN
	pause 30
	turnobject ECRUTEAKPOKECENTER1F_NURSE, UP
	pause 10
	turnobject ECRUTEAKPOKECENTER1F_NURSE, DOWN
	pause 20
	turnobject ECRUTEAKPOKECENTER1F_BILL, DOWN
	pause 10
	opentext
	writetext EcruteakPokecenter1F_BillText1
	promptbutton
	sjump .PointlessJump

.PointlessJump:
	writetext EcruteakPokecenter1F_BillText2
	waitbutton
	closetext
	turnobject PLAYER, DOWN
	applymovement ECRUTEAKPOKECENTER1F_BILL, EcruteakPokecenter1FBillMovement2
	playsound SFX_EXIT_BUILDING
	disappear ECRUTEAKPOKECENTER1F_BILL
	clearevent EVENT_MET_BILL
	setflag ENGINE_TIME_CAPSULE
	setscene SCENE_FINISHED
	waitsfx
	end

EcruteakPokecenter1FNurseScript:
	jumpstd pokecenternurse

EcruteakPokecenter1FPokefanMScript:
	special Mobile_DummyReturnFalse
	iftrue .mobile
	jumptextfaceplayer EcruteakPokecenter1FPokefanMText

.mobile
	jumptextfaceplayer EcruteakPokecenter1FPokefanMTextMobile

EcruteakPokecenter1FCooltrainerFScript:
	jumptextfaceplayer EcruteakPokecenter1FCooltrainerFText

EcruteakPokecenter1FGymGuyScript:
	jumptextfaceplayer EcruteakPokecenter1FGymGuyText

EcruteakPokecenter1FBillMovement1:
	step UP
	step UP
	step UP
	step UP
	step RIGHT
	step RIGHT
	step RIGHT
	turn_head UP
	step_end

EcruteakPokecenter1FBillMovement2:
	step RIGHT
	step DOWN
	step DOWN
	step DOWN
	step DOWN
	step_end

EcruteakPokecenter1FPlayerMovement1:
	step UP
	step UP
	step UP
	step_end

EcruteakPokecenter1F_BillText1:
	text "Hola, soy BILL."
	line "¿Quién eres tú?"
	cont "¿Eh? ¿<PLAYER>?"

	para "¡Has llegado justo"
	line "a tiempo!"
	done

EcruteakPokecenter1F_BillText2:
	text "Ya he terminado de"
	line "ajustar la CÁPSULA"
	cont "DEL TIEMPO."

	para "Sabes que puedes"
	line "cambiar #MON,"
	cont "¿verdad?"

	para "Mi CÁPSULA DEL"
	line "TIEMPO sirve para"

	para "intercambiar"
	line "con el pasado."

	para "Pero no podrás"
	line "enviar nada que no"

	para "existiera en el"
	line "pasado."

	para "Si lo haces, el PC"
	line "del pasado podría"
	cont "estropearse."

	para "Así que debes"
	line "eliminar cualquier"

	para "cosa que no"
	line "existiera antes."

	para "Esto es, no envíes"
	line "nuevos movimientos"

	para "ni nuevos #MON"
	line "en esta CÁPSULA."

	para "No te preocupes."
	line "Ya he acabado"
	cont "de ajustarla."

	para "Mañana funcionarán"
	line "todas las CÁPSULAS"

	para "DEL TIEMPO de los"
	line "CENTROS #MON."

	para "Debo volver pronto"
	line "a CIUDAD TRIGAL."
	cont "Mi familia espera."

	para "¡Hasta luego!"
	done

EcruteakPokecenter1FPokefanMText:
	text "Las CHICAS KIMONO"
	line "son unas geniales"

	para "bailarinas, además"
	line "de magníficas con"
	cont "sus #MON."
	done

EcruteakPokecenter1FPokefanMTextMobile:
	text "Seguro que esperas"
	line "luchar con más"

	para "gente, ¿verdad?"
	line "Parece que hay un"

	para "sitio en el que se"
	line "reúnen los"
	cont "entrenadores."

	para "Te preguntarás"
	line "dónde."

	para "Es pasando CIUDAD"
	line "OLIVO."
	done

EcruteakPokecenter1FCooltrainerFText:
	text "MORTI, el LÍDER"
	line "del GIMNASIO, es"
	cont "muy bueno."

	para "Y sus #MON son"
	line "muy fuertes."
	done

EcruteakPokecenter1FGymGuyText:
	text "LAGO DE LA FURIA."

	para "Un montón de"
	line "GYARADOS…"

	para "¡Esto huele a"
	line "conspiración!"
	done

EcruteakPokecenter1F_MapEvents:
	db 0, 0 ; filler

	db 3 ; warp events
	warp_event  3,  7, ECRUTEAK_CITY, 6
	warp_event  4,  7, ECRUTEAK_CITY, 6
	warp_event  0,  7, POKECENTER_2F, 1

	db 0 ; coord events

	db 0 ; bg events

	db 5 ; object events
	object_event  3,  1, SPRITE_NURSE, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, EcruteakPokecenter1FNurseScript, -1
	object_event  7,  6, SPRITE_POKEFAN_M, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, EcruteakPokecenter1FPokefanMScript, -1
	object_event  1,  4, SPRITE_COOLTRAINER_F, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, EcruteakPokecenter1FCooltrainerFScript, -1
	object_event  7,  1, SPRITE_GYM_GUY, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, EcruteakPokecenter1FGymGuyScript, -1
	object_event  0,  7, SPRITE_BILL, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, ObjectEvent, EVENT_ECRUTEAK_POKE_CENTER_BILL
