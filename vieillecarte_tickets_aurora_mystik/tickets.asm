INCLUDE "../macros.asm"
INCLUDE "../constants/items.asm"
INCLUDE "../constants/scriptcommands.asm"
SECTION "CODE", ROM0

DataStartEonTicket:
	Mystery_Event
	db CHECKSUM_CRC
	dd 0 ; checksum placeholder
	GBAPTR ScriptStartEonTicket 
	GBAPTR EonTicketEnd

ScriptStartEonTicket: ; 008E
	db PRELOAD_SCRIPT
	GBAPTR PreloadScriptStartEonTicket
	db END_OF_CHUNKS

PreloadScriptStartEonTicket: ; 0094
	setvirtualaddress PreloadScriptStartEonTicket
	bufferitemname $01, VIEILLECARTE
	checkitem VIEILLECARTE, $0001
	compare $800D, $0001
	virtualgotoif $01, TransferFailEonTicket
	additem VIEILLECARTE, $0001
	setflag $013C ;					FLAG_RECEIVED_OLD_SEA_MAP
	setflag $08D6 ;					FLAG_ENABLE_SHIP_FARAWAY_ISLAND
	virtualloadpointer TransferSuccessEonTicket
	setbyte $02
	end

TransferFailEonTicket: ; 00B3
	virtualloadpointer TransferFailTextEonTicket
	setbyte $03
	end

TransferSuccessEonTicket:
	Text_FR "Une VIEILLECARTE a été\n"
	Text_FR "réceptionnée!@"

TransferFailTextEonTicket:
	Text_FR "La VIEILLECARTE a déjà\n"
	Text_FR "été receptionnée.@"
EonTicketEnd:
	db $00,$00,$00


DataStartAuroraTicket:
	db $01,$00,$00,$00,$02,$FF,$00,$FF,$00,$00,$00,$04,$00,$80,$03,$00,$00 ; Mystery_Event
	db CHECKSUM_CRC
	dd 0 ; checksum placeholder
	GBAPTR ScriptStartEonTicket
	GBAPTR EonTicketEnd

ScriptStartAuroraTicket:
	db PRELOAD_SCRIPT
	GBAPTR PreloadScriptStartEonTicket
	db END_OF_CHUNKS

PreloadScriptStartAuroraTicket:
	setvirtualaddress PreloadScriptStartEonTicket
	bufferitemname $01, TICKETAURORA
	checkitem TICKETAURORA, $0001
	compare $800D, $0001
	virtualgotoif $01, TransferFailEonTicket
	additem TICKETAURORA, $0001
	setflag $013A ;					FLAG_RECEIVED_AURORA_TICKET
	setflag $08D5 ;					FLAG_ENABLE_SHIP_BIRTH_ISLAND
	virtualloadpointer TransferSuccessEonTicket
	setbyte $02
	end

TransferFailAuroraTicket:
	virtualloadpointer TransferFailTextEonTicket
	setbyte $03
	end

TransferSuccessAuroraTicket:
	Text_FR "Un TICKETAURORA a été \n"
	Text_FR "réceptionné! @"


TransferFailTextAuroraTicket:
	Text_FR "Le TICKETAURORA a déjà\n"
	Text_FR "été receptionné. @"

AuroraTicketEnd:
	db $00,$00,$00

DataStartMysticTicket:
	db $01,$00,$00,$00,$02,$FF,$00,$FF,$00,$00,$00,$04,$00,$80,$03,$00,$00 ; Mystery_Event
	db CHECKSUM_CRC
	dd 0 ; checksum placeholder
	GBAPTR ScriptStartEonTicket
	GBAPTR EonTicketEnd

ScriptStartMysticTicket:
	db PRELOAD_SCRIPT
	GBAPTR PreloadScriptStartEonTicket
	db END_OF_CHUNKS

PreloadScriptStartMysticTicket:
	setvirtualaddress PreloadScriptStartEonTicket
	bufferitemname $01, TICKETMYSTIK
	checkitem TICKETMYSTIK, $0001
	compare $800D, $0001
	virtualgotoif $01, TransferFailEonTicket
	additem TICKETMYSTIK, $0001
	setflag $013B ; 				FLAG_RECEIVED_MYSTIC_TICKET
	setflag $08E0 ;					FLAG_ENABLE_SHIP_NAVEL_ROCK
	virtualloadpointer TransferSuccessEonTicket
	setbyte $02
	end

TransferFailMysticTicket:
	virtualloadpointer TransferFailTextEonTicket
	setbyte $03
	end

TransferSuccessMysticTicket:
	Text_FR "Un TICKETMYSTIK a été \n"
	Text_FR "réceptionné! @"


TransferFailTextMysticTicket:
	Text_FR "Le TICKETMYSTIK a déjà\n"
	Text_FR "été receptionné. @"

MysticTicketEnd:
	db $00,$00,$00

EndofTicketChunks:

DataEnd:
	EOF