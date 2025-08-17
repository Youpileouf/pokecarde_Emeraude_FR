INCLUDE "berries/macros.asm"
	
	Baie_Enigma

	Text_FR "FILYS@@"7
	Fermete TENDRE
	Dimension 27,2
	Recolte 1, 2
	Etiquette PREMIERE_LIGNE
	Etiquette SECONDE_LIGNE
	Croissance_Heures 1
	Saveurs 30, 0, 30, 0, 0
	Onctuosite 85

	db 0,0,0
	db 0 ; No bag effect
	db 0,0,0,0,0,0,0,0,0,0,0,0,0,0
	db 0 ; No in combat effect
	db 0

	End_Berry