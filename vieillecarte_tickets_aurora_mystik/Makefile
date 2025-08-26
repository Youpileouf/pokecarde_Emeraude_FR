all: build/08-O002-FR-01.raw verify

.PHONY: verify
verify: build/08-O002-FR.z80 
	md5sum --check decoration.md5

build/prologue-%.tx: prologue.asm
	python3 ../scripts/regionalize.py $< $@ $* $*
build/prologue-%.o: build/prologue-%.tx
	../bin/rgbds/v0.9.1/rgbasm -M $@.d -o $@ $<
build/prologue-%.gbc: build/prologue-%.o
	../bin/rgbds/v0.9.1/rgblink -o $@ $<
build/prologue-%.bin: build/prologue-%.gbc
	python3 ../scripts/stripgbc.py $< $@

.PRECIOUS: build/prologue-%.tx build/prologue-%.o build/prologue-%.gbc build/prologue-%.bin

build/tickets-%.tx: tickets.asm
	python3 ../scripts/regionalize.py $< $@ $* $*
build/tickets-%.o: build/tickets-%.tx
	../bin/rgbds/v0.9.1/rgbasm -M $@.d -o $@ $<
build/tickets-%.gbc: build/tickets-%.o
	../bin/rgbds/v0.9.1/rgblink -o $@ $<
build/tickets-%.bin: build/tickets-%.gbc
	python3 ../scripts/stripgbc.py $< $@
build/tickets-%.mev: build/tickets-%.bin
	python3 ../scripts/checksum_regi.py $< $@

.PRECIOUS: build/tickets-%.tx build/tickets-%.o build/tickets-%.gbc build/tickets-%.bin build/tickets-%.mev

build/08-O002-%.tx: 08-O002.asm build/tickets-%.mev build/prologue-%.bin
	python3 ../scripts/ereadertext.py $< $@ $*
build/08-O002-%.o: build/08-O002-%.tx
	../bin/rgbds/v0.9.1/rgbasm -M $@.d -I build -o $@ $<
build/08-O002-%.gbc: build/08-O002-%.o
	../bin/rgbds/v0.9.1/rgblink -o $@ $<
build/08-O002-%.z80: build/08-O002-%.gbc
	python3 ../scripts/stripgbc.py $< $@
build/08-O002-%.vpk: build/08-O002-%.z80
	../bin/nedc/v1.4.1/nevpk -c -i $< -o $@
build/08-O002-%-01.raw: build/08-O002-%.vpk
	../bin/nedc/v1.4.1/nedcmake -i $< -o $(subst -01.raw,,$@) -type 1 -region 1

.PRECIOUS: build/08-O002-%.tx build/08-O002-%.o build/08-O002-%.gbc build/08-O002-%.z80 build/08-O002-%.vpk build/08-O002-%-01.raw

# Automatically create build dirs if missing
BUILD_DIRS=build
$(info $(shell mkdir -p $(BUILD_DIRS)))

.PHONY: clean
clean:
	rm -rf build && mkdir -p $(BUILD_DIRS)

# Automatically generated dep files
-include build/*.d
