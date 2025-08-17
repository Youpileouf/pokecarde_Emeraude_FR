INCLUDE "berries/macros.asm"

	Baie_Enigma

	Text_FR "ONYON@@"7
	Fermete TRES_FERME
	Dimension 3,5
	Recolte 2, 3
	Etiquette PREMIERE_LIGNE
	Etiquette SECONDE_LIGNE
	Croissance_Heures 18
	Saveurs 0, 30, 0, 0, 30
	Onctuosite 85

	db 0,0,0
	db $00
	db 0,0,0,0,0,0,0,0,0,0,0,0,0,0
	db $17 ; self-restores a lowered stat
	db 0

	End_Berry