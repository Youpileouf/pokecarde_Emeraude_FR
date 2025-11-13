INCLUDE "../macros.asm"
INCLUDE "../constants/scriptcommands.asm"

	Mystery_Event

	db CHECKSUM_CRC
	dd 0 ; checksum placeholder
	GBAPTR DataStart
	GBAPTR DataEnd

DataStart:
	db NATIONAL_POKEDEX 
	db $02 ; end of chunks

DataEnd:
	EOF