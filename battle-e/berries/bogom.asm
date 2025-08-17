INCLUDE "berries/macros.asm"
	
	Baie_Enigma

	Text_FR "BOGOM"7
	Fermete FERME
	Dimension 22,0
	Recolte 1, 3
	Etiquette PREMIERE_LIGNE
	Etiquette SECONDE_LIGNE
	Croissance_Heures 18
	Saveurs 10, 10, 10, 10, 10
	Onctuosite 5

	db 0,0,0
	db 0 ; No bag effect
	db 0,0,0,0,0,0,0,0,0,0,0,0,0,0
	db 0 ; No in combat effect
	db 0

	End_Berry