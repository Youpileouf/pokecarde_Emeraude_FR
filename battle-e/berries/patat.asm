INCLUDE "berries/macros.asm"
	
	Baie_Enigma

	Text_FR "PATAT@@"7
	Fermete TRES_FERME
	Dimension 8,8
	Recolte 4, 12
	Etiquette PREMIERE_LIGNE
	Etiquette SECONDE_LIGNE
	Croissance_Heures 24
	Saveurs 0, 0, 30, 0, 30
	Onctuosite 85

	db 0,0,0
	db 0 ; No bag effect
	db 0,0,0,0,0,0,0,0,0,0,0,0,0,0
	db 0 ; No in combat effect
	db 0

	End_Berry