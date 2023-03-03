unownwall: MACRO
rept _NARG
if \1 == "-"
x = $64
elif \1 >= "Y"
x = 2 * (\1 - "Y") + $60
elif \1 >= "Q"
x = 2 * (\1 - "Q") + $40
elif \1 >= "I"
x = 2 * (\1 - "I") + $20
else
x = 2 * (\1 - "A")
endc
	db x
	shift
endr
	db -1 ; end
ENDM

UnownWalls:
; UNOWNWORDS_ESCAPE
	; db      $0e, $48, $20, $06, $00, -1
	unownwall "H", "U", "I", "D", "A"
; UNOWNWORDS_LIGHT
	; db      $64, $26, $48, $62, $64, -1
	unownwall "-", "L", "U", "Z", "-"
; UNOWNWORDS_WATER
	; db      $00, $0c, $48, $00, -1
	unownwall "A", "G", "U", "A"
; UNOWNWORDS_HO_OH
	; db      $0e, $2c, $64, $2c, $0e, -1
	unownwall "H", "O", "-", "O", "H"

MenuHeaders_UnownWalls:
; UNOWNWORDS_ESCAPE
	db MENU_BACKUP_TILES ; flags
	menu_coords 4, 4, 15, 9
; UNOWNWORDS_LIGHT
	db MENU_BACKUP_TILES ; flags
	menu_coords 4, 4, 15, 9
; UNOWNWORDS_WATER
	db MENU_BACKUP_TILES ; flags
	menu_coords 5, 4, 14, 9
; UNOWNWORDS_HO_OH
	db MENU_BACKUP_TILES ; flags
	menu_coords 4, 4, 15, 9
