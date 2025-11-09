INCLUDE "../macros.asm"
INCLUDE "../constants/items.asm"
INCLUDE "../constants/scriptcommands.asm"
INCLUDE "../eCard Injection Script/thumb/FonctionsCustom.asm"

	Mystery_Event

	db CHECKSUM_CRC
	dd 0 ; checksum placeholder
	GBAPTR DataStart
	GBAPTR DataEnd

DataStart:
	db IN_GAME_SCRIPT
	db $00,$12 ; 					Route 103 = 1200
	db 1   ; 					TopDresseur à côté de la grotte
	GBAPTR ScriptStart
	GBAPTR ScriptEnd

	db PRELOAD_SCRIPT
	GBAPTR PreloadScriptStart

	db END_OF_CHUNKS

PreloadScriptStart:
	setvirtualaddress PreloadScriptStart
	callnative $0201C045; 				Exécute WriteASM
	virtualloadpointer MessageDeTransfertScript
	setbyte 2
	dw $0000
	end
	WriteASM;					Code thumb dans /thumb/FonctionsCustom.asm
	;						WriteASM lit les 4096 bytes de code qui se
	;						trouvent sous lui et les copie dans le secteur
	;						30 de la save (complètement inutilisé dans les
	;						cartouches d'Emeraude non japonnaise)

VraiScriptStartHorsASLR:
	setvirtualaddress VraiScriptStartHorsASLR
	
	;Le vrai script est à rédiger ici
	;Grâce à l'astuce du WriteASM puis du ReadASM,
	;le code du script ne se situe plus dans les
	;zones mémoires soumises à l'ASLR.
	;Comme le code n'est plus stocké dans le 
	;RamScript, il n'est plus soumis à la limite
	;de taille de ce dernier. La limite passe de
	;995 bytes à 4096 bytes.

	end

MessageDeTransfertScript:
	Text_FR "Nouveau DLC disponible ! Va parler\n"
	Text_FR "à XXXX route YYYY.@"

ScriptStart:
	
	writebytetoaddr $1E, $02024744 ;		Stocke ReadASM dans gEnemyParty[0]
	writebytetoaddr $20, $02024745 ;		 
	writebytetoaddr $01, $02024746 ;		ReadASM lit les données du secteur 30
	writebytetoaddr $49, $02024747 ;		de la save et les copie dans l'EWRAM
	writebytetoaddr $01, $02024748 ;		à partir de 0x0203ABBC.
	writebytetoaddr $4B, $02024749 ;		
	writebytetoaddr $18, $0202474A ;		
	writebytetoaddr $47, $0202474B
	writebytetoaddr $BC, $0202474C
	writebytetoaddr $AB, $0202474D
	writebytetoaddr $03, $0202474E
	writebytetoaddr $02, $0202474F
	writebytetoaddr $19, $02024750
	writebytetoaddr $2E, $02024751
	writebytetoaddr $15, $02024752
	writebytetoaddr $08, $02024753

	callnative $02024745 ;				Exécute ReadASM

	goto $0203ABBC ; 				pointe vers le code qui vient d'être lu 

ScriptEnd:

DataEnd:
	EOF
