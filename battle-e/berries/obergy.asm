INCLUDE "berries/macros.asm"

	Baie_Enigma

	Text_FR "OBERGY@"7
	Fermete TENDRE
	Dimension 4,1
	Recolte 2, 3
	Etiquette PREMIERE_LIGNE
	Etiquette SECONDE_LIGNE
	Croissance_Heures 18
	Saveurs 0, 40, 0, 0, 0
	Onctuosite 65

	db 0,0,0
	db $00 ; No bag effect
	db 0,0,0,0, 0,0,0,0, 0,0,0,0, 0,0
	db $1C ; self-cure infatuation
	db 0

	End_Berry