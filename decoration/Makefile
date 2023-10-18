all: 08-O001-EN.raw
.SECONDARY: 08-O002-EN.z80

decoration-%.tx: decoration.asm
	python ../scripts/regionalize.py $< $@ $* $*
decoration-%.o: decoration-%.tx
	./rgbasm.exe -o $@ $<
decoration-%.gbc: decoration-%.o
	./rgblink.exe -o $@ $<
decoration-%.bin: decoration-%.gbc
	python ../scripts/stripgbc.py $< $@
decoration-%.mev: decoration-%.bin
	python ../scripts/checksum_regi.py $< $@

prologue-%.tx: prologue.asm
	python ../scripts/regionalize.py $< $@ $* $*
prologue-%.o: prologue-%.tx
	./rgbasm.exe -o $@ $<
prologue-%.gbc: prologue-%.o
	./rgblink.exe -o $@ $<
prologue-%.bin: prologue-%.gbc
	python ../scripts/stripgbc.py $< $@

08-O001-%.tx: 08-O001.asm decoration-%.mev prologue-%.bin
	python ../scripts/ereadertext.py $< $@ $*
08-O001-%.o: 08-O001-%.tx
	./rgbasm.exe -o $@ $<
08-O001-%.gbc: 08-O001-%.o
	./rgblink.exe -o $@ $<
08-O001-%.z80: 08-O001-%.gbc
	python ../scripts/stripgbc.py $< $@
08-O001-%.vpk: 08-O001-%.z80
	./nevpk.exe -c -i $< -o $@
08-O001-%.raw: 08-O001-%.vpk
	./nedcmake.exe -i $< -o $@ -type 1 -region 1
	mv $@-01.raw $@

decoration-tickets-%.tx: decoration-tickets.asm
	python ../scripts/regionalize.py $< $@ $* $*
decoration-tickets-%.o: decoration-tickets-%.tx
	./rgbasm.exe -o $@ $<
decoration-tickets-%.gbc: decoration-tickets-%.o
	./rgblink.exe -o $@ $<
decoration-tickets-%.bin: decoration-tickets-%.gbc
	python ../scripts/stripgbc.py $< $@
decoration-tickets-%.mev: decoration-tickets-%.bin
	python ../scripts/checksum_regi.py $< $@

08-O002-%.tx: 08-O002.asm decoration-tickets-%.mev prologue-%.bin
	python ../scripts/ereadertext.py $< $@ $*
08-O002-%.o: 08-O002-%.tx
	./rgbasm.exe -o $@ $<
08-O002-%.gbc: 08-O002-%.o
	./rgblink.exe -o $@ $<
08-O002-%.z80: 08-O002-%.gbc
	python ../scripts/stripgbc.py $< $@
08-O002-%.vpk: 08-O002-%.z80
	./nevpk.exe -c -i $< -o $@
08-O002-%.raw: 08-O002-%.vpk
	./nedcmake.exe -i $< -o $@ -type 1 -region 1
	mv $@-01.raw $@

clean:
	rm -f *.tx *.o *.gbc *.z80 *.bin *.mev *.vpk *.raw