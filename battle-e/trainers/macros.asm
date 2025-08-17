INCLUDE "../macros.asm"
INCLUDE "../constants/abilities.asm"
INCLUDE "../constants/easychat.asm"
INCLUDE "../constants/items.asm"
INCLUDE "../constants/moves.asm"
INCLUDE "../constants/natures.asm"
INCLUDE "../constants/pokemon.asm"
INCLUDE "../constants/trainerclasses.asm"

DEF ATALANOPOLIS EQU 0

MACRO Combat_Dresseur
	Section "battle",ROM0[$100]
	db $01
	dd $02000000
	db $FF,0,$FF,0,0,0,$04,0,$80,$03,0,0 ; $FF to by-pass region lock $03 for Emerald game flag
	db $0D
	dd $02000018
	db $02,$00
	ENDM

MACRO Dresseur_MtDresseur
	REPT 253
		db $00 ; pads the data to 256 bytes
	ENDR
	ENDM

DEF Num_MtDresseur EQUS "dd"
DEF Niveau_TC EQUS "db"
DEF Classe EQUS "db"
DEF Etage_TC EQUS "dw" ; the byte after it is 00, but apparently means something…

MACRO Intro_FR
	IF REGION == REGION_FR
	dw \1, \2, \3, \4, \5, \6
	ENDC
	ENDM
MACRO Victoire_FR
	IF REGION == REGION_FR
	dw \1, \2, \3, \4, \5, \6
	ENDC
	ENDM
MACRO Defaite_FR
	IF REGION == REGION_FR
	dw \1, \2, \3, \4, \5, \6
	ENDC
	ENDM
MACRO Apres_Combat_FR
	IF REGION == REGION_FR
	dw \1, \2, \3, \4, \5, \6
	ENDC
	ENDM

DEF Pokemon EQUS "dw"
DEF Objet EQUS "dw"
DEF Capacites EQUS "dw"
DEF Niv EQUS "db"
MACRO PP_Ups
	db (\1) + (\2 << 2) + (\3 << 4) + (\4 << 6)
	ENDM
DEF EVs EQUS "db"
DEF OT_ID EQUS "dw"
MACRO IVs
	dw \1 + (\2 << 5) + (\3 << 10) + ((\4 & 1) << 15)
	dw (\4 >> 1) + (\5 << 4) + (\6 << 9) + (\7 << 15)
	ENDM
MACRO PV
	dw (\1 & $FFFF), (\1 >> 16)
	ENDM
DEF Bonheur EQUS "db"

MACRO End_Trainer
	db 0,0,0,0
	EOF
	ENDM