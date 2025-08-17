INCLUDE "berries/macros.asm"

	Baie_Enigma

	Text_FR "KIPICK@"7
	Fermete SUPER_FERME
	Dimension 15,3
	Recolte 2, 3
	Etiquette PREMIERE_LIGNE
	Etiquette SECONDE_LIGNE
	Croissance_Heures 18
	Saveurs 40, 0, 00, 0, 0
	Onctuosite 65

	db 0,0,0
	db $01 ; cures confusion
	db 0,0,0,0,0,0,0,0,0,0,0,0,0,0
	db $08 ; self-cures confusion
	db 0

	End_Berry