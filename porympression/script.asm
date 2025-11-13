INCLUDE "../macros.asm"
INCLUDE "../constants/items.asm"
INCLUDE "../constants/scriptcommands.asm"
INCLUDE "../porympression/thumb/FonctionsCustom.asm"

	Mystery_Event

	db CHECKSUM_CRC
	dd 0 ; checksum placeholder
	GBAPTR DataStart
	GBAPTR DataEnd

DataStart:
	db IN_GAME_SCRIPT
	db 11, 01	; Devon Corporation
	db 1		; Scientist ("Talk to Pokémon")
	GBAPTR PrinterScriptStart
	GBAPTR PrinterScriptEnd

	db PRELOAD_SCRIPT
	GBAPTR PreloadScriptStart

	db END_OF_CHUNKS

PrinterScriptStart:
	setvirtualaddress PrinterScriptStart

	lock
	faceplayer
	
	virtualmsgbox Intro
	waitmsg
	waitkeypress
Recommencer:	
	showmoneybox

	virtualmsgbox AskMoney
	waitmsg
	yesnobox 22, 8
	compare LASTRESULT, FALSE
	virtualgotoif EQUAL, Goodbye
	
	checkmoney $00002710
	compare LASTRESULT, FALSE
	virtualgotoif EQUAL, NoMoney

	removemoney $00002710
	updatemoneybox
	playse SE_SHOP
	waitsecilerba

	virtualmsgbox TakeMoney
	waitmsg
	waitkeypress
	closemessage
	hidemoneybox
	delay 10
	
	copybyte $03005d80, $030022E0		; Seed RNG using gMain.vBlankCounter1... I think
	copybyte $03005d81, $030022E1
	copybyte $03005d82, $030022E2
	copybyte $03005d83, $030022E3

	setvar VAR_TEMP_2, $A ; Loop counter
	fadescreen FADE_TO_BLACK
	delay 30
	playmoncry $0E9, 0 ; PORYGON2
	waitmoncry
	playbgm MUS_RG_TEACHY_TV_MENU, FALSE
	
DoPrint:
	random 50

	copyvar VAR_TEMP_3, LASTRESULT
	addvar VAR_TEMP_3, CT01
	bufferitemname STR_VAR_1, VAR_TEMP_3
	copyvar VAR_0x8004, VAR_TEMP_3
	additem VAR_TEMP_3, 1
	
	
	db $25		; special
	dw $019E	; BufferTMHMMoveName
	compare LASTRESULT, FALSE
	virtualgotoif NOT_EQUAL, .msgsuccess
	virtualmsgbox AddFail
	playse SE_FAILURE
	goto .aftermsg
.msgsuccess
	virtualmsgbox AddSuccess
	playse SE_SUCCESS
.aftermsg
	waitmsg
	waitkeypress

	subvar VAR_TEMP_2, 1
	
	compare VAR_TEMP_2, 0
	virtualgotoif NOT_EQUAL, DoPrint
	closemessage
	fadedefaultbgm
	fadescreen FADE_FROM_BLACK

	virtualmsgbox Continue
	waitmsg
	yesnobox 22, 8
	compare LASTRESULT, FALSE
	virtualgotoif EQUAL, Kill
	vgoto Recommencer

Goodbye:
	virtualmsgbox GoodbyeText
	waitmsg
	waitkeypress
	closemessage
	hidemoneybox
	release
	end

Kill:
	virtualmsgbox Shutdown
	waitmsg
	waitkeypress
	closemessage
	release
	end

NoMoney:
	virtualmsgbox NotEnough
	waitmsg
	waitkeypress
	closemessage
	hidemoneybox
	release
	end

Intro:
	Text_FR "J’ai écris un programme appelé\n"
	Text_FR "PORY IMPRESSION!\p"

	Text_FR "Il grave des CAPSULES TECHNIQUES\n"
	Text_FR "plus vite qu’un NINJASK!@"

Shutdown:
	Text_FR "5 sur 5. Extinction\n"
	Text_FR "de la PORY IMPRESSION.@"

Continue:
	Text_FR "Veux-tu que je continue de faire\n"
	Text_FR "tourner la PORY IMPRESSION?@"

GoodbyeText:
	Text_FR "A plus!@"

AskMoney:
	Text_FR "Veux-tu l’essayer\n"
	Text_FR "pour $10 000?@"

AddFail:
	Text_FR "\v2 \v3 gravé!\nSAC plein détecté…@"

AddSuccess:
	Text_FR "\v2 \v3 gravé!\nCT ajouté au SAC!@"

TakeMoney:
	Text_FR "Merci beaucoup.\n"
	Text_FR "C’est à toi, PORYGON2!@"

NotEnough:
	Text_FR "Désolé. L’entretien des serveurs n’est\p"
	Text_FR "pas donné. Reviens quand tu auras\n"
	Text_FR "assez d’argent.@"

PrinterScriptEnd:


PreloadScriptStart:
	setvirtualaddress PreloadScriptStart

	virtualloadpointer Done
	setbyte 2
	end

Done:
	Text_FR "La PORY IMPRESSION est prête! Va\n"
	Text_FR "à la DEVON SARL pour commencer!@"

DataEnd:
	EOF
