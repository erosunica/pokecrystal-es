	object_const_def ; object_event constants
	const ROUTE30_YOUNGSTER1
	const ROUTE30_YOUNGSTER2
	const ROUTE30_YOUNGSTER3
	const ROUTE30_BUG_CATCHER
	const ROUTE30_YOUNGSTER4
	const ROUTE30_MONSTER1
	const ROUTE30_MONSTER2
	const ROUTE30_FRUIT_TREE1
	const ROUTE30_FRUIT_TREE2
	const ROUTE30_COOLTRAINER_F
	const ROUTE30_POKE_BALL

Route30_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

YoungsterJoey_ImportantBattleScript:
	waitsfx
	playmusic MUSIC_JOHTO_TRAINER_BATTLE
	opentext
	writetext Text_UseTackle
	pause 30
	closetext
	playsound SFX_TACKLE
	applymovement ROUTE30_MONSTER2, Route30_JoeysRattataAttacksMovement
	opentext
	faceplayer
	writetext Text_ThisIsABigBattle
	waitbutton
	turnobject ROUTE30_YOUNGSTER1, UP
	closetext
	playsound SFX_TACKLE
	applymovement ROUTE30_MONSTER1, Route30_MikeysRattataAttacksMovement
	special RestartMapMusic
	end

TrainerYoungsterJoey:
	trainer YOUNGSTER, JOEY1, EVENT_BEAT_YOUNGSTER_JOEY, YoungsterJoey1SeenText, YoungsterJoey1BeatenText, 0, .Script

.Script:
	loadvar VAR_CALLERID, PHONE_YOUNGSTER_JOEY
	endifjustbattled
	opentext
	checkflag ENGINE_JOEY
	iftrue .Rematch
	checkcellnum PHONE_YOUNGSTER_JOEY
	iftrue .NumberAccepted
	checkevent EVENT_JOEY_ASKED_FOR_PHONE_NUMBER
	iftrue .AskAgain
	writetext YoungsterJoey1AfterText
	promptbutton
	setevent EVENT_JOEY_ASKED_FOR_PHONE_NUMBER
	scall .AskNumber1
	sjump .RequestNumber

.AskAgain:
	scall .AskNumber2
.RequestNumber:
	askforphonenumber PHONE_YOUNGSTER_JOEY
	ifequal PHONE_CONTACTS_FULL, .PhoneFull
	ifequal PHONE_CONTACT_REFUSED, .NumberDeclined
	gettrainername STRING_BUFFER_3, YOUNGSTER, JOEY1
	scall .RegisteredNumber
	sjump .NumberAccepted

.Rematch:
	scall .RematchStd
	winlosstext YoungsterJoey1BeatenText, 0
	readmem wJoeyFightCount
	ifequal 4, .Fight4
	ifequal 3, .Fight3
	ifequal 2, .Fight2
	ifequal 1, .Fight1
	ifequal 0, .LoadFight0
.Fight4:
	checkevent EVENT_BEAT_ELITE_FOUR
	iftrue .LoadFight4
.Fight3:
	checkevent EVENT_CLEARED_RADIO_TOWER
	iftrue .LoadFight3
.Fight2:
	checkflag ENGINE_FLYPOINT_OLIVINE
	iftrue .LoadFight2
.Fight1:
	checkflag ENGINE_FLYPOINT_GOLDENROD
	iftrue .LoadFight1
.LoadFight0:
	loadtrainer YOUNGSTER, JOEY1
	startbattle
	reloadmapafterbattle
	loadmem wJoeyFightCount, 1
	clearflag ENGINE_JOEY
	end

.LoadFight1:
	loadtrainer YOUNGSTER, JOEY2
	startbattle
	reloadmapafterbattle
	loadmem wJoeyFightCount, 2
	clearflag ENGINE_JOEY
	end

.LoadFight2:
	loadtrainer YOUNGSTER, JOEY3
	startbattle
	reloadmapafterbattle
	loadmem wJoeyFightCount, 3
	clearflag ENGINE_JOEY
	end

.LoadFight3:
	loadtrainer YOUNGSTER, JOEY4
	startbattle
	reloadmapafterbattle
	loadmem wJoeyFightCount, 4
	clearflag ENGINE_JOEY
	end

.LoadFight4:
	loadtrainer YOUNGSTER, JOEY5
	startbattle
	reloadmapafterbattle
	clearflag ENGINE_JOEY
	checkevent EVENT_JOEY_HP_UP
	iftrue .GiveHPUp
	checkevent EVENT_GOT_HP_UP_FROM_JOEY
	iftrue .done
	scall .RematchGift
	verbosegiveitem HP_UP
	iffalse .PackFull
	setevent EVENT_GOT_HP_UP_FROM_JOEY
	sjump .NumberAccepted

.done
	end

.GiveHPUp:
	opentext
	writetext YoungsterJoeyText_GiveHPUpAfterBattle
	waitbutton
	verbosegiveitem HP_UP
	iffalse .PackFull
	clearevent EVENT_JOEY_HP_UP
	setevent EVENT_GOT_HP_UP_FROM_JOEY
	sjump .NumberAccepted

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

.RematchStd:
	jumpstd rematchm
	end

.PackFull:
	setevent EVENT_JOEY_HP_UP
	jumpstd packfullm
	end

.RematchGift:
	jumpstd rematchgiftm
	end

TrainerYoungsterMikey:
	trainer YOUNGSTER, MIKEY, EVENT_BEAT_YOUNGSTER_MIKEY, YoungsterMikeySeenText, YoungsterMikeyBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext YoungsterMikeyAfterText
	waitbutton
	closetext
	end

TrainerBugCatcherDon:
	trainer BUG_CATCHER, DON, EVENT_BEAT_BUG_CATCHER_DON, BugCatcherDonSeenText, BugCatcherDonBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext BugCatcherDonAfterText
	waitbutton
	closetext
	end

Route30YoungsterScript:
	faceplayer
	opentext
	checkevent EVENT_GAVE_MYSTERY_EGG_TO_ELM
	iftrue .CompletedEggQuest
	writetext Route30YoungsterText_DirectionsToMrPokemonsHouse
	waitbutton
	closetext
	end

.CompletedEggQuest:
	writetext Route30YoungsterText_EveryoneIsBattling
	waitbutton
	closetext
	end

Route30CooltrainerFScript:
	jumptextfaceplayer Route30CooltrainerFText

Route30Sign:
	jumptext Route30SignText

MrPokemonsHouseDirectionsSign:
	jumptext MrPokemonsHouseDirectionsSignText

MrPokemonsHouseSign:
	jumptext MrPokemonsHouseSignText

Route30TrainerTips:
	jumptext Route30TrainerTipsText

Route30Antidote:
	itemball ANTIDOTE

Route30FruitTree1:
	fruittree FRUITTREE_ROUTE_30_1

Route30FruitTree2:
	fruittree FRUITTREE_ROUTE_30_2

Route30HiddenPotion:
	hiddenitem POTION, EVENT_ROUTE_30_HIDDEN_POTION

Route30_JoeysRattataAttacksMovement:
	fix_facing
	big_step UP
	big_step DOWN
	step_end

Route30_MikeysRattataAttacksMovement:
	fix_facing
	big_step DOWN
	big_step UP
	step_end

Text_UseTackle:
	text "¡Ve, RATTATA!"

	para "¡PLACAJE!"
	done

Text_ThisIsABigBattle:
	text "¿Qué? ¡Es un gran"
	line "combate!"
	cont "¡Déjame en paz!"
	done

YoungsterJoey1SeenText:
	text "Perdí, así que"
	line "estoy buscando más"
	cont "#MON."

	para "¡Espera! ¡Pareces"
	line "débil! ¡Venga,"
	cont "luchemos!"
	done

YoungsterJoey1BeatenText:
	text "¡Argh! ¡He perdido"
	line "de nuevo!"
	done

YoungsterJoey1AfterText:
	text "¿Debo tener más"
	line "#MON para poder"
	cont "luchar mejor?"

	para "¡No! ¡Continuaré"
	line "sólo con éste,"
	cont "pase lo que pase!"
	done

YoungsterMikeySeenText:
	text "Entrenas #MON,"
	line "¿verdad?"

	para "¡Pues entonces"
	line "luchemos!"
	done

YoungsterMikeyBeatenText:
	text "¡Qué extraño!"
	line "¡Creí que ganaría!"
	done

YoungsterMikeyAfterText:
	text "Es muy duro llegar"
	line "a ser un buen"
	cont "entrenador."

	para "Tengo que luchar"
	line "contra más gente"
	cont "para mejorar."
	done

BugCatcherDonSeenText:
	text "¡En lugar de un"
	line "#MON bicho,"

	para "he encontrado a"
	line "alguien que los"
	cont "entrena!"
	done

BugCatcherDonBeatenText:
	text "¡Arg! ¡Eres muy"
	line "fuerte!"
	done

BugCatcherDonAfterText:
	text "Me quedé sin #"
	line "BALL mientras"
	cont "atrapaba #MON."

	para "Debería haber"
	line "comprado más…"
	done

Route30YoungsterText_DirectionsToMrPokemonsHouse:
	text "¿La casa del SR."
	line "#MON? Está un"
	cont "poco más adelante."
	done

Route30YoungsterText_EveryoneIsBattling:
	text "¡Todo el mundo se"
	line "divierte luchando!"

	para "¡Tú también"
	line "deberías hacerlo!"
	done

Route30CooltrainerFText:
	text "No soy una"
	line "entrenadora."

	para "Pero si miras a"
	line "uno a los ojos,"

	para "prepárate para"
	line "luchar."
	done

Route30SignText:
	text "RUTA 30"

	para "CIUDAD MALVA -"
	line "CIUDAD CEREZO"
	done

MrPokemonsHouseDirectionsSignText:
	text "CASA SR. #MON"
	line "¡Todo recto!"
	done

MrPokemonsHouseSignText:
	text "CASA SR. #MON"
	done

Route30TrainerTipsText:
	text "PISTAS ENTRENADOR"

	para "¡No robes los"
	line "#MON de otros!"

	para "¡Las # BALL"
	line "sólo se lanzan a"
	cont "#MON salvajes!"
	done

YoungsterJoeyText_GiveHPUpAfterBattle:
	text "Perdí otra vez…"
	line "¡Eres fuerte!"

	para "Oh. Casi olvido"
	line "que tenía que"
	cont "darte esto."

	para "Úsalo para hacerte"
	line "aún más fuerte,"
	cont "¿vale?"

	para "Yo también seré"
	line "más fuerte."
	done

Route30_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event  7, 39, ROUTE_30_BERRY_HOUSE, 1
	warp_event 17,  5, MR_POKEMONS_HOUSE, 1

	db 0 ; coord events

	db 5 ; bg events
	bg_event  9, 43, BGEVENT_READ, Route30Sign
	bg_event 13, 29, BGEVENT_READ, MrPokemonsHouseDirectionsSign
	bg_event 15,  5, BGEVENT_READ, MrPokemonsHouseSign
	bg_event  3, 21, BGEVENT_READ, Route30TrainerTips
	bg_event 14,  9, BGEVENT_ITEM, Route30HiddenPotion

	db 11 ; object events
	object_event  5, 26, SPRITE_YOUNGSTER, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, YoungsterJoey_ImportantBattleScript, EVENT_ROUTE_30_BATTLE
	object_event  2, 28, SPRITE_YOUNGSTER, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 3, TrainerYoungsterJoey, EVENT_ROUTE_30_YOUNGSTER_JOEY
	object_event  5, 23, SPRITE_YOUNGSTER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 1, TrainerYoungsterMikey, -1
	object_event  1,  7, SPRITE_BUG_CATCHER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_TRAINER, 3, TrainerBugCatcherDon, -1
	object_event  7, 30, SPRITE_YOUNGSTER, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 1, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, Route30YoungsterScript, -1
	object_event  5, 24, SPRITE_MONSTER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, ObjectEvent, EVENT_ROUTE_30_BATTLE
	object_event  5, 25, SPRITE_MONSTER, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, ObjectEvent, EVENT_ROUTE_30_BATTLE
	object_event  5, 39, SPRITE_FRUIT_TREE, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, Route30FruitTree1, -1
	object_event 11,  5, SPRITE_FRUIT_TREE, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, Route30FruitTree2, -1
	object_event  2, 13, SPRITE_COOLTRAINER_F, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, Route30CooltrainerFScript, -1
	object_event  8, 35, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, Route30Antidote, EVENT_ROUTE_30_ANTIDOTE
