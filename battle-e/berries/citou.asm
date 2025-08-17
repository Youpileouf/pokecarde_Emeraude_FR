INCLUDE "berries/macros.asm"

	Baie_Enigma

	Text_FR "CITOU@@"7
	Fermete SUPER_FERME
	Dimension 4,8
	Recolte 2, 3
	Etiquette PREMIERE_LIGNE
	Etiquette SECONDE_LIGNE
	Croissance_Heures 18
	Saveurs 0, 0, 0, 0, 40
	Onctuosite 65

	db 0,0,0
	db $04 ; cures freeze
	db 0,0,0,0, 0,0,0,0, 0,0,0,0, 0,0
	db $06 ; self-cures freeze
	db 0

	End_Berry