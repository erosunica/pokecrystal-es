LoadSGBPokedexGFX: ; unused
	ld hl, SGBPokedexGFX_LZ
	ld de, vTiles2 tile $31
	jp Decompress

LoadSGBPokedexGFX2: ; unused
	ld hl, SGBPokedexGFX_LZ
	ld de, vTiles2 tile $31
	lb bc, BANK(SGBPokedexGFX_LZ), 58
	jp DecompressRequest2bpp

SGBPokedexGFX_LZ: ; unused
INCBIN "gfx/pokedex/pokedex_sgb.2bpp.lz"
