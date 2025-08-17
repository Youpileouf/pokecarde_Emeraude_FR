INCLUDE "berries/macros.asm"

	Enigma_Berry

	Text_EN "PUMKIN@"7
	Firmness SUPER_HARD
	Size 4,8
	Yield_Range 2, 3
	db $2C,$A6,$58,$08 ; US ROM offset Enigma tag1
	db $4A,$A6,$58,$08 ; US ROM offset Enigma tag2
	Growth_Stage_Hours 18
	Flavor 0, 0, 0, 0, 40
	Smoothness 65

	db 0,0,0
	db $04 ; cures freeze
	db 0,0,0,0, 0,0,0,0, 0,0,0,0, 0,0
	db $06 ; self-cures freeze
	db 0

	End_Berry