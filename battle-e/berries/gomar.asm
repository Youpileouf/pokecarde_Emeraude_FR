INCLUDE "berries/macros.asm"

	Baie_Enigma

	Text_FR "GOMAR@@"7
	Fermete TRES_FERME
	Dimension 3,6
	Recolte 2, 3
	Etiquette PREMIERE_LIGNE
	Etiquette SECONDE_LIGNE
	Croissance_Heures 18
	Saveurs 0, 0, 0, 40, 0
	Onctuosite 65

	db 0,0,0
	db $08 ; cures burn
	db 0,0,0,0,0,0,0,0,0,0,0,0,0,0
	db $05 ; self-cures burn
	db 0

	End_Berry
