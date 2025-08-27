INCLUDE "../macros.asm"
INCLUDE "../constants/abilities.asm"
INCLUDE "../constants/easychat.asm"
INCLUDE "../constants/items.asm"
INCLUDE "../constants/moves.asm"
INCLUDE "../constants/natures.asm"
INCLUDE "../constants/pokemon.asm"



MACRO PersonalityValues
	dw (\1 & $FFFF), (\1 >> 16)
	ENDM
DEF OT_ID EQUS "dw"
DEF Langue EQUS "dw"
DEF Marquage EQUS "db"


DEF Pokemon EQUS "dw"
DEF Objet EQUS "dw"
DEF Experience EQUS "dd"
MACRO PP_Ups
	db (\1) + (\2 << 2) + (\3 << 4) + (\4 << 6)
	ENDM
DEF Bonheur EQUS "db"


DEF Capacites EQUS "dw"
DEF PP EQUS "db"


DEF EVs EQUS "db"
DEF Condition EQUS "db"


DEF Pokerus EQUS "db"
DEF LieuRencontre EQUS "db"
MACRO Origine
	dw \1 + (\2 << 7) + (\3 << 11) + (\4 << 15)
	ENDM
MACRO IVs
	dw \1 + (\2 << 5) + (\3 << 10) + ((\4 & 1) << 15)
	dw (\4 >> 1) + (\5 << 4) + (\6 << 9) + (\7 << 15)
	ENDM
MACRO CapaciteSpe
	dd (\1 << 28)
	ENDM
DEF Rubans EQUS "dd"


DEF ChangementStatut EQUS "dd"
DEF Niv EQUS "db"
DEF PokerusRestant EQUS "db"
DEF PvActuels EQUS "dw"
DEF PvTotaux EQUS "dw"
DEF Attaque EQUS "dw"
DEF Defense EQUS "dw"
DEF Vitesse EQUS "dw"
DEF AtqSpe EQUS "dw"
DEF DefSpe EQUS "dw"

MACRO Lettre_FR
	IF REGION == REGION_FR
	dw \1, \2, \3, \4, \5, \6, \7, \8, \9
	ENDC
	ENDM
