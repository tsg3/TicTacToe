module sprite_tb;
									
	logic [9:0] pixelx, pixely, posx, posy, address;
	logic xm31, ym31;
	
	address_gen DUT(
	.pixelx(pixelx),
	.pixely(pixely),
	.posx(posx),
	.posy(posy),
	.xm31(xm31),
	.ym31(ym31),
	.address(address));
	
	initial begin

		pixelx = 10'd31;
		pixely = 10'd31;
		#10 posx = 10'd0; posy = 10'd0;
		#10 posx = 10'd40; posy = 10'd0;
		#10 posx = 10'd89; posy = 10'd0;
		#10 posx = 10'd12; posy = 10'd45;
		#10 posx = 10'd100; posy = 10'd45;
		#10 posx = 10'd45; posy = 10'd230;
		end

endmodule
