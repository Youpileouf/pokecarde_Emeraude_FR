INCLUDE "berries/macros.asm"

	Enigma_Berry

	Text_EN "DRASH@@"7
	Firmness VERY_HARD
	Size 13,4
	Yield_Range 2, 3
	BerryTag BERRY_TAG_ONE
	BerryTag BERRY_TAG_TWO
	Growth_Stage_Hours 18
	Flavor 0, 0, 40, 0, 0
	Smoothness 65

	db 0,0,0
	db $10 ; cures poison
	db 0,0,0,0,0,0,0,0,0,0,0,0,0,0
	db $04 ; self-cures poison
	db 0

	End_Berry
