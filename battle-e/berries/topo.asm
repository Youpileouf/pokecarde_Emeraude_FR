INCLUDE "berries/macros.asm"
	
	Enigma_Berry

	Text_EN "TOPO@@@"7
	Firmness VERY_HARD
	Size 8,8
	Yield_Range 4, 12
	db $2C,$A6,$58,$08 ; US ROM offset Enigma tag1
	db $4A,$A6,$58,$08 ; US ROM offset Enigma tag2
	Growth_Stage_Hours 24
	Flavor 0, 0, 30, 0, 30
	Smoothness 85

	db 0,0,0
	db 0 ; No bag effect
	db 0,0,0,0,0,0,0,0,0,0,0,0,0,0
	db 0 ; No in combat effect
	db 0

	End_Berry