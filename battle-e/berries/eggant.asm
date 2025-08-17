INCLUDE "berries/macros.asm"

	Enigma_Berry

	Text_EN "EGGANT@"7
	Firmness SOFT
	Size 4,1
	Yield_Range 2, 3
	db $2C,$A6,$58,$08 ; US ROM offset Enigma tag1
	db $4A,$A6,$58,$08 ; US ROM offset Enigma tag2
	Growth_Stage_Hours 18
	Flavor 0, 40, 0, 0, 0
	Smoothness 65

	db 0,0,0
	db $00 ; No bag effect
	db 0,0,0,0, 0,0,0,0, 0,0,0,0, 0,0
	db $1C ; self-cure infatuation
	db 0

	End_Berry