	object_const_def ; object_event constants
	const GOLDENRODBIKESHOP_CLERK

GoldenrodBikeShop_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

.UnreferencedDummyScene:
	end

GoldenrodBikeShopClerkScript:
	faceplayer
	opentext
	checkevent EVENT_GOT_BICYCLE
	iftrue .GotBicycle
	writetext GoldenrodBikeShopClerkIntroText
	yesorno
	iffalse .Refused
	writetext GoldenrodBikeShopClerkAgreedText
	promptbutton
	waitsfx
	giveitem BICYCLE
	writetext BorrowedABicycleText
	playsound SFX_KEY_ITEM
	waitsfx
	itemnotify
	setflag ENGINE_BIKE_SHOP_CALL_ENABLED
	setevent EVENT_GOT_BICYCLE
.GotBicycle:
	writetext GoldenrodBikeShopClerkFirstRateBikesText
	waitbutton
	closetext
	end

.Refused:
	writetext GoldenrodBikeShopClerkRefusedText
	waitbutton
	closetext
	end

GoldenrodBikeShopJustReleasedCompactBike:
; unused
	jumptext GoldenrodBikeShopJustReleasedCompactBikeText

GoldenrodBikeShopBicycle:
	jumptext GoldenrodBikeShopBicycleText

GoldenrodBikeShopClerkIntroText:
	text "(Suspiro…)"
	line "Me trasladé aquí,"

	para "pero no vendo mis"
	line "BICIS. ¿Por qué?"

	para "¿Montarías en una"
	line "BICI para hacerme"
	cont "publicidad?"
	done

GoldenrodBikeShopClerkAgreedText:
	text "¿De verdad? ¡Bien!"

	para "Dime tu nombre y"
	line "número de teléfono"

	para "y te prestaré una"
	line "BICI."
	done

BorrowedABicycleText:
	text "<PLAYER> tomó"
	line "prestada una BICI."
	done

GoldenrodBikeShopClerkFirstRateBikesText:
	text "¡Mis BICIS son de"
	line "gran calidad!"

	para "Puedes usarlas en"
	line "cualquier lugar."
	done

GoldenrodBikeShopClerkRefusedText:
	text "(Suspiro…)"
	line "¡Oh, rayos y"
	cont "centellas…!"
	done

GoldenrodBikeShopJustReleasedCompactBikeText:
	text "¡Lo último! ¡BICIS"
	line "compactas de"
	cont "máxima calidad!"
	done

GoldenrodBikeShopBicycleText:
	text "¡Es una BICI"
	line "novísima!"
	done

GoldenrodBikeShop_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event  2,  7, GOLDENROD_CITY, 2
	warp_event  3,  7, GOLDENROD_CITY, 2

	db 0 ; coord events

	db 9 ; bg events
	bg_event  1,  2, BGEVENT_READ, GoldenrodBikeShopBicycle
	bg_event  0,  3, BGEVENT_READ, GoldenrodBikeShopBicycle
	bg_event  1,  3, BGEVENT_READ, GoldenrodBikeShopBicycle
	bg_event  0,  5, BGEVENT_READ, GoldenrodBikeShopBicycle
	bg_event  1,  5, BGEVENT_READ, GoldenrodBikeShopBicycle
	bg_event  0,  6, BGEVENT_READ, GoldenrodBikeShopBicycle
	bg_event  1,  6, BGEVENT_READ, GoldenrodBikeShopBicycle
	bg_event  6,  6, BGEVENT_READ, GoldenrodBikeShopBicycle
	bg_event  7,  6, BGEVENT_READ, GoldenrodBikeShopBicycle

	db 1 ; object events
	object_event  7,  2, SPRITE_CLERK, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, GoldenrodBikeShopClerkScript, -1
