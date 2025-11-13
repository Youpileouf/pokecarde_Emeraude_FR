INCLUDE "../macros.asm"
INCLUDE "../constants/items.asm"
INCLUDE "../constants/scriptcommands.asm"
INCLUDE "../velo/thumb/FonctionsCustom.asm"

	Mystery_Event

	db CHECKSUM_CRC
	dd 0 ; checksum placeholder
	GBAPTR DataStart
	GBAPTR DataEnd

DataStart:
	db IN_GAME_SCRIPT
	db 10, 1	; Bike Shop
	db 2		; NPC
	GBAPTR PrinterScriptStart
	GBAPTR PrinterScriptEnd

	db PRELOAD_SCRIPT
	GBAPTR PreloadScriptStart

	db END_OF_CHUNKS

PrinterScriptStart:
	setvirtualaddress PrinterScriptStart

	lock
	faceplayer
	
	virtualmsgbox Intro
	waitmsg
	waitkeypress
	
	checkitem VELO_COURSE, 1
	virtualgotoif FALSE, .giveMach
	giveitem VELO_CROSS, 1
	vgoto .givenBike
.giveMach
	giveitem VELO_COURSE, 1
.givenBike
	closemessage
	release
	killscript
	end

Intro:
	Text_FR "Le vendeur ne t’a donné qu’un\n"
	Text_FR "seul vélo?\p"

	Text_FR "Hérésie! Prends celui-ci.@"

PrinterScriptEnd:


PreloadScriptStart:
	setvirtualaddress PreloadScriptStart

	virtualloadpointer Done
	setbyte 2
	end

Done:
	Text_FR "Fais un tour au magasin de vélo.@"

DataEnd:
	EOF