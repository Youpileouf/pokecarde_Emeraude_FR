INCLUDE "../macros.asm"

MACRO Baie_Enigma
	Section "berry",ROM0[$100]
	db $01
	dd $02000000
	db $FF,0,$FF,0,0,0,$04,0,$80,$03,0,0 ; $FF to by-pass region lock $03 for Emerald game flag
	db $07
	dd $02000018
	db $02,$00
	ENDM

; fermeté
DEF Fermete EQUS "db"
DEF TRES_TENDRE EQU 1
DEF TENDRE      EQU 2
DEF FERME       EQU 3
DEF TRES_FERME  EQU 4
DEF SUPER_FERME EQU 5

MACRO Dimension
	dw \1 * 10 + \2
	ENDM

MACRO Recolte
	db \2, \1
	ENDM

DEF Etiquette EQUS "db"
DEF PREMIERE_LIGNE EQUS "$FE,$E9,$58,$08" ; FR ROM offset Enigma tag1
DEF SECONDE_LIGNE EQUS "$1C,$EA,$58,$08" ; FR ROM offset Enigma tag2

DEF Croissance_Heures EQUS "db"
DEF Saveurs EQUS "db"
DEF Onctuosite EQUS "dw" ; not sure if the second byte is significant on its own

MACRO End_Berry
	dd 0 ; placeholder for checksum
	EOF
	ENDM
