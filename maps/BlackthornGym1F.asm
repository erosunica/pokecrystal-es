	object_const_def ; object_event constants
	const BLACKTHORNGYM1F_CLAIR
	const BLACKTHORNGYM1F_COOLTRAINER_M1
	const BLACKTHORNGYM1F_COOLTRAINER_M2
	const BLACKTHORNGYM1F_COOLTRAINER_F
	const BLACKTHORNGYM1F_GYM_GUY

BlackthornGym1F_MapScripts:
	db 0 ; scene scripts

	db 1 ; callbacks
	callback MAPCALLBACK_TILES, .Boulders

.Boulders:
	checkevent EVENT_BOULDER_IN_BLACKTHORN_GYM_1
	iffalse .skip1
	changeblock 8, 2, $3b ; fallen boulder 2
.skip1
	checkevent EVENT_BOULDER_IN_BLACKTHORN_GYM_2
	iffalse .skip2
	changeblock 2, 4, $3a ; fallen boulder 1
.skip2
	checkevent EVENT_BOULDER_IN_BLACKTHORN_GYM_3
	iffalse .skip3
	changeblock 8, 6, $3b ; fallen boulder 2
.skip3
	return

BlackthornGymClairScript:
	faceplayer
	opentext
	checkflag ENGINE_RISINGBADGE
	iftrue .AlreadyGotBadge
	checkevent EVENT_BEAT_CLAIR
	iftrue .FightDone
	writetext ClairIntroText
	waitbutton
	closetext
	winlosstext ClairWinText, 0
	loadtrainer CLAIR, CLAIR1
	startbattle
	reloadmapafterbattle
	setevent EVENT_BEAT_CLAIR
	opentext
	writetext ClairText_GoToDragonsDen
	waitbutton
	closetext
	setevent EVENT_BEAT_COOLTRAINERM_PAUL
	setevent EVENT_BEAT_COOLTRAINERM_CODY
	setevent EVENT_BEAT_COOLTRAINERM_MIKE
	setevent EVENT_BEAT_COOLTRAINERF_FRAN
	setevent EVENT_BEAT_COOLTRAINERF_LOLA
	clearevent EVENT_MAHOGANY_MART_OWNERS
	setevent EVENT_BLACKTHORN_CITY_GRAMPS_BLOCKS_DRAGONS_DEN
	clearevent EVENT_BLACKTHORN_CITY_GRAMPS_NOT_BLOCKING_DRAGONS_DEN
	end

.FightDone:
	writetext ClairText_TooMuchToExpect
	waitbutton
	closetext
	end

.AlreadyGotBadge:
	checkevent EVENT_GOT_TM24_DRAGONBREATH
	iftrue .GotTM24
	writetext BlackthornGymClairText_YouKeptMeWaiting
	promptbutton
	giveitem TM_DRAGONBREATH
	iffalse .BagFull
	getitemname STRING_BUFFER_3, TM_DRAGONBREATH
	writetext BlackthornGymText_ReceivedTM24
	playsound SFX_ITEM
	waitsfx
	itemnotify
	setevent EVENT_GOT_TM24_DRAGONBREATH
	writetext BlackthornGymClairText_DescribeTM24
	promptbutton
	sjump .GotTM24

.BagFull:
	writetext BlackthornGymClairText_BagFull
	waitbutton
	closetext
	end

.GotTM24:
	writetext BlackthornGymClairText_League
	waitbutton
	closetext
	end

TrainerCooltrainermPaul:
	trainer COOLTRAINERM, PAUL, EVENT_BEAT_COOLTRAINERM_PAUL, CooltrainermPaulSeenText, CooltrainermPaulBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext CooltrainermPaulAfterBattleText
	waitbutton
	closetext
	end

TrainerCooltrainermMike:
	trainer COOLTRAINERM, MIKE, EVENT_BEAT_COOLTRAINERM_MIKE, CooltrainermMikeSeenText, CooltrainermMikeBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext CooltrainermMikeAfterBattleText
	waitbutton
	closetext
	end

TrainerCooltrainerfLola:
	trainer COOLTRAINERF, LOLA, EVENT_BEAT_COOLTRAINERF_LOLA, CooltrainerfLolaSeenText, CooltrainerfLolaBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext CooltrainerfLolaAfterBattleText
	waitbutton
	closetext
	end

BlackthornGymGuyScript:
	faceplayer
	opentext
	checkevent EVENT_BEAT_CLAIR
	iftrue .BlackthornGymGuyWinScript
	writetext BlackthornGymGuyText
	waitbutton
	closetext
	end

.BlackthornGymGuyWinScript:
	writetext BlackthornGymGuyWinText
	waitbutton
	closetext
	end

BlackthornGymStatue:
	checkflag ENGINE_RISINGBADGE
	iftrue .Beaten
	jumpstd gymstatue1
.Beaten:
	gettrainername STRING_BUFFER_4, CLAIR, CLAIR1
	jumpstd gymstatue2

ClairIntroText:
	text "Soy DÉBORA."

	para "Soy la mejor"
	line "maestra dragón del"
	cont "mundo."

	para "Puedo enfrentarme"
	line "incluso al ALTO"

	para "MANDO de la LIGA"
	line "#MON."

	para "¿Todavía quieres"
	line "enfrentarte a mí?"

	para "Bien…"
	line "¡Adelante!"

	para "¡Como LÍDER de"
	line "GIMNASIO, usaré"

	para "toda mi fuerza"
	line "contra mi"
	cont "oponente!"
	done

ClairWinText:
	text "¿He perdido?"

	para "No puedo creerlo."
	line "Ha debido de haber"
	cont "algún error…"
	done

ClairText_GoToDragonsDen:
	text "Me niego a"
	line "aceptarlo."

	para "He podido perder,"
	line "pero todavía no"

	para "podrás con la LIGA"
	line "#MON."

	para "Ya sé. Deberías"
	line "enfrentarte al"
	cont "desafío dragón."

	para "Tras este GIMNASIO"
	line "existe un lugar"

	para "llamado GUARIDA"
	line "DRAGÓN."

	para "Hay un pequeño"
	line "santuario en su"

	para "centro."
	line "Ve allí."

	para "¡Si pruebas tu"
	line "valía, reconoceré"

	para "que te mereces la"
	line "MEDALLA del"
	cont "GIMNASIO!"
	done

ClairText_TooMuchToExpect:
	text "¿Qué pasa?"

	para "¿Es demasiado"
	line "para ti?"
	done

BlackthornGymClairText_YouKeptMeWaiting:
	text "¡Me has hecho"
	line "esperar!"

	para "¡Ven! ¡Coge esto!"
	done

BlackthornGymText_ReceivedTM24:
	text "<PLAYER>"
	line "recibió MT24."
	done

BlackthornGymClairText_DescribeTM24:
	text "Esta MT contiene"
	line "DRAGOALIENTO."

	para "No, no tiene nada"
	line "que ver con mi"
	cont "aliento."

	para "Si no la quieres,"
	line "no es necesario"
	cont "que la aceptes."
	done

BlackthornGymClairText_BagFull:
	text "¿Qué pasa? ¿No te"
	line "queda espacio?"
	done

BlackthornGymClairText_League:
	text "¿Qué pasa?"

	para "¿No vas a la LIGA"
	line "#MON?"

	para "¿Sabes cómo ir"
	line "hasta allí?"

	para "Desde aquí, ve a"
	line "PUEBLO PRIMAVERA."

	para "Ve hacia el Este,"
	line "con SURF, a la"
	cont "LIGA #MON."

	para "La ruta es muy"
	line "dura."

	para "¡No te atrevas a"
	line "perder en la LIGA"
	cont "#MON!"

	para "¡Si lo haces, me"
	line "sentará muy mal"

	para "haber perdido"
	line "contigo!"

	para "Haz todo lo que"
	line "puedas."
	done

CooltrainermPaulSeenText:
	text "¿Tu primer combate"
	line "contra dragones?"

	para "¡Te mostraré lo"
	line "fuertes que son!"
	done

CooltrainermPaulBeatenText:
	text "¿Han perdido mis"
	line "#MON dragón?"
	done

CooltrainermPaulAfterBattleText:
	text "¿LANCE te dijo que"
	line "quería verte de"

	para "nuevo?"
	line "¡Ni por asomo!"
	done

CooltrainermMikeSeenText:
	text "¿Mis posibilidades"
	line "de perder? ¡Ni el"
	cont "uno por ciento!"
	done

CooltrainermMikeBeatenText:
	text "Es extraño."
	done

CooltrainermMikeAfterBattleText:
	text "Ahora sé cuál es"
	line "mi punto débil."

	para "¡Gracias por"
	line "enseñármelo!"
	done

CooltrainerfLolaSeenText:
	text "Los dragones son"
	line "#MON sagrados."

	para "Están llenos de"
	line "energía vital."

	para "Si no mantienes"
	line "la seriedad, no"

	para "podrás acabar con"
	line "ellos."
	done

CooltrainerfLolaBeatenText:
	text "¡Adelante!"
	done

CooltrainerfLolaAfterBattleText:
	text "Los dragones son"
	line "débiles contra los"

	para "movimientos del"
	line "tipo dragón."
	done

BlackthornGymGuyText:
	text "¡Hola!"

	para "¡Ha sido un largo"
	line "viaje, pero casi"
	cont "hemos llegado!"

	para "¡Confía en mí!"
	line "DÉBORA usa los"

	para "míticos y sagrados"
	line "#MON dragón."

	para "No son fáciles de"
	line "dañar."

	para "Pero se supone que"
	line "son débiles contra"

	para "los ataques del"
	line "tipo hielo."
	done

BlackthornGymGuyWinText:
	text "¡Genial! ¡Has"
	line "vencido a DÉBORA!"

	para "Sólo te queda el"
	line "desafío de la"
	cont "LIGA #MON."

	para "¡Vas a ganar la"
	line "LIGA #MON!"
	done

BlackthornGym1F_MapEvents:
	db 0, 0 ; filler

	db 7 ; warp events
	warp_event  4, 17, BLACKTHORN_CITY, 1
	warp_event  5, 17, BLACKTHORN_CITY, 1
	warp_event  1,  7, BLACKTHORN_GYM_2F, 1
	warp_event  7,  9, BLACKTHORN_GYM_2F, 2
	warp_event  2,  6, BLACKTHORN_GYM_2F, 3
	warp_event  7,  7, BLACKTHORN_GYM_2F, 4
	warp_event  7,  6, BLACKTHORN_GYM_2F, 5

	db 0 ; coord events

	db 2 ; bg events
	bg_event  3, 15, BGEVENT_READ, BlackthornGymStatue
	bg_event  6, 15, BGEVENT_READ, BlackthornGymStatue

	db 5 ; object events
	object_event  5,  3, SPRITE_CLAIR, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, BlackthornGymClairScript, -1
	object_event  6,  6, SPRITE_COOLTRAINER_M, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 3, TrainerCooltrainermMike, -1
	object_event  1, 14, SPRITE_COOLTRAINER_M, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 3, TrainerCooltrainermPaul, -1
	object_event  9,  2, SPRITE_COOLTRAINER_F, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 1, TrainerCooltrainerfLola, -1
	object_event  7, 15, SPRITE_GYM_GUY, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, BlackthornGymGuyScript, -1
