all: build/00-P000-FR-01.raw verify

.PHONY: verify
verify: build/00-P000-FR.z80 
	md5sum --check ribbons.md5

build/prologue-%.tx: prologue.asm
	python3 ../scripts/regionalize.py $< $@ $* $*
build/prologue-%.o: build/prologue-%.tx
	../bin/rgbds/v0.9.1/rgbasm -M $@.d -o $@ $<
build/prologue-%.gbc: build/prologue-%.o
	../bin/rgbds/v0.9.1/rgblink -o $@ $<
build/prologue-%.bin: build/prologue-%.gbc
	python3 ../scripts/stripgbc.py $< $@

.PRECIOUS: build/prologue-%.tx build/prologue-%.o build/prologue-%.gbc build/prologue-%.bin

build/pokedex-%.tx: pokedex.asm
	python3 ../scripts/regionalize.py $< $@ $* $*
build/pokedex-%.o: build/pokedex-%.tx
	../bin/rgbds/v0.9.1/rgbasm -M $@.d -o $@ $<
build/pokedex-%.gbc: build/pokedex-%.o
	../bin/rgbds/v0.9.1/rgblink -o $@ $<
build/pokedex-%.bin: build/pokedex-%.gbc
	python3 ../scripts/stripgbc.py $< $@
build/pokedex-%.mev: build/pokedex-%.bin
	python3 ../scripts/checksum.py $< $@

.PRECIOUS: build/pokedex-%.tx build/pokedex-%.o build/pokedex-%.gbc build/pokedex-%.bin build/pokedex-%.mev

build/00-P000-%.tx: 00-P000.asm build/pokedex-%.mev build/prologue-%.bin
	python3 ../scripts/ereadertext.py $< $@ $*
build/00-P000-%.o: build/00-P000-%.tx
	../bin/rgbds/v0.9.1/rgbasm -M $@.d -I build -o $@ $<
build/00-P000-%.gbc: build/00-P000-%.o
	../bin/rgbds/v0.9.1/rgblink -o $@ $<
build/00-P000-%.z80: build/00-P000-%.gbc
	python3 ../scripts/stripgbc.py $< $@
build/00-P000-%.vpk: build/00-P000-%.z80
	../bin/nedc/v1.4/nevpk -c -i $< -o $@
build/00-P000-%-01.raw: build/00-P000-%.vpk
	../bin/nedc/v1.4/nedcmake -i $< -o $(subst -01.raw,,$@) -type 1 -region 1

.PRECIOUS: build/00-P000-%.tx build/00-P000-%.o build/00-P000-%.gbc build/00-P000-%.z80 build/00-P000-%.vpk build/00-P000-%-01.raw

# Automatically create build dirs if missing
BUILD_DIRS=build
$(info $(shell mkdir -p $(BUILD_DIRS)))

.PHONY: clean
clean:
	rm -rf build && mkdir -p $(BUILD_DIRS)

# Automatically generated dep files
-include build/*.d
