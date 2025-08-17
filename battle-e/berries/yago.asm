INCLUDE "berries/macros.asm"

	Enigma_Berry

	Text_EN "YAGO@@@"7
	Firmness VERY_HARD
	Size 3,6
	Yield_Range 2, 3
	db $2C,$A6,$58,$08 ; US ROM offset Enigma tag1
	db $4A,$A6,$58,$08 ; US ROM offset Enigma tag2
	Growth_Stage_Hours 18
	Flavor 0, 0, 0, 40, 0
	Smoothness 65

	db 0,0,0
	db $08 ; cures burn
	db 0,0,0,0,0,0,0,0,0,0,0,0,0,0
	db $05 ; self-cures burn
	db 0

	End_Berry