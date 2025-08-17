INCLUDE "berries/macros.asm"

	Baie_Enigma

	Text_FR "DIRA@@@"7
	Fermete TRES_FERME
	Dimension 13,4
	Recolte 2, 3
	Etiquette PREMIERE_LIGNE
	Etiquette SECONDE_LIGNE
	Croissance_Heures 18
	Saveurs 0, 0, 40, 0, 0
	Onctuosité 65

	db 0,0,0
	db $10 ; cures poison
	db 0,0,0,0,0,0,0,0,0,0,0,0,0,0
	db $04 ; self-cures poison
	db 0

	End_Berry