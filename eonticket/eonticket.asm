INCLUDE "../macros.asm"
INCLUDE "../constants/items.asm"
INCLUDE "../constants/scriptcommands.asm"

	Mystery_Event

	db CHECKSUM_CRC
	dd 0 ; checksum placeholder
	GBAPTR DataStart
	GBAPTR DataEnd

DataStart:
	db IN_GAME_SCRIPT
	db 8,1 ; Petalburg Gym
	db 1   ; Norman
	GBAPTR NormanScriptStart
	GBAPTR NormanScriptEnd


	db MIX_RECORDS_ITEM
	db 1  ; ???
IF REGION == REGION_DE
	db 5  ; distribution limit from German debug ROM
ELSE
	db 30 ; distribution limit from English release
ENDC
	dw PASSE_EON


	db PRELOAD_SCRIPT
	GBAPTR PreloadScriptStart


	db END_OF_CHUNKS


GoSeeYourFather:
	Text_FR "Allez voir votre père à l’ARENE\n"
	Text_FR "POKéMON de CLEMENTI-VILLE.@"


NormanScriptStart:
	setvirtualaddress NormanScriptStart
	
	checkitem PASSE_EON, 1
	compare LASTRESULT, 1
	virtualgotoif 1, .delete_script
	checkpcitem PASSE_EON, 1
	compare LASTRESULT, 1
	virtualgotoif 1, .delete_script
	checkflag $00CE ;		FLAG_ENCOUNTERED_LATIAS_OR_LATIOS
	virtualgotoif 1, .delete_script
	
	lock
	faceplayer
	virtualmsgbox GoodToSeeYou
	waitmsg
	waitkeypress

	checkitemroom PASSE_EON, 1
	compare LASTRESULT, 0
	virtualgotoif 1, NoRoomToGive

	copyvarifnotzero $8000, PASSE_EON
	copyvarifnotzero $8001, 1
	callstd 0
	setflag $08B3 ;				FLAG_ENABLE_SHIP_SOUTHERN_ISLAND
	virtualmsgbox AppearsToBeAFerryTicket
	waitmsg
	waitkeypress
	release
.delete_script
	killscript

NoRoomToGive:
	virtualmsgbox KeyItemsPocketIsFull
	waitmsg
	waitkeypress
	release
	end

GoodToSeeYou:
	Text_FR "PAPA: \v1! Content de te voir! Nous\n"
	Text_FR "avons reçu une lettre pour toi, \v1.@" 

AppearsToBeAFerryTicket:
	Text_FR "PAPA: Ca ressemble a un passe de ferry\n"
	Text_FR "mais je n’en ai jamais vu de pareil.\p"
	Text_FR "Tu devrais visiter NENUCRIQUE\n"
	Text_FR "et te renseigner là-bas.@"

KeyItemsPocketIsFull:
	Text_FR "PAPA: \v1, la POCHE\n" 
	Text_FR "OBJ.RARES de ton sac est pleine.\p" 
	Text_FR "Déplace quelques OBJ.RARES dans ton\n"
	Text_FR "ton PC et reviens me voir.@"

NormanScriptEnd:


PreloadScriptStart:
	setvirtualaddress PreloadScriptStart
	
	checkitem PASSE_EON, 1
	compare LASTRESULT, 1
	virtualgotoif 1, .ineligible
	checkpcitem PASSE_EON, 1
	compare LASTRESULT, 1
	virtualgotoif 1, .ineligible
	checkflag $00CE ;		FLAG_ENCOUNTERED_LATIAS_OR_LATIOS
	virtualgotoif 1, .ineligible

	checkitemroom PASSE_EON, 1
	compare LASTRESULT, 0
	virtualgotoif 1, .no_room

	virtualloadpointer GoSeeYourFather
	setbyte 2
	end

.ineligible
	virtualloadpointer MayBeplayedOnlyOnce
	setbyte 3
	end

.no_room
	virtualloadpointer BagsKeyItemsPocketFull
	setbyte 3
	end

MayBeplayedOnlyOnce:
	Text_FR "Cet EVENEMENT n’est pas répétable.@"

BagsKeyItemsPocketFull:
	Text_FR "La POCHE OBJ.RARES de\n"
	Text_FR "ton SAC est pleine.@"

DataEnd:
	EOF
