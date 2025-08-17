INCLUDE "berries/macros.asm"
	
	Enigma_Berry

	Text_EN "CHILAN@"7
	Firmness SOFT
	Size 27,2
	Yield_Range 1, 2
	BerryTag BERRY_TAG_ONE
	BerryTag BERRY_TAG_TWO
	Growth_Stage_Hours 1
	Flavor 30, 0, 30, 0, 0
	Smoothness 85

	db 0,0,0
	db 0 ; No bag effect
	db 0,0,0,0,0,0,0,0,0,0,0,0,0,0
	db 0 ; No in combat effect
	db 0

	End_Berry
