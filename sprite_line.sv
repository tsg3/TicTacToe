module sprite_line(input clk, input[9:0] posx, posy, 
						output visible);
always_comb				
	if((10'd214 <= posx & posx < 10'd219) | (10'd424 <= posx & posx < 10'd429) |
		(10'd155 <= posy & posy < 10'd160) | (10'd316 <= posy & posy < 10'd321))
		visible = 1'b1;
	else
		visible = 1'b0;
		
endmodule
