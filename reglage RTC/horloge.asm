INCLUDE "../macros.asm"
INCLUDE "../constants/scriptcommands.asm"

	Mystery_Event

	db CHECKSUM_CRC
	dd 0 ; checksum placeholder
	GBAPTR DataStart
	GBAPTR DataEnd

DataStart:
	db CLOCK_ADJUSTMENT 
	db $02 ; end of chunks

DataEnd:
	EOF