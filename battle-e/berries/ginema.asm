INCLUDE "berries/macros.asm"

	Enigma_Berry

	Text_EN "GINEMA@"7
	Firmness VERY_HARD
	Size 3,5
	Yield_Range 2, 3
	BerryTag BERRY_TAG_ONE
	BerryTag BERRY_TAG_TWO
	Growth_Stage_Hours 18
	Flavor 0, 30, 0, 0, 30
	Smoothness 85

	db 0,0,0
	db $00
	db 0,0,0,0,0,0,0,0,0,0,0,0,0,0
	db $17 ; self-restores a lowered stat
	db 0

	End_Berry
