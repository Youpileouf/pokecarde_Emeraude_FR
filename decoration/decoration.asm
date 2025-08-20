INCLUDE "../macros.asm"
INCLUDE "../constants/items.asm"
INCLUDE "../constants/scriptcommands.asm"
SECTION "CODE", ROM0

DataStartRegirock:
	Mystery_Event
	db CHECKSUM_CRC 
	dd 0 ; checksum placeholder
	GBAPTR ScriptStartRegirock 
	GBAPTR RegirockEnd 

ScriptStartRegirock:
	db PRELOAD_SCRIPT
	GBAPTR PreloadScriptStartRegirock
	db END_OF_CHUNKS

PreloadScriptStartRegirock:
	setvirtualaddress PreloadScriptStartRegirock
	bufferdecorationname $00, $0076 ;Regirock doll
	adddecoration $0076
	compare $800D, $0000
	virtualgotoif $01, TransferFailRegirock
	virtualloadpointer TransferSuccessRegirock
	setbyte $02
	end

TransferFailRegirock:
	virtualloadpointer TransferFailTextRegirock
	setbyte $03
	end

TransferSuccessRegirock:
	Text_FR "Une \v2 a été\n"
	Text_FR "réceptionnée!@"

TransferFailTextRegirock:
	Text_FR "Plus de place pour la\n"
	Text_FR "\v2...@"

RegirockEnd:
	db $00,$00,$00


DataStartRegice:
	db $01,$00,$00,$00,$02,$FF,$00,$FF,$00,$00,$00,$04,$00,$80,$03,$00,$00 ; This is here because it doesn't like Mystery_Event being used more than once
	db CHECKSUM_CRC
	dd 0 ; checksum placeholder
	GBAPTR ScriptStartRegirock ;Uses the Regirock pointers, I assume there's some data swapping shenanigans somewhere
	GBAPTR RegirockEnd

ScriptStartRegice:
	db PRELOAD_SCRIPT
	GBAPTR PreloadScriptStartRegirock
	db END_OF_CHUNKS

PreloadScriptStartRegice:
	setvirtualaddress PreloadScriptStartRegirock
	bufferdecorationname $00, $0077 ;Regice doll
	adddecoration $0077
	compare $800D, $0000
	virtualgotoif $01, TransferFailRegirock     ;Once again uses regirock pointers
	virtualloadpointer TransferSuccessRegirock
	setbyte $02
	end

TransferFailRegice:
	virtualloadpointer TransferFailTextRegirock
	setbyte $03
	end

TransferSuccessRegice:
	Text_FR "Une \v2 a été\n"
	Text_FR "réceptionnée!@"


TransferFailTextRegice:
	Text_FR "Plus de place pour la\n"
	Text_FR "\v2...@"

RegiceEnd:
	db $00,$00,$00

DataStartRegisteel:
	db $01,$00,$00,$00,$02,$FF,$00,$FF,$00,$00,$00,$04,$00,$80,$03,$00,$00 ; Mystery_Event
	db CHECKSUM_CRC
	dd 0 ; checksum placeholder
	GBAPTR ScriptStartRegirock
	GBAPTR RegirockEnd

ScriptStartRegisteel:
	db PRELOAD_SCRIPT
	GBAPTR PreloadScriptStartRegirock
	db END_OF_CHUNKS

PreloadScriptStartRegisteel:
	setvirtualaddress PreloadScriptStartRegirock
	bufferdecorationname $00, $0078 ;Registeel doll
	adddecoration $0078
	compare $800D, $0000
	virtualgotoif $01, TransferFailRegirock  ;Once again uses regirock pointers
	virtualloadpointer TransferSuccessRegirock
	setbyte $02
	end

TransferFailRegisteel:
	virtualloadpointer TransferFailTextRegirock
	setbyte $03
	end

TransferSuccessRegisteel:
	Text_FR "Une \v2 a été\n"
	Text_FR "réceptionnée!@"


TransferFailTextRegisteel:
	Text_FR "Plus de place pour la\n"
	Text_FR "\v2...@"

RegisteelEnd:
	db $00,$00,$00

EndofRegiChunks:

DataEnd:
	EOF
