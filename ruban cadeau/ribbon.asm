INCLUDE "../macros.asm"
INCLUDE "../constants/scriptcommands.asm"
INCLUDE "../constants/ribbons.asm"

	Mystery_Event

	db CHECKSUM_CRC
	dd 0 ; checksum placeholder
	GBAPTR DataStart
	GBAPTR DataEnd

DataStart:
	db AWARD_RIBBON 
	Ruban_Offert 		RUBAN_TERRE
	Description_Ruban 	DESCRIPTION_RUBAN_TERRE
	db $02 ; end of chunks

DataEnd:
	EOF