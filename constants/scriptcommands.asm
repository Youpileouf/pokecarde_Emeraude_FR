DEF LASTRESULT EQU $800D

MACRO nop_;		ne fait rien
	db $00
	ENDM

MACRO nopone;		ne fait rien
	db $01
	ENDM

MACRO end;		terminates scripts execution
	db $02
	ENDM

MACRO return;		Jumps back to after the last-executed call statement,
	db $03;		and continues script execution from there.
	ENDM

MACRO call_;		Jumps to destination and continues script execution from there.	
	db $04;		The location of the calling script is remembered and can be returned to later.
	dd \1
	ENDM

MACRO goto;		Jumps to destination and continues script execution from there.
	db $05
	dd \1
	ENDM

MACRO goto_if;		If the result of the last comparison matches condition
	db $06;		(see Comparison operators), jumps to destination and 
	db \1;		continues script execution from there.
	dd \2
	ENDM

MACRO call_if;		If the result of the last comparison matches condition 
	db $07;		(see Comparison operators), calls destination.
	db \1
	dd \2
	ENDM

MACRO gotostd;		Jumps to the script in gStdScripts at index function.
	db $08
	db \1
	ENDM

MACRO callstd;		Calls the script in gStdScripts at index function.
	db $09;		STD_OBTAIN_ITEM = 0 | STD_FIND_ITEM = 1
	db \1;		STD_OBTAIN_DECORATION = 7 | STD_REGISTER_MATCH_CALL = 8
	ENDM

MACRO gotostd_if;	If the result of the last comparison matches condition
	db $0A;		(see Comparison operators), jumps to the script in 
	db \1;		gStdScripts at index function.
	db \2
	ENDM

MACRO callstd_if;	If the result of the last comparison matches condition
	db $0B;		(see Comparison operators), calls the script in gStdScripts 
	db \3;		at index function.
	db \2
	ENDM

MACRO returnram;	Equivalent to the 'return' command for a RAM script.
	db $0C
	ENDM

MACRO killscript;	Equivalent to the 'end' command for a RAM script.
	db $0D
	ENDM

MACRO setbyte;		Sets the Mystery Event script status (MEVENT_STATUS_*).
	db $0E
	db \1
	ENDM

MACRO loadword;	Sets the value at the specified script data index to a fixed 4-byte value.
	db $0F
	db \1
	dd \2
	ENDM

MACRO loadbyte;		Sets the value at the specified script data index to a fixed byte value.
	db $10
	db \1
	db \2
	ENDM

MACRO writebytetoaddr;	Sets the value at the specified pointer.
	db $11
	db \1
	dd \2
	ENDM

MACRO loadbytefromaddr;	Sets the value at the specified script data index 
	db $12;		to the value at pointer 'source'.
	db \1
	dd \2
	ENDM

MACRO setptrbyte;	Sets the value at pointer 'destination' to the contents 
	db $13;		of the script data at 'srcIndex'.
	db \1
	dd \2
	ENDM

MACRO copylocal;	Copies the contents of the script data from one index to another.
	db $14
	db \1
	db \2
	ENDM

MACRO copybyte;		Copies the byte at source to destination, 
	db $15;		replacing whatever byte was previously there.
	dd \1
	dd \2
	ENDM

MACRO setvar;		Changes the value of destination to value.
	db $16
	dw \1
	dw \2
	ENDM

MACRO addvar;		Changes the value of destination by adding value to it. 
	db $17;		Overflow is not prevented (0xFFFF + 1 = 0x0000).
	dw \1
	dw \2
	ENDM

MACRO subvar;		Changes the value of destination by subtracting value to it.
	db $18;		Overflow is not prevented (0x0000 - 1 = 0xFFFF).
	dw \1
	dw \2
	ENDM

MACRO copyvar;		Copies the value of source into destination.
	db $19
	dw \1
	dw \2
	ENDM

MACRO copyvarifnotzero; If source is not a variable, then this function acts like setvar.
	db $1A;		Otherwise, it acts like copyvar.
	dw \1
	dw \2
	ENDM

MACRO comparelocaltolocal;Compares the values of the script data at indexes 'local1' and 'local2'.
	db $1B;		The result is stored in comparisonResult to be acted on by goto_if / call_if
	db \1
	db \2
	ENDM

MACRO comparelocaltovalue;Compares the value of the script data at index 'local' to a fixed value.
	db $1C;		The result is stored in comparisonResult to be acted on by goto_if / call_if
	db \1
	db \2
	ENDM

MACRO comparelocaltoptr;Compares the value of the script data at index 'local' to the value at 'ptr'
	db $1D;		The result is stored in comparisonResult to be acted on by goto_if / call_if
	db \1
	dd \2
	ENDM

MACRO compareptrtolocal;Compares the value at 'ptr' to the value of the script data at index 'local'.
	db $1E;		The result is stored in comparisonResult to be acted on by goto_if / call_if
	dd \1
	db \2
	ENDM

MACRO compareptrtovalue;Compares the value at 'ptr' to a fixed value.
	db $1F;		The result is stored in comparisonResult to be acted on by goto_if / call_if
	dd \1
	db \2
	ENDM

MACRO compareptrtoptr;	Compares the value at 'ptr1' to the value at 'ptr2'.
	db $20;		The result is stored in comparisonResult to be acted on by goto_if / call_if
	dd \1
	dd \2
	ENDM


MACRO compare;		Compares the value of 'var' to a fixed value.
	db $21;		The result is stored in comparisonResult to be acted on by goto_if / call_if
	dw \1
	dw \2
	ENDM

MACRO comparevartovar;	Compares the value of 'var1' to the value of 'var2'.
	db $22;		The result is stored in comparisonResult to be acted on by goto_if / call_if
	dw \1
	dw \2
	ENDM

MACRO callnative;	Calls the native C function stored at func.
	db $23
	dd \1
	ENDM

MACRO gotonative;	Replaces the script with the function stored at func.
	db $24;		Execution returns to the bytecode script when func returns TRUE.
	dd \1
	ENDM

MACRO special;		Calls a function listed in the table in data/specials.inc.
	db $25
	dw \1
	ENDM

MACRO specialvar;	Calls a function listed in the table in data/specials.inc. That function's
	db $26;		output (if any) will be written to the variable specified by 'output'.
	dw \1;		output
	dw \2;		special function
	ENDM

MACRO waitstate;	Blocks script execution until a command or C code manually unblocks it.
	db $27;		Generally used with specific commands and specials. Calling 
	ENDM;		ScriptContext_Enable for instance will allow execution to continue.

MACRO delay;		Blocks script execution for frames. (Pokemon Emerald runs at just shy
	db $28;		of 60 frames per second.)
	dw \1
	ENDM

MACRO setflag;		Sets flag to TRUE.
	db $29
	dw \1
	ENDM

MACRO clearflag;	Sets flag to FALSE.
	db $2A
	dw \1
	ENDM

MACRO checkflag;	Compares flag to TRUE and stores the result in comparisonResult to be used
	db $2B;		by goto_if, etc. See additional _if_unset and _if_set macros
	dw \1
	ENDM

MACRO initclock;	Initializes the RTC`s local time offset to the given hour and minute.
	db $2C
	dw \1
	dw \2
	ENDM

MACRO dotimebasedevents;	Updates local time using the RTC and runs time based events.
	db $2D
	ENDM

MACRO gettime;		Sets the values of variables VAR_0x8000, VAR_0x8001, and VAR_0x8002
	db $2E;		to the current hour, minute, and second.
	ENDM

MACRO playse;		Plays the specified sound. Only one sound may play at a time,
	db $2F;		with newer ones interrupting older ones.
	dw \1
	ENDM

MACRO waitse;		Blocks script execution until the currently-playing sound
	db $30;		(triggered by playse) finishes playing.
	dw \1
	ENDM

MACRO playfanfare;	Plays the fanfare specified by the song number. If the specified song
	db $31;		is not a fanfare it will instead play the first song in sFanfares.
	dw \1
	ENDM

MACRO waitfanfare;	Blocks script execution until all currently-playing fanfares finish.
	db $32
	ENDM

MACRO playbgm;		Plays the specified song. If save_song is TRUE, the
	db $33;		specified song will be saved as if savebgm was called with 
	dw \1
	db \2
	ENDM

MACRO savebgm;		Saves the specified song to be played later. Saved music may be played
	db $34;		when Overworld_PlaySpecialMapMusic is called.
	dw \1;		This occurs on exiting most warps.
	ENDM

MACRO fadefaultbgm;	Crossfades the currently-playing song into the map's default song.
	db $35
	ENDM

MACRO fadenewbgm;	Crossfades the currently-playing song into the specified song.
	db $36
	dw \1
	ENDM

MACRO fadeoutbgm;	Fades out the currently-playing song.
	db $37
	db \1
	ENDM

MACRO fadeinbgm;	Fades the previously-playing song back in.
	db $38
	db \1
	ENDM

MACRO warp;		/!\ To Do
	db $39
	ENDM

MACRO warpsilent;	/!\ To Do
	db $3A
	ENDM

MACRO warpdoor;		/!\ To Do
	db $3B
	ENDM

MACRO warphole;		/!\ To Do
	db $3C
	ENDM

MACRO warpteleport;	/!\ To Do
	db $3D
	ENDM

MACRO setwarp;		/!\ To Do
	db $3E
	ENDM

MACRO setdynamicwarp;	/!\ To Do
	db $3F
	ENDM

MACRO setdivewarp;	/!\ To Do
	db $40
	ENDM

MACRO setholewarp;	/!\ To Do
	db $41
	ENDM

MACRO getplayerxy;	Retrieves the player's zero-indexed x- and y-coordinates in the map,
	db $42;		and stores them in the specified variables.
	dw \1
	dw \2
	ENDM

MACRO getpartysize;	Retrieves the number of Pokemon in the player's party,
	db $43;		and stores that number in VAR_RESULT.
	ENDM

MACRO additem;		Attempts to add quantity of the specified item to the player's Bag.
	db $44;		If the player has enough room, the item will be added and VAR_RESULT
	dw \1;		will be set to TRUE; otherwise, VAR_RESULT is set to FALSE.
	dw \2
	ENDM

MACRO checkitemroom
	db $46
	dw \1, \2
	ENDM
MACRO checkitem
	db $47
	dw \1, \2
	ENDM
MACRO checkpcitem
	db $4A
	dw \1, \2
	ENDM
MACRO adddecoration
	db $4b
	dw \1
	ENDM
MACRO faceplayer
	db $5A
	ENDM
MACRO waitmsg
	db $66
	ENDM
MACRO lock
	db $6A
	ENDM
MACRO release
	db $6C
	ENDM
MACRO waitkeypress
	db $6D
	ENDM
MACRO yesnobox
	db $6E
	db \1
	db \2
	ENDM
MACRO showmonpic
	db $75
	dw \1
	db \2
	db \3
	ENDM
MACRO hidemonpic
	db $76
	ENDM
MACRO showcontestpainting
	db $77
	db \1
	ENDM
MACRO braillemessage
	db $78
	dd \1
	ENDM
MACRO brailleformat
	db \1
	db \2
	db \3
	db \4
	db \5
	db \6
	ENDM
MACRO givemon
	db $79
	dw \1
	db \2
	dw \3
	dd \4
	dd \5
	db \6
	ENDM
MACRO giveegg
	db $7A
	dw \1
	ENDM
MACRO setmonmove
	db $7b
	db \1
	db \2
	dw \3
	ENDM
MACRO checkpartymove
	db $7c
	dw \1
	ENDM
MACRO bufferspeciesname
	db $7d
	db \1
	dw \2
	ENDM
MACRO bufferleadmonspeciesname
	db $7E
	db \1
	ENDM
MACRO bufferpartymonnick
	db $7f
	db \1
	dw \2
	ENDM
MACRO bufferitemname
	db $80
	db \1
	dw \2
	ENDM
MACRO bufferdecorationname
	db $81
	db \1
	dw \2
	ENDM
MACRO buffermovename
	db $82
	db \1
	dw \2
	ENDM
MACRO random
	db $8F
	dw \1
	ENDM
MACRO setrespawn
	db $9F
	dw \1
	ENDM
MACRO checkplayergender
	db $A0
	ENDM
MACRO playmoncry
	db $A1
	dw \1
	dw \2
	ENDM
MACRO setwildbattle
	db $B6
	dw \1
	db \2
	dw \3
	ENDM
MACRO dowildbattle
	db $B7
	ENDM
MACRO setvirtualaddress
	db $B8
	GBAPTR \1
	ENDM
MACRO vgoto
	db $B9
	GBAPTR \1
	ENDM
MACRO virtualgotoif
	db $BB
	db \1
	GBAPTR \2
	ENDM
MACRO virtualmsgbox
	db $BD
	GBAPTR \1
	ENDM
MACRO virtualloadpointer
	db $BE
	GBAPTR \1
	ENDM
MACRO waitmoncry
	db $C5
	ENDM
MACRO setmoneventlegal
	db $CD
	dw \1
	ENDM
MACRO checkmoneventlegal
	db $CE
	dw \1
	ENDM
MACRO setmonmetlocation
	db $D2
	dw \1
	db \2
	ENDM
