FadeToMenu::
	xor a
	ldh [hBGMapMode], a
	call LoadStandardMenuHeader
	farcall FadeOutPalettes
	call ClearSprites
	; fallthrough
DisableSpriteUpdates::
	xor a
	ldh [hMapAnims], a
	ld a, [wVramState]
	res 0, a
	ld [wVramState], a
	xor a
	ld [wSpriteUpdatesEnabled], a
	ret

CloseSubmenu::
	call ClearBGPalettes
	call ReloadTilesetAndPalettes
	call UpdateSprites
	call ExitMenu
	jr FinishExitMenu

ExitAllMenus::
	call ClearBGPalettes
	call ExitMenu
	call ReloadTilesetAndPalettes
	call UpdateSprites
FinishExitMenu::
	ld b, SCGB_MAPPALS
	call GetSGBLayout
	farcall LoadOW_BGPal7
	call WaitBGMap2
	farcall FadeInPalettes
	; fallthrough
EnableSpriteUpdates::
	ld a, $1
	ld [wSpriteUpdatesEnabled], a
	ld a, [wVramState]
	set 0, a
	ld [wVramState], a
	ld a, $1
	ldh [hMapAnims], a
	ret
