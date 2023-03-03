	object_const_def ; object_event constants
	const RADIOTOWER3F_SUPER_NERD
	const RADIOTOWER3F_GYM_GUY
	const RADIOTOWER3F_COOLTRAINER_F
	const RADIOTOWER3F_ROCKET1
	const RADIOTOWER3F_ROCKET2
	const RADIOTOWER3F_ROCKET3
	const RADIOTOWER3F_SCIENTIST

RadioTower3F_MapScripts:
	db 0 ; scene scripts

	db 1 ; callbacks
	callback MAPCALLBACK_TILES, .CardKeyShutterCallback

.CardKeyShutterCallback:
	checkevent EVENT_USED_THE_CARD_KEY_IN_THE_RADIO_TOWER
	iftrue .Change
	return

.Change:
	changeblock 14, 2, $2a ; open shutter
	changeblock 14, 4, $01 ; floor
	return

RadioTower3FSuperNerdScript:
	jumptextfaceplayer RadioTower3FSuperNerdText

RadioTower3FGymGuyScript:
	faceplayer
	opentext
	checkevent EVENT_CLEARED_RADIO_TOWER
	iftrue .NoRockets
	writetext RadioTower3FGymGuyText_Rockets
	waitbutton
	closetext
	end

.NoRockets:
	writetext RadioTower3FGymGuyText
	waitbutton
	closetext
	end

RadioTower3FCooltrainerFScript:
	faceplayer
	opentext
	checkevent EVENT_GOT_SUNNY_DAY_FROM_RADIO_TOWER
	iftrue .GotSunnyDay
	checkevent EVENT_CLEARED_RADIO_TOWER
	iftrue .NoRockets
	checkevent EVENT_USED_THE_CARD_KEY_IN_THE_RADIO_TOWER
	iftrue .UsedCardKey
	writetext RadioTower3FCooltrainerFPleaseSaveDirectorText
	waitbutton
	closetext
	end

.UsedCardKey:
	writetext RadioTower3FCooltrainerFIsDirectorSafeText
	waitbutton
	closetext
	end

.NoRockets:
	writetext RadioTower3FCooltrainerFYoureMyHeroText
	promptbutton
	verbosegiveitem TM_SUNNY_DAY
	iffalse .NoRoom
	writetext RadioTower3FCooltrainerFItsSunnyDayText
	waitbutton
	closetext
	setevent EVENT_GOT_SUNNY_DAY_FROM_RADIO_TOWER
	end

.GotSunnyDay:
	writetext RadioTower3FCooltrainerFYouWereMarvelousText
	waitbutton
.NoRoom:
	closetext
	end

TrainerGruntM7:
	trainer GRUNTM, GRUNTM_7, EVENT_BEAT_ROCKET_GRUNTM_7, GruntM7SeenText, GruntM7BeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext GruntM7AfterBattleText
	waitbutton
	closetext
	end

TrainerGruntM8:
	trainer GRUNTM, GRUNTM_8, EVENT_BEAT_ROCKET_GRUNTM_8, GruntM8SeenText, GruntM8BeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext GruntM8AfterBattleText
	waitbutton
	closetext
	end

TrainerGruntM9:
	trainer GRUNTM, GRUNTM_9, EVENT_BEAT_ROCKET_GRUNTM_9, GruntM9SeenText, GruntM9BeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext GruntM9AfterBattleText
	waitbutton
	closetext
	end

TrainerScientistMarc:
	trainer SCIENTIST, MARC, EVENT_BEAT_SCIENTIST_MARC, ScientistMarcSeenText, ScientistMarcBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext ScientistMarcAfterBattleText
	waitbutton
	closetext
	end

CardKeySlotScript::
	opentext
	writetext RadioTower3FCardKeySlotText
	waitbutton
	checkevent EVENT_USED_THE_CARD_KEY_IN_THE_RADIO_TOWER
	iftrue .UsedCardKey
	checkitem CARD_KEY
	iftrue .HaveCardKey
.UsedCardKey:
	closetext
	end

.HaveCardKey:
	writetext InsertedTheCardKeyText
	waitbutton
	setevent EVENT_USED_THE_CARD_KEY_IN_THE_RADIO_TOWER
	playsound SFX_ENTER_DOOR
	changeblock 14, 2, $2a ; open shutter
	changeblock 14, 4, $01 ; floor
	reloadmappart
	closetext
	waitsfx
	end

RadioTower3FPersonnelSign:
	jumptext RadioTower3FPersonnelSignText

RadioTower3FPokemonMusicSign:
	jumptext RadioTower3FPokemonMusicSignText

RadioTower3FSuperNerdText:
	text "Hemos grabado los"
	line "gritos de todos"

	para "los #MON"
	line "descubiertos."

	para "Debemos de tener"
	line "unos 200 tipos."
	done

RadioTower3FGymGuyText_Rockets:
	text "Los #MON son"
	line "muy queridos por"
	cont "sus entrenadores."

	para "Es horrible ver"
	line "cómo trata el"

	para "TEAM ROCKET"
	line "a los #MON."
	done

RadioTower3FGymGuyText:
	text "Emitimos programas"
	line "de entretenimiento"

	para "las 24 horas del"
	line "día."

	para "¡Intentaremos"
	line "hacerlo lo mejor"
	cont "posible!"
	done

RadioTower3FCooltrainerFPleaseSaveDirectorText:
	text "El jefe del TEAM"
	line "ROCKET se ha"
	cont "encerrado."

	para "Pero el DIRECTOR"
	line "puede abrirle."

	para "Está en el cuarto"
	line "piso."

	para "¡Sálvale!"
	done

RadioTower3FCooltrainerFIsDirectorSafeText:
	text "¿Está a salvo el"
	line "DIRECTOR?"
	done

RadioTower3FCooltrainerFYoureMyHeroText:
	text "¡Gracias!"
	line "¡Eres genial!"

	para "Toma esto como"
	line "agradecimiento."
	done

RadioTower3FCooltrainerFItsSunnyDayText:
	text "¡Es DÍA SOLEADO!"
	line "Mejora movimientos"

	para "del tipo fuego"
	line "durante un tiempo."
	done

RadioTower3FCooltrainerFYouWereMarvelousText:
	text "¡Estuviste"
	line "genial!"
	done

GruntM7SeenText:
	text "He recibido"
	line "órdenes."

	para "¡Aplastaré a todo"
	line "aquel que desafíe"
	cont "al TEAM ROCKET!"
	done

GruntM7BeatenText:
	text "¿¡Qué!?"
	done

GruntM7AfterBattleText:
	text "No he cumplido con"
	line "mi deber…"

	para "Me van a bajar el"
	line "sueldo…"
	done

GruntM8SeenText:
	text "Me encanta ordenar"
	line "a los #MON que"
	cont "cometan delitos."
	done

GruntM8BeatenText:
	text "¿Bromeas?"
	done

GruntM8AfterBattleText:
	text "¡No me gusta"
	line "perder!"

	para "¡Odio a los"
	line "#MON inútiles!"
	done

GruntM9SeenText:
	text "¿Por qué se abrió"
	line "la puerta?"

	para "¿Acaso has tenido"
	line "algo que ver?"
	done

GruntM9BeatenText:
	text "¡Es mi fin!"
	done

GruntM9AfterBattleText:
	text "¿Qué? ¿Esquivaste"
	line "a nuestros hombres"
	cont "del SUBTERRÁNEO?"

	para "¿Cómo lo hiciste?"
	done

ScientistMarcSeenText:
	text "¿Qué haces mero-"
	line "deando por aquí?"

	para "¿Quién eres?"
	done

ScientistMarcBeatenText:
	text "¡Vaya! ¡No te tomé"
	line "muy en serio!"
	done

ScientistMarcAfterBattleText:
	text "¡Jajajajaja…!"

	para "Desde aquí puedo"
	line "transmitir todo"
	cont "tipo de señales."
	done

RadioTower3FCardKeySlotText:
	text "Es la ranura de la"
	line "LLAVE MAGNÉTICA."
	done

InsertedTheCardKeyText:
	text "<PLAYER> usó la"
	line "LLAVE MAGNÉTICA."
	done

RadioTower3FPersonnelSignText:
	text "P2 PERSONAL"
	done

RadioTower3FPokemonMusicSignText:
	text "MÚSICA #MON"
	line "con el DJ NARDO"
	done

RadioTower3F_MapEvents:
	db 0, 0 ; filler

	db 3 ; warp events
	warp_event  0,  0, RADIO_TOWER_2F, 1
	warp_event  7,  0, RADIO_TOWER_4F, 2
	warp_event 17,  0, RADIO_TOWER_4F, 4

	db 0 ; coord events

	db 3 ; bg events
	bg_event  3,  0, BGEVENT_READ, RadioTower3FPersonnelSign
	bg_event  9,  0, BGEVENT_READ, RadioTower3FPokemonMusicSign
	bg_event 14,  2, BGEVENT_UP, CardKeySlotScript

	db 7 ; object events
	object_event  7,  4, SPRITE_SUPER_NERD, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, RadioTower3FSuperNerdScript, EVENT_RADIO_TOWER_CIVILIANS_AFTER
	object_event  3,  4, SPRITE_GYM_GUY, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, RadioTower3FGymGuyScript, -1
	object_event 11,  3, SPRITE_COOLTRAINER_F, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, RadioTower3FCooltrainerFScript, -1
	object_event  5,  1, SPRITE_ROCKET, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, 0, OBJECTTYPE_TRAINER, 2, TrainerGruntM7, EVENT_RADIO_TOWER_ROCKET_TAKEOVER
	object_event  6,  2, SPRITE_ROCKET, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_TRAINER, 3, TrainerGruntM8, EVENT_RADIO_TOWER_ROCKET_TAKEOVER
	object_event 16,  6, SPRITE_ROCKET, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, 0, OBJECTTYPE_TRAINER, 3, TrainerGruntM9, EVENT_RADIO_TOWER_ROCKET_TAKEOVER
	object_event  9,  6, SPRITE_SCIENTIST, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 5, TrainerScientistMarc, EVENT_RADIO_TOWER_ROCKET_TAKEOVER
