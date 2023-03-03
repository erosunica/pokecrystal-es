	object_const_def ; object_event constants
	const ROUTE39_SAILOR
	const ROUTE39_POKEFAN_M
	const ROUTE39_POKEFAN_F1
	const ROUTE39_MILTANK1
	const ROUTE39_MILTANK2
	const ROUTE39_MILTANK3
	const ROUTE39_MILTANK4
	const ROUTE39_PSYCHIC_NORMAN
	const ROUTE39_FRUIT_TREE
	const ROUTE39_POKEFAN_F2

Route39_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

Route39Miltank:
	opentext
	writetext Route39MiltankText
	cry MILTANK
	waitbutton
	closetext
	end

TrainerPokefanmDerek:
	trainer POKEFANM, DEREK1, EVENT_BEAT_POKEFANM_DEREK, PokefanmDerekSeenText, PokefanmDerekBeatenText, 0, .Script

.Script:
	loadvar VAR_CALLERID, PHONE_POKEFANM_DEREK
	endifjustbattled
	opentext
	checkflag ENGINE_DEREK_HAS_NUGGET
	iftrue .HasNugget
	checkcellnum PHONE_POKEFANM_DEREK
	iftrue .NumberAccepted
	checkpoke PIKACHU
	iffalse .WantsPikachu
	checkevent EVENT_DEREK_ASKED_FOR_PHONE_NUMBER
	iftrue .AskedAlready
	writetext PokefanMDerekText_NotBragging
	promptbutton
	setevent EVENT_DEREK_ASKED_FOR_PHONE_NUMBER
	scall .AskNumber1
	sjump .AskForNumber

.AskedAlready:
	scall .AskNumber2
.AskForNumber:
	askforphonenumber PHONE_POKEFANM_DEREK
	ifequal PHONE_CONTACTS_FULL, .PhoneFull
	ifequal PHONE_CONTACT_REFUSED, .NumberDeclined
	gettrainername STRING_BUFFER_3, POKEFANM, DEREK1
	scall .RegisteredNumber
	sjump .NumberAccepted

.HasNugget:
	scall .Gift
	verbosegiveitem NUGGET
	iffalse .NoRoom
	clearflag ENGINE_DEREK_HAS_NUGGET
	sjump .NumberAccepted

.NoRoom:
	sjump .PackFull

.WantsPikachu:
	writetext PokefanMDerekPikachuIsItText
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

.Gift:
	jumpstd giftm
	end

.PackFull:
	jumpstd packfullm
	end

TrainerPokefanfRuth:
	trainer POKEFANF, RUTH, EVENT_BEAT_POKEFANF_RUTH, PokefanfRuthSeenText, PokefanfRuthBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext PokefanfRuthAfterBattleText
	waitbutton
	closetext
	end

TrainerSailorEugene:
	trainer SAILOR, EUGENE, EVENT_BEAT_SAILOR_EUGENE, SailorEugeneSeenText, SailorEugeneBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext SailorEugeneAfterBattleText
	waitbutton
	closetext
	end

TrainerPsychicNorman:
	trainer PSYCHIC_T, NORMAN, EVENT_BEAT_PSYCHIC_NORMAN, PsychicNormanSeenText, PsychicNormanBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext PsychicNormanAfterBattleText
	waitbutton
	closetext
	end

TrainerPokefanfJaime:
	faceplayer
	opentext
	checktime NITE
	iffalse .NotNight
	checkevent EVENT_BEAT_POKEFANF_JAIME
	iftrue .Beaten
	writetext PokefanfJaimeSeenText
	waitbutton
	closetext
	winlosstext PokefanfJaimeBeatenText, 0
	loadtrainer POKEFANF, JAIME
	startbattle
	reloadmapafterbattle
	setevent EVENT_BEAT_POKEFANF_JAIME
	closetext
	end

.Beaten:
	writetext PokefanfJaimeAfterBattleText
	waitbutton
	closetext
	end

.NotNight:
	writetext PokefanfJaimeHopeItGetsDarkText
	waitbutton
	closetext
	end

Route39Sign:
	jumptext Route39SignText

MoomooFarmSign:
	jumptext MoomooFarmSignText

Route39TrainerTips:
	jumptext Route39TrainerTipsText

Route39FruitTree:
	fruittree FRUITTREE_ROUTE_39

Route39HiddenNugget:
	hiddenitem NUGGET, EVENT_ROUTE_39_HIDDEN_NUGGET

Route39MiltankText:
	text "MUU-MUU: ¡Muu!"
	done

SailorEugeneSeenText:
	text "Acabo de volver a"
	line "CIUDAD OLIVO."

	para "¿Te apetece luchar"
	line "con los #MON?"
	done

SailorEugeneBeatenText:
	text "¡Awaaargh!"
	done

SailorEugeneAfterBattleText:
	text "Mis #MON han"
	line "sido atrapados y"

	para "entrenados en el"
	line "extranjero."

	para "Me han acompañado"
	line "en esos largos"
	cont "viajes."
	done

PokefanmDerekSeenText:
	text "¡Es buen momento"
	line "para alardear de"
	cont "mi PIKACHU!"
	done

PokefanmDerekBeatenText:
	text "No tuve tiempo de"
	line "presumir de mi"
	cont "PIKACHU…"
	done

PokefanMDerekText_NotBragging:
	text "¡No te estoy"
	line "escuchando!"

	para "¡Los #FANS"
	line "tenemos por norma"

	para "no escuchar a la"
	line "gente presumida!"
	done

PokefanfRuthSeenText:
	text "¡Qué #MON más"
	line "encantadores!"

	para "Enseñemos nuestros"
	line "#MON al mismo"
	cont "tiempo."
	done

PokefanfRuthBeatenText:
	text "No me importa"
	line "perder."
	done

PokefanfRuthAfterBattleText:
	text "¿Sabes algo sobre"
	line "los #MON bebés?"

	para "¡Seguro que son"
	line "adorables!"
	done

PokefanMDerekPikachuIsItText:
	text "¡PIKACHU es lo"
	line "más! ¿No crees?"
	done

PsychicNormanSeenText:
	text "Déjame ver de qué"
	line "son capaces tus"
	cont "#MON."
	done

PsychicNormanBeatenText:
	text "¡Ooh! Tus #MON"
	line "tienen potencial."
	done

PsychicNormanAfterBattleText:
	text "¿Sabes que los"
	line "#MON tienen"

	para "distintas"
	line "habilidades?"

	para "Son como las"
	line "personas. Cada uno"

	para "tiene su propio"
	line "potencial."
	done

PokefanfJaimeHopeItGetsDarkText:
	text "Ufufufu… Espero"
	line "que oscurezca"
	cont "pronto."
	done

PokefanfJaimeSeenText:
	text "Llegas justo a"
	line "tiempo."

	para "Luchemos."
	done

PokefanfJaimeBeatenText:
	text "Oh, qué"
	line "decepcionante…"
	done

PokefanfJaimeAfterBattleText:
	text "Encontré mi MEOWTH"
	line "aquí por la noche,"
	cont "en la RUTA 39."

	para "No estoy segura,"
	line "pero parece que"

	para "le gusta que me"
	line "entrene aquí."

	para "Cuando estamos por"
	line "esta zona, se"

	para "vuelve más cari-"
	line "ñoso."
	done

Route39SignText:
	text "RUTA 39"

	para "CIUDAD OLIVO -"
	line "CIUDAD IRIS"
	done

MoomooFarmSignText:
	text "GRANJA MUU-MUU"

	para "Prueba nuestra"
	line "rica leche fresca"
	done

Route39TrainerTipsText:
	text "PISTAS ENTRENADOR"

	para "Usa GOLPE CABEZA"
	line "en los árboles"

	para "para que salgan"
	line "#MON."

	para "De los árboles"
	line "pueden caer varios"
	cont "tipos de #MON"
	done

Route39_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event  1,  3, ROUTE_39_BARN, 1
	warp_event  5,  3, ROUTE_39_FARMHOUSE, 1

	db 0 ; coord events

	db 4 ; bg events
	bg_event  5, 31, BGEVENT_READ, Route39TrainerTips
	bg_event  9,  5, BGEVENT_READ, MoomooFarmSign
	bg_event 15,  7, BGEVENT_READ, Route39Sign
	bg_event  5, 13, BGEVENT_ITEM, Route39HiddenNugget

	db 10 ; object events
	object_event 13, 29, SPRITE_SAILOR, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 5, TrainerSailorEugene, -1
	object_event 10, 22, SPRITE_POKEFAN_M, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 4, TrainerPokefanmDerek, -1
	object_event 11, 19, SPRITE_POKEFAN_F, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 4, TrainerPokefanfRuth, -1
	object_event  3, 12, SPRITE_TAUROS, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, Route39Miltank, -1
	object_event  6, 11, SPRITE_TAUROS, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, Route39Miltank, -1
	object_event  4, 15, SPRITE_TAUROS, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, Route39Miltank, -1
	object_event  8, 13, SPRITE_TAUROS, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, Route39Miltank, -1
	object_event 13,  7, SPRITE_STANDING_YOUNGSTER, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 1, TrainerPsychicNorman, -1
	object_event  9,  3, SPRITE_FRUIT_TREE, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, Route39FruitTree, -1
	object_event  4, 22, SPRITE_POKEFAN_F, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, TrainerPokefanfJaime, -1
