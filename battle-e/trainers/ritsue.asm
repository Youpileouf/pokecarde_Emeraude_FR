INCLUDE "trainers/macros.asm"

	Battle_Trainer

	BT_Level 0
	Class LASS
	BT_Floor 0
	Text_EN "SUSAN"8
	Text_JP "リツエ"8
	OT_ID 00000, 00000

	Intro_JP $1c18, $0a34, $103e, $0a48, $020e, $0c00
	Win_JP $1c06, $140b, $140f, $0e08, $0609, $0e21
	Loss_JP $201e, $103e, $ffff, $0e36, $1210, $0c3d

	Intro_EN MY, POKEMON, IS, MY, FRIEND, FOREVER
	Win_EN WE, WILL, ALWAYS, WIN, TOGETHER, _EX
	Loss_EN I, WILL, TRY, REALLY, HARD, _EX_EX

	Pokemon LINOONE
	Holds CHESTO_BERRY
	Moves CUT, ROCK_SMASH, BELLY_DRUM, REST
	Level 90
	PP_Ups 0,0,0,0
	EVs 0,252,252,0,0,6
	OT_ID 00000, 00000
	IVs 15,31,31,15,15,15, 0
	PV $00000021
	Text_EN "LINOONE"11
	Text_JP "マッスグマ"11
	Friendship 255

	Pokemon PELIPPER
	Holds CHERI_BERRY
	Moves SURF, FLY, SHOCK_WAVE, AERIAL_ACE 
	Level 92
	PP_Ups 0,0,0,0
	EVs 0,0,0,6,252,252
	OT_ID 00000, 00000
	IVs 15,15,15,15,31,31, 0
	PV $00000014
	Text_EN "PELIPPER"11
	Text_JP "ペリッパー"11
	Friendship 255

	Pokemon BRELOOM
	Holds LUM_BERRY
	Moves FLASH, STRENGTH, BULLET_SEED, SKY_UPPERCUT
	Level 94
	PP_Ups 0,0,0,0
	EVs 6,0,0,252,0,252
	OT_ID 00000, 00000
	IVs 15,15,15,31,15,31, 0
	PV $000000E1
	Text_EN "BRELOOM"11
	Text_JP "キノガッサ"11
	Friendship 255

	End_Trainer