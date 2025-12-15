DEF VAR_TEMP_0 EQU $4000
DEF VAR_TEMP_1 EQU $4001
DEF VAR_TEMP_2 EQU $4002
DEF VAR_TEMP_3 EQU $4003
DEF VAR_TEMP_4 EQU $4004
DEF VAR_TEMP_5 EQU $4005
DEF VAR_TEMP_6 EQU $4006
DEF VAR_TEMP_7 EQU $4007
DEF VAR_TEMP_8 EQU $4008
DEF VAR_TEMP_9 EQU $4009
DEF VAR_TEMP_F EQU $400F

DEF VAR_0x8000 EQU $8000
DEF VAR_0x8001 EQU $8001
DEF VAR_0x8004 EQU $8004
DEF VAR_0x800A EQU $800A
DEF VAR_0x800B EQU $800B

DEF VAR_GULPIN_0x40FF	EQU $40FF ; E: Gulpin [Daily Shard]

DEF VAR_ITEM_ID 		EQU $800E
DEF FLAG_DAILY_GULPIN_0x920	EQU $920

DEF LESS_THAN		EQU 0
DEF EQUAL		EQU 1
DEF GREATER_THAN	EQU 2
DEF LESS_THAN_EQUAL	EQU 3
DEF GREATER_THAN_EQUAL	EQU 4
DEF NOT_EQUAL		EQU 5

DEF TRUE		EQU $1
DEF FALSE		EQU $0

DEF STR_VAR_1 		EQU $0
DEF STR_VAR_2 		EQU $1

DEF FADE_FROM_BLACK  	EQU 0
DEF FADE_TO_BLACK    	EQU 1
DEF FADE_FROM_WHITE  	EQU 2
DEF FADE_TO_WHITE    	EQU 3

DEF SE_SUCCESS		EQU 31
DEF SE_FAILURE		EQU 32

; Gulpin Printer
DEF COMMON		EQU $1
DEF UNCOMMON 		EQU $2
DEF RARE		EQU $3
DEF ULTRARARE		EQU $4

MACRO removeitem
	db $45
	dw \1 ; Item ID
	dw \2 ; Quantity
	ENDM
	
MACRO closemessage
	db $68
	ENDM
	
MACRO fadescreen
	db $97
	db \1
	ENDM
	
MACRO createvobject
	db $AA
	db \1 ; GFX Id
	db \2 ; Object Id
	dw \3 ; X
	dw \4 ; Y
	db \5 ; Elevation
	db \6 ; Direction
	ENDM
	
MACRO applymovement
	db $4F
	dw \1 ; Object Id
	dd \2 ; Movement pointer
	ENDM
	
MACRO waitmovement
	db $51
	dw \1 ; Object Id
	ENDM

MACRO randomitem
	db $00
	db $00;alignement
	db $FF
	db $B5
	db $1F
	db $48
	db $00
	db $68
	db $1F
	db $49
	db $40
	db $18
	db $02
	db $30
	db $06
	db $1C
	db $40
	db $B4
	db $20
	db $49
	db $80
	db $20
	db $C0
	db $01
	db $01
	db $30
	db $7B
	db $46
	db $05
	db $33
	db $9E
	db $46
	db $08
	db $47
	db $00
	db $25
	db $01
	db $28
	db $02
	db $D1
	db $06
	db $25
	db $00
	db $24
	db $0E
	db $E0
	db $02
	db $28
	db $02
	db $D1
	db $10
	db $25
	db $0E
	db $24
	db $09
	db $E0
	db $03
	db $28
	db $02
	db $D1
	db $08
	db $25
	db $32
	db $24
	db $04
	db $E0
	db $04
	db $28
	db $02
	db $D1
	db $04
	db $25
	db $46
	db $24
	db $FF
	db $E7
	db $40
	db $BC
	db $36
	db $19
	db $40
	db $B4
	db $0E
	db $48
	db $7B
	db $46
	db $05
	db $33
	db $9E
	db $46
	db $00
	db $47
	db $29
	db $1C
	db $0C
	db $4A
	db $7B
	db $46
	db $05
	db $33
	db $9E
	db $46
	db $10
	db $47
	db $02
	db $25
	db $68
	db $43
	db $10
	db $BC
	db $24
	db $18
	db $06
	db $4E
	db $80
	db $20
	db $C0
	db $01
	db $21
	db $88
	db $7D
	db $46
	db $05
	db $35
	db $AE
	db $46
	db $30
	db $47
	db $FF
	db $BD
	db $8C
	db $5D
	db $00
	db $03
	db $98
	db $35
	db $00
	db $00
	db $C1
	db $D6
	db $09
	db $08
	db $C9
	db $F5
	db $06
	db $08
	db $B5
	db $0B
	db $2F
	db $08
	db $A5
	db $D6
	db $09
	db $08
	ENDM

MACRO gulpintable
	dw $FF69
	dw BOULE_FUMEE
	dw PIERRE_STASE
	dw BAIE_ORAN
	dw SUPEREPOUSSE
	dw LIMONADE
	dw HUILE
	dw PAS_D_OBJET; UNCOMMON
	dw BAIE_SITRUS
	dw AMELIORATOR
	dw ECAILLEDRACO
	dw ECAILLEOCEAN
	dw DENT_OCEAN
	dw PEAU_METAL
	dw VIVE_GRIFFE
	dw ELIXIR
	dw HUILE_MAX
	dw PIERRESOLEIL
	dw PIERRE_LUNE
	dw PIERRE_FEU
	dw PIERREFOUDRE
	dw PIERRE_EAU
	dw PIERREPLANTE
	dw POUSS_ETOILE
	dw RAPPEL_MAX
	dw PAS_D_OBJET; RARE
	dw HERBEBLANCHE
	dw GRELOT_COQUE
	dw ROCHE_ROYALE
	dw LUXE_BALL
	dw GRELOT_ZEN
	dw RESTES
	dw ECAILLECOEUR
	dw MAX_ELIXIR
	dw PEPITE
	dw PAS_D_OBJET; ULTRA RARE
	dw OEUF_CHANCE
	dw PIECE_RUNE
	dw MULTI_EXP
	dw MASTER_BALL
	dw SUPER_BONBON
	dw PAS_D_OBJET
	ENDM
