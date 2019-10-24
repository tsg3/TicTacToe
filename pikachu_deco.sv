module pikachu_deco (input [2:0] color,	
							output logic [23:0] RGB);

// 0xff80a899 - Fondo - 0
// 0x00000000 - Negro - 1
// 0x001cd5ee - Amarillo - 2
// 0x000000ff - Rojo - 3
// 0x00ffffff - Blanco - 4
// 0x00012871 - Cafe - 5			 
				 
				 
always_comb
	case (color)
	3'd0: RGB = 24'h80a899;
	3'd1: RGB = 24'h000000;
	3'd2: RGB = 24'heed51c;
	3'd3: RGB = 24'hff0000;
	3'd4: RGB = 24'hffffff;
	3'd5: RGB = 24'h712801;
	default: RGB = 24'h80a899;
	endcase
endmodule
