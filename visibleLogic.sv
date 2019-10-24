module  (input xm63, ym63,
							input [2:0] color,
							output visible);

logic background;
assign background = (color == 3'd0); 
assign visible = ~background && ~(xm63 | ym63);
	
endmodule
