rom := pokecrystal-es.gbc

crystal-es_obj := \
audio.o \
home.o \
main.o \
wram.o \
data/text/common.o \
data/maps/map_data.o \
data/pokemon/dex_entries.o \
data/pokemon/egg_moves.o \
data/pokemon/evos_attacks.o \
engine/movie/credits.o \
engine/overworld/events.o \
gfx/pics.o \
gfx/sprites.o \
gfx/tilesets.o \
lib/mobile/main.o


### Build tools

ifeq (,$(shell which sha1sum))
SHA1 := shasum
else
SHA1 := sha1sum
endif

RGBDS ?=
RGBASM  ?= $(RGBDS)rgbasm
RGBFIX  ?= $(RGBDS)rgbfix
RGBGFX  ?= $(RGBDS)rgbgfx
RGBLINK ?= $(RGBDS)rgblink


### Build targets

.SUFFIXES:
.PHONY: all clean tidy compare tools
.SECONDEXPANSION:
.PRECIOUS:
.SECONDARY:

all: $(rom)

clean:
	rm -f $(rom) $(crystal-es_obj) $(rom:.gbc=.map) $(rom:.gbc=.sym)
	find gfx \( -name "*.[12]bpp" -o -name "*.lz" -o -name "*.gbcpal" \) -delete
	find gfx/pokemon -mindepth 1 ! -path "gfx/pokemon/unown/*" \( -name "bitmask.asm" -o -name "frames.asm" -o -name "front.animated.tilemap" -o -name "front.dimensions" \) -delete
	$(MAKE) clean -C tools/

tidy:
	rm -f $(rom) $(crystal-es_obj) $(rom:.gbc=.map) $(rom:.gbc=.sym)
	$(MAKE) clean -C tools/

compare: $(rom)
	@$(SHA1) -c rom.sha1

tools:
	$(MAKE) -C tools/


$(crystal-es_obj):   RGBASMFLAGS =

# The dep rules have to be explicit or else missing files won't be reported.
# As a side effect, they're evaluated immediately instead of when the rule is invoked.
# It doesn't look like $(shell) can be deferred so there might not be a better way.
define DEP
$1: $2 $$(shell tools/scan_includes $2)
	$$(RGBASM) $$(RGBASMFLAGS) -L -o $$@ $$<
endef

# Build tools when building the rom.
# This has to happen before the rules are processed, since that's when scan_includes is run.
ifeq (,$(filter clean tools,$(MAKECMDGOALS)))

$(info $(shell $(MAKE) -C tools))

$(foreach obj, $(crystal-es_obj), $(eval $(call DEP,$(obj),$(obj:.o=.asm))))

endif


$(rom): $(crystal-es_obj) $(rom:.gbc=.link)
	$(RGBLINK) -n $(rom:.gbc=.sym) -m $(rom:.gbc=.map) -l $(rom:.gbc=.link) -o $@ $(crystal-es_obj)
	$(RGBFIX) -Cjv -i BYTS -k 01 -l 0x33 -m 0x10 -p 0 -r 3 -t PM_CRYSTAL $@
	tools/sort_symfile.sh $(rom:.gbc=.sym)


# For files that the compressor can't match, there will be a .lz file suffixed with the md5 hash of the correct uncompressed file.
# If the hash of the uncompressed file matches, use this .lz instead.
# This allows pngs to be used for compressed graphics and still match.

%.lz: hash = $(shell tools/md5 $(*D)/$(*F) | sed "s/\(.\{8\}\).*/\1/")
%.lz: %
	$(eval filename := $@.$(hash))
	$(if $(wildcard $(filename)),\
		cp $(filename) $@,\
		tools/lzcomp -- $< $@)


### Pokemon pic animation rules

gfx/pokemon/%/front.animated.2bpp: gfx/pokemon/%/front.2bpp gfx/pokemon/%/front.dimensions
	tools/pokemon_animation_graphics -o $@ $^
gfx/pokemon/%/front.animated.tilemap: gfx/pokemon/%/front.2bpp gfx/pokemon/%/front.dimensions
	tools/pokemon_animation_graphics -t $@ $^
gfx/pokemon/%/bitmask.asm: gfx/pokemon/%/front.animated.tilemap gfx/pokemon/%/front.dimensions
	tools/pokemon_animation -b $^ > $@
gfx/pokemon/%/frames.asm: gfx/pokemon/%/front.animated.tilemap gfx/pokemon/%/front.dimensions
	tools/pokemon_animation -f $^ > $@


### Terrible hacks to match animations. Delete these rules if you don't care about matching.

# Dewgong has an unused tile id in its last frame. The tile itself is missing.
gfx/pokemon/dewgong/frames.asm: gfx/pokemon/dewgong/front.animated.tilemap gfx/pokemon/dewgong/front.dimensions
	tools/pokemon_animation -f $^ > $@
	echo "	db \$$4d" >> $@

# Lugia has two unused tile ids in its last frame. The tiles themselves are missing.
gfx/pokemon/lugia/frames.asm: gfx/pokemon/lugia/front.animated.tilemap gfx/pokemon/lugia/front.dimensions
	tools/pokemon_animation -f $^ > $@
	echo "	db \$$5e, \$$59" >> $@

# Girafarig has a redundant tile after the end. It is used in two frames, so it must be injected into the generated graphics.
# This is more involved, so it's hacked into pokemon_animation_graphics.
gfx/pokemon/girafarig/front.animated.2bpp: gfx/pokemon/girafarig/front.2bpp gfx/pokemon/girafarig/front.dimensions
	tools/pokemon_animation_graphics --girafarig -o $@ $^
gfx/pokemon/girafarig/front.animated.tilemap: gfx/pokemon/girafarig/front.2bpp gfx/pokemon/girafarig/front.dimensions
	tools/pokemon_animation_graphics --girafarig -t $@ $^


### Misc file-specific graphics rules

gfx/pokemon/%/back.2bpp: rgbgfx += -h

gfx/trainers/%.2bpp: rgbgfx += -h

gfx/pokemon/egg/unused_front.2bpp: rgbgfx += -h

gfx/new_game/shrink1.2bpp: rgbgfx += -h
gfx/new_game/shrink2.2bpp: rgbgfx += -h

gfx/mail/dragonite.1bpp: tools/gfx += --remove-whitespace
gfx/mail/large_note.1bpp: tools/gfx += --remove-whitespace
gfx/mail/surf_mail_border.1bpp: tools/gfx += --remove-whitespace
gfx/mail/flower_mail_border.1bpp: tools/gfx += --remove-whitespace
gfx/mail/litebluemail_border.1bpp: tools/gfx += --remove-whitespace

gfx/pokedex/pokedex.2bpp: tools/gfx += --trim-whitespace
gfx/pokedex/pokedex_sgb.2bpp: tools/gfx += --trim-whitespace
gfx/pokedex/question_mark.2bpp: rgbgfx += -h
gfx/pokedex/slowpoke.2bpp: tools/gfx += --trim-whitespace

gfx/pokegear/pokegear.2bpp: rgbgfx += -x2
gfx/pokegear/pokegear_sprites.2bpp: tools/gfx += --trim-whitespace

gfx/mystery_gift/mystery_gift.2bpp: tools/gfx += --trim-whitespace

gfx/title/crystal.2bpp: tools/gfx += --interleave --png=$<
gfx/title/old_fg.2bpp: tools/gfx += --interleave --png=$<
gfx/title/logo.2bpp: rgbgfx += -x 4

gfx/trade/ball.2bpp: tools/gfx += --remove-whitespace

gfx/slots/slots_1.2bpp: tools/gfx += --trim-whitespace
gfx/slots/slots_2.2bpp: tools/gfx += --interleave --png=$<
gfx/slots/slots_3.2bpp: tools/gfx += --interleave --png=$< --remove-duplicates --keep-whitespace --remove-xflip

gfx/card_flip/card_flip_1.2bpp: tools/gfx += --trim-whitespace
gfx/card_flip/card_flip_2.2bpp: tools/gfx += --remove-whitespace

gfx/battle_anims/angels.2bpp: tools/gfx += --trim-whitespace
gfx/battle_anims/beam.2bpp: tools/gfx += --remove-xflip --remove-yflip --remove-whitespace
gfx/battle_anims/bubble.2bpp: tools/gfx += --trim-whitespace
gfx/battle_anims/charge.2bpp: tools/gfx += --trim-whitespace
gfx/battle_anims/egg.2bpp: tools/gfx += --remove-whitespace
gfx/battle_anims/explosion.2bpp: tools/gfx += --remove-whitespace
gfx/battle_anims/hit.2bpp: tools/gfx += --remove-whitespace
gfx/battle_anims/horn.2bpp: tools/gfx += --remove-whitespace
gfx/battle_anims/lightning.2bpp: tools/gfx += --remove-whitespace
gfx/battle_anims/misc.2bpp: tools/gfx += --remove-duplicates --remove-xflip
gfx/battle_anims/noise.2bpp: tools/gfx += --remove-whitespace
gfx/battle_anims/objects.2bpp: tools/gfx += --remove-whitespace --remove-xflip
gfx/battle_anims/pokeball.2bpp: tools/gfx += --remove-xflip --keep-whitespace
gfx/battle_anims/reflect.2bpp: tools/gfx += --remove-whitespace
gfx/battle_anims/rocks.2bpp: tools/gfx += --remove-whitespace
gfx/battle_anims/skyattack.2bpp: tools/gfx += --remove-whitespace
gfx/battle_anims/status.2bpp: tools/gfx += --remove-whitespace

gfx/player/chris.2bpp: rgbgfx += -h
gfx/player/chris_back.2bpp: rgbgfx += -h
gfx/player/kris.2bpp: rgbgfx += -h
gfx/player/kris_back.2bpp: rgbgfx += -h

gfx/trainer_card/chris_card.2bpp: rgbgfx += -h
gfx/trainer_card/kris_card.2bpp: rgbgfx += -h
gfx/trainer_card/leaders.2bpp: tools/gfx += --trim-whitespace

gfx/overworld/chris_fish.2bpp: tools/gfx += --trim-whitespace
gfx/overworld/kris_fish.2bpp: tools/gfx += --trim-whitespace

gfx/sprites/big_onix.2bpp: tools/gfx += --remove-whitespace --remove-xflip

gfx/battle/dude.2bpp: rgbgfx += -h

gfx/font/unused_bold_font.1bpp: tools/gfx += --trim-whitespace

gfx/sgb/sgb_border.2bpp: tools/gfx += --trim-whitespace

gfx/mobile/ascii_font.2bpp: tools/gfx += --trim-whitespace
gfx/mobile/dialpad.2bpp: tools/gfx += --trim-whitespace
gfx/mobile/dialpad_cursor.2bpp: tools/gfx += --trim-whitespace
gfx/mobile/electro_ball.2bpp: tools/gfx += --trim-whitespace
gfx/mobile/electro_ball_nonmatching.2bpp: tools/gfx += --remove-duplicates --remove-xflip
gfx/mobile/mobile_splash.2bpp: tools/gfx += --remove-duplicates --remove-xflip
gfx/mobile/card.2bpp: tools/gfx += --trim-whitespace
gfx/mobile/card_2.2bpp: tools/gfx += --trim-whitespace
gfx/mobile/card_folder.2bpp: tools/gfx += --trim-whitespace
gfx/mobile/phone_tiles.2bpp: tools/gfx += --remove-whitespace
gfx/mobile/pichu_animated.2bpp: tools/gfx += --trim-whitespace
gfx/mobile/stadium2_n64.2bpp: tools/gfx += --trim-whitespace


### Catch-all graphics rules

%.2bpp: %.png
	$(RGBGFX) $(rgbgfx) -o $@ $<
	$(if $(tools/gfx),\
		tools/gfx $(tools/gfx) -o $@ $@)

%.1bpp: %.png
	$(RGBGFX) $(rgbgfx) -d1 -o $@ $<
	$(if $(tools/gfx),\
		tools/gfx $(tools/gfx) -d1 -o $@ $@)

%.dimensions: %.png
	tools/png_dimensions $< $@
