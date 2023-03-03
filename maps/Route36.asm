	object_const_def ; object_event constants
	const ROUTE36_YOUNGSTER1
	const ROUTE36_YOUNGSTER2
	const ROUTE36_WEIRD_TREE
	const ROUTE36_LASS1
	const ROUTE36_FISHER
	const ROUTE36_FRUIT_TREE
	const ROUTE36_ARTHUR
	const ROUTE36_FLORIA
	const ROUTE36_SUICUNE

Route36_MapScripts:
	db 2 ; scene scripts
	scene_script .DummyScene0 ; SCENE_ROUTE36_NOTHING
	scene_script .DummyScene1 ; SCENE_ROUTE36_SUICUNE

	db 1 ; callbacks
	callback MAPCALLBACK_OBJECTS, .ArthurCallback

.DummyScene0:
	end

.DummyScene1:
	end

.ArthurCallback:
	readvar VAR_WEEKDAY
	ifequal THURSDAY, .ArthurAppears
	disappear ROUTE36_ARTHUR
	return

.ArthurAppears:
	appear ROUTE36_ARTHUR
	return

Route36SuicuneScript:
	showemote EMOTE_SHOCK, PLAYER, 15
	pause 15
	playsound SFX_WARP_FROM
	turnobject PLAYER, UP
	applymovement ROUTE36_SUICUNE, Route36SuicuneMovement
	disappear ROUTE36_SUICUNE
	turnobject PLAYER, DOWN
	pause 10
	setscene SCENE_ROUTE36_NOTHING
	clearevent EVENT_SAW_SUICUNE_AT_CIANWOOD_CITY
	setmapscene CIANWOOD_CITY, SCENE_CIANWOODCITY_SUICUNE_AND_EUSINE
	end

SudowoodoScript:
	checkitem SQUIRTBOTTLE
	iftrue .Fight

	waitsfx
	playsound SFX_SANDSTORM
	applymovement ROUTE36_WEIRD_TREE, SudowoodoShakeMovement
	end

.Fight:
	opentext
	writetext UseSquirtbottleText
	yesorno
	iffalse DidntUseSquirtbottleScript
	closetext
WateredWeirdTreeScript:: ; export (for when you use Squirtbottle from pack)
	opentext
	writetext UsedSquirtbottleText
	waitbutton
	closetext
	waitsfx
	playsound SFX_SANDSTORM
	applymovement ROUTE36_WEIRD_TREE, SudowoodoShakeMovement
	opentext
	writetext SudowoodoAttackedText
	waitbutton
	closetext
	loadwildmon SUDOWOODO, 20
	startbattle
	setevent EVENT_FOUGHT_SUDOWOODO
	ifequal DRAW, DidntCatchSudowoodo
	disappear ROUTE36_WEIRD_TREE
	variablesprite SPRITE_WEIRD_TREE, SPRITE_TWIN
	reloadmapafterbattle
	end

DidntUseSquirtbottleScript:
	closetext
	end

DidntCatchSudowoodo:
	reloadmapafterbattle
	applymovement ROUTE36_WEIRD_TREE, WeirdTreeMovement_Flee
	disappear ROUTE36_WEIRD_TREE
	variablesprite SPRITE_WEIRD_TREE, SPRITE_TWIN
	special LoadUsedSpritesGFX
	special RefreshSprites
	end

Route36FloriaScript:
	faceplayer
	opentext
	checkevent EVENT_TALKED_TO_FLORIA_AT_FLOWER_SHOP
	iftrue .SecondTimeTalking
	setevent EVENT_MET_FLORIA
	writetext FloriaText1
	waitbutton
	closetext
	clearevent EVENT_FLORIA_AT_FLOWER_SHOP
	readvar VAR_FACING
	ifequal UP, .Up
	applymovement ROUTE36_FLORIA, FloriaMovement1
	disappear ROUTE36_FLORIA
	end

.Up:
	applymovement ROUTE36_FLORIA, FloriaMovement2
	disappear ROUTE36_FLORIA
	end

.SecondTimeTalking:
	writetext FloriaText2
	waitbutton
	closetext
	end

Route36RockSmashGuyScript:
	faceplayer
	opentext
	checkevent EVENT_GOT_TM08_ROCK_SMASH
	iftrue .AlreadyGotRockSmash
	checkevent EVENT_FOUGHT_SUDOWOODO
	iftrue .ClearedSudowoodo
	writetext RockSmashGuyText1
	waitbutton
	closetext
	end

.ClearedSudowoodo:
	writetext RockSmashGuyText2
	promptbutton
	verbosegiveitem TM_ROCK_SMASH
	iffalse .NoRoomForTM
	setevent EVENT_GOT_TM08_ROCK_SMASH
.AlreadyGotRockSmash:
	writetext RockSmashGuyText3
	waitbutton
.NoRoomForTM:
	closetext
	end

Route36LassScript:
	faceplayer
	opentext
	checkevent EVENT_FOUGHT_SUDOWOODO
	iftrue .ClearedSudowoodo
	writetext Route36LassText
	waitbutton
	closetext
	end

.ClearedSudowoodo:
	writetext Route36LassText_ClearedSudowoodo
	waitbutton
	closetext
	end

TrainerSchoolboyAlan1:
	trainer SCHOOLBOY, ALAN1, EVENT_BEAT_SCHOOLBOY_ALAN, SchoolboyAlan1SeenText, SchoolboyAlan1BeatenText, 0, .Script

.Script:
	loadvar VAR_CALLERID, PHONE_SCHOOLBOY_ALAN
	endifjustbattled
	opentext
	checkflag ENGINE_ALAN
	iftrue .ChooseRematch
	checkflag ENGINE_ALAN_HAS_FIRE_STONE
	iftrue .GiveFireStone
	checkcellnum PHONE_SCHOOLBOY_ALAN
	iftrue .NumberAccepted
	checkevent EVENT_ALAN_ASKED_FOR_PHONE_NUMBER
	iftrue .AskAgainForPhoneNumber
	writetext SchoolboyAlanBooksText
	promptbutton
	setevent EVENT_ALAN_ASKED_FOR_PHONE_NUMBER
	scall .AskNumber1
	sjump .ContinueAskForPhoneNumber

.AskAgainForPhoneNumber:
	scall .AskNumber2
.ContinueAskForPhoneNumber:
	askforphonenumber PHONE_SCHOOLBOY_ALAN
	ifequal PHONE_CONTACTS_FULL, .PhoneFull
	ifequal PHONE_CONTACT_REFUSED, .NumberDeclined
	gettrainername STRING_BUFFER_3, SCHOOLBOY, ALAN1
	scall .RegisteredNumber
	sjump .NumberAccepted

.ChooseRematch:
	scall .Rematch
	winlosstext SchoolboyAlan1BeatenText, 0
	readmem wAlanFightCount
	ifequal 4, .Fight4
	ifequal 3, .Fight3
	ifequal 2, .Fight2
	ifequal 1, .Fight1
	ifequal 0, .LoadFight0
.Fight4:
	checkevent EVENT_RESTORED_POWER_TO_KANTO
	iftrue .LoadFight4
.Fight3:
	checkevent EVENT_BEAT_ELITE_FOUR
	iftrue .LoadFight3
.Fight2:
	checkflag ENGINE_FLYPOINT_BLACKTHORN
	iftrue .LoadFight2
.Fight1:
	checkflag ENGINE_FLYPOINT_OLIVINE
	iftrue .LoadFight1
.LoadFight0:
	loadtrainer SCHOOLBOY, ALAN1
	startbattle
	reloadmapafterbattle
	loadmem wAlanFightCount, 1
	clearflag ENGINE_ALAN
	end

.LoadFight1:
	loadtrainer SCHOOLBOY, ALAN2
	startbattle
	reloadmapafterbattle
	loadmem wAlanFightCount, 2
	clearflag ENGINE_ALAN
	end

.LoadFight2:
	loadtrainer SCHOOLBOY, ALAN3
	startbattle
	reloadmapafterbattle
	loadmem wAlanFightCount, 3
	clearflag ENGINE_ALAN
	end

.LoadFight3:
	loadtrainer SCHOOLBOY, ALAN4
	startbattle
	reloadmapafterbattle
	loadmem wAlanFightCount, 4
	clearflag ENGINE_ALAN
	end

.LoadFight4:
	loadtrainer SCHOOLBOY, ALAN5
	startbattle
	reloadmapafterbattle
	clearflag ENGINE_ALAN
	end

.GiveFireStone:
	scall .Gift
	verbosegiveitem FIRE_STONE
	iffalse .BagFull
	clearflag ENGINE_ALAN_HAS_FIRE_STONE
	setevent EVENT_ALAN_GAVE_FIRE_STONE
	sjump .NumberAccepted

.BagFull:
	sjump .PackFull

.AskNumber1:
	jumpstd asknumber1m
	end

.AskNumber2:
	jumpstd asknumber2m
	end

.RegisteredNumber:
	jumpstd registerednumberm
	end

.NumberAccepted:
	jumpstd numberacceptedm
	end

.NumberDeclined:
	jumpstd numberdeclinedm
	end

.PhoneFull:
	jumpstd phonefullm
	end

.Rematch:
	jumpstd rematchm
	end

.Gift:
	jumpstd giftm
	end

.PackFull:
	jumpstd packfullm
	end

TrainerPsychicMark:
	trainer PSYCHIC_T, MARK, EVENT_BEAT_PSYCHIC_MARK, PsychicMarkSeenText, PsychicMarkBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext PsychicMarkAfterBattleText
	waitbutton
	closetext
	end

ArthurScript:
	faceplayer
	opentext
	checkevent EVENT_GOT_HARD_STONE_FROM_ARTHUR
	iftrue .AlreadyGotStone
	readvar VAR_WEEKDAY
	ifnotequal THURSDAY, ArthurNotThursdayScript
	checkevent EVENT_MET_ARTHUR_OF_THURSDAY
	iftrue .MetArthur
	writetext MeetArthurText
	promptbutton
	setevent EVENT_MET_ARTHUR_OF_THURSDAY
.MetArthur:
	writetext ArthurGivesGiftText
	promptbutton
	verbosegiveitem HARD_STONE
	iffalse .BagFull
	setevent EVENT_GOT_HARD_STONE_FROM_ARTHUR
	writetext ArthurGaveGiftText
	waitbutton
	closetext
	end

.AlreadyGotStone:
	writetext ArthurThursdayText
	waitbutton
.BagFull:
	closetext
	end

ArthurNotThursdayScript:
	writetext ArthurNotThursdayText
	waitbutton
	closetext
	end

Route36Sign:
	jumptext Route36SignText

RuinsOfAlphNorthSign:
	jumptext RuinsOfAlphNorthSignText

Route36TrainerTips1:
	jumptext Route36TrainerTips1Text

Route36TrainerTips2:
	jumptext Route36TrainerTips2Text

Route36FruitTree:
	fruittree FRUITTREE_ROUTE_36

SudowoodoShakeMovement:
	tree_shake ; shake
	step_end

WeirdTreeMovement_Flee:
	fast_jump_step UP
	fast_jump_step UP
	step_end

FloriaMovement1:
	step DOWN
	step DOWN
	step DOWN
	step LEFT
	step LEFT
	step LEFT
	step LEFT
	step LEFT
	step LEFT
	step_end

FloriaMovement2:
	step LEFT
	step DOWN
	step DOWN
	step DOWN
	step LEFT
	step LEFT
	step LEFT
	step LEFT
	step LEFT
	step_end

Route36SuicuneMovement:
	set_sliding
	fast_jump_step DOWN
	fast_jump_step DOWN
	fast_jump_step DOWN
	fast_jump_step RIGHT
	fast_jump_step RIGHT
	fast_jump_step RIGHT
	remove_sliding
	step_end

UseSquirtbottleText:
	text "Un árbol extraño."
	line "¿Usas la REGADERA?"
	done

UsedSquirtbottleText:
	text "<PLAYER> usó"
	line "la REGADERA."
	done

SudowoodoAttackedText:
	text "¡Al árbol extraño"
	line "no le gusta la"
	cont "REGADERA!"

	para "¡El árbol extraño"
	line "atacó!"
	done

FloriaText1:
	text "¡Soy FLORA, de"
	line "la FLORISTERÍA!"

	para "¡Escucha!"

	para "¡Cuando le eché"
	line "agua a ese árbol"

	para "extraño, saltó"
	line "hacia atrás!"

	para "Debe de tratarse"
	line "de un #MON."

	para "¡Apuesto a que"
	line "le sacarías del"

	para "disfraz si lo"
	line "mojaras!"

	para "¡Ya sé! ¡Le"
	line "pediré a mi"

	para "hermana su"
	line "REGADERA!"
	done

FloriaText2:
	text "Cuando le hablé a"
	line "mi hermana de ese"

	para "árbol, me dijo que"
	line "era peligroso."

	para "Si venzo a BLANCA,"
	line "quizás me preste"
	cont "su REGADERA…"
	done

RockSmashGuyText1:
	text "¡Cielos!"

	para "Iba a quitar ese"
	line "árbol con un gran"
	cont "derechazo."

	para "Pero no pude."
	line "¡Soy un fracaso!"
	done

RockSmashGuyText2:
	text "¿Quitaste ese"
	line "pobre árbol?"

	para "¡Estoy impresio-"
	line "nado! Toma esto."
	done

UnusedReceivedTM08Text:
	text "<PLAYER> recibió"
	line "MT08."
	done

RockSmashGuyText3:
	text "Se trata del"
	line "GOLPE ROCA."

	para "Puedes destrozar"
	line "rocas con un"

	para "simple golpe bien"
	line "dirigido."

	para "Si encuentras una"
	line "roca en tu camino,"
	cont "¡destrózala!"
	done

UnusedOddTreeText:
	text "Un árbol extraño"
	line "bloquea el camino"
	cont "a CIUDAD TRIGAL."

	para "Quería ver el gran"
	line "CENTRO #MON que"
	cont "acaban de abrir…"
	done

Route36LassText:
	text "Un extraño árbol"
	line "bloquea el camino"
	cont "a CIUDAD TRIGAL."

	para "No me deja ir de"
	line "compras."

	para "Alguien debería"
	line "hacer algo al"
	cont "respecto."
	done

Route36LassText_ClearedSudowoodo:
	text "Ese árbol extraño"
	line "desapareció sin"
	cont "dejar rastro."

	para "¡Oh! ¿Ese árbol"
	line "era un #MON?"
	done

PsychicMarkSeenText:
	text "¡Te voy a leer"
	line "el pensamiento!"
	done

PsychicMarkBeatenText:
	text "¡Te malinterpreté!"
	done

PsychicMarkAfterBattleText:
	text "Sería fuerte si"
	line "pudiera saber lo"

	para "que está pensando"
	line "mi rival."
	done

SchoolboyAlan1SeenText:
	text "¡Gracias a mis"
	line "estudios, estoy"

	para "preparado para"
	line "cualquier #MON!"
	done

SchoolboyAlan1BeatenText:
	text "¡Ups! ¿Error de"
	line "cálculo?"
	done

SchoolboyAlanBooksText:
	text "Yo también estudio"
	line "5 horas al día."

	para "Leyendo libros"
	line "puedes aprender"
	cont "muchas cosas."
	done

MeetArthurText:
	text "JOSUÉ: ¿Quién"
	line "eres tú?"

	para "Soy JOSUÉ, por"
	line "jueves."
	done

ArthurGivesGiftText:
	text "Toma. Coge esto."
	done

ArthurGaveGiftText:
	text "JOSUÉ: Debería"
	line "usarlo un #MON"

	para "con habilidades de"
	line "tipo roca."

	para "Mejora los ataques"
	line "de tipo roca."
	done

ArthurThursdayText:
	text "JOSUÉ: Soy JOSUÉ,"
	line "por jueves. Soy el"

	para "cuarto de siete"
	line "hermanos."
	done

ArthurNotThursdayText:
	text "JOSUÉ: Hoy no es"
	line "jueves."
	cont "¡Qué desilusión!"
	done

Route36SignText:
	text "RUTA 36"
	done

RuinsOfAlphNorthSignText:
	text "RUINAS ALFA"
	line "ENTRADA NORTE"
	done

Route36TrainerTips1Text:
	text "PISTAS ENTRENADOR"

	para "Las habilidades de"
	line "los #MON varían"

	para "incluso dentro de"
	line "una misma especie."

	para "Al principio, sus"
	line "habilidades pueden"
	cont "parecerse."

	para "Sin embargo, las"
	line "diferencias surgen"

	para "a medida que el"
	line "#MON crece"
	done

Route36TrainerTips2Text:
	text "PISTAS ENTRENADOR"

	para "Usa EXCAVAR para"
	line "volver a la"
	cont "entrada."

	para "Es útil para"
	line "explorar cuevas y"
	cont "otros lugares"
	done

Route36_MapEvents:
	db 0, 0 ; filler

	db 4 ; warp events
	warp_event 18,  8, ROUTE_36_NATIONAL_PARK_GATE, 3
	warp_event 18,  9, ROUTE_36_NATIONAL_PARK_GATE, 4
	warp_event 47, 13, ROUTE_36_RUINS_OF_ALPH_GATE, 1
	warp_event 48, 13, ROUTE_36_RUINS_OF_ALPH_GATE, 2

	db 2 ; coord events
	coord_event 20,  7, SCENE_ROUTE36_SUICUNE, Route36SuicuneScript
	coord_event 22,  7, SCENE_ROUTE36_SUICUNE, Route36SuicuneScript

	db 4 ; bg events
	bg_event 29,  1, BGEVENT_READ, Route36TrainerTips2
	bg_event 45, 11, BGEVENT_READ, RuinsOfAlphNorthSign
	bg_event 55,  7, BGEVENT_READ, Route36Sign
	bg_event 21,  7, BGEVENT_READ, Route36TrainerTips1

	db 9 ; object events
	object_event 20, 13, SPRITE_YOUNGSTER, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 3, TrainerPsychicMark, -1
	object_event 31, 14, SPRITE_YOUNGSTER, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 5, TrainerSchoolboyAlan1, -1
	object_event 35,  9, SPRITE_WEIRD_TREE, SPRITEMOVEDATA_SUDOWOODO, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, SudowoodoScript, EVENT_ROUTE_36_SUDOWOODO
	object_event 51,  8, SPRITE_LASS, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 2, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, Route36LassScript, -1
	object_event 44,  9, SPRITE_FISHER, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, Route36RockSmashGuyScript, -1
	object_event 21,  4, SPRITE_FRUIT_TREE, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, Route36FruitTree, -1
	object_event 46,  6, SPRITE_YOUNGSTER, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, ArthurScript, EVENT_ROUTE_36_ARTHUR_OF_THURSDAY
	object_event 33, 12, SPRITE_LASS, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, Route36FloriaScript, EVENT_FLORIA_AT_SUDOWOODO
	object_event 21,  6, SPRITE_SUICUNE, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, ObjectEvent, EVENT_SAW_SUICUNE_ON_ROUTE_36
