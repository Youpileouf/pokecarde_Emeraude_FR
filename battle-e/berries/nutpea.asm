INCLUDE "berries/macros.asm"

	Enigma_Berry

	Text_EN "NUTPEA@"7
	Firmness SUPER_HARD
	Size 12,4
	Yield_Range 1, 3
	BerryTag BERRY_TAG_ONE
	BerryTag BERRY_TAG_TWO
	Growth_Stage_Hours 18
	Flavor 10, 10, 10, 10, 10
	Smoothness 5

	db 0,0,0
	db 0 ; No bag effect
	db 0,0,0,0,0,0,0,0,0,0,0,0,0,0
	db 0 ; No in combat effect
	db 0

	End_Berry
