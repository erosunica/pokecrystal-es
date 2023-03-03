	object_const_def ; object_event constants
	const POKECOMCENTERADMINOFFICEMOBILE_SCIENTIST1
	const POKECOMCENTERADMINOFFICEMOBILE_SCIENTIST2
	const POKECOMCENTERADMINOFFICEMOBILE_SCIENTIST3

PokecomCenterAdminOfficeMobile_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

PokecomCenterAdminOfficeMobileScientist1Script:
	jumptextfaceplayer PokecomCenterAdminOfficeMobileScientist1Text

PokecomCenterAdminOfficeMobileScientist2Script:
	jumptextfaceplayer PokecomCenterAdminOfficeMobileScientist2Text

PokecomCenterAdminOfficeMobileScientist3Script:
	jumptextfaceplayer PokecomCenterAdminOfficeMobileScientist3Text

PokecomCenterAdminOfficeMobileComputer1:
	opentext
	writetext PokecomCenterAdminOfficeMobileComputer1Text
	waitbutton
.loop:
	reloadmappart
	loadmenu .Computer1MenuHeader
	verticalmenu
	closewindow
	ifequal 1, .PokeComClub
	ifequal 2, .MobileCenter
	sjump .Quit

.PokeComClub:
	opentext
	writetext PokecomCenterAdminOfficeMobileComputer1Text_PokeComClub
	waitbutton
	sjump .loop

.MobileCenter:
	opentext
	writetext PokecomCenterAdminOfficeMobileComputer1Text_MobileCenter
	waitbutton
	sjump .loop

.Quit:
	closetext
	end

.Computer1MenuHeader:
	db MENU_BACKUP_TILES ; flags
	menu_coords 0, 0, 15, 8
	dw .MenuData
	db 1 ; default option

.MenuData:
	db STATICMENU_CURSOR ; flags
	db 3 ; items
	db "#　つうしん　クラブ@" ; # COM CLUB
	db "モバイルセンター@" ; MOBILE CENTER
	db "やめる@" ; QUIT

PokecomCenterAdminOfficeMobileComputer2:
	opentext
	writetext PokecomCenterAdminOfficeMobileComputer2Text
	waitbutton
.loop:
	reloadmappart
	loadmenu .Computer2MenuHeader
	verticalmenu
	closewindow
	ifequal 1, .UsePhone
	ifequal 2, .DontUsePhone
	sjump .Quit

.UsePhone:
	opentext
	writetext PokecomCenterAdminOfficeMobileComputer2Text_UsePhone
	waitbutton
	sjump .loop

.DontUsePhone:
	opentext
	writetext PokecomCenterAdminOfficeMobileComputer2Text_DontUsePhone
	waitbutton
	sjump .loop

.Quit:
	closetext
	end

.Computer2MenuHeader:
	db MENU_BACKUP_TILES ; flags
	menu_coords 0, 0, 15, 8
	dw .MenuData
	db 1 ; default option

.MenuData:
	db STATICMENU_CURSOR ; flags
	db 3 ; items
	db "でんわ<WO>つかうとき@" ; Use phone
	db "でんわ<GA>つながらないとき@" ; Don't use phone
	db "やめる@" ; QUIT

PokecomCenterAdminOfficeMobileComputer3:
	jumptext PokecomCenterAdminOfficeMobileComputer3Text

PokecomCenterAdminOfficeMobileScientist1Text:
	text "El CENTRO #COM"
	line "y el CENTRO MÓVIL"

	para "fueron construidos"
	line "para satisfacer la"

	para "demanda de cambio"
	line "y lucha entre"

	para "entrenadores"
	line "que no se conocen."
	done

PokecomCenterAdminOfficeMobileScientist2Text:
	text "Cuando enlazaste"
	line "con alguien por"

	para "teléfono móvil por"
	line "primera vez, ¿no"
	cont "te impresionó?"

	para "¡La primera vez"
	line "me impresionó"

	para "tanto que me puse"
	line "a temblar!"
	done

PokecomCenterAdminOfficeMobileScientist3Text:
	text "Fueron capaces de"
	line "construir este"

	para "gran edificio"
	line "gracias a los"

	para "avances en"
	line "tecnología"
	cont "inalámbrica."
	done

PokecomCenterAdminOfficeMobileComputer1Text:
	text "Es una nota sobre"
	line "dónde deben usarse"

	para "los ADAPTADORES de"
	line "MÓVIL…"
	done

PokecomCenterAdminOfficeMobileComputer1Text_PokeComClub:
	text "El CLUB #COM"
	line "está en el piso de"

	para "arriba de los"
	line "CENTROS #MON."

	para "En él, puedes"
	line "luchar o cambiar"

	para "con un/a amigo/a"
	line "lejano/a usando el"
	cont "ADAPTADOR MÓVIL."

	para "Para conectar, tu"
	line "amigo/a debe tener"

	para "el mismo tipo de"
	line "ADAPTADOR de"
	cont "MÓVIL."
	done

PokecomCenterAdminOfficeMobileComputer1Text_MobileCenter:
	text "Para usar el"
	line "CENTRO DE CAMBIO o"

	para "leer las NOTICIAS"
	line "#MON, necesitas"

	para "llamar al CENTRO"
	line "MÓVIL."

	para "Debes inscribirte"
	line "en el CENTRO MÓVIL"

	para "antes de poder"
	line "conectarte."
	done

PokecomCenterAdminOfficeMobileComputer2Text:
	text "Es una nota sobre"
	line "cómo usar el"
	cont "teléfono…"
	done

PokecomCenterAdminOfficeMobileComputer2Text_UsePhone:
	text "Asegúrate de que"
	line "tu teléfono y el"

	para "ADAPTADOR de MÓVIL"
	line "están bien"
	cont "conectados."

	para "Cuida que haya"
	line "buena cobertura en"
	cont "tu móvil."

	para "No toques ni"
	line "cuelgues el móvil"
	cont "mientras conecta."
	done

PokecomCenterAdminOfficeMobileComputer2Text_DontUsePhone:
	text "Si el servidor"
	line "está ocupado, no"

	para "será posible"
	line "conectar."

	para "Inténtalo más"
	line "tarde."

	para "Si no consigues"
	line "conectar o no"

	para "comprendes los"
	line "mensajes de error,"

	para "llama a Atención"
	line "al Cliente o lee"
	cont "las instrucciones."
	done

PokecomCenterAdminOfficeMobileComputer3Text:
	text "La OFICINA de"
	line "ADMINISTRACIÓN"

	para "recibió un e-mail."
	line "Dice…"

	para "<……> <……> <……>"

	para "Al equipo del"
	line "CENTRO #COM…"

	para "La comunicación"
	line "sin cables permite"

	para "que los entrenado-"
	line "res interactúen a"

	para "nivel nacional."
	line "Sigamos trabajando"

	para "hasta el día en"
	line "que todos los"

	para "entrenadores del"
	line "mundo nos podamos"
	cont "unir sin barreras."

	para "<……> <……> <……>"
	done

PokecomCenterAdminOfficeMobile_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event  0, 31, GOLDENROD_POKECENTER_1F, 3
	warp_event  1, 31, GOLDENROD_POKECENTER_1F, 3

	db 0 ; coord events

	db 3 ; bg events
	bg_event  6, 26, BGEVENT_UP, PokecomCenterAdminOfficeMobileComputer1
	bg_event  6, 28, BGEVENT_UP, PokecomCenterAdminOfficeMobileComputer2
	bg_event  3, 26, BGEVENT_UP, PokecomCenterAdminOfficeMobileComputer3

	db 3 ; object events
	object_event  4, 28, SPRITE_SCIENTIST, SPRITEMOVEDATA_WALK_UP_DOWN, 0, 1, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, PokecomCenterAdminOfficeMobileScientist1Script, -1
	object_event  7, 27, SPRITE_SCIENTIST, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, PokecomCenterAdminOfficeMobileScientist2Script, -1
	object_event  7, 29, SPRITE_SCIENTIST, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, PokecomCenterAdminOfficeMobileScientist3Script, -1
