	object_const_def ; object_event constants
	const VIOLETPOKECENTER1F_NURSE
	const VIOLETPOKECENTER1F_GAMEBOY_KID
	const VIOLETPOKECENTER1F_GENTLEMAN
	const VIOLETPOKECENTER1F_YOUNGSTER
	const VIOLETPOKECENTER1F_ELMS_AIDE

VioletPokecenter1F_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

VioletPokecenterNurse:
	jumpstd pokecenternurse

VioletPokecenter1F_ElmsAideScript:
	faceplayer
	opentext
	checkevent EVENT_REFUSED_TO_TAKE_EGG_FROM_ELMS_AIDE
	iftrue .SecondTimeAsking
	writetext VioletPokecenterElmsAideFavorText
.AskTakeEgg:
	yesorno
	iffalse .RefusedEgg
	readvar VAR_PARTYCOUNT
	ifequal PARTY_LENGTH, .PartyFull
	giveegg TOGEPI, 5
	getstring STRING_BUFFER_4, .eggname
	scall .AideGivesEgg
	setevent EVENT_GOT_TOGEPI_EGG_FROM_ELMS_AIDE
	clearevent EVENT_ELMS_AIDE_IN_LAB
	clearevent EVENT_TOGEPI_HATCHED
	setmapscene ROUTE_32, SCENE_ROUTE32_OFFER_SLOWPOKETAIL
	writetext VioletPokecenterElmsAideGiveEggText
	waitbutton
	closetext
	readvar VAR_FACING
	ifequal UP, .AideWalksAroundPlayer
	turnobject PLAYER, DOWN
	applymovement VIOLETPOKECENTER1F_ELMS_AIDE, MovementData_AideWalksStraightOutOfPokecenter
	playsound SFX_EXIT_BUILDING
	disappear VIOLETPOKECENTER1F_ELMS_AIDE
	waitsfx
	end

.AideWalksAroundPlayer:
	applymovement VIOLETPOKECENTER1F_ELMS_AIDE, MovementData_AideWalksLeftToExitPokecenter
	turnobject PLAYER, DOWN
	applymovement VIOLETPOKECENTER1F_ELMS_AIDE, MovementData_AideFinishesLeavingPokecenter
	playsound SFX_EXIT_BUILDING
	disappear VIOLETPOKECENTER1F_ELMS_AIDE
	waitsfx
	end

.eggname
	db "HUEVO@"

.AideGivesEgg:
	jumpstd receivetogepiegg
	end

.PartyFull:
	writetext VioletCityElmsAideFullPartyText
	waitbutton
	closetext
	end

.RefusedEgg:
	writetext VioletPokecenterElmsAideRefuseText
	waitbutton
	closetext
	setevent EVENT_REFUSED_TO_TAKE_EGG_FROM_ELMS_AIDE
	end

.SecondTimeAsking:
	writetext VioletPokecenterElmsAideAskEggText
	sjump .AskTakeEgg

VioletPokecenter1FGameboyKidScript:
	jumptextfaceplayer VioletPokecenter1FGameboyKidText

VioletPokecenter1FGentlemanScript:
	jumptextfaceplayer VioletPokecenter1FGentlemanText

VioletPokecenter1FYoungsterScript:
	jumptextfaceplayer VioletPokecenter1FYoungsterText

MovementData_AideWalksStraightOutOfPokecenter:
	step DOWN
	step DOWN
	step DOWN
	step DOWN
	step_end

MovementData_AideWalksLeftToExitPokecenter:
	step LEFT
	step DOWN
	step_end

MovementData_AideFinishesLeavingPokecenter:
	step DOWN
	step DOWN
	step DOWN
	step_end

VioletPokecenterElmsAideFavorText:
	text "<PLAY_G>, cuánto"
	line "tiempo. El PROF."

	para "ELM me pidió que"
	line "te buscara."

	para "Tiene que pedirte"
	line "otro favor."

	para "¿Puedes llevar el"
	line "HUEVO #MON?"
	done

VioletPokecenterElmsAideGiveEggText:
	text "Descubrimos que el"
	line "#MON no saldrá"

	para "hasta que no haya"
	line "crecido dentro del"
	cont "HUEVO."

	para "Además, tiene que"
	line "ir acompañado de"
	cont "#MON activos."

	para "<PLAY_G>, eres"
	line "la única persona"

	para "en la que podemos"
	line "confiar."

	para "¡Por favor, llama"
	line "al PROF. ELM"

	para "cuando eclosione"
	line "el HUEVO!"
	done

VioletCityElmsAideFullPartyText:
	text "¡Oh, no! No puedes"
	line "llevar más"
	cont "#MON."

	para "Esperaré aquí a"
	line "que le hagas"
	cont "sitio al HUEVO."
	done

VioletPokecenterElmsAideRefuseText:
	text "Pero…"
	line "El PROF. ELM"
	cont "preguntó por ti."
	done

VioletPokecenterElmsAideAskEggText:
	text "<PLAY_G>, ¿tomas"
	line "el HUEVO?"
	done

; unused
VioletPokecenterFarawayLinkText:
	text "He pensado que"
	line "sería genial co-"
	cont "nectarme y luchar"
	cont "con mis amigos que"
	cont "viven lejos."
	done

; unused
VioletPokecenterMobileAdapterText:
	text "Combatí con un"
	line "amigo de ORQUÍDEA"

	para "mediante un enlace"
	line "móvil."

	para "Si conectas un"
	line "ADAPTADOR DE MÓVIL"

	para "puedes enlazar con"
	line "un/a amigo/a"
	cont "lejano/a."
	done

VioletPokecenter1FGameboyKidText:
	text "Un tal BILL creó"
	line "el Sistema de"

	para "Almacenamiento"
	line "de #MON."
	done

VioletPokecenter1FGentlemanText:
	text "Fue hace unos tres"
	line "años."

	para "El TEAM ROCKET"
	line "quería hacer daño"
	cont "a los #MON."

	para "Pero prevaleció la"
	line "justicia y un niño"
	cont "acabó con ellos."
	done

VioletPokecenter1FYoungsterText:
	text "Los #MON son"
	line "listos y no"

	para "obedecen a quien"
	line "no respetan."

	para "Sin las MEDALLAS"
	line "necesarias, harán"

	para "lo que ellos"
	line "quieran."
	done

VioletPokecenter1F_MapEvents:
	db 0, 0 ; filler

	db 3 ; warp events
	warp_event  3,  7, VIOLET_CITY, 5
	warp_event  4,  7, VIOLET_CITY, 5
	warp_event  0,  7, POKECENTER_2F, 1

	db 0 ; coord events

	db 0 ; bg events

	db 5 ; object events
	object_event  3,  1, SPRITE_NURSE, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, VioletPokecenterNurse, -1
	object_event  7,  6, SPRITE_GAMEBOY_KID, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, VioletPokecenter1FGameboyKidScript, -1
	object_event  1,  4, SPRITE_GENTLEMAN, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, VioletPokecenter1FGentlemanScript, -1
	object_event  8,  1, SPRITE_YOUNGSTER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, VioletPokecenter1FYoungsterScript, -1
	object_event  4,  3, SPRITE_SCIENTIST, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, VioletPokecenter1F_ElmsAideScript, EVENT_ELMS_AIDE_IN_VIOLET_POKEMON_CENTER
