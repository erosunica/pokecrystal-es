	object_const_def ; object_event constants
	const AZALEATOWN_AZALEA_ROCKET1
	const AZALEATOWN_GRAMPS
	const AZALEATOWN_TEACHER
	const AZALEATOWN_YOUNGSTER
	const AZALEATOWN_SLOWPOKE1
	const AZALEATOWN_SLOWPOKE2
	const AZALEATOWN_SLOWPOKE3
	const AZALEATOWN_SLOWPOKE4
	const AZALEATOWN_FRUIT_TREE
	const AZALEATOWN_SILVER
	const AZALEATOWN_AZALEA_ROCKET3
	const AZALEATOWN_KURT_OUTSIDE

AzaleaTown_MapScripts:
	db 3 ; scene scripts
	scene_script .DummyScene0 ; SCENE_AZALEATOWN_NOTHING
	scene_script .DummyScene1 ; SCENE_AZALEATOWN_RIVAL_BATTLE
	scene_script .DummyScene2 ; SCENE_AZALEATOWN_KURT_RETURNS_GS_BALL

	db 1 ; callbacks
	callback MAPCALLBACK_NEWMAP, .Flypoint

.DummyScene0:
	end

.DummyScene1:
	end

.DummyScene2:
	end

.Flypoint:
	setflag ENGINE_FLYPOINT_AZALEA
	return

AzaleaTownRivalBattleScene1:
	moveobject AZALEATOWN_SILVER, 11, 11
	turnobject PLAYER, RIGHT
	showemote EMOTE_SHOCK, PLAYER, 15
	special FadeOutMusic
	pause 15
	appear AZALEATOWN_SILVER
	applymovement AZALEATOWN_SILVER, AzaleaTownRivalBattleApproachMovement1
	turnobject PLAYER, DOWN
	sjump AzaleaTownRivalBattleScript

AzaleaTownRivalBattleScene2:
	turnobject PLAYER, RIGHT
	showemote EMOTE_SHOCK, PLAYER, 15
	special FadeOutMusic
	pause 15
	appear AZALEATOWN_SILVER
	applymovement AZALEATOWN_SILVER, AzaleaTownRivalBattleApproachMovement2
	turnobject PLAYER, UP
AzaleaTownRivalBattleScript:
	playmusic MUSIC_RIVAL_ENCOUNTER
	opentext
	writetext AzaleaTownRivalBeforeText
	waitbutton
	closetext
	setevent EVENT_RIVAL_AZALEA_TOWN
	checkevent EVENT_GOT_TOTODILE_FROM_ELM
	iftrue .Totodile
	checkevent EVENT_GOT_CHIKORITA_FROM_ELM
	iftrue .Chikorita
	winlosstext AzaleaTownRivalWinText, AzaleaTownRivalLossText
	setlasttalked AZALEATOWN_SILVER
	loadtrainer RIVAL1, RIVAL1_2_TOTODILE
	startbattle
	dontrestartmapmusic
	reloadmapafterbattle
	sjump .AfterBattle

.Totodile:
	winlosstext AzaleaTownRivalWinText, AzaleaTownRivalLossText
	setlasttalked AZALEATOWN_SILVER
	loadtrainer RIVAL1, RIVAL1_2_CHIKORITA
	startbattle
	dontrestartmapmusic
	reloadmapafterbattle
	sjump .AfterBattle

.Chikorita:
	winlosstext AzaleaTownRivalWinText, AzaleaTownRivalLossText
	setlasttalked AZALEATOWN_SILVER
	loadtrainer RIVAL1, RIVAL1_2_CYNDAQUIL
	startbattle
	dontrestartmapmusic
	reloadmapafterbattle
	sjump .AfterBattle

.AfterBattle:
	playmusic MUSIC_RIVAL_AFTER
	opentext
	writetext AzaleaTownRivalAfterText
	waitbutton
	closetext
	turnobject PLAYER, LEFT
	applymovement AZALEATOWN_SILVER, AzaleaTownRivalBattleExitMovement
	playsound SFX_EXIT_BUILDING
	disappear AZALEATOWN_SILVER
	setscene SCENE_AZALEATOWN_NOTHING
	waitsfx
	playmapmusic
	end

AzaleaTownRocket1Script:
	jumptextfaceplayer AzaleaTownRocket1Text

AzaleaTownRocket2Script:
	jumptextfaceplayer AzaleaTownRocket2Text

AzaleaTownGrampsScript:
	faceplayer
	opentext
	checkevent EVENT_CLEARED_SLOWPOKE_WELL
	iftrue .ClearedWell
	writetext AzaleaTownGrampsTextBefore
	waitbutton
	closetext
	end

.ClearedWell:
	writetext AzaleaTownGrampsTextAfter
	waitbutton
	closetext
	end

AzaleaTownTeacherScript:
	jumptextfaceplayer AzaleaTownTeacherText

AzaleaTownYoungsterScript:
	jumptextfaceplayer AzaleaTownYoungsterText

AzaleaTownSlowpokeScript:
	opentext
	writetext AzaleaTownSlowpokeText1
	pause 60
	writetext AzaleaTownSlowpokeText2
	cry SLOWPOKE
	waitbutton
	closetext
	end

UnusedWoosterScript:
; unused
	faceplayer
	opentext
	writetext WoosterText
	cry QUAGSIRE
	waitbutton
	closetext
	end

AzaleaTownCelebiScene:
	applymovement PLAYER, AzaleaTownPlayerLeavesKurtsHouseMovement
	opentext
	writetext AzaleaTownKurtText1
	promptbutton
	turnobject AZALEATOWN_KURT_OUTSIDE, RIGHT
	writetext AzaleaTownKurtText2
	promptbutton
	writetext AzaleaTownKurtText3
	waitbutton
	verbosegiveitem GS_BALL
	turnobject AZALEATOWN_KURT_OUTSIDE, LEFT
	setflag ENGINE_FOREST_IS_RESTLESS
	clearevent EVENT_ILEX_FOREST_LASS
	setevent EVENT_ROUTE_34_ILEX_FOREST_GATE_LASS
	setscene SCENE_AZALEATOWN_NOTHING
	closetext
	end

AzaleaTownKurtScript:
	faceplayer
	opentext
	writetext AzaleaTownKurtText3
	waitbutton
	turnobject AZALEATOWN_KURT_OUTSIDE, LEFT
	closetext
	end

AzaleaTownSign:
	jumptext AzaleaTownSignText

KurtsHouseSign:
	jumptext KurtsHouseSignText

AzaleaGymSign:
	jumptext AzaleaGymSignText

SlowpokeWellSign:
	jumptext SlowpokeWellSignText

CharcoalKilnSign:
	jumptext CharcoalKilnSignText

AzaleaTownIlextForestSign:
	jumptext AzaleaTownIlexForestSignText

AzaleaTownPokecenterSign:
	jumpstd pokecentersign

AzaleaTownMartSign:
	jumpstd martsign

WhiteApricornTree:
	fruittree FRUITTREE_AZALEA_TOWN

AzaleaTownHiddenFullHeal:
	hiddenitem FULL_HEAL, EVENT_AZALEA_TOWN_HIDDEN_FULL_HEAL

AzaleaTownRivalBattleApproachMovement1:
	step LEFT
	step LEFT
	step LEFT
	step LEFT
	step LEFT
	step LEFT
	turn_head UP
	step_end

AzaleaTownRivalBattleApproachMovement2:
	step LEFT
	step LEFT
	step LEFT
	step LEFT
	step LEFT
	step LEFT
	turn_head DOWN
	step_end

AzaleaTownRivalBattleExitMovement:
	step LEFT
	step LEFT
	step LEFT
	step_end

AzaleaTownPlayerLeavesKurtsHouseMovement:
	step LEFT
	step LEFT
	step UP
	turn_head LEFT
	step_end

AzaleaTownRivalBeforeText:
	text "Dime una cosa…"

	para "¿Es cierto que el"
	line "TEAM ROCKET ha"
	cont "vuelto?"

	para "¿Qué? ¿Los has"
	line "derrotado? ¡Anda!"

	para "¡No me mientas!"
	line "¿Bromeas?"

	para "Pues a ver qué tal"
	line "eres."
	done

AzaleaTownRivalWinText:
	text "¡Vaya!"
	line "¡Inútiles #MON!"

	para "¡Escúchame! ¡Has"
	line "ganado porque mis"

	para "#MON eran"
	line "débiles!"
	done

AzaleaTownRivalAfterText:
	text "Odio a los"
	line "débiles."

	para "Ya sean #MON"
	line "o entrenadores. Da"
	cont "igual quién o qué."

	para "Seré fuerte"
	line "y acabaré con los"
	cont "enclenques."

	para "Eso también va por"
	line "el TEAM ROCKET."

	para "Son fuertes cuando"
	line "están en grupo,"

	para "pero si están"
	line "solos, son unos"
	cont "cobardes."

	para "¡Cuánto les odio!"

	para "¡Fuera de mi"
	line "vista! ¡Eres tan"

	para "insignificante"
	line "como el resto!"
	done

AzaleaTownRivalLossText:
	text "¡Ja! Sabía que"
	line "mentías."
	done

AzaleaTownRocket1Text:
	text "Entrar ahí es muy"
	line "peligroso, por eso"
	cont "estoy de guardia."

	para "¿A que soy un"
	line "buen samaritano?"
	done

AzaleaTownRocket2Text:
	text "¿Sabes algo sobre"
	line "las COLASLOWPOKE?"

	para "¡Dicen que son muy"
	line "sabrosas!"

	para "¿Te gusta saberlo?"
	done

AzaleaTownGrampsTextBefore:
	text "Los SLOWPOKE han"
	line "desaparecido del"
	cont "pueblo…"

	para "Dicen que venden"
	line "sus COLAS en algún"
	cont "lugar."
	done

AzaleaTownGrampsTextAfter:
	text "Los SLOWPOKE han"
	line "vuelto."

	para "Conociéndolos,"
	line "quizá han estado"

	para "remoloneando en"
	line "algún lugar."
	done

AzaleaTownTeacherText:
	text "¿Viste a CÉSAR"
	line "para que te diera"
	cont "algunas BALL?"

	para "Muchas personas"
	line "lo hacen."
	done

AzaleaTownYoungsterText:
	text "Ataja por PUEBLO"
	line "AZALEA y llegarás"
	cont "al ENCINAR."

	para "Pero estos"
	line "arbolitos te"
	cont "impiden pasar."

	para "Los #MON del"
	line "CARBONERO pueden"
	cont "CORTAR árboles."
	done

AzaleaTownSlowpokeText1:
	text "SLOWPOKE: …"

	para "<……> <……> <……>"
	done

AzaleaTownSlowpokeText2:
	text "(Bostezo)<……>"
	done

WoosterText:
	text "WOOSTER: ¡Wooost…!"
	done

AzaleaTownKurtText1:
	text "¡El ENCINAR está"
	line "inquieto!"

	para "¿Qué está pasando?"
	done

AzaleaTownKurtText2:
	text "¡<PLAYER>, aquí"
	line "tienes tu GS BALL!"
	done

AzaleaTownKurtText3:
	text "¿Puedes ir a ver"
	line "por qué el ENCINAR"
	cont "está tan inquieto?"
	done

AzaleaTownSignText:
	text "PUEBLO AZALEA"
	line "Donde la gente y"

	para "los #MON viven"
	line "en feliz armonía"
	done

KurtsHouseSignText:
	text "CASA DE CÉSAR"
	done

AzaleaGymSignText:
	text "LÍDER DEL GIMNASIO"
	line "#MON DE PUEBLO"
	cont "AZALEA: ANTÓN"

	para "La enciclopedia"
	line "andante de los"
	cont "#MON bicho"
	done

SlowpokeWellSignText:
	text "POZO SLOWPOKE"

	para "Conocido también"
	line "como POZO LLUVIA."

	para "Los nativos creen"
	line "que el bostezo de"

	para "SLOWPOKE invoca la"
	line "lluvia."

	para "Hace 400 años, un"
	line "bostezo de"

	para "SLOWPOKE acabó"
	line "con una sequía"
	done

CharcoalKilnSignText:
	text "CASA DEL CARBONERO"
	done

AzaleaTownIlexForestSignText:
	text "EL ENCINAR"

	para "Entra por la"
	line "puerta"
	done

AzaleaTown_MapEvents:
	db 0, 0 ; filler

	db 8 ; warp events
	warp_event 15,  9, AZALEA_POKECENTER_1F, 1
	warp_event 21, 13, CHARCOAL_KILN, 1
	warp_event 21,  5, AZALEA_MART, 2
	warp_event  9,  5, KURTS_HOUSE, 1
	warp_event 10, 15, AZALEA_GYM, 1
	warp_event 31,  7, SLOWPOKE_WELL_B1F, 1
	warp_event  2, 10, ILEX_FOREST_AZALEA_GATE, 3
	warp_event  2, 11, ILEX_FOREST_AZALEA_GATE, 4

	db 3 ; coord events
	coord_event  5, 10, SCENE_AZALEATOWN_RIVAL_BATTLE, AzaleaTownRivalBattleScene1
	coord_event  5, 11, SCENE_AZALEATOWN_RIVAL_BATTLE, AzaleaTownRivalBattleScene2
	coord_event  9,  6, SCENE_AZALEATOWN_KURT_RETURNS_GS_BALL, AzaleaTownCelebiScene

	db 9 ; bg events
	bg_event 19,  9, BGEVENT_READ, AzaleaTownSign
	bg_event 10,  9, BGEVENT_READ, KurtsHouseSign
	bg_event 14, 15, BGEVENT_READ, AzaleaGymSign
	bg_event 29,  7, BGEVENT_READ, SlowpokeWellSign
	bg_event 19, 13, BGEVENT_READ, CharcoalKilnSign
	bg_event 16,  9, BGEVENT_READ, AzaleaTownPokecenterSign
	bg_event 22,  5, BGEVENT_READ, AzaleaTownMartSign
	bg_event  3,  9, BGEVENT_READ, AzaleaTownIlextForestSign
	bg_event 31,  6, BGEVENT_ITEM, AzaleaTownHiddenFullHeal

	db 12 ; object events
	object_event 31,  9, SPRITE_AZALEA_ROCKET, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, AzaleaTownRocket1Script, EVENT_AZALEA_TOWN_SLOWPOKETAIL_ROCKET
	object_event 21,  9, SPRITE_GRAMPS, SPRITEMOVEDATA_WANDER, 1, 2, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, AzaleaTownGrampsScript, -1
	object_event 15, 13, SPRITE_TEACHER, SPRITEMOVEDATA_WALK_UP_DOWN, 0, 2, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, AzaleaTownTeacherScript, -1
	object_event  7,  9, SPRITE_YOUNGSTER, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 1, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, AzaleaTownYoungsterScript, -1
	object_event  8, 17, SPRITE_SLOWPOKE, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, AzaleaTownSlowpokeScript, EVENT_AZALEA_TOWN_SLOWPOKES
	object_event 18,  9, SPRITE_SLOWPOKE, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, AzaleaTownSlowpokeScript, EVENT_AZALEA_TOWN_SLOWPOKES
	object_event 29,  9, SPRITE_SLOWPOKE, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, AzaleaTownSlowpokeScript, EVENT_AZALEA_TOWN_SLOWPOKES
	object_event 15, 15, SPRITE_SLOWPOKE, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, AzaleaTownSlowpokeScript, EVENT_AZALEA_TOWN_SLOWPOKES
	object_event  8,  2, SPRITE_FRUIT_TREE, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, WhiteApricornTree, -1
	object_event 11, 10, SPRITE_AZALEA_ROCKET, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, ObjectEvent, EVENT_RIVAL_AZALEA_TOWN
	object_event 10, 16, SPRITE_AZALEA_ROCKET, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, AzaleaTownRocket2Script, EVENT_SLOWPOKE_WELL_ROCKETS
	object_event  6,  5, SPRITE_KURT_OUTSIDE, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, AzaleaTownKurtScript, EVENT_AZALEA_TOWN_KURT
