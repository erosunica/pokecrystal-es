	object_const_def ; object_event constants
	const CHERRYGROVECITY_GRAMPS
	const CHERRYGROVECITY_SILVER
	const CHERRYGROVECITY_TEACHER
	const CHERRYGROVECITY_YOUNGSTER
	const CHERRYGROVECITY_FISHER

CherrygroveCity_MapScripts:
	db 2 ; scene scripts
	scene_script .DummyScene0 ; SCENE_CHERRYGROVECITY_NOTHING
	scene_script .DummyScene1 ; SCENE_CHERRYGROVECITY_MEET_RIVAL

	db 1 ; callbacks
	callback MAPCALLBACK_NEWMAP, .FlyPoint

.DummyScene0:
	end

.DummyScene1:
	end

.FlyPoint:
	setflag ENGINE_FLYPOINT_CHERRYGROVE
	return

CherrygroveCityGuideGent:
	faceplayer
	opentext
	writetext GuideGentIntroText
	yesorno
	iffalse .No
	sjump .Yes
.Yes:
	writetext GuideGentTourText1
	waitbutton
	closetext
	playmusic MUSIC_SHOW_ME_AROUND
	follow CHERRYGROVECITY_GRAMPS, PLAYER
	applymovement CHERRYGROVECITY_GRAMPS, GuideGentMovement1
	opentext
	writetext GuideGentPokecenterText
	waitbutton
	closetext
	applymovement CHERRYGROVECITY_GRAMPS, GuideGentMovement2
	turnobject PLAYER, UP
	opentext
	writetext GuideGentMartText
	waitbutton
	closetext
	applymovement CHERRYGROVECITY_GRAMPS, GuideGentMovement3
	turnobject PLAYER, UP
	opentext
	writetext GuideGentRoute30Text
	waitbutton
	closetext
	applymovement CHERRYGROVECITY_GRAMPS, GuideGentMovement4
	turnobject PLAYER, LEFT
	opentext
	writetext GuideGentSeaText
	waitbutton
	closetext
	applymovement CHERRYGROVECITY_GRAMPS, GuideGentMovement5
	turnobject PLAYER, UP
	pause 60
	turnobject CHERRYGROVECITY_GRAMPS, LEFT
	turnobject PLAYER, RIGHT
	opentext
	writetext GuideGentGiftText
	promptbutton
	getstring STRING_BUFFER_4, .mapcardname
	scall .JumpstdReceiveItem
	setflag ENGINE_MAP_CARD
	writetext GotMapCardText
	promptbutton
	writetext GuideGentPokegearText
	waitbutton
	closetext
	stopfollow
	special RestartMapMusic
	turnobject PLAYER, UP
	applymovement CHERRYGROVECITY_GRAMPS, GuideGentMovement6
	playsound SFX_ENTER_DOOR
	disappear CHERRYGROVECITY_GRAMPS
	clearevent EVENT_GUIDE_GENT_VISIBLE_IN_CHERRYGROVE
	waitsfx
	end

.JumpstdReceiveItem:
	jumpstd receiveitem
	end

.mapcardname
	db "TARJ. MAPA@"

.No:
	writetext GuideGentNoText
	waitbutton
	closetext
	end

CherrygroveSilverSceneSouth:
	moveobject CHERRYGROVECITY_SILVER, 39, 7
CherrygroveSilverSceneNorth:
	turnobject PLAYER, RIGHT
	showemote EMOTE_SHOCK, PLAYER, 15
	special FadeOutMusic
	pause 15
	appear CHERRYGROVECITY_SILVER
	applymovement CHERRYGROVECITY_SILVER, CherrygroveCity_RivalWalksToYou
	turnobject PLAYER, RIGHT
	playmusic MUSIC_RIVAL_ENCOUNTER
	opentext
	writetext CherrygroveRivalText_Seen
	waitbutton
	closetext
	checkevent EVENT_GOT_TOTODILE_FROM_ELM
	iftrue .Totodile
	checkevent EVENT_GOT_CHIKORITA_FROM_ELM
	iftrue .Chikorita
	winlosstext SilverCherrygroveWinText, SilverCherrygroveLossText
	setlasttalked CHERRYGROVECITY_SILVER
	loadtrainer RIVAL1, RIVAL1_1_TOTODILE
	loadvar VAR_BATTLETYPE, BATTLETYPE_CANLOSE
	startbattle
	dontrestartmapmusic
	reloadmap
	iftrue .AfterVictorious
	sjump .AfterYourDefeat

.Totodile:
	winlosstext SilverCherrygroveWinText, SilverCherrygroveLossText
	setlasttalked CHERRYGROVECITY_SILVER
	loadtrainer RIVAL1, RIVAL1_1_CHIKORITA
	loadvar VAR_BATTLETYPE, BATTLETYPE_CANLOSE
	startbattle
	dontrestartmapmusic
	reloadmap
	iftrue .AfterVictorious
	sjump .AfterYourDefeat

.Chikorita:
	winlosstext SilverCherrygroveWinText, SilverCherrygroveLossText
	setlasttalked CHERRYGROVECITY_SILVER
	loadtrainer RIVAL1, RIVAL1_1_CYNDAQUIL
	loadvar VAR_BATTLETYPE, BATTLETYPE_CANLOSE
	startbattle
	dontrestartmapmusic
	reloadmap
	iftrue .AfterVictorious
	sjump .AfterYourDefeat

.AfterVictorious:
	playmusic MUSIC_RIVAL_AFTER
	opentext
	writetext CherrygroveRivalText_YouWon
	waitbutton
	closetext
	sjump .FinishRival

.AfterYourDefeat:
	playmusic MUSIC_RIVAL_AFTER
	opentext
	writetext CherrygroveRivalText_YouLost
	waitbutton
	closetext
.FinishRival:
	playsound SFX_TACKLE
	applymovement PLAYER, CherrygroveCity_RivalPushesYouOutOfTheWay
	turnobject PLAYER, LEFT
	applymovement CHERRYGROVECITY_SILVER, CherrygroveCity_RivalExitsStageLeft
	disappear CHERRYGROVECITY_SILVER
	setscene SCENE_CHERRYGROVECITY_NOTHING
	special HealParty
	playmapmusic
	end

CherrygroveTeacherScript:
	faceplayer
	opentext
	checkflag ENGINE_MAP_CARD
	iftrue .HaveMapCard
	writetext CherrygroveTeacherText_NoMapCard
	waitbutton
	closetext
	end

.HaveMapCard:
	writetext CherrygroveTeacherText_HaveMapCard
	waitbutton
	closetext
	end

CherrygroveYoungsterScript:
	faceplayer
	opentext
	checkflag ENGINE_POKEDEX
	iftrue .HavePokedex
	writetext CherrygroveYoungsterText_NoPokedex
	waitbutton
	closetext
	end

.HavePokedex:
	writetext CherrygroveYoungsterText_HavePokedex
	waitbutton
	closetext
	end

MysticWaterGuy:
	faceplayer
	opentext
	checkevent EVENT_GOT_MYSTIC_WATER_IN_CHERRYGROVE
	iftrue .After
	writetext MysticWaterGuyTextBefore
	promptbutton
	verbosegiveitem MYSTIC_WATER
	iffalse .Exit
	setevent EVENT_GOT_MYSTIC_WATER_IN_CHERRYGROVE
.After:
	writetext MysticWaterGuyTextAfter
	waitbutton
.Exit:
	closetext
	end

CherrygroveCitySign:
	jumptext CherrygroveCitySignText

GuideGentsHouseSign:
	jumptext GuideGentsHouseSignText

CherrygroveCityPokecenterSign:
	jumpstd pokecentersign

CherrygroveCityMartSign:
	jumpstd martsign

GuideGentMovement1:
	step LEFT
	step LEFT
	step UP
	step LEFT
	turn_head UP
	step_end

GuideGentMovement2:
	step LEFT
	step LEFT
	step LEFT
	step LEFT
	step LEFT
	step LEFT
	turn_head UP
	step_end

GuideGentMovement3:
	step LEFT
	step LEFT
	step LEFT
	step LEFT
	step LEFT
	step LEFT
	step LEFT
	turn_head UP
	step_end

GuideGentMovement4:
	step LEFT
	step LEFT
	step LEFT
	step DOWN
	step LEFT
	step LEFT
	step LEFT
	step DOWN
	turn_head LEFT
	step_end

GuideGentMovement5:
	step DOWN
	step DOWN
	step RIGHT
	step RIGHT
	step RIGHT
	step RIGHT
	step RIGHT
	step RIGHT
	step RIGHT
	step RIGHT
	step RIGHT
	step RIGHT
	step DOWN
	step DOWN
	step RIGHT
	step RIGHT
	step RIGHT
	step RIGHT
	step RIGHT
	turn_head UP
	step_end

GuideGentMovement6:
	step UP
	step UP
	step_end

CherrygroveCity_RivalWalksToYou:
	step LEFT
	step LEFT
	step LEFT
	step LEFT
	step LEFT
	step_end

CherrygroveCity_RivalPushesYouOutOfTheWay:
	big_step DOWN
	turn_head UP
	step_end

CherrygroveCity_UnusedMovementData:
	step LEFT
	turn_head DOWN
	step_end

CherrygroveCity_RivalExitsStageLeft:
	big_step LEFT
	big_step LEFT
	big_step LEFT
	big_step LEFT
	big_step UP
	big_step UP
	big_step LEFT
	big_step LEFT
	step_end

GuideGentIntroText:
	text "Empezaste hace"
	line "poco, ¿verdad?"
	cont "¡Estoy seguro!"

	para "¡Está bien! ¡Todo"
	line "el mundo es novato"
	cont "alguna vez!"

	para "Si quieres, te"
	line "puedo enseñar"
	cont "algunas cosas."
	done

GuideGentTourText1:
	text "¡De acuerdo!"
	line "¡Sígueme!"
	done

GuideGentPokecenterText:
	text "Esto es un CENTRO"
	line "#MON."

	para "Aquí curan a"
	line "tus #MON."

	para "Vas a necesitar"
	line "mucho de ellos,"

	para "así que es mejor"
	line "conocerlos bien."
	done

GuideGentMartText:
	text "Esto es una TIENDA"
	line "#MON."

	para "Hay # BALL para"
	line "capturar #MON"

	para "salvajes y otras"
	line "muchas cosas."
	done

GuideGentRoute30Text:
	text "La RUTA 30 está"
	line "por aquí."

	para "En ella luchan"
	line "los entrenadores"

	para "con sus queridos"
	line "#MON."
	done

GuideGentSeaText:
	text "Como puedes ver,"
	line "esto es el mar."

	para "Algunos #MON"
	line "sólo viven en el"
	cont "agua."
	done

GuideGentGiftText:
	text "Llegamos…"

	para "¡Ésta es mi casa!"
	line "Gracias por"
	cont "tu compañía."

	para "Déjame que te dé"
	line "un pequeño regalo."
	done

GotMapCardText:
	text "¡Ahora el #GEAR"
	line "de <PLAYER> tiene"
	cont "un MAPA!"
	done

GuideGentPokegearText:
	text "El #GEAR será"
	line "más útil cuando"
	cont "añadas TARJETAS."

	para "¡Mucha suerte"
	line "en tu aventura!"
	done

GuideGentNoText:
	text "Oh… Disfruto"
	line "haciéndolo…"

	para "Bueno. Vuelve a"
	line "verme cuando"
	cont "quieras."
	done

CherrygroveRivalText_Seen:
	text "<……> <……> <……>"

	para "Tienes un #MON"
	line "en el LABORATORIO."

	para "Qué desperdicio."
	line "Alguien como tú."

	para "<……> <……> <……>"

	para "¿No escuchas lo"
	line "que te digo?"

	para "Bueno, yo también"
	line "tengo un buen"

	para "#MON."
	line "¡Te enseñaré de lo"
	cont "que hablo!"
	done

SilverCherrygroveWinText:
	text "Grrr. ¿Feliz de"
	line "haber ganado?"
	done

CherrygroveRivalText_YouLost:
	text "<……> <……> <……>"

	para "Me llamo ¿¿??."

	para "Voy a ser el mejor"
	line "entrenador de"

	para "#MON del"
	line "mundo."
	done

SilverCherrygroveLossText:
	text "Grrr. Menuda"
	line "pérdida de tiempo."
	done

CherrygroveRivalText_YouWon:
	text "<……> <……> <……>"

	para "Me llamo ¿¿??."

	para "Voy a ser el mayor"
	line "entrenador de"

	para "#MON del"
	line "mundo."
	done

CherrygroveTeacherText_NoMapCard:
	text "¿Has hablado con"
	line "el anciano que"

	para "está cerca del"
	line "CENTRO #MON?"

	para "Te dará un MAPA de"
	line "JOHTO para tu"
	cont "#GEAR."
	done

CherrygroveTeacherText_HaveMapCard:
	text "Cuando vas con los"
	line "#MON, cualquier"
	cont "sitio está bien."
	done

CherrygroveYoungsterText_NoPokedex:
	text "La casa del SR."
	line "#MON está más"
	cont "adelante."
	done

CherrygroveYoungsterText_HavePokedex:
	text "He luchado contra"
	line "los entrenadores"
	cont "del camino."

	para "Mis #MON han"
	line "perdido. ¡Están"

	para "fatal! Los llevaré"
	line "al CENTRO #MON."
	done

MysticWaterGuyTextBefore:
	text "Atrapé un #MON"
	line "que llevaba un"
	cont "objeto."

	para "Creo que es"
	line "AGUA MÍSTICA."

	para "No lo necesito,"
	line "¿lo quieres?"
	done

MysticWaterGuyTextAfter:
	text "Pues yo me voy a"
	line "pescar."
	done

CherrygroveCitySignText:
	text "CIUDAD CEREZO"

	para "La ciudad de las"
	line "flores bonitas y"
	cont "fragantes"
	done

GuideGentsHouseSignText:
	text "CASA DEL GUÍA"
	done

CherrygroveCity_MapEvents:
	db 0, 0 ; filler

	db 5 ; warp events
	warp_event 23,  3, CHERRYGROVE_MART, 2
	warp_event 29,  3, CHERRYGROVE_POKECENTER_1F, 1
	warp_event 17,  7, CHERRYGROVE_GYM_SPEECH_HOUSE, 1
	warp_event 25,  9, GUIDE_GENTS_HOUSE, 1
	warp_event 31, 11, CHERRYGROVE_EVOLUTION_SPEECH_HOUSE, 1

	db 2 ; coord events
	coord_event 33,  6, SCENE_CHERRYGROVECITY_MEET_RIVAL, CherrygroveSilverSceneNorth
	coord_event 33,  7, SCENE_CHERRYGROVECITY_MEET_RIVAL, CherrygroveSilverSceneSouth

	db 4 ; bg events
	bg_event 30,  8, BGEVENT_READ, CherrygroveCitySign
	bg_event 23,  9, BGEVENT_READ, GuideGentsHouseSign
	bg_event 24,  3, BGEVENT_READ, CherrygroveCityMartSign
	bg_event 30,  3, BGEVENT_READ, CherrygroveCityPokecenterSign

	db 5 ; object events
	object_event 32,  6, SPRITE_GRAMPS, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, CherrygroveCityGuideGent, EVENT_GUIDE_GENT_IN_HIS_HOUSE
	object_event 39,  6, SPRITE_SILVER, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, ObjectEvent, EVENT_RIVAL_CHERRYGROVE_CITY
	object_event 27, 12, SPRITE_TEACHER, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 1, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, CherrygroveTeacherScript, -1
	object_event 23,  7, SPRITE_YOUNGSTER, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 1, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, CherrygroveYoungsterScript, -1
	object_event  7, 12, SPRITE_FISHER, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, MysticWaterGuy, -1
