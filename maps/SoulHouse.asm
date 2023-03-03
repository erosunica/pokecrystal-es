	object_const_def ; object_event constants
	const SOULHOUSE_MRFUJI
	const SOULHOUSE_TEACHER
	const SOULHOUSE_LASS
	const SOULHOUSE_GRANNY

SoulHouse_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

MrFuji:
	jumptextfaceplayer MrFujiText

SoulHouseTeacherScript:
	jumptextfaceplayer SoulHouseTeacherText

SoulHouseLassScript:
	jumptextfaceplayer SoulHouseLassText

SoulHouseGrannyScript:
	jumptextfaceplayer SoulHouseGrannyText

MrFujiText:
	text "SR. FUJI: ¡Hola!"

	para "¡Mmm…! Parece que"
	line "estás educando a"

	para "tus #MON con"
	line "mucho cariño."

	para "Los amantes de los"
	line "#MON vienen a"

	para "rendir homenaje a"
	line "#MON muertos."

	para "Por favor, muestra"
	line "tu condolencia por"

	para "las almas #MON"
	line "que han partido."

	para "Seguro que eso"
	line "les hará felices."
	done

SoulHouseTeacherText:
	text "Creo que aquí hay"
	line "otras tumbas de"
	cont "#MON."

	para "Hay muchas cámaras"
	line "en las que sólo"

	para "puede entrar el"
	line "SR. FUJI."
	done

SoulHouseLassText:
	text "He venido con mi"
	line "madre a visitar"

	para "las tumbas de los"
	line "#MON…"
	done

SoulHouseGrannyText:
	text "A los #MON que"
	line "vivían conmigo…"

	para "los quería como a"
	line "mis nietos…"
	done

SoulHouse_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event  4,  7, LAVENDER_TOWN, 6
	warp_event  5,  7, LAVENDER_TOWN, 6

	db 0 ; coord events

	db 0 ; bg events

	db 4 ; object events
	object_event  4,  2, SPRITE_GRAMPS, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, MrFuji, -1
	object_event  7,  3, SPRITE_TEACHER, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 1, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, SoulHouseTeacherScript, -1
	object_event  2,  5, SPRITE_LASS, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, SoulHouseLassScript, -1
	object_event  1,  3, SPRITE_GRANNY, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, SoulHouseGrannyScript, -1
