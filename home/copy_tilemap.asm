LoadTilemapToTempTilemap::
; Load wTilemap into wTempTilemap
	ldh a, [rSVBK]
	push af
	ld a, BANK(wTempTilemap)
	ldh [rSVBK], a
	hlcoord 0, 0
	decoord 0, 0, wTempTilemap
	ld bc, wTilemapEnd - wTilemap
	call CopyBytes
	pop af
	ldh [rSVBK], a
	ret

LoadTempTilemapToTilemap::
; Load wTempTilemap into wTilemap
	ldh a, [rSVBK]
	push af
	ld a, BANK(wTempTilemap)
	ldh [rSVBK], a
	hlcoord 0, 0, wTempTilemap
	decoord 0, 0
	ld bc, wTilemapEnd - wTilemap
	call CopyBytes
	pop af
	ldh [rSVBK], a
	ret
