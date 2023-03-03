	object_const_def ; object_event constants
	const BILLSFAMILYSHOUSE_BILL
	const BILLSFAMILYSHOUSE_POKEFAN_F
	const BILLSFAMILYSHOUSE_TWIN

BillsFamilysHouse_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

BillScript:
	faceplayer
	opentext
	checkevent EVENT_GOT_EEVEE
	iftrue .GotEevee
	writetext BillTakeThisEeveeText
	yesorno
	iffalse .Refused
	writetext BillImCountingOnYouText
	promptbutton
	waitsfx
	readvar VAR_PARTYCOUNT
	ifequal PARTY_LENGTH, .NoRoom
	writetext ReceivedEeveeText
	playsound SFX_CAUGHT_MON
	waitsfx
	givepoke EEVEE, 20
	setevent EVENT_GOT_EEVEE
	writetext BillEeveeMayEvolveText
	waitbutton
	closetext
	end

.NoRoom:
	writetext BillPartyFullText
	waitbutton
	closetext
	end

.Refused:
	writetext BillNoEeveeText
	waitbutton
	closetext
	end

.GotEevee:
	writetext BillPopWontWorkText
	waitbutton
	closetext
	end

BillsMomScript:
	faceplayer
	opentext
	checkevent EVENT_MET_BILL
	iffalse .HaventMetBill
	writetext BillsMomText_BeforeEcruteak
	waitbutton
	closetext
	end

.HaventMetBill:
	writetext BillsMomText_AfterEcruteak
	waitbutton
	closetext
	end

BillsSisterScript:
	faceplayer
	opentext
	checkcellnum PHONE_BILL
	iftrue .GotBillsNumber
	writetext BillsSisterUsefulNumberText
	askforphonenumber PHONE_BILL
	ifequal PHONE_CONTACTS_FULL, .NoRoom
	ifequal PHONE_CONTACT_REFUSED, .Refused
	waitsfx
	addcellnum PHONE_BILL
	writetext RecordedBillsNumberText
	playsound SFX_REGISTER_PHONE_NUMBER
	waitsfx
	promptbutton
.GotBillsNumber:
	writetext BillsSisterStorageSystemText
	waitbutton
	closetext
	end

.Refused:
	writetext BillsSisterRefusedNumberText
	waitbutton
	closetext
	end

.NoRoom:
	writetext BillsSisterPhoneFullText
	promptbutton
	sjump .Refused

BillsHouseBookshelf1:
	jumpstd picturebookshelf

BillsHouseBookshelf2:
	jumpstd magazinebookshelf

BillsHouseRadio:
	jumpstd radio2

BillTakeThisEeveeText:
	text "BILL: ¡Hola,"
	line "<PLAYER>! Haznos"

	para "un favor y acepta"
	line "este EEVEE."

	para "Apareció cuando"
	line "ajustaba la"

	para "CÁPSULA DEL"
	line "TIEMPO."

	para "Alguien tiene que"
	line "cuidarlo y a mí no"
	cont "me gusta salir."

	para "¿Puedo confiar en"
	line "ti para jugar con"
	cont "él, <PLAYER>?"
	done

BillImCountingOnYouText:
	text "BILL: ¡Sabía que"
	line "aceptarías!"

	para "¡Vamos! ¡Tú sí"
	line "que vales!"

	para "Bueno, cuento"
	line "contigo."

	para "¡Cuídalo bien!"
	done

ReceivedEeveeText:
	text "¡<PLAYER> recibió"
	line "a EEVEE!"
	done

BillEeveeMayEvolveText:
	text "BILL: ELM dice que"
	line "EEVEE evoluciona"

	para "en formas nuevas y"
	line "desconocidas."
	done

BillPartyFullText:
	text "No, espera."
	line "No puedes llevar"
	cont "más #MON."
	done

BillNoEeveeText:
	text "¡Oh…! ¿Qué podemos"
	line "hacer ahora?"
	done

BillPopWontWorkText:
	text "BILL: Mi padre no"
	line "trabaja. Lo único"

	para "que hace es"
	line "holgazanear."

	para "Es que no da ni"
	line "golpe…"
	done

BillsMomText_BeforeEcruteak:
	text "Anda, ¿coleccionas"
	line "#MON? Mi hijo"

	para "BILL es todo un"
	line "experto."

	para "Le han llamado del"
	line "CENTRO #MON de"
	cont "CIUDAD IRIS."

	para "Mi marido fue al"
	line "CASINO sin que le"
	cont "llamara nadie…"
	done

BillsMomText_AfterEcruteak:
	text "Mi marido era"
	line "conocido como un"

	para "#MANÍACO."
	line "BILL ha debido de"

	para "seguir los pasos"
	line "de su padre."
	done

BillsSisterUsefulNumberText:
	text "¿Entrenas #MON?"
	line "Tengo un número de"

	para "teléfono que te"
	line "será útil."
	done

RecordedBillsNumberText:
	text "<PLAYER> grabó el"
	line "n.° de BILL."
	done

BillsSisterRefusedNumberText:
	text "Mi hermano creó el"
	line "Sistema de"

	para "Almacenamiento de"
	line "#MON del PC."

	para "Te iba a dar el"
	line "teléfono de BILL…"
	done

BillsSisterPhoneFullText:
	text "No puedes grabar"
	line "ningún número más."
	done

BillsSisterStorageSystemText:
	text "Mi hermano BILL"
	line "creó el Sistema de"

	para "Almacenamiento de"
	line "los #MON."
	done

BillsFamilysHouse_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event  2,  7, GOLDENROD_CITY, 4
	warp_event  3,  7, GOLDENROD_CITY, 4

	db 0 ; coord events

	db 3 ; bg events
	bg_event  0,  1, BGEVENT_READ, BillsHouseBookshelf2
	bg_event  1,  1, BGEVENT_READ, BillsHouseBookshelf1
	bg_event  7,  1, BGEVENT_READ, BillsHouseRadio

	db 3 ; object events
	object_event  2,  3, SPRITE_BILL, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, BillScript, EVENT_MET_BILL
	object_event  5,  3, SPRITE_POKEFAN_F, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, BillsMomScript, -1
	object_event  5,  4, SPRITE_TWIN, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, BillsSisterScript, -1
