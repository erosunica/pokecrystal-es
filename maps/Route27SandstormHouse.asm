	object_const_def ; object_event constants
	const ROUTE27SANDSTORMHOUSE_GRANNY

Route27SandstormHouse_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

SandstormHouseWoman:
	faceplayer
	opentext
	checkevent EVENT_GOT_TM37_SANDSTORM
	iftrue .AlreadyGotItem
	special GetFirstPokemonHappiness
	writetext SandstormHouseWomanText1
	promptbutton
	ifgreater 150 - 1, .Loyal
	sjump .Disloyal

.Loyal:
	writetext SandstormHouseWomanLoyalText
	promptbutton
	verbosegiveitem TM_SANDSTORM
	iffalse .Done
	setevent EVENT_GOT_TM37_SANDSTORM
.AlreadyGotItem:
	writetext SandstormHouseSandstormDescription
	waitbutton
.Done:
	closetext
	end

.Disloyal:
	writetext SandstormHouseWomanDisloyalText
	waitbutton
	closetext
	end

SandstormHouseBookshelf:
	jumpstd magazinebookshelf

SandstormHouseWomanText1:
	text "¿Adónde vas con"
	line "los #MON?"

	para "¿A la LIGA"
	line "#MON?"

	para "¿Son tus #MON"
	line "lo bastante fieles"

	para "como para permi-"
	line "tirte ganar?"

	para "Déjame ver…"
	done

SandstormHouseWomanLoyalText:
	text "¡Ah! Tus #MON"
	line "confían mucho"
	cont "en ti."

	para "Da gusto ver a"
	line "alguien tan bueno."

	para "Toma. Un regalo"
	line "para el viaje."
	done

SandstormHouseSandstormDescription:
	text "MT37 contiene"
	line "TORMENTA ARENA."

	para "Este movimiento"
	line "daña a ambos"
	cont "combatientes."

	para "Es para entrena-"
	line "dores avanzados."

	para "Úsala si te"
	line "atreves. ¡Suerte!"
	done

SandstormHouseWomanDisloyalText:
	text "Si no confían más"
	line "en ti, tendras"

	para "problemas para"
	line "ganar."

	para "La confianza es el"
	line "vínculo entre los"

	para "#MON y sus"
	line "entrenadores."
	done

Route27SandstormHouse_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event  2,  7, ROUTE_27, 1
	warp_event  3,  7, ROUTE_27, 1

	db 0 ; coord events

	db 2 ; bg events
	bg_event  0,  1, BGEVENT_READ, SandstormHouseBookshelf
	bg_event  1,  1, BGEVENT_READ, SandstormHouseBookshelf

	db 1 ; object events
	object_event  2,  4, SPRITE_GRANNY, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, SandstormHouseWoman, -1
