INCLUDE "../macros.asm"
INCLUDE "../constants/items.asm"
INCLUDE "../constants/pokemon.asm"
INCLUDE "../constants/scriptcommands.asm"
INCLUDE "../Gloupti/thumb/FonctionsCustom.asm"

;callnative $2024795 = loadscript
;callnative $20247A9 = DestroyVirtualObjects
;callnative $2024799 = CpuSet
;0x02024744 -> 0x02024797 = Item Table
;0x02024798 -> 0x020247B3 = CpuSet
;0x02024794 -> 0x020247A7 = loadscript /!\ réécrit sur ItemTable et CpuSet
;0x020247A8 -> 0x020247B1 = DestroyVirtualObjects /!\ réécrit sur CpuSet

	Mystery_Event

	db CHECKSUM_CRC
	dd 0 ; checksum placeholder
	GBAPTR DataStart
	GBAPTR DataEnd

DataStart:
	db IN_GAME_SCRIPT
	db 12, 6	; Fortree City
	db 1		; FortreeCity_House3_EventScript_Maniac
	GBAPTR GulpinScriptStart
	GBAPTR GulpinScriptEnd

	db PRELOAD_SCRIPT
	GBAPTR PreloadScriptStart

	db END_OF_CHUNKS

GulpinScriptStart:
	setvirtualaddress GulpinScriptStart ;1+4
	
	vgoto Begin ; 1+4

	randomitem ; 

Begin:
	; Stocke loadscript dans gEnemyParty (2024744->202499B)
	writebytetoaddr $02, $2024794; Fait sauter l'exécution du script
	writebytetoaddr $48, $2024795; en gSaveBlock1Ptr + 0x373B
	writebytetoaddr $00, $2024796; 0x03005D8C + 0x373B
	writebytetoaddr $68, $2024797; 373B étant 0x13 après le début de RamScript
	writebytetoaddr $02, $2024798; cet Offset correspond à randomitem
	writebytetoaddr $49, $2024799
	writebytetoaddr $40, $202479A
	writebytetoaddr $18, $202479B
	writebytetoaddr $00, $202479C
	writebytetoaddr $47, $202479D
	writebytetoaddr $C0, $202479E
	writebytetoaddr $46, $202479F
	writebytetoaddr $8C, $20247A0
	writebytetoaddr $5D, $20247A1
	writebytetoaddr $00, $20247A2
	writebytetoaddr $03, $20247A3
	writebytetoaddr $3B, $20247A4
	writebytetoaddr $37, $20247A5
	writebytetoaddr $00, $20247A6
	writebytetoaddr $00, $20247A7

	; Enregistre DestroyVirtualObjetcs dans gEnemyParty
	writebytetoaddr $00, $20247A8
	writebytetoaddr $48, $20247A9
	writebytetoaddr $00, $20247AA
	writebytetoaddr $47, $20247AB
	writebytetoaddr $01, $20247AC
	writebytetoaddr $7B, $20247AD
	writebytetoaddr $09, $20247AE
	writebytetoaddr $08, $20247AF
	writebytetoaddr $41, $20247B0
	writebytetoaddr $1F, $20247B1
	
	; enregistre Movement: Face Right dans gEnemyParty
	writebytetoaddr $20, $20247B4 ; MOVEMENT_ACTION_WALK_IN_PLACE_NORMAL_RIGHT
	writebytetoaddr $FE, $20247B5

	; Script start
	lock
	faceplayer

	dotimebasedevents
	checkflag FLAG_DAILY_GULPIN_0x920
	virtualgotoif TRUE, .skipShardRoll
	; Do shard roll
	random 3
	copyvar VAR_TEMP_3, LASTRESULT
	addvar VAR_TEMP_3, TESSON_ROUGE
	copyvar VAR_GULPIN_0x40FF, VAR_TEMP_3
	setflag FLAG_DAILY_GULPIN_0x920

.skipShardRoll
	bufferitemname STR_VAR_1, VAR_GULPIN_0x40FF
	virtualmsgbox Intro
	waitmsg
	yesnobox 22, 8
	compare LASTRESULT, FALSE
	virtualgotoif EQUAL, Goodbye

GiveItem:
	checkitem VAR_GULPIN_0x40FF, 1
	compare LASTRESULT, TRUE
	virtualgotoif NOT_EQUAL, NoShardEnd
	removeitem VAR_GULPIN_0x40FF, 1	
	
	bufferitemname STR_VAR_1, VAR_GULPIN_0x40FF
	virtualmsgbox HandedShard
	waitmsg
	waitkeypress
	closemessage

	compare VAR_TEMP_F, TRUE
	virtualgotoif EQUAL, .skipGulpin

	setvar VAR_TEMP_F, TRUE ; Gulpin is out
	playse 61 ; SE_BALL_THROW
	fadescreen FADE_TO_WHITE
	createvobject $A4, 5, 2, 3, 3, 0 ; Create Gulpin sprite (Right)
	fadescreen FADE_FROM_WHITE
	playmoncry GLOUPTI, 0
	waitmoncry
	
	applymovement $FF, $20247B4 ; Face right
	waitmovement $FF

.skipGulpin
	setvar VAR_TEMP_3, 10 ; How many items should dispense
GulpinLoop:
	random 100
	compare LASTRESULT, 70
	virtualgotoif LESS_THAN_EQUAL, .common
	compare LASTRESULT, 90
	virtualgotoif LESS_THAN_EQUAL, .uncommon
	compare LASTRESULT, 97
	virtualgotoif LESS_THAN_EQUAL, .rare
	; if nothing else, go straight to ultra rare
	setvar VAR_TEMP_1, ULTRARARE
	vgoto .giveItem
.rare
	setvar VAR_TEMP_1, RARE
	vgoto .giveItem
.uncommon
	setvar VAR_TEMP_1, UNCOMMON
	vgoto .giveItem
.common
	setvar VAR_TEMP_1, COMMON ; fall through
.giveItem
	callnative $2024795 ; exécute loadscript qui va exécuter randomitem
	bufferitemname STR_VAR_1, VAR_TEMP_0
	virtualmsgbox SpitOut
	waitmsg
	waitkeypress
	additem VAR_TEMP_0, 1
	compare LASTRESULT, TRUE
	virtualgotoif EQUAL, .msgsuccess
	virtualmsgbox SpitOutFail
	playse SE_FAILURE
	vgoto .aftermsg
.msgsuccess
	virtualmsgbox SpitOutSuccess
	playse SE_SUCCESS
.aftermsg
	waitmsg
	waitkeypress
	subvar VAR_TEMP_3, 1

	compare VAR_TEMP_3, 0
	virtualgotoif NOT_EQUAL, GulpinLoop

	bufferitemname STR_VAR_1, VAR_GULPIN_0x40FF
	virtualmsgbox Again
	waitmsg
	yesnobox 22, 8

	compare LASTRESULT, FALSE
	virtualgotoif EQUAL, Goodbye
	vgoto GiveItem

Goodbye:
	virtualmsgbox YourLoss
Ending:
	waitmsg
	waitkeypress
	closemessage

	compare VAR_TEMP_F, TRUE
	virtualgotoif FALSE, .skipGulpin

	
	playse 15 ; SE_BALL_OPEN
	fadescreen FADE_TO_WHITE
	callnative $20247A9 ; DestroyVirtualObjects
	fadescreen FADE_FROM_WHITE
	setvar VAR_TEMP_F, FALSE ; Gulpin is no longer out

.skipGulpin
	release
	end

NoShardEnd:
	virtualmsgbox NoShard
	vgoto Ending

Intro:
	Text_FR "Hey! Tu veux voir le tour que\n"
	Text_FR "j’ai appris à mon GLOUPTI?\p"

	Text_FR "Ca ne coûte qu’un \v2, heh.@"

YourLoss:
	Text_FR "Tant pis pour toi, gamin…@"

NoShard:
	Text_FR "Ne me fais pas perdre mon temps.@"

Again:
	Text_FR "Tu veux revoir le tour?\n"
	Text_FR "Ca fera juste un \v2.@"

HandedShard:
	Text_FR "\v1 donne un\n"
	Text_FR "\v2.@"

SpitOut:
	Text_FR "GLOUPTI régurgite \v2!@"

SpitOutFail:
	Text_FR "Ton SAC est plein…@"

SpitOutSuccess:
	Text_FR "Tu l’attrapes!@"

GulpinScriptEnd:


PreloadScriptStart:
	setvirtualaddress PreloadScriptStart

	virtualloadpointer Done
	setbyte 2

	; Stock Item Table dans gEnemyParty
	writebytetoaddr $69, $2024744
	writebytetoaddr $FF, $2024745
	writebytetoaddr $C2, $2024746
	writebytetoaddr $00, $2024747
	writebytetoaddr $C3, $2024748
	writebytetoaddr $00, $2024749
	writebytetoaddr $8B, $202474A
	writebytetoaddr $00, $202474B
	writebytetoaddr $53, $202474C
	writebytetoaddr $00, $202474D
	writebytetoaddr $1C, $202474E
	writebytetoaddr $00, $202474F
	writebytetoaddr $22, $2024750
	writebytetoaddr $00, $2024751
	writebytetoaddr $00, $2024752
	writebytetoaddr $00, $2024753
	writebytetoaddr $8E, $2024754
	writebytetoaddr $00, $2024755
	writebytetoaddr $DA, $2024756
	writebytetoaddr $00, $2024757
	writebytetoaddr $C9, $2024758
	writebytetoaddr $00, $2024759
	writebytetoaddr $C1, $202475A
	writebytetoaddr $00, $202475B
	writebytetoaddr $C0, $202475C
	writebytetoaddr $00, $202475D
	writebytetoaddr $C7, $202475E
	writebytetoaddr $00, $202475F
	writebytetoaddr $B7, $2024760
	writebytetoaddr $00, $2024761
	writebytetoaddr $24, $2024762
	writebytetoaddr $00, $2024763
	writebytetoaddr $23, $2024764
	writebytetoaddr $00, $2024765
	writebytetoaddr $5D, $2024766
	writebytetoaddr $00, $2024767
	writebytetoaddr $5E, $2024768
	writebytetoaddr $00, $2024769
	writebytetoaddr $5F, $202476A
	writebytetoaddr $00, $202476B
	writebytetoaddr $60, $202476C
	writebytetoaddr $00, $202476D
	writebytetoaddr $61, $202476E
	writebytetoaddr $00, $202476F
	writebytetoaddr $62, $2024770
	writebytetoaddr $00, $2024771
	writebytetoaddr $6C, $2024772
	writebytetoaddr $00, $2024773
	writebytetoaddr $19, $2024774
	writebytetoaddr $00, $2024775
	writebytetoaddr $00, $2024776
	writebytetoaddr $00, $2024777
	writebytetoaddr $B4, $2024778
	writebytetoaddr $00, $2024779
	writebytetoaddr $DB, $202477A
	writebytetoaddr $00, $202477B
	writebytetoaddr $BB, $202477C
	writebytetoaddr $00, $202477D
	writebytetoaddr $0B, $202477E
	writebytetoaddr $00, $202477F
	writebytetoaddr $B8, $2024780
	writebytetoaddr $00, $2024781
	writebytetoaddr $C8, $2024782
	writebytetoaddr $00, $2024783
	writebytetoaddr $6F, $2024784
	writebytetoaddr $00, $2024785
	writebytetoaddr $25, $2024786
	writebytetoaddr $00, $2024787
	writebytetoaddr $6E, $2024788
	writebytetoaddr $00, $2024789
	writebytetoaddr $00, $202478A
	writebytetoaddr $00, $202478B
	writebytetoaddr $C5, $202478C
	writebytetoaddr $00, $202478D
	writebytetoaddr $BD, $202478E
	writebytetoaddr $00, $202478F
	writebytetoaddr $B6, $2024790
	writebytetoaddr $00, $2024791
	writebytetoaddr $01, $2024792
	writebytetoaddr $00, $2024793
	writebytetoaddr $44, $2024794
	writebytetoaddr $00, $2024795
	writebytetoaddr $00, $2024796
	writebytetoaddr $00, $2024797

	; Stocke CpuSet dans gEnemyParty
	writebytetoaddr $03, $2024798 ; Copie de 0x02024744 à 0x02024797 (soit l'ItemTable)
	writebytetoaddr $49, $2024799 ; dans gSaveBlock1Ptr + UnusedOffset
	writebytetoaddr $09, $202479A ; Il s'agit d'un emplacement dans la
	writebytetoaddr $68, $202479B ; save active (Save A ou B) à l'offset
	writebytetoaddr $03, $202479C ; 0x3598 
	writebytetoaddr $48, $202479D ; Cet emplacement de 0x180 = 384 bytes
	writebytetoaddr $09, $202479E ; se situe entre les datas du cadeau myst.
	writebytetoaddr $18, $202479F ; et celles du temps du Mont Dresseurs
	writebytetoaddr $03, $20247A0
	writebytetoaddr $48, $20247A1
	writebytetoaddr $2A, $20247A2
	writebytetoaddr $22, $20247A3
	writebytetoaddr $0B, $20247A4
	writebytetoaddr $DF, $20247A5
	writebytetoaddr $70, $20247A6
	writebytetoaddr $47, $20247A7
	writebytetoaddr $8C, $20247A8
	writebytetoaddr $5D, $20247A9
	writebytetoaddr $00, $20247AA
	writebytetoaddr $03, $20247AB
	writebytetoaddr $98, $20247AC
	writebytetoaddr $35, $20247AD
	writebytetoaddr $00, $20247AE
	writebytetoaddr $00, $20247AF
	writebytetoaddr $44, $20247B0
	writebytetoaddr $47, $20247B1
	writebytetoaddr $02, $20247B2
	writebytetoaddr $02, $20247B3

	callnative $2024799; exécute CpuSet

	end

Done:
	Text_FR "Visite CIMETRONELLE et découvre\n"
	Text_FR "un GLOUPTI vraiment étonnant!@"

DataEnd:
	EOF
