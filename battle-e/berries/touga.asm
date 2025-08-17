INCLUDE "berries/macros.asm"

	Enigma_Berry

	Text_EN "TOUGA@@"7
	Firmness SUPER_HARD
	Size 15,3
	Yield_Range 2, 3
	db $2C,$A6,$58,$08 ; US ROM offset Enigma tag1
	db $4A,$A6,$58,$08 ; US ROM offset Enigma tag2
	Growth_Stage_Hours 18
	Flavor 40, 0, 00, 0, 0
	Smoothness 65

	db 0,0,0
	db $01 ; cures confusion
	db 0,0,0,0,0,0,0,0,0,0,0,0,0,0
	db $08 ; self-cures confusion
	db 0

	End_Berry