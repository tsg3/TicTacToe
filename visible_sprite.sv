module visible_sprite(input xm31, ym31, enable,
							 input [2:0] color,
							 output visible);

logic background;
assign background = (color == 3'd0); 
assign visible = ~background & ~(xm31 | ym31) & enable;
	
endmodule
