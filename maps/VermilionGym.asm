	object_const_def ; object_event constants
	const VERMILIONGYM_SURGE
	const VERMILIONGYM_GENTLEMAN
	const VERMILIONGYM_ROCKER
	const VERMILIONGYM_SUPER_NERD
	const VERMILIONGYM_GYM_GUY

VermilionGym_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

VermilionGymSurgeScript:
	faceplayer
	opentext
	checkflag ENGINE_THUNDERBADGE
	iftrue .FightDone
	writetext LtSurgeIntroText
	waitbutton
	closetext
	winlosstext LtSurgeWinLossText, 0
	loadtrainer LT_SURGE, LT_SURGE1
	startbattle
	reloadmapafterbattle
	setevent EVENT_BEAT_LTSURGE
	setevent EVENT_BEAT_GENTLEMAN_GREGORY
	setevent EVENT_BEAT_GUITARIST_VINCENT
	setevent EVENT_BEAT_JUGGLER_HORTON
	opentext
	writetext ReceivedThunderBadgeText
	playsound SFX_GET_BADGE
	waitsfx
	setflag ENGINE_THUNDERBADGE
	writetext LtSurgeThunderBadgeText
	waitbutton
	closetext
	end

.FightDone:
	writetext LtSurgeFightDoneText
	waitbutton
	closetext
	end

TrainerGentlemanGregory:
	trainer GENTLEMAN, GREGORY, EVENT_BEAT_GENTLEMAN_GREGORY, GentlemanGregorySeenText, GentlemanGregoryBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext GentlemanGregoryAfterBattleText
	waitbutton
	closetext
	end

TrainerGuitaristVincent:
	trainer GUITARIST, VINCENT, EVENT_BEAT_GUITARIST_VINCENT, GuitaristVincentSeenText, GuitaristVincentBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext GuitaristVincentAfterBattleText
	waitbutton
	closetext
	end

TrainerJugglerHorton:
	trainer JUGGLER, HORTON, EVENT_BEAT_JUGGLER_HORTON, JugglerHortonSeenText, JugglerHortonBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext JugglerHortonAfterBattleText
	waitbutton
	closetext
	end

VermilionGymGuyScript:
	faceplayer
	opentext
	checkevent EVENT_BEAT_LTSURGE
	iftrue .VermilionGymGuyWinScript
	writetext VermilionGymGuyText
	waitbutton
	closetext
	end

.VermilionGymGuyWinScript:
	writetext VermilionGymGuyWinText
	waitbutton
	closetext
	end

VermilionGymTrashCan:
	jumptext VermilionGymTrashCanText

VermilionGymStatue:
	checkflag ENGINE_THUNDERBADGE
	iftrue .Beaten
	jumpstd gymstatue1
.Beaten:
	gettrainername STRING_BUFFER_4, LT_SURGE, LT_SURGE1
	jumpstd gymstatue2

LtSurgeIntroText:
	text "SURGE: ¡Eh, tú,"
	line "joven!"

	para "Tengo que recono-"
	line "cerlo. No es que"

	para "sea inteligente"
	line "desafiarme, ¡pero"
	cont "requiere agallas!"

	para "Cuando se trata de"
	line "#MON"

	para "eléctricos, ¡soy"
	line "el número uno!"

	para "Nunca he perdido"
	line "en la batalla."

	para "¡Te electrocutaré"
	line "como hice con el"

	para "enemigo en la"
	line "guerra!"
	done

LtSurgeWinLossText:
	text "SURGE: ¡Arrrgh!"
	line "¡Eres fuerte!"

	para "Vale, joven. ¡Toma"
	line "la MEDALLA TRUENO!"
	done

ReceivedThunderBadgeText:
	text "<PLAYER> recibió"
	line "la MEDALLA TRUENO."
	done

LtSurgeThunderBadgeText:
	text "SURGE: La MEDALLA"
	line "TRUENO aumenta la"

	para "VELOCIDAD de los"
	line "#MON."

	para "Te la mereces por"
	line "haberme vencido."

	para "Llévala con"
	line "orgullo, ¿me oyes?"
	done

LtSurgeFightDoneText:
	text "SURGE: ¡Eh, tú!"
	line "¿Todavía estás"

	para "molestando por"
	line "aquí?"

	para "¡Mis #MON y yo"
	line "seguimos en ello!"
	done

GentlemanGregorySeenText:
	text "¿Vienes a derrotar"
	line "al LT. SURGE?"

	para "¡No, si yo puedo"
	line "impedirlo!"
	done

GentlemanGregoryBeatenText:
	text "¡Cuánto siento"
	line "haberle fallado,"
	cont "LT. SURGE!"
	done

GentlemanGregoryAfterBattleText:
	text "Cuando aún estaba"
	line "en el ejército, el"

	para "LT. SURGE me salvó"
	line "la vida."
	done

GuitaristVincentSeenText:
	text "El LT. SURGE reco-"
	line "noció mi potencial"

	para "con los #MON"
	line "eléctricos."

	para "¿Crees que puedes"
	line "vencerme?"
	done

GuitaristVincentBeatenText:
	text "¡Ooh! ¡Increíble!"
	done

GuitaristVincentAfterBattleText:
	text "Si funcionaran las"
	line "trampas del"

	para "GIMNASIO, no lo"
	line "habrías logrado."
	done

JugglerHortonSeenText:
	text "¡Voy a acabar"
	line "contigo! ¡Vas a"
	cont "echar chispas!"
	done

JugglerHortonBeatenText:
	text "¡Vaya! Me has"
	line "vencido…"
	done

JugglerHortonAfterBattleText:
	text "No te relajes por"
	line "haberme vencido…"

	para "LT. SURGE es muy"
	line "fuerte."
	done

VermilionGymGuyText:
	text "¡Hola!"

	para "Esta vez no ten-"
	line "drás tanta suerte."

	para "El LT. SURGE es"
	line "muy prudente. Ha"

	para "puesto trampas por"
	line "todo el GIMNASIO."

	para "Pero (risas), las"
	line "trampas no están"
	cont "activadas."

	para "Te será fácil"
	line "encontrar a"
	cont "LT. SURGE."
	done

VermilionGymGuyWinText:
	text "¡Vaya combate más"
	line "electrizante!"

	para "¡Me has puesto"
	line "muy nervioso!"
	done

VermilionGymTrashCanText:
	text "¡Bah! Aquí sólo"
	line "hay basura."
	done

VermilionGym_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event  4, 17, VERMILION_CITY, 7
	warp_event  5, 17, VERMILION_CITY, 7

	db 0 ; coord events

	db 17 ; bg events
	bg_event  1,  7, BGEVENT_READ, VermilionGymTrashCan
	bg_event  3,  7, BGEVENT_READ, VermilionGymTrashCan
	bg_event  5,  7, BGEVENT_READ, VermilionGymTrashCan
	bg_event  7,  7, BGEVENT_READ, VermilionGymTrashCan
	bg_event  9,  7, BGEVENT_READ, VermilionGymTrashCan
	bg_event  1,  9, BGEVENT_READ, VermilionGymTrashCan
	bg_event  3,  9, BGEVENT_READ, VermilionGymTrashCan
	bg_event  5,  9, BGEVENT_READ, VermilionGymTrashCan
	bg_event  7,  9, BGEVENT_READ, VermilionGymTrashCan
	bg_event  9,  9, BGEVENT_READ, VermilionGymTrashCan
	bg_event  1, 11, BGEVENT_READ, VermilionGymTrashCan
	bg_event  3, 11, BGEVENT_READ, VermilionGymTrashCan
	bg_event  5, 11, BGEVENT_READ, VermilionGymTrashCan
	bg_event  7, 11, BGEVENT_READ, VermilionGymTrashCan
	bg_event  9, 11, BGEVENT_READ, VermilionGymTrashCan
	bg_event  3, 15, BGEVENT_READ, VermilionGymStatue
	bg_event  6, 15, BGEVENT_READ, VermilionGymStatue

	db 5 ; object events
	object_event  5,  2, SPRITE_SURGE, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, VermilionGymSurgeScript, -1
	object_event  8,  8, SPRITE_GENTLEMAN, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 4, TrainerGentlemanGregory, -1
	object_event  4,  7, SPRITE_ROCKER, SPRITEMOVEDATA_STANDING_DOWN, 3, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 3, TrainerGuitaristVincent, -1
	object_event  0, 10, SPRITE_SUPER_NERD, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 4, TrainerJugglerHorton, -1
	object_event  7, 15, SPRITE_GYM_GUY, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 1, VermilionGymGuyScript, -1
