	object_const_def ; object_event constants
	const ROUTE32_FISHER1
	const ROUTE32_FISHER2
	const ROUTE32_FISHER3
	const ROUTE32_YOUNGSTER1
	const ROUTE32_YOUNGSTER2
	const ROUTE32_YOUNGSTER3
	const ROUTE32_LASS1
	const ROUTE32_COOLTRAINER_M
	const ROUTE32_YOUNGSTER4
	const ROUTE32_FISHER4
	const ROUTE32_POKE_BALL1
	const ROUTE32_FISHER5
	const ROUTE32_FRIEDA
	const ROUTE32_POKE_BALL2

Route32_MapScripts:
	db 3 ; scene scripts
	scene_script .DummyScene0 ; SCENE_DEFAULT
	scene_script .DummyScene1 ; SCENE_ROUTE32_OFFER_SLOWPOKETAIL
	scene_script .DummyScene2 ; SCENE_ROUTE32_NOTHING

	db 1 ; callbacks
	callback MAPCALLBACK_OBJECTS, .Frieda

.DummyScene0:
	end

.DummyScene1:
	end

.DummyScene2:
	end

.Frieda:
	readvar VAR_WEEKDAY
	ifequal FRIDAY, .FriedaAppears
	disappear ROUTE32_FRIEDA
	return

.FriedaAppears:
	appear ROUTE32_FRIEDA
	return

Route32CooltrainerMScript:
	faceplayer
Route32CooltrainerMContinueScene:
	opentext
	checkevent EVENT_GOT_MIRACLE_SEED_IN_ROUTE_32
	iftrue .GotMiracleSeed
	checkflag ENGINE_ZEPHYRBADGE
	iffalse .DontHaveZephyrBadge
	checkevent EVENT_GOT_TOGEPI_EGG_FROM_ELMS_AIDE
	iftrue .GiveMiracleSeed
	writetext Route32CooltrainerMText_AideIsWaiting
	waitbutton
	closetext
	end

.Unreferenced:
	writetext Route32CooltrainerMText_UnusedSproutTower
	waitbutton
	closetext
	end

.GiveMiracleSeed:
	writetext Route32CooltrainerMText_HaveThisSeed
	promptbutton
	verbosegiveitem MIRACLE_SEED
	iffalse .BagFull
	setevent EVENT_GOT_MIRACLE_SEED_IN_ROUTE_32
	sjump .GotMiracleSeed

.DontHaveZephyrBadge:
	writetext Route32CooltrainerMText_VioletGym
	waitbutton
	closetext
	end

.GotMiracleSeed:
	writetext Route32CooltrainerMText_ExperiencesShouldBeUseful
	waitbutton
.BagFull:
	closetext
	end

Route32CooltrainerMStopsYouScene:
	turnobject ROUTE32_COOLTRAINER_M, LEFT
	turnobject PLAYER, RIGHT
	opentext
	writetext Route32CooltrainerMText_WhatsTheHurry
	waitbutton
	closetext
	follow PLAYER, ROUTE32_COOLTRAINER_M
	applymovement PLAYER, Movement_Route32CooltrainerMPushesYouBackToViolet
	stopfollow
	turnobject PLAYER, DOWN
	scall Route32CooltrainerMContinueScene
	applymovement ROUTE32_COOLTRAINER_M, Movement_Route32CooltrainerMReset1
	applymovement ROUTE32_COOLTRAINER_M, Movement_Route32CooltrainerMReset2
	end

Route32RoarTMGuyScript:
	faceplayer
	opentext
	checkevent EVENT_GOT_TM05_ROAR
	iftrue .AlreadyHaveRoar
	writetext Text_RoarIntro
	promptbutton
	verbosegiveitem TM_ROAR
	iffalse .Finish
	setevent EVENT_GOT_TM05_ROAR
.AlreadyHaveRoar:
	writetext Text_RoarOutro
	waitbutton
.Finish:
	closetext
	end

Route32WannaBuyASlowpokeTailScript:
	turnobject ROUTE32_FISHER4, DOWN
	turnobject PLAYER, UP
	sjump _OfferToSellSlowpokeTail

SlowpokeTailSalesmanScript:
	faceplayer
_OfferToSellSlowpokeTail:
	setscene SCENE_ROUTE32_NOTHING
	opentext
	writetext Text_MillionDollarSlowpokeTail
	yesorno
	iffalse .refused
	writetext Text_ThoughtKidsWereLoaded
	waitbutton
	closetext
	end

.refused
	writetext Text_RefusedToBuySlowpokeTail
	waitbutton
	closetext
	end

TrainerCamperRoland:
	trainer CAMPER, ROLAND, EVENT_BEAT_CAMPER_ROLAND, CamperRolandSeenText, CamperRolandBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext CamperRolandAfterText
	waitbutton
	closetext
	end

TrainerFisherJustin:
	trainer FISHER, JUSTIN, EVENT_BEAT_FISHER_JUSTIN, FisherJustinSeenText, FisherJustinBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext FisherJustinAfterText
	waitbutton
	closetext
	end

TrainerFisherRalph1:
	trainer FISHER, RALPH1, EVENT_BEAT_FISHER_RALPH, FisherRalph1SeenText, FisherRalph1BeatenText, 0, .Script

.Script:
	loadvar VAR_CALLERID, PHONE_FISHER_RALPH
	endifjustbattled
	opentext
	checkflag ENGINE_RALPH
	iftrue .Rematch
	checkflag ENGINE_FISH_SWARM
	iftrue .Swarm
	checkcellnum PHONE_FISHER_RALPH
	iftrue .NumberAccepted
	checkevent EVENT_RALPH_ASKED_FOR_PHONE_NUMBER
	iftrue .AskAgain
	writetext FisherRalphAfterText
	promptbutton
	setevent EVENT_RALPH_ASKED_FOR_PHONE_NUMBER
	scall .AskNumber1
	sjump .AskForNumber

.AskAgain:
	scall .AskNumber2
.AskForNumber:
	askforphonenumber PHONE_FISHER_RALPH
	ifequal PHONE_CONTACTS_FULL, .PhoneFull
	ifequal PHONE_CONTACT_REFUSED, .NumberDeclined
	gettrainername STRING_BUFFER_3, FISHER, RALPH1
	scall .RegisteredNumber
	sjump .NumberAccepted

.Rematch:
	scall .RematchStd
	winlosstext FisherRalph1BeatenText, 0
	readmem wRalphFightCount
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
	checkflag ENGINE_FLYPOINT_LAKE_OF_RAGE
	iftrue .LoadFight2
.Fight1:
	checkflag ENGINE_FLYPOINT_ECRUTEAK
	iftrue .LoadFight1
.LoadFight0:
	loadtrainer FISHER, RALPH1
	startbattle
	reloadmapafterbattle
	loadmem wRalphFightCount, 1
	clearflag ENGINE_RALPH
	end

.LoadFight1:
	loadtrainer FISHER, RALPH2
	startbattle
	reloadmapafterbattle
	loadmem wRalphFightCount, 2
	clearflag ENGINE_RALPH
	end

.LoadFight2:
	loadtrainer FISHER, RALPH3
	startbattle
	reloadmapafterbattle
	loadmem wRalphFightCount, 3
	clearflag ENGINE_RALPH
	end

.LoadFight3:
	loadtrainer FISHER, RALPH4
	startbattle
	reloadmapafterbattle
	loadmem wRalphFightCount, 4
	clearflag ENGINE_RALPH
	end

.LoadFight4:
	loadtrainer FISHER, RALPH5
	startbattle
	reloadmapafterbattle
	clearflag ENGINE_RALPH
	end

.Swarm:
	writetext FisherRalphSwarmText
	waitbutton
	closetext
	end

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

TrainerFisherHenry:
	trainer FISHER, HENRY, EVENT_BEAT_FISHER_HENRY, FisherHenrySeenText, FisherHenryBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext FisherHenryAfterText
	waitbutton
	closetext
	end

TrainerPicnickerLiz1:
	trainer PICNICKER, LIZ1, EVENT_BEAT_PICNICKER_LIZ, PicnickerLiz1SeenText, PicnickerLiz1BeatenText, 0, .Script

.Script:
	loadvar VAR_CALLERID, PHONE_PICNICKER_LIZ
	endifjustbattled
	opentext
	checkflag ENGINE_LIZ
	iftrue .Rematch
	checkcellnum PHONE_PICNICKER_LIZ
	iftrue .NumberAccepted
	checkevent EVENT_LIZ_ASKED_FOR_PHONE_NUMBER
	iftrue .AskAgain
	writetext PicnickerLiz1AfterText
	promptbutton
	setevent EVENT_LIZ_ASKED_FOR_PHONE_NUMBER
	scall .AskNumber1
	sjump .AskForNumber

.AskAgain:
	scall .AskNumber2
.AskForNumber:
	askforphonenumber PHONE_PICNICKER_LIZ
	ifequal PHONE_CONTACTS_FULL, .PhoneFull
	ifequal PHONE_CONTACT_REFUSED, .NumberDeclined
	gettrainername STRING_BUFFER_3, PICNICKER, LIZ1
	scall .RegisteredNumber
	sjump .NumberAccepted

.Rematch:
	scall .RematchStd
	winlosstext PicnickerLiz1BeatenText, 0
	readmem wLizFightCount
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
	checkevent EVENT_CLEARED_ROCKET_HIDEOUT
	iftrue .LoadFight2
.Fight1:
	checkflag ENGINE_FLYPOINT_ECRUTEAK
	iftrue .LoadFight1
.LoadFight0:
	loadtrainer PICNICKER, LIZ1
	startbattle
	reloadmapafterbattle
	loadmem wLizFightCount, 1
	clearflag ENGINE_LIZ
	end

.LoadFight1:
	loadtrainer PICNICKER, LIZ2
	startbattle
	reloadmapafterbattle
	loadmem wLizFightCount, 2
	clearflag ENGINE_LIZ
	end

.LoadFight2:
	loadtrainer PICNICKER, LIZ3
	startbattle
	reloadmapafterbattle
	loadmem wLizFightCount, 3
	clearflag ENGINE_LIZ
	end

.LoadFight3:
	loadtrainer PICNICKER, LIZ4
	startbattle
	reloadmapafterbattle
	loadmem wLizFightCount, 4
	clearflag ENGINE_LIZ
	end

.LoadFight4:
	loadtrainer PICNICKER, LIZ5
	startbattle
	reloadmapafterbattle
	clearflag ENGINE_LIZ
	end

.AskNumber1:
	jumpstd asknumber1f
	end

.AskNumber2:
	jumpstd asknumber2f
	end

.RegisteredNumber:
	jumpstd registerednumberf
	end

.NumberAccepted:
	jumpstd numberacceptedf
	end

.NumberDeclined:
	jumpstd numberdeclinedf
	end

.PhoneFull:
	jumpstd phonefullf
	end

.RematchStd:
	jumpstd rematchf
	end

TrainerYoungsterAlbert:
	trainer YOUNGSTER, ALBERT, EVENT_BEAT_YOUNGSTER_ALBERT, YoungsterAlbertSeenText, YoungsterAlbertBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext YoungsterAlbertAfterText
	waitbutton
	closetext
	end

TrainerYoungsterGordon:
	trainer YOUNGSTER, GORDON, EVENT_BEAT_YOUNGSTER_GORDON, YoungsterGordonSeenText, YoungsterGordonBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext YoungsterGordonAfterText
	waitbutton
	closetext
	end

TrainerBirdKeeperPeter:
	trainer BIRD_KEEPER, PETER, EVENT_BEAT_BIRD_KEEPER_PETER, BirdKeeperPeterSeenText, BirdKeeperPeterBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext BirdKeeperPeterAfterText
	waitbutton
	closetext
	end

FriedaScript:
	faceplayer
	opentext
	checkevent EVENT_GOT_POISON_BARB_FROM_FRIEDA
	iftrue .Friday
	readvar VAR_WEEKDAY
	ifnotequal FRIDAY, .NotFriday
	checkevent EVENT_MET_FRIEDA_OF_FRIDAY
	iftrue .MetFrieda
	writetext MeetFriedaText
	promptbutton
	setevent EVENT_MET_FRIEDA_OF_FRIDAY
.MetFrieda:
	writetext FriedaGivesGiftText
	promptbutton
	verbosegiveitem POISON_BARB
	iffalse .Done
	setevent EVENT_GOT_POISON_BARB_FROM_FRIEDA
	writetext FriedaGaveGiftText
	waitbutton
	closetext
	end

.Friday:
	writetext FriedaFridayText
	waitbutton
.Done:
	closetext
	end

.NotFriday:
	writetext FriedaNotFridayText
	waitbutton
	closetext
	end

Route32GreatBall:
	itemball GREAT_BALL

Route32Repel:
	itemball REPEL

Route32Sign:
	jumptext Route32SignText

Route32RuinsSign:
	jumptext Route32RuinsSignText

Route32UnionCaveSign:
	jumptext Route32UnionCaveSignText

Route32PokecenterSign:
	jumpstd pokecentersign

Route32HiddenGreatBall:
	hiddenitem GREAT_BALL, EVENT_ROUTE_32_HIDDEN_GREAT_BALL

Route32HiddenSuperPotion:
	hiddenitem SUPER_POTION, EVENT_ROUTE_32_HIDDEN_SUPER_POTION

Movement_Route32CooltrainerMPushesYouBackToViolet:
	step UP
	step UP
	step_end

Movement_Route32CooltrainerMReset1:
	step DOWN
	step_end

Movement_Route32CooltrainerMReset2:
	step RIGHT
	step_end

Route32CooltrainerMText_WhatsTheHurry:
	text "¡Espera!"
	line "¿Por qué corres?"
	done

Route32CooltrainerMText_AideIsWaiting:
	text "<PLAYER>, ¿verdad?"

	para "Un tipo con gafas"
	line "te buscaba."

	para "Compruébalo. Te"
	line "está esperando en"
	cont "el CENTRO #MON."
	done

Route32CooltrainerMText_UnusedSproutTower:
; unused
	text "¿Has ido a la"
	line "TORRE BELLSPROUT?"

	para "Si pasas por"
	line "CIUDAD MALVA,"

	para "deberías"
	line "entrenarte allí."

	para "Es crucial para"
	line "los entrenadores."

	para "¡Ve a la TORRE"
	line "BELLSPROUT!"
	done

Route32CooltrainerMText_VioletGym:
	text "¿Has ido al"
	line "GIMNASIO #MON?"

	para "Allí puedes probar"
	line "a tus #MON y"
	cont "a ti mismo."

	para "¡Es un rito para"
	line "todos los"
	cont "entrenadores!"
	done

Route32CooltrainerMText_HaveThisSeed:
	text "Tienes #MON muy"
	line "buenos."

	para "Seguro que es por"
	line "haberlos entrenado"

	para "en los alrededores"
	line "de CIUDAD MALVA."

	para "El entrenamiento"
	line "en el GIMNASIO ha"

	para "debido de ser de"
	line "gran ayuda."

	para "Toma esto como"
	line "recuerdo de"
	cont "CIUDAD MALVA."

	para "Aumenta el poder"
	line "de los movimientos"
	cont "de tipo planta."
	done

Route32CooltrainerMText_ExperiencesShouldBeUseful:
	text "Tu experiencia en"
	line "CIUDAD MALVA"

	para "debería ayudarte"
	line "en tu viaje."
	done

Text_MillionDollarSlowpokeTail:
	text "¿Te gustaría tener"
	line "esta sabrosa y"

	para "nutritiva"
	line "COLASLOWPOKE?"

	para "¡Sólo te costará"
	line "1.000.000¥!"

	para "¡Te gustará!"
	done

Text_ThoughtKidsWereLoaded:
	text "¡Vaya! Pensaba que"
	line "los niños de hoy"

	para "en día estaban"
	line "forrados…"
	done

Text_RefusedToBuySlowpokeTail:
	text "¿No la quieres?"
	line "Pues lárgate."
	done

FisherJustinSeenText:
	text "¡Vaya!"

	para "¡Se me escapó ese"
	line "pez por tu culpa!"
	done

FisherJustinBeatenText:
	text "¡Splash!"
	done

FisherJustinAfterText:
	text "Paciencia… La"
	line "base de la pesca"

	para "y de los #MON"
	line "es la misma."
	done

FisherRalph1SeenText:
	text "Soy muy bueno,"
	line "tanto pescando"

	para "como con los"
	line "#MON."

	para "¡No voy a perder"
	line "con alguien tan"
	cont "joven!"
	done

FisherRalph1BeatenText:
	text "Intenté acelerar"
	line "las cosas…"
	done

FisherRalphAfterText:
	text "¡Pescar es una"
	line "pasión eterna y"

	para "los #MON son"
	line "amigos eternos!"
	done

FisherRalphSwarmText:
	text "Uno, dos, tres…"
	line "¡Jajajajaja!"

	para "¡Qué gran botín!"

	para "¡Vale! ¡Sigue y"
	line "atrapa tantos como"
	cont "puedas!"
	done

; --- start a segment of unused text

Route32UnusedFisher1SeenText:
	text "Siempre atrapo los"
	line "mismos #MON…"

	para "Quizá con un"
	line "combate cambien"
	cont "las cosas."
	done

Route32UnusedFisher1BeatenText:
	text "Ahora ya nada me"
	line "sale bien…"
	done

Route32UnusedFisher1AfterText:
	text "¿Cómo es posible"
	line "que el tipo de al"

	para "lado pesque buenos"
	line "#MON?"
	done

Route32UnusedFisher2SeenText:
	text "¡Oye! Hoy estoy de"
	line "suerte. ¿Quieres"
	cont "luchar, joven?"
	done

Route32UnusedFisher2BeatenText:
	text "¡Uf! Esta vez no"
	line "tuve suerte."
	done

Route32UnusedFisher2AfterText:
	text "Si quieres atrapar"
	line "buenos #MON,"

	para "tienes que tener"
	line "una buena CAÑA."
	done

; --- end a segment of unused texts

FisherHenrySeenText:
	text "¿Mi #MON?"
	line "¡Recién pescado!"
	done

FisherHenryBeatenText:
	text "¡Splash!"
	done

FisherHenryAfterText:
	text "Los #MON"
	line "recién atrapados"

	para "no son comparables"
	line "con los criados."
	done

YoungsterAlbertSeenText:
	text "No te había visto"
	line "antes."

	para "¿Te crees muy"
	line "fuerte?"
	done

YoungsterAlbertBeatenText:
	text "¡Eres fuerte!"
	done

YoungsterAlbertAfterText:
	text "Intentaré ser el"
	line "mejor con mis"
	cont "favoritos."

	para "No uso los mismos"
	line "#MON que"
	cont "todo el mundo."
	done

YoungsterGordonSeenText:
	text "¡He encontrado"
	line "#MON muy buenos"
	cont "en la hierba!"

	para "¡Creo que me"
	line "servirán!"
	done

YoungsterGordonBeatenText:
	text "¡Maldición! Creía"
	line "que podía ganar."
	done

YoungsterGordonAfterText:
	text "En la hierba hay"
	line "cosas pegajosas."
	done

CamperRolandSeenText:
	text "Esa mirada…"
	line "Me intriga."
	done

CamperRolandBeatenText:
	text "¡Mmmm!"
	line "¡Qué decepción!"
	done

CamperRolandAfterText:
	text "Si no quieres"
	line "luchar, evita el"
	cont "contacto visual."
	done

PicnickerLiz1SeenText:
	text "Sí. Y sabes que…"

	para "¿Luchar? ¡Estoy"
	line "al teléfono!"

	para "Vale. Pero que sea"
	line "rápido."
	done

PicnickerLiz1BeatenText:
	text "¡Oh! ¡Tengo que"
	line "aliviar mi enfado!"
	done

PicnickerLiz1AfterText:
	text "Yo también estaba"
	line "charlando."
	done

BirdKeeperPeterSeenText:
	text "¡Esa MEDALLA! ¡Es"
	line "de CIUDAD MALVA!"

	para "¿Ganaste a PEGASO?"
	done

BirdKeeperPeterBeatenText:
	text "Conozco mis"
	line "debilidades."
	done

BirdKeeperPeterAfterText:
	text "Debería volver a"
	line "entrenarme en el"

	para "GIMNASIO de"
	line "CIUDAD MALVA."
	done

Route32UnusedText:
; unused
	text "Los pescadores me"
	line "han insultado por"
	cont "molestarles…"
	done

Text_RoarIntro:
	text "¡GRRRRRR!"
	line "¡TODOS HUYEN"

	para "CUANDO RUJO! ¡PERO"
	line "TÚ HAS VENIDO!"

	para "¡ESO ME GUSTA!"
	line "¡TOMA ESTO!"
	done

Text_RoarOutro:
	text "¡GRRRRRR!"
	line "¡ES RUGIDO! HASTA"

	para "LOS #MON HUYEN"
	line "CON UN RUGIDO."
	done

MeetFriedaText:
	text "VICKI: ¡Yuju!"
	line "¡Es viernes!"

	para "Soy VICKI, por"
	line "viernes."

	para "¡Mucho gusto!"
	done

FriedaGivesGiftText:
	text "¡Toma una FLECHA"
	line "VENENOSA!"
	done

FriedaGaveGiftText:
	text "VICKI: Dásela a un"
	line "#MON de tipo"
	cont "veneno."

	para "¡Oh!"

	para "¡Es terrible!"

	para "¡Te sorprenderá"
	line "ver cómo mejora"

	para "los movimientos"
	line "de tipo veneno!"
	done

FriedaFridayText:
	text "VICKI: ¡Hola! ¿Qué"
	line "día prefieres?"

	para "A mí me gusta el"
	line "viernes. Sin duda."

	para "¿No crees que es"
	line "genial?"
	done

FriedaNotFridayText:
	text "VICKI: ¿Hoy no es"
	line "viernes?"

	para "¡Me aburro cuando"
	line "no lo es!"
	done

Route32SignText:
	text "RUTA 32"

	para "CIUDAD MALVA -"
	line "PUEBLO AZALEA"
	done

Route32RuinsSignText:
	text "RUINAS ALFA"
	line "ENTRADA ESTE"
	done

Route32UnionCaveSignText:
	text "Hacia la"
	line "CUEVA UNIÓN"
	done

Route32_MapEvents:
	db 0, 0 ; filler

	db 4 ; warp events
	warp_event 11, 73, ROUTE_32_POKECENTER_1F, 1
	warp_event  4,  2, ROUTE_32_RUINS_OF_ALPH_GATE, 3
	warp_event  4,  3, ROUTE_32_RUINS_OF_ALPH_GATE, 4
	warp_event  6, 79, UNION_CAVE_1F, 4

	db 2 ; coord events
	coord_event 18,  8, SCENE_DEFAULT, Route32CooltrainerMStopsYouScene
	coord_event  7, 71, SCENE_ROUTE32_OFFER_SLOWPOKETAIL, Route32WannaBuyASlowpokeTailScript

	db 6 ; bg events
	bg_event 13,  5, BGEVENT_READ, Route32Sign
	bg_event  9,  1, BGEVENT_READ, Route32RuinsSign
	bg_event 10, 84, BGEVENT_READ, Route32UnionCaveSign
	bg_event 12, 73, BGEVENT_READ, Route32PokecenterSign
	bg_event 12, 67, BGEVENT_ITEM, Route32HiddenGreatBall
	bg_event 11, 40, BGEVENT_ITEM, Route32HiddenSuperPotion

	db 14 ; object events
	object_event  8, 49, SPRITE_FISHER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_TRAINER, 1, TrainerFisherJustin, -1
	object_event 12, 56, SPRITE_FISHER, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_TRAINER, 3, TrainerFisherRalph1, -1
	object_event  6, 48, SPRITE_FISHER, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_TRAINER, 1, TrainerFisherHenry, -1
	object_event 12, 22, SPRITE_YOUNGSTER, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 3, TrainerYoungsterAlbert, -1
	object_event  4, 63, SPRITE_YOUNGSTER, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 3, TrainerYoungsterGordon, -1
	object_event  3, 45, SPRITE_YOUNGSTER, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_TRAINER, 3, TrainerCamperRoland, -1
	object_event 10, 30, SPRITE_LASS, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_TRAINER, 1, TrainerPicnickerLiz1, -1
	object_event 19,  8, SPRITE_COOLTRAINER_M, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, Route32CooltrainerMScript, -1
	object_event 11, 82, SPRITE_YOUNGSTER, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 3, TrainerBirdKeeperPeter, -1
	object_event  7, 70, SPRITE_FISHER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, SlowpokeTailSalesmanScript, EVENT_SLOWPOKE_WELL_ROCKETS
	object_event  6, 53, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, Route32GreatBall, EVENT_ROUTE_32_GREAT_BALL
	object_event 15, 13, SPRITE_FISHER, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, Route32RoarTMGuyScript, -1
	object_event 12, 67, SPRITE_LASS, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, FriedaScript, EVENT_ROUTE_32_FRIEDA_OF_FRIDAY
	object_event  3, 30, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, Route32Repel, EVENT_ROUTE_32_REPEL
