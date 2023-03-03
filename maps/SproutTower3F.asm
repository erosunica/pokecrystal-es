	object_const_def ; object_event constants
	const SPROUTTOWER3F_SAGE1
	const SPROUTTOWER3F_SAGE2
	const SPROUTTOWER3F_SAGE3
	const SPROUTTOWER3F_SAGE4
	const SPROUTTOWER3F_POKE_BALL1
	const SPROUTTOWER3F_POKE_BALL2
	const SPROUTTOWER3F_SILVER

SproutTower3F_MapScripts:
	db 2 ; scene scripts
	scene_script .DummyScene0 ; SCENE_DEFAULT
	scene_script .DummyScene1 ; SCENE_FINISHED

	db 0 ; callbacks

.DummyScene0:
	end

.DummyScene1:
	end

SproutTower3FRivalScene:
	turnobject PLAYER, UP
	showemote EMOTE_SHOCK, PLAYER, 15
	special FadeOutMusic
	playsound SFX_TACKLE
	playsound SFX_ELEVATOR
	earthquake 79
	pause 15
	playsound SFX_TACKLE
	playsound SFX_ELEVATOR
	earthquake 79
	applymovement PLAYER, MovementData_0x184a1d
	applymovement SPROUTTOWER3F_SILVER, MovementData_0x184a22
	opentext
	writetext SproutTowerElderLecturesRivalText
	waitbutton
	closetext
	showemote EMOTE_SHOCK, SPROUTTOWER3F_SILVER, 15
	turnobject SPROUTTOWER3F_SILVER, DOWN
	pause 15
	applymovement SPROUTTOWER3F_SILVER, MovementData_0x184a24
	playmusic MUSIC_RIVAL_ENCOUNTER
	opentext
	writetext SproutTowerRivalOnlyCareAboutStrongText
	waitbutton
	closetext
	turnobject SPROUTTOWER3F_SILVER, UP
	opentext
	writetext SproutTowerRivalUsedEscapeRopeText
	pause 15
	closetext
	playsound SFX_WARP_TO
	special FadeBlackQuickly
	special ReloadSpritesNoPalettes
	disappear SPROUTTOWER3F_SILVER
	waitsfx
	special FadeInQuickly
	setscene SCENE_FINISHED
	special RestartMapMusic
	end

SageLiScript:
	faceplayer
	opentext
	checkevent EVENT_GOT_HM05_FLASH
	iftrue .GotFlash
	writetext SageLiSeenText
	waitbutton
	closetext
	winlosstext SageLiBeatenText, 0
	loadtrainer SAGE, LI
	startbattle
	reloadmapafterbattle
	opentext
	writetext SageLiTakeThisFlashText
	promptbutton
	verbosegiveitem HM_FLASH
	setevent EVENT_GOT_HM05_FLASH
	setevent EVENT_BEAT_SAGE_LI
	writetext SageLiFlashExplanationText
	waitbutton
	closetext
	end

.GotFlash:
	writetext SageLiAfterBattleText
	waitbutton
	closetext
	end

TrainerSageJin:
	trainer SAGE, JIN, EVENT_BEAT_SAGE_JIN, SageJinSeenText, SageJinBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext SageJinAfterBattleText
	waitbutton
	closetext
	end

TrainerSageTroy:
	trainer SAGE, TROY, EVENT_BEAT_SAGE_TROY, SageTroySeenText, SageTroyBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext SageTroyAfterBattleText
	waitbutton
	closetext
	end

TrainerSageNeal:
	trainer SAGE, NEAL, EVENT_BEAT_SAGE_NEAL, SageNealSeenText, SageNealBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext SageNealAfterBattleText
	waitbutton
	closetext
	end

SproutTower3FPainting:
	jumptext SproutTower3FPaintingText

SproutTower3FStatue:
	jumptext SproutTower3FStatueText

SproutTower3FPotion:
	itemball POTION

SproutTower3FEscapeRope:
	itemball ESCAPE_ROPE

MovementData_0x184a1d:
	step UP
	step UP
	step UP
	step UP
	step_end

MovementData_0x184a22:
	step UP
	step_end

MovementData_0x184a24:
	step RIGHT
	step DOWN
	step_end

SproutTowerElderLecturesRivalText:
	text "ANCIANO: Eres muy"
	line "hábil entrenando"
	cont "#MON."

	para "Como te prometí,"
	line "aquí tienes tu MO."

	para "Pero déjame que te"
	line "diga que deberías"

	para "tratar mejor a"
	line "tus #MON."

	para "Luchas de forma"
	line "muy violenta."

	para "Los #MON no son"
	line "armas de guerra."
	done

SproutTowerRivalOnlyCareAboutStrongText:
	text "…"

	para "¡Bah!"
	line "Afirma ser el"

	para "ANCIANO, pero"
	line "es muy débil."

	para "Es evidente."

	para "Jamás perdería"
	line "ante quienes dicen"

	para "que hay que ser"
	line "bueno con los"
	cont "#MON."

	para "Sólo me interesan"
	line "los #MON"
	cont "ganadores."

	para "Paso de los"
	line "#MON débiles."
	done

SproutTowerRivalUsedEscapeRopeText:
	text "¡<RIVAL>"
	line "usó CUERDA HUIDA!"
	done

SageLiSeenText:
	text "¡Encantado de"
	line "verte por aquí!"

	para "TORRE BELLSPROUT"
	line "es un lugar de"
	cont "entrenamiento."

	para "La gente y los"
	line "#MON evalúan"

	para "sus vínculos para"
	line "construir juntos"
	cont "un futuro mejor."

	para "Yo soy la prueba"
	line "final."

	para "¡Déjame evaluar"
	line "tus vínculos con"
	cont "los #MON!"
	done

SageLiBeatenText:
	text "¡Ah, excelente!"
	done

SageLiTakeThisFlashText:
	text "Tú y tus #MON"
	line "no deberíais tener"

	para "problemas con este"
	line "movimiento."

	para "Toma esta MO."
	line "Es DESTELLO."
	done

SageLiFlashExplanationText:
	text "DESTELLO ilumina"
	line "hasta el lugar más"
	cont "oscuro."

	para "Y, con la MEDALLA"
	line "de CIUDAD MALVA,"

	para "podrás usarlo"
	line "fuera del combate."
	done

SageLiAfterBattleText:
	text "¡Ojalá aprendas y"
	line "madures con tu"
	cont "viaje!"
	done

SageJinSeenText:
	text "¡Me entreno para"
	line "saberlo todo"
	cont "sobre los #MON!"
	done

SageJinBeatenText:
	text "Mi entrenamiento"
	line "es incompleto…"
	done

SageJinAfterBattleText:
	text "Cuanto más fuerte"
	line "sea el #MON,"

	para "más fuerte será"
	line "su entrenador."

	para "No, espera. Cuanto"
	line "más fuerte sea el"

	para "entrenador, más"
	line "fuerte el #MON."
	done

SageTroySeenText:
	text "A ver cuánto"
	line "confías en tus"
	cont "#MON."
	done

SageTroyBeatenText:
	text "¡Sí, tu confianza"
	line "es auténtica!"
	done

SageTroyAfterBattleText:
	text "No estás lejos del"
	line "ANCIANO."
	done

SageNealSeenText:
	text "La MO del ANCIANO"
	line "alumbra hasta lo"
	cont "más oscuro."
	done

SageNealBeatenText:
	text "¡Mi cerebro sí que"
	line "es brillante!"
	done

SageNealAfterBattleText:
	text "¡Que haya luz en"
	line "tus viajes!"
	done

SproutTower3FPaintingText:
	text "Es un bonito"
	line "cuadro de un"
	cont "BELLSPROUT."
	done

SproutTower3FStatueText:
	text "Estatua #MON…"

	para "Parece muy"
	line "ilustre."
	done

SproutTower3F_MapEvents:
	db 0, 0 ; filler

	db 1 ; warp events
	warp_event 10, 14, SPROUT_TOWER_2F, 4

	db 1 ; coord events
	coord_event 11,  9, SCENE_DEFAULT, SproutTower3FRivalScene

	db 6 ; bg events
	bg_event  8,  1, BGEVENT_READ, SproutTower3FStatue
	bg_event 11,  1, BGEVENT_READ, SproutTower3FStatue
	bg_event  9,  0, BGEVENT_READ, SproutTower3FPainting
	bg_event 10,  0, BGEVENT_READ, SproutTower3FPainting
	bg_event  5, 15, BGEVENT_READ, SproutTower3FStatue
	bg_event 14, 15, BGEVENT_READ, SproutTower3FStatue

	db 7 ; object events
	object_event  8, 13, SPRITE_SAGE, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 3, TrainerSageJin, -1
	object_event  8,  8, SPRITE_SAGE, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 2, TrainerSageTroy, -1
	object_event 10,  2, SPRITE_SAGE, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, SageLiScript, -1
	object_event 11, 11, SPRITE_SAGE, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 3, TrainerSageNeal, -1
	object_event  6, 14, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, SproutTower3FPotion, EVENT_SPROUT_TOWER_3F_POTION
	object_event 14,  1, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, SproutTower3FEscapeRope, EVENT_SPROUT_TOWER_3F_ESCAPE_ROPE
	object_event 10,  4, SPRITE_SILVER, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, ObjectEvent, EVENT_RIVAL_SPROUT_TOWER
