module deco_pikachu (input [2:0] color,	
             output logic [23:0] RGB);

// 0xff34904a - Fondo - 0
// 0xff000000 - Negro - 1
// 0xff1cd5ee - Amarillo - 2
// 0xff0000ff - Rojo - 3
// 0xffffffff - Blanco - 4
// 0xff012871 - Cafe - 5			 
				 
				 
always_comb
	case (color)
	3'd0: RGB = 24b'34904a;
	3'd1: RGB = 24b'000000;
	3'd2: RGB = 24b'1cd5ee;
	3'd3: RGB = 24b'0000ff;
	3'd4: RGB = 24b'ffffff;
	3'd5: RGB = 24b'012871;
	endcase
endmodule
