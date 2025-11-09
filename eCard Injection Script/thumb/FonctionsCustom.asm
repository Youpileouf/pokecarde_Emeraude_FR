MACRO WriteASM ; Emeraude Français
	db $1E
	db $20
	db $01
	db $49
	db $01
	db $4A
	db $10
	db $47
	db $54
	db $C0
	db $01
	db $02
	db $D5
	db $25
	db $15
	db $08
	ENDM

MACRO ReadASM ; Emeraude Français
	db $1E
	db $20
	db $01
	db $49
	db $01
	db $4B
	db $18
	db $47
	db $BC
	db $AB
	db $03
	db $02
	db $19
	db $2E
	db $15
	db $08
	ENDM