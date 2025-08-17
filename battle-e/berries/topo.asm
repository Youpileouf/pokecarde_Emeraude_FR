INCLUDE "berries/macros.asm"
	
	Enigma_Berry

	Text_EN "TOPO@@@"7
	Firmness VERY_HARD
	Size 8,8
	Yield_Range 4, 12
	BerryTag BERRY_TAG_ONE
	BerryTag BERRY_TAG_TWO
	Growth_Stage_Hours 24
	Flavor 0, 0, 30, 0, 30
	Smoothness 85

	db 0,0,0
	db 0 ; No bag effect
	db 0,0,0,0,0,0,0,0,0,0,0,0,0,0
	db 0 ; No in combat effect
	db 0

	End_Berry
