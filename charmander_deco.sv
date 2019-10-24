module charmander_deco (input [2:0] color,	
								output logic [23:0] RGB);

// 0xff80a899 - Fondo - 0
// 0xff000000 - Negro - 1
// 0xff0087ff - Naranja - 2
// 0xff0000ff - Rojo - 3
// 0xff00fffb - Amarillo - 4
// 0xffffffff - Blanco - 5					 
				 
				 
always_comb
	case (color)
	3'd0: RGB = 24'h80a899;
	3'd1: RGB = 24'h000000;
	3'd2: RGB = 24'hff8700;
	3'd3: RGB = 24'hff0000;
	3'd4: RGB = 24'hfbff00;
	3'd5: RGB = 24'hffffff;
	default: RGB = 24'h80a899;
	endcase
endmodule
