INCLUDE "./macros.asm"

	Mystery_Event

	db CHECKSUM_CRC
	dd 0 ; checksum placeholder
	GBAPTR DataStart
	GBAPTR DataEnd

DataStart:
	db GIVE_POKEMON
	GBAPTR PokemonStart 
	db $02

PokemonStart:
;	PersonalityValues $00F300F3; -> l'encodage en hexadecimal fonctionne toujours (retirer le ; en début de ligne pour activer)
	PersonalityValues SHINY_RIGIDE_MALE ; fonctionne seulement pour OT_ID 00000,00000 (ajouter un ; en début de ligne pour désactiver) 
	OT_ID 00000, 00000
	Text_FR "BELDUM"10
	Langue $0202	;Langue $0201=JP $0202=EN $0203=FR $0204=IT $0205=DE $0206=KR $0207=ES $0601=OEUF
	Text_FR "STEVEN"7
	Marquage 0 ;
	dw 0 ;Checksum, calculée plus tard
	dw 0 ;inconnu


;Partie GROWTH de la Data Substructure du pokémon
	Pokemon TERHAL
	Objet LETTRE_SONGE
	Experience 156
	PP_Ups 0,0,0,0
	Bonheur 0
	dw 0 ;inconnu


;Partie ATTACKS de la Data Substructure du pokémon
	Capacites POING_METEOR, BALL_OMBRE, SEISME, BOMB_BEURK
	PP 10, 15, 10, 10


;Partie EV & CONDITION de la Data Substructure du pokémon
	EVs 0,255,0,0,255,0
	Condition 0,0,0,0,0,0    ;i.e. Contest Condition


;Partie MISCELLANEOUS de la Data Substructure du pokémon
	Pokerus 0
	LieuRencontre $FF
	Origine 5,3,4,0  ; 				NivDeRencontre, JeuDOrigine, Pokéball, GenreDuDresseurDOrigine
	IVs 31,31,31,31,31,31, CAPACITE_SPE_1 ;		Alternativement TERHAL_CORPS_SAIN est aussi une écriture valide
	Rubans 0


	ChangementStatut 0
	Niv 5
	PokerusRestant 0
	PvActuels 20
	PvTotaux 20
	Attaque 16
	Defense 14
	Vitesse 9
	AtqSpe 9
	DefSpe 15

;section lettre
	Lettre_FR VOICI,UN,JOLI,POKEMON,POUR,TOI,PRENDS,EN,_SOIN
	Text_FR "Youpi"8
	OT_ID 00000, 00000
	Pokemon TERHAL
	Objet LETTRE_SONGE
	
	db $03, $00;


DataEnd:
	EOF