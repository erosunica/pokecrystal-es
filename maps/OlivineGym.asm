	object_const_def ; object_event constants
	const OLIVINEGYM_JASMINE
	const OLIVINEGYM_GYM_GUY

OlivineGym_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

OlivineGymJasmineScript:
	faceplayer
	opentext
	checkevent EVENT_BEAT_JASMINE
	iftrue .FightDone
	writetext Jasmine_SteelTypeIntro
	waitbutton
	closetext
	winlosstext Jasmine_BetterTrainer, 0
	loadtrainer JASMINE, JASMINE1
	startbattle
	reloadmapafterbattle
	setevent EVENT_BEAT_JASMINE
	opentext
	writetext Text_ReceivedMineralBadge
	playsound SFX_GET_BADGE
	waitsfx
	setflag ENGINE_MINERALBADGE
	readvar VAR_BADGES
	scall OlivineGymActivateRockets
.FightDone:
	checkevent EVENT_GOT_TM23_IRON_TAIL
	iftrue .GotIronTail
	writetext Jasmine_BadgeSpeech
	promptbutton
	verbosegiveitem TM_IRON_TAIL
	iffalse .NoRoomForIronTail
	setevent EVENT_GOT_TM23_IRON_TAIL
	writetext Jasmine_IronTailSpeech
	waitbutton
	closetext
	end

.GotIronTail:
	writetext Jasmine_GoodLuck
	waitbutton
.NoRoomForIronTail:
	closetext
	end

OlivineGymActivateRockets:
	ifequal 7, .RadioTowerRockets
	ifequal 6, .GoldenrodRockets
	end

.GoldenrodRockets:
	jumpstd goldenrodrockets

.RadioTowerRockets:
	jumpstd radiotowerrockets

OlivineGymGuyScript:
	faceplayer
	checkevent EVENT_BEAT_JASMINE
	iftrue .OlivineGymGuyWinScript
	checkevent EVENT_JASMINE_RETURNED_TO_GYM
	iffalse .OlivineGymGuyPreScript
	opentext
	writetext OlivineGymGuyText
	waitbutton
	closetext
	end

.OlivineGymGuyWinScript:
	opentext
	writetext OlivineGymGuyWinText
	waitbutton
	closetext
	end

.OlivineGymGuyPreScript:
	opentext
	writetext OlivineGymGuyPreText
	waitbutton
	closetext
	end

OlivineGymStatue:
	checkflag ENGINE_MINERALBADGE
	iftrue .Beaten
	jumpstd gymstatue1
.Beaten:
	gettrainername STRING_BUFFER_4, JASMINE, JASMINE1
	jumpstd gymstatue2

Jasmine_SteelTypeIntro:
	text "Gracias por"
	line "ayudarnos en el"
	cont "FARO…"

	para "Pero esto es"
	line "distinto. Déjame"
	cont "que me presente."

	para "Soy YASMINA, una"
	line "LÍDER de GIMNASIO."

	para "Uso el tipo acero."

	para "¿Sabes algo del"
	line "tipo acero?"

	para "Fue descubierto"
	line "hace poco tiempo."

	para "¡Um…! ¡Veamos!"
	done

Jasmine_BetterTrainer:
	text "Eres mejor que yo,"
	line "tanto en habilidad"
	cont "como en simpatía."

	para "De acuerdo con las"
	line "normas de la LIGA,"

	para "te concedo esta"
	line "MEDALLA."
	done

Text_ReceivedMineralBadge:
	text "<PLAYER> recibió la"
	line "MEDALLA MINERAL."
	done

Jasmine_BadgeSpeech:
	text "La MEDALLA MINERAL"
	line "aumenta la DEFENSA"
	cont "de los #MON."

	para "¡Eh…! Toma"
	line "esto también…"
	done

Text_ReceivedTM09:
	text "<PLAYER> recibió la"
	line "MT09."
	done

Jasmine_IronTailSpeech:
	text "Usa esta MT para"
	line "enseñar COLA"
	cont "FÉRREA."
	done

Jasmine_GoodLuck:
	text "Eh… No sé"
	line "cómo decirlo, pero"
	cont "buena suerte…"
	done

OlivineGymGuyText:
	text "YASMINA usa el"
	line "tipo acero recién"
	cont "descubierto."

	para "No sé mucho sobre"
	line "ese tipo."
	done

OlivineGymGuyWinText:
	text "Ha sido increíble."

	para "El tipo acero se"
	line "las trae, ¿eh?"

	para "¡No había visto un"
	line "combate así en mi"
	cont "vida!"
	done

OlivineGymGuyPreText:
	text "YASMINA, la LÍDER"
	line "del GIMNASIO, está"
	cont "en el FARO."

	para "Ha estado cuidando"
	line "a un #MON"
	cont "enfermo."

	para "Un buen entrenador"
	line "debe ser"
	cont "compasivo."
	done

OlivineGym_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event  4, 15, OLIVINE_CITY, 2
	warp_event  5, 15, OLIVINE_CITY, 2

	db 0 ; coord events

	db 2 ; bg events
	bg_event  3, 13, BGEVENT_READ, OlivineGymStatue
	bg_event  6, 13, BGEVENT_READ, OlivineGymStatue

	db 2 ; object events
	object_event  5,  3, SPRITE_JASMINE, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, OlivineGymJasmineScript, EVENT_OLIVINE_GYM_JASMINE
	object_event  7, 13, SPRITE_GYM_GUY, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, OlivineGymGuyScript, -1
