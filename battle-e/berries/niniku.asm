INCLUDE "berries/macros.asm"
	
	Enigma_Berry

	Text_EN "NINIKU@"7
	Firmness HARD
	Size 24,9
	Yield_Range 1, 2
	db $2C,$A6,$58,$08 ; US ROM offset Enigma tag1
	db $4A,$A6,$58,$08 ; US ROM offset Enigma tag2
	Growth_Stage_Hours 1
	Flavor 0, 30, 0, 30, 0
	Smoothness 85

	db 0,0,0
	db 0 ; No bag effect
	db 0,0,0,0,0,0,0,0,0,0,0,0,0,0
	db 0 ; No in combat effect
	db 0

	End_Berry