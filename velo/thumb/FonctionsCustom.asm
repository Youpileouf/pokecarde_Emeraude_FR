DEF STD_OBTAIN_ITEM 	EQU $00

DEF TRUE 		EQU $1
DEF FALSE 		EQU $0

MACRO closemessage
	db $68
	ENDM

MACRO giveitem
	copyvarifnotzero $8000, \1
	copyvarifnotzero $8001, \2
	callstd STD_OBTAIN_ITEM
	ENDM