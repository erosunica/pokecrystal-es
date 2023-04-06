MobileMenuGFX:
INCBIN "gfx/mobile/mobile_menu.2bpp"

MainMenu:
	xor a
	ld [wDisableTextAcceleration], a
	call Function49ed0
	ld b, SCGB_DIPLOMA
	call GetSGBLayout
	call SetPalettes
	ld hl, wGameTimerPause
	res GAMETIMERPAUSE_TIMER_PAUSED_F, [hl]
	call MainMenu_GetWhichMenu
	ld [wWhichIndexSet], a
	call MainMenu_PrintCurrentTimeAndDay
	ld hl, .MenuHeader
	call LoadMenuHeader
	call MainMenuJoypadLoop
	call CloseWindow
	jr c, .quit
	call ClearTilemap
	ld a, [wMenuSelection]
	ld hl, .Jumptable
	rst JumpTable
	jr MainMenu

.quit
	ret

.MenuHeader:
	db MENU_BACKUP_TILES ; flags
	menu_coords 0, 0, 16, 7
	dw .MenuData
	db 1 ; default option

.MenuData:
	db STATICMENU_CURSOR ; flags
	db 0 ; items
	dw MainMenuItems
	dw PlaceMenuStrings
	dw .Strings

.Strings:
	db "CONTINUAR@"
	db "JUEGO NUEVO@"
	db "OPCIÓN@"
	db "REGALO MIST@"
	db "MOBILE@"
	db "MOBILE STUDIUM@"

.Jumptable:
	dw MainMenu_Continue
	dw MainMenu_NewGame
	dw MainMenu_Options
	dw MainMenu_MysteryGift
	dw MainMenu_Mobile
	dw MainMenu_MobileStudium

CONTINUE       EQU 0
NEW_GAME       EQU 1
OPTION         EQU 2
MYSTERY_GIFT   EQU 3
MOBILE         EQU 4
MOBILE_STUDIUM EQU 5

MainMenuItems:

NewGameMenu:
	db 2
	db NEW_GAME
	db OPTION
	db -1

ContinueMenu:
	db 3
	db CONTINUE
	db NEW_GAME
	db OPTION
	db -1

MobileMysteryMenu:
	db 5
	db CONTINUE
	db NEW_GAME
	db OPTION
	db MYSTERY_GIFT
	db MOBILE
	db -1

MobileMenu:
	db 4
	db CONTINUE
	db NEW_GAME
	db OPTION
	db MOBILE
	db -1

MobileStudiumMenu:
	db 5
	db CONTINUE
	db NEW_GAME
	db OPTION
	db MOBILE
	db MOBILE_STUDIUM
	db -1

MysteryMobileStudiumMenu:
	db 6
	db CONTINUE
	db NEW_GAME
	db OPTION
	db MYSTERY_GIFT
	db MOBILE
	db MOBILE_STUDIUM
	db -1

MysteryMenu:
	db 4
	db CONTINUE
	db NEW_GAME
	db OPTION
	db MYSTERY_GIFT
	db -1

MysteryStudiumMenu:
	db 5
	db CONTINUE
	db NEW_GAME
	db OPTION
	db MYSTERY_GIFT
	db MOBILE_STUDIUM
	db -1

StudiumMenu:
	db 4
	db CONTINUE
	db NEW_GAME
	db OPTION
	db MOBILE_STUDIUM
	db -1

MainMenu_GetWhichMenu:
	nop
	nop
	nop
	ld a, [wSaveFileExists]
	and a
	jr nz, .next
	ld a, $0 ; New Game
	ret

.next
	ld a, BANK(sNumDailyMysteryGiftPartnerIDs)
	call GetSRAMBank
	ld a, [sNumDailyMysteryGiftPartnerIDs]
	cp -1
	call CloseSRAM
	jr nz, .mystery_gift
	ld a, $1 ; Continue
	ret

.mystery_gift
	ld a, $6 ; Mystery Gift
	ret

MainMenuJoypadLoop:
	call SetUpMenu
.loop
	call MainMenu_PrintCurrentTimeAndDay
	ld a, [w2DMenuFlags1]
	set 5, a
	ld [w2DMenuFlags1], a
	call GetScrollingMenuJoypad
	ld a, [wMenuJoypad]
	cp B_BUTTON
	jr z, .b_button
	cp A_BUTTON
	jr z, .a_button
	jr .loop

.a_button
	call PlayClickSFX
	and a
	ret

.b_button
	scf
	ret

MainMenu_PrintCurrentTimeAndDay:
	ld a, [wSaveFileExists]
	and a
	ret z
	xor a
	ldh [hBGMapMode], a
	call .PlaceBox
	ld hl, wOptions
	ld a, [hl]
	push af
	set NO_TEXT_SCROLL, [hl]
	call .PlaceTime
	pop af
	ld [wOptions], a
	ld a, $1
	ldh [hBGMapMode], a
	ret

.PlaceBox:
	call CheckRTCStatus
	and $80
	jp nz, SpeechTextbox
	hlcoord 0, 14
	ld b, 2
	ld c, 18
	call Textbox
	ret

.TimeFail: ; unused
	call SpeechTextbox
	ret

.PlaceTime:
	ld a, [wSaveFileExists]
	and a
	ret z
	call CheckRTCStatus
	and $80
	jp nz, .PrintTimeNotSet
	call UpdateTime
	bccoord 1, 15
	call TextCommand_DAY
	decoord 4, 16
	ldh a, [hHours]
	ld c, a
	farcall PrintHour
	ld [hl], ":"
	inc hl
	ld de, hMinutes
	lb bc, PRINTNUM_LEADINGZEROS | 1, 2
	call PrintNum
	ret

.min
; unused
	db "min.@"

.PrintTimeNotSet:
	hlcoord 1, 14
	ld de, .TimeNotSet
	call PlaceString
	ret

.TimeNotSet:
	db "HORA NO FIJADA@"

.MainMenuTimeUnknownText:
	text_far _MainMenuTimeUnknownText
	text_end

.PlaceCurrentDay: ; unused
	push de
	ld hl, .Days
	ld a, b
	call GetNthString
	ld d, h
	ld e, l
	pop hl
	call PlaceString
	ld h, b
	ld l, c
	ld de, .Day
	call PlaceString
	ret

.Days:
	db "DOMINGO@"
	db "LUNES@"
	db "MARTES@"
	db "MIÉRCOLES@"
	db "JUEVES@"
	db "VIERNES@"
	db "SÁBADO@"
.Day:
	db "@"

Function49ed0:
	xor a
	ldh [hMapAnims], a
	call ClearTilemap
	call LoadFontsExtra
	call LoadStandardFont
	call ClearWindowData
	ret

MainMenu_NewGame:
	farcall NewGame
	ret

MainMenu_Options:
	farcall OptionsMenu
	ret

MainMenu_Continue:
	farcall Continue
	ret

MainMenu_MysteryGift:
	farcall MysteryGift
	ret
