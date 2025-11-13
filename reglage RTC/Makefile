all: build/00-H000-FR-01.raw verify

.PHONY: verify
verify: build/00-H000-FR.z80 
	md5sum --check horloge.md5

build/prologue-%.tx: prologue.asm
	python3 ../scripts/regionalize.py $< $@ $* $*
build/prologue-%.o: build/prologue-%.tx
	../bin/rgbds/v0.9.1/rgbasm -M $@.d -o $@ $<
build/prologue-%.gbc: build/prologue-%.o
	../bin/rgbds/v0.9.1/rgblink -o $@ $<
build/prologue-%.bin: build/prologue-%.gbc
	python3 ../scripts/stripgbc.py $< $@

.PRECIOUS: build/prologue-%.tx build/prologue-%.o build/prologue-%.gbc build/prologue-%.bin

build/horloge-%.tx: horloge.asm
	python3 ../scripts/regionalize.py $< $@ $* $*
build/horloge-%.o: build/horloge-%.tx
	../bin/rgbds/v0.9.1/rgbasm -M $@.d -o $@ $<
build/horloge-%.gbc: build/horloge-%.o
	../bin/rgbds/v0.9.1/rgblink -o $@ $<
build/horloge-%.bin: build/horloge-%.gbc
	python3 ../scripts/stripgbc.py $< $@
build/horloge-%.mev: build/horloge-%.bin
	python3 ../scripts/checksum.py $< $@

.PRECIOUS: build/horloge-%.tx build/horloge-%.o build/horloge-%.gbc build/horloge-%.bin build/horloge-%.mev

build/00-H000-%.tx: 00-H000.asm build/horloge-%.mev build/prologue-%.bin
	python3 ../scripts/ereadertext.py $< $@ $*
build/00-H000-%.o: build/00-H000-%.tx
	../bin/rgbds/v0.9.1/rgbasm -M $@.d -I build -o $@ $<
build/00-H000-%.gbc: build/00-H000-%.o
	../bin/rgbds/v0.9.1/rgblink -o $@ $<
build/00-H000-%.z80: build/00-H000-%.gbc
	python3 ../scripts/stripgbc.py $< $@
build/00-H000-%.vpk: build/00-H000-%.z80
	../bin/nedc/v1.4/nevpk -c -i $< -o $@
build/00-H000-%-01.raw: build/00-H000-%.vpk
	../bin/nedc/v1.4/nedcmake -i $< -o $(subst -01.raw,,$@) -type 1 -region 1

.PRECIOUS: build/00-H000-%.tx build/00-H000-%.o build/00-H000-%.gbc build/00-H000-%.z80 build/00-H000-%.vpk build/00-H000-%-01.raw

# Automatically create build dirs if missing
BUILD_DIRS=build
$(info $(shell mkdir -p $(BUILD_DIRS)))

.PHONY: clean
clean:
	rm -rf build && mkdir -p $(BUILD_DIRS)

# Automatically generated dep files
-include build/*.d
