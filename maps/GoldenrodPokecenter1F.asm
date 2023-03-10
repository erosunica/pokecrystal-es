	object_const_def ; object_event constants
	const GOLDENRODPOKECENTER1F_NURSE
	const GOLDENRODPOKECENTER1F_LINK_RECEPTIONIST
	const GOLDENRODPOKECENTER1F_GAMEBOY_KID
	const GOLDENRODPOKECENTER1F_LASS
	const GOLDENRODPOKECENTER1F_POKEFAN_F

GoldenrodPokecenter1F_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

GoldenrodPokecenter1FNurseScript:
	jumpstd pokecenternurse

GoldenrodPokecenter1F_GSBallSceneLeft:
	setval BATTLETOWERACTION_CHECKMOBILEEVENT
	special BattleTowerAction
	ifequal MOBILE_EVENT_OBJECT_GS_BALL, .gsball
	end

.gsball
	checkevent EVENT_GOT_GS_BALL_FROM_POKECOM_CENTER
	iftrue .cancel
	playsound SFX_EXIT_BUILDING
	moveobject GOLDENRODPOKECENTER1F_LINK_RECEPTIONIST, 0, 7
	disappear GOLDENRODPOKECENTER1F_LINK_RECEPTIONIST
	appear GOLDENRODPOKECENTER1F_LINK_RECEPTIONIST
	playmusic MUSIC_SHOW_ME_AROUND
	applymovement GOLDENRODPOKECENTER1F_LINK_RECEPTIONIST, GoldenrodPokeCenter1FLinkReceptionistApproachPlayerAtLeftDoorwayTileMovement
	turnobject PLAYER, UP
	opentext
	writetext GoldenrodPokeCenter1FLinkReceptionistPleaseAcceptGSBallText
	waitbutton
	verbosegiveitem GS_BALL
	setevent EVENT_GOT_GS_BALL_FROM_POKECOM_CENTER
	setevent EVENT_CAN_GIVE_GS_BALL_TO_KURT
	writetext GoldenrodPokeCenter1FLinkReceptionistPleaseDoComeAgainText
	waitbutton
	closetext
	applymovement GOLDENRODPOKECENTER1F_LINK_RECEPTIONIST, GoldenrodPokeCenter1FLinkReceptionistWalkToStairsFromLeftDoorwayTileMovement
	special RestartMapMusic
	disappear GOLDENRODPOKECENTER1F_LINK_RECEPTIONIST
	playsound SFX_EXIT_BUILDING
.cancel
	end

GoldenrodPokecenter1F_GSBallSceneRight:
	setval BATTLETOWERACTION_CHECKMOBILEEVENT
	special BattleTowerAction
	ifequal MOBILE_EVENT_OBJECT_GS_BALL, .gsball
	end

.gsball
	checkevent EVENT_GOT_GS_BALL_FROM_POKECOM_CENTER
	iftrue .cancel
	playsound SFX_EXIT_BUILDING
	moveobject GOLDENRODPOKECENTER1F_LINK_RECEPTIONIST, 0, 7
	disappear GOLDENRODPOKECENTER1F_LINK_RECEPTIONIST
	appear GOLDENRODPOKECENTER1F_LINK_RECEPTIONIST
	playmusic MUSIC_SHOW_ME_AROUND
	applymovement GOLDENRODPOKECENTER1F_LINK_RECEPTIONIST, GoldenrodPokeCenter1FLinkReceptionistApproachPlayerAtRightDoorwayTileMovement
	turnobject PLAYER, UP
	opentext
	writetext GoldenrodPokeCenter1FLinkReceptionistPleaseAcceptGSBallText
	waitbutton
	verbosegiveitem GS_BALL
	setevent EVENT_GOT_GS_BALL_FROM_POKECOM_CENTER
	setevent EVENT_CAN_GIVE_GS_BALL_TO_KURT
	writetext GoldenrodPokeCenter1FLinkReceptionistPleaseDoComeAgainText
	waitbutton
	closetext
	applymovement GOLDENRODPOKECENTER1F_LINK_RECEPTIONIST, GoldenrodPokeCenter1FLinkReceptionistWalkToStairsFromRightDoorwayTileMovement
	special RestartMapMusic
	disappear GOLDENRODPOKECENTER1F_LINK_RECEPTIONIST
	playsound SFX_EXIT_BUILDING
.cancel
	end

GoldenrodPokecenter1FGameboyKidScript:
	jumptextfaceplayer GoldenrodPokecenter1FGameboyKidText

GoldenrodPokecenter1FLassScript:
	jumptextfaceplayer GoldenrodPokecenter1FLassText

GoldenrodPokecenter1FPokefanF:
	faceplayer
	opentext
	writetext GoldenrodPokecenter1FPokefanFDoYouHaveEonMailText
	waitbutton
	writetext GoldenrodPokecenter1FAskGiveAwayAnEonMailText
	yesorno
	iffalse .NoEonMail
	takeitem EON_MAIL
	iffalse .NoEonMail
	writetext GoldenrodPokecenter1FPlayerGaveAwayTheEonMailText
	waitbutton
	writetext GoldenrodPokecenter1FPokefanFThisIsForYouText
	waitbutton
	verbosegiveitem REVIVE
	iffalse .NoRoom
	writetext GoldenrodPokecenter1FPokefanFDaughterWillBeDelightedText
	waitbutton
	closetext
	end

.NoEonMail:
	writetext GoldenrodPokecenter1FPokefanFTooBadText
	waitbutton
	closetext
	end

.NoRoom:
	giveitem EON_MAIL
	writetext GoldenrodPokecenter1FPokefanFAnotherTimeThenText
	waitbutton
	closetext
	end

GoldenrodPokeCenter1FLinkReceptionistApproachPlayerAtLeftDoorwayTileMovement:
	step UP
	step RIGHT
	step RIGHT
	step RIGHT
	turn_head DOWN
	step_end

GoldenrodPokeCenter1FLinkReceptionistWalkToStairsFromLeftDoorwayTileMovement:
	step LEFT
	step LEFT
	step LEFT
	step DOWN
	step_end

GoldenrodPokeCenter1FLinkReceptionistApproachPlayerAtRightDoorwayTileMovement:
	step UP
	step RIGHT
	step RIGHT
	step RIGHT
	step RIGHT
	turn_head DOWN
	step_end

GoldenrodPokeCenter1FLinkReceptionistWalkToStairsFromRightDoorwayTileMovement:
	step LEFT
	step LEFT
	step LEFT
	step LEFT
	step DOWN
	step_end

; unused
UnknownText_0x61072:
	text "??Hola! ??ste es el"
	line "CENTRO DE CAMBIO"

	para "del CENTRO"
	line "#COM."

	para "Puedes cambiar"
	line "#MON con gente"
	cont "que est?? lejos."
	done

UnknownText_0x610ce:
	text "Para hacer un"
	line "intercambio,"

	para "necesitamos tu"
	line "#MON."

	para "??Quieres inter-"
	line "cambiar alguno?"
	done

UnknownText_0x61111:
	text "??Qu?? tipo de"
	line "#MON quieres"
	cont "a cambio?"
	done

UnknownText_0x6113b:
	text "Bien. Intentaremos"
	line "intercambiar un"

	para "@"
	text_ram wStringBuffer3
	text " por un"
	line "@"
	text_ram wStringBuffer4
	text "."

	para "Necesitamos tu"
	line "#MON durante"
	cont "el intercambio."

	para "Por favor, espera"
	line "mientras se"
	cont "prepara la sala."
	done

UnknownText_0x611c9:
	text "Bien. Intentaremos"
	line "intercambiar un"

	para "@"
	text_ram wStringBuffer3
	text " por un"
	line "#MON que no"
	cont "hayas visto nunca."

	para "Necesitamos tu"
	line "#MON durante"
	cont "el intercambio."

	para "Por favor, espera"
	line "mientras se"
	cont "prepara la sala."
	done

UnknownText_0x61271:
	text "Recibido tu"
	line "#MON de"
	cont "intercambio."

	para "Llevar?? tiempo"
	line "encontrar un"

	para "compa??ero de"
	line "intercambio."

	para "Vuelve luego."
	done

UnknownText_0x612d8:
	text "??Eh? S??lo tienes"
	line "un #MON en tu"
	cont "equipo."

	para "Vuelve cuando"
	line "hayas aumentado el"

	para "n??mero de miembros"
	line "de tu equipo."
	done

UnknownText_0x61344:
	text "Esperamos verte"
	line "pronto."
	done

UnknownText_0x6135f:
	text "Error de"
	line "comunicaci??n???"
	done

UnknownText_0x61375:
	text "Si aceptamos ese"
	line "#MON, ??con cu??l"
	cont "luchar??s?"
	done

UnknownText_0x613a9:
	text "Lo siento. No"
	line "aceptamos HUEVOS."
	done

UnknownText_0x613c8:
	text "Lo siento, pero tu"
	line "#MON no parece"

	para "muy normal. No"
	line "podemos aceptarlo."
	done

UnknownText_0x61409:
	text "??Eh? ??No tenemos"
	line "ya un #MON"
	cont "tuyo?"
	done

UnknownText_0x61438:
	text "Veremos las salas."

	para "Espera, por favor."
	done

UnknownText_0x6145c:
	text "Disculpa la"
	line "espera."

	para "Se ha encontrado"
	line "un compa??ero."
	done

UnknownText_0x6149a:
	text "Es tu nuevo"
	line "compa??ero."

	para "Por favor, tr??talo"
	line "con cari??o."

	para "Esperamos volver a"
	line "verte."
	done

UnknownText_0x614ed:
	text "Oh, oh. Tu equipo"
	line "est?? al completo."

	para "Por favor, vuelve"
	line "cuando haya sitio"
	cont "en tu equipo."
	done

UnknownText_0x61544:
	text "Es una pena, pero"
	line "nadie se ha"

	para "presentado para"
	line "ser tu compa??ero."

	para "??Quieres recuperar"
	line "tu #MON?"
	done

UnknownText_0x615a5:
	text "Te hemos devuelto"
	line "tu #MON."
	done

UnknownText_0x615c2:
	text "Es una pena, pero"
	line "nadie se ha"

	para "presentado para"
	line "ser tu compa??ero."

	para "Tenemos tu #MON"
	line "desde hace mucho."

	para "Por ello, se"
	line "siente solo."

	para "Lo siento, pero"
	line "debemos"
	cont "devolv??rtelo."
	done

UnknownText_0x6166e:
	text "Esperamos verte"
	line "pronto."
	done

UnknownText_0x61689:
	text "Bien. Seguiremos"
	line "teniendo tu"

	para "#MON con"
	line "nosotros."
	done

UnknownText_0x616b4:
	text "??Eh? Dejaste tu"
	line "#MON con"

	para "nosotros hace muy"
	line "poco."

	para "Por favor, vuelve"
	line "m??s tarde."
	done

UnknownText_0x616fb:
	text "Vamos a GUARDAR"
	line "antes de conectar"
	cont "con el CENTRO."
	done

UnknownText_0x61727:
	text "??Qu?? #MON"
	line "quieres cambiar?"
	done

UnknownText_0x61749:
	text "Lo siento, pero"
	line "debemos cancelar"
	cont "el intercambio."
	done

UnknownText_0x6176f:
	text "??Oh!"

	para "??Veo que tienes un"
	line "TICKET HUEVO!"

	para "??Es un cup??n para"
	line "gente especial que"

	para "puede cambiarse"
	line "por un #MON"
	cont "especial!"
	done

UnknownText_0x617d2:
	text "D??jame darte una"
	line "peque??a"
	cont "explicaci??n."

	para "Los cambios hechos"
	line "en el CENTRO DE"

	para "CAMBIO se hacen"
	line "entre dos entrena-"
	cont "dores que no se"
	line "conocen."

	para "Por eso, puede que"
	line "lleve tiempo."

	para "De todas formas,"
	line "tienes un HUEVO"
	cont "RARO."

	para "Enseguida lo"
	line "recibir??s."

	para "Por favor, elige"
	line "una de las salas"

	para "del CENTRO para"
	line "que podamos"

	para "enviarte el"
	line "HUEVO RARO."
	done

UnknownText_0x6191f:
	text "Por favor, espera"
	line "un momento."
	done

UnknownText_0x61936:
	text "Gracias por"
	line "esperar."

	para "Hemos recibido tu"
	line "HUEVO RARO."

	para "??Aqu?? lo tienes!"

	para "Por favor, cu??dalo"
	line "con cari??o."
	done

UnknownText_0x61996:
	text "Lo siento mucho."

	para "El servicio de"
	line "intercambio TICKET"

	para "HUEVO no funciona"
	line "ahora."
	done

UnknownText_0x619db:
	text "Es una M??QUINA de"
	line "NOTICIAS #MON."
	done

UnknownText_0x619f5:
	text "??Qu?? deseas hacer?"
	done

UnknownText_0x61a11:
	text "Las NOTICIAS"
	line "#MON se"

	para "obtienen de los"
	line "archivos GUARDADOS"

	para "de entrenadores"
	cont "#MON."

	para "Cuando leas las"
	line "NOTICIAS, tu"

	para "archivo GUARDADO"
	line "ser?? enviado."

	para "El archivo de"
	line "datos GUARDADOS"

	para "contiene tu"
	line "progreso y tu"
	cont "perfil de m??vil."

	para "No se enviar?? tu"
	line "n??mero de m??vil."

	para "El contenido de"
	line "las NOTICIAS"

	para "variar?? dependien-"
	line "do de los archivos"

	para "GUARDADOS enviados"
	line "por ti y por otros"

	para "entrenadores"
	line "#MON."

	para "??Es posible que"
	line "salgas en las"
	cont "NOTICIAS!"
	done

UnknownText_0x61b7c:
	text "??Quieres leer las"
	line "NOTICIAS?"
	done

UnknownText_0x61b9d:
	text "Leyendo las"
	line "??ltimas NOTICIAS???"
	cont "Espera, por favor."
	done

UnknownText_0x61bc4:
	text "No hay NOTICIAS"
	line "antiguas???"
	done

UnknownText_0x61bdb:
	text "Los datos de las"
	line "NOTICIAS est??n"
	cont "da??ados."

	para "Por favor, baja"
	line "las NOTICIAS otra"
	cont "vez."
	done

UnknownText_0x61c18:
	text "Estamos en los"
	line "preparativos."

	para "Por favor, vuelve"
	line "m??s tarde."
	done

UnknownText_0x61c4b:
	text "GUARDAREMOS tu"
	line "progreso antes de"

	para "poner en marcha la"
	line "M??QUINA de las"
	cont "NOTICIAS."
	done

UnknownText_0x61c89:
	text "Uau, este CENTRO"
	line "#MON es enorme."

	para "Lo acaban de"
	line "construir. Tambi??n"

	para "han instalado"
	line "muchas m??quinas"
	cont "nuevas."
	done

UnknownText_0x61cef:
	text "??Ide?? algo nuevo"
	line "para el CENTRO DE"
	cont "CAMBIO!"

	para "??Equipo a PIDGEY"
	line "con una CARTA y"

	para "despu??s preparo el"
	line "intercambio con"
	cont "otro #MON!"

	para "??Si todo el mundo"
	line "lo hiciera, la"

	para "CARTA llegar??a a"
	line "todo tipo de"
	cont "gente!"

	para "??Lo llamo CARTA"
	line "PIDGEY!"

	para "??Si se vuelve"
	line "popular, voy a"

	para "hacer un mont??n de"
	line "nuevos amigos!"
	done

UnknownText_0x61dfd:
	text "Se dice que puedes"
	line "cambiar #MON"

	para "hasta con"
	line "desconocidos."

	para "Pero todav??a est??n"
	line "con preparativos."
	done

UnknownText_0x61e5c:
	text "Una chica que no"
	line "conozco me envi??"

	para "su HOPPIP."
	line "Deber??as cambiar"

	para "un #MON por"
	line "otro que quieras."
	done

UnknownText_0x61eb2:
	text "??Recib?? un HOPPIP"
	line "hembra, pero se"
	cont "llama STANLEY!"

	para "??As?? se llama mi"
	line "padre!"
	done

UnknownText_0x61efa:
	text "??Qu?? es la M??QUINA"
	line "de las NOTICIAS?"

	para "??Recoge noticias"
	line "de un ??rea m??s"

	para "amplia que la"
	line "radio?"
	done

UnknownText_0x61f48:
	text "El CENTRO #COM"
	line "se enlazar?? con"

	para "los otros CENTROS"
	line "#MON por"

	para "medio de una red"
	line "inal??mbrica."

	para "Lo que significa"
	line "que podr?? conec-"
	cont "tarme con todo"
	line "tipo de gente."
	done

UnknownText_0x61fc9:
	text "Las m??quinas no"
	line "est??n en uso"
	cont "todav??a."

	para "Aunque mola venir"
	line "a un sitio tan"

	para "chulo antes que"
	line "nadie."
	done

UnknownText_0x6202c:
	text "Mi amigo sali?? en"
	line "las NOTICIAS hace"

	para "poco. ??No me lo"
	line "pod??a creer!"
	done

UnknownText_0x6206d:
	text "??No puedo dejar de"
	line "leer las ??ltimas"
	cont "NOTICIAS!"
	done

UnknownText_0x620a1:
	text "Si aparezco en las"
	line "NOTICIAS y me hago"

	para "famoso, supongo"
	line "que me adorar??n."

	para "Estoy tramando"
	line "c??mo podr??a salir"
	cont "en las NOTICIAS???"
	done

GoldenrodPokecenter1FGameboyKidText:
	text "En el COLISEO de"
	line "arriba se lucha"
	cont "enlazado."

	para "Los r??cords se"
	line "apuntan en la"

	para "pared, as?? que no"
	line "puedo perder."
	done

UnknownText_0x62173:
	text "Vine por aqu??"
	line "cuando me enter??"

	para "de que el CENTRO"
	line "#MON de TRIGAL"

	para "ten??a m??quinas"
	line "nuevas que nadie"
	cont "hab??a visto antes."

	para "Pero parece que"
	line "siguen ocupados"

	para "con todos los"
	line "preparativos???"
	done

UnknownText_0x62222:
	text "??S??lo de ver todas"
	line "estas cosas nuevas"

	para "me siento mucho"
	line "m??s joven!"
	done

GoldenrodPokecenter1FLassText:
	text "Un #MON de"
	line "nivel superior no"
	cont "siempre gana."

	para "Aun as??, su tipo"
	line "puede tener alguna"
	cont "desventaja."

	para "No creo que haya"
	line "un ??nico #MON"

	para "que sea el m??s"
	line "fuerte."
	done

GoldenrodPokeCenter1FLinkReceptionistPleaseAcceptGSBallText:
	text "<PLAYER>, ??no?"

	para "??Felicidades!"

	para "??Estamos de"
	line "promoci??n, hemos"

	para "recibido una GS"
	line "BALL para ti!"

	para "??Por favor,"
	line "ac??ptala!"
	done

GoldenrodPokeCenter1FLinkReceptionistPleaseDoComeAgainText:
	text "??Vuelve cuando"
	line "quieras!"
	done

UnknownText_0x62370:
	text "CENTRO #COM"
	line "PB INFORMACI??N"

	para "Izquierda:"
	line "ADMINISTRACI??N"

	para "Centro:"
	line "CENTRO DE CAMBIO"

	para "Derecha:"
	line "NOTICIAS #MON"
	done

UnknownText_0x623c7:
	text "??Es una M??QUINA de"
	line "NOTICIAS #MON!"

	para "No est?? operativa"
	line "todav??a???"
	done

GoldenrodPokecenter1FPokefanFDoYouHaveEonMailText:
	text "??Llevas mucho peso"
	line "en la mochila!"

	para "??Oye! ??No tendr??s"
	line "algo llamado"
	cont "CARTA E??N?"

	para "Mi hija est??"
	line "buscando una."

	para "Puedes darme una,"
	line "??verdad?"
	done

GoldenrodPokecenter1FAskGiveAwayAnEonMailText:
	text "??Entregas una"
	line "CARTA E??N?"
	done

GoldenrodPokecenter1FPokefanFThisIsForYouText:
	text "??Oh, genial!"
	line "??Gracias, cari??o!"

	para "??Toma esto en"
	line "agradecimiento!"
	done

GoldenrodPokecenter1FPokefanFDaughterWillBeDelightedText:
	text "??A mi hija le"
	line "encantar??!"
	done

GoldenrodPokecenter1FPokefanFTooBadText:
	text "??Oh? ??No tienes?"
	line "Qu?? l??stima???"
	done

GoldenrodPokecenter1FPokefanFAnotherTimeThenText:
	text "Oh??? Bueno, en otra"
	line "ocasi??n ser??."
	done

GoldenrodPokecenter1FPlayerGaveAwayTheEonMailText:
	text "<PLAYER> entrega"
	line "la CARTA E??N."
	done

GoldenrodPokecenter1F_MapEvents:
	db 0, 0 ; filler

	db 4 ; warp events
	warp_event  3,  7, GOLDENROD_CITY, 15
	warp_event  4,  7, GOLDENROD_CITY, 15
	warp_event  0,  6, POKECOM_CENTER_ADMIN_OFFICE_MOBILE, 1
	warp_event  0,  7, POKECENTER_2F, 1

	db 2 ; coord events
	coord_event  3,  7, SCENE_DEFAULT, GoldenrodPokecenter1F_GSBallSceneLeft
	coord_event  4,  7, SCENE_DEFAULT, GoldenrodPokecenter1F_GSBallSceneRight

	db 0 ; bg events

	db 5 ; object events
	object_event  3,  1, SPRITE_NURSE, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, GoldenrodPokecenter1FNurseScript, -1
	object_event 16,  8, SPRITE_LINK_RECEPTIONIST, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, ObjectEvent, -1
	object_event  6,  1, SPRITE_GAMEBOY_KID, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, GoldenrodPokecenter1FGameboyKidScript, -1
	object_event  1,  4, SPRITE_LASS, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 1, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, GoldenrodPokecenter1FLassScript, -1
	object_event  7,  5, SPRITE_POKEFAN_F, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, GoldenrodPokecenter1FPokefanF, -1
