module pikachu_module(input clk, enable, input [9:0] posx,
							 posy, pixelx, pixely,
							 output [23:0] RGB,
							 output visible);

							
logic [9:0] address;
logic [2:0] color;
logic xm31, ym31;

address_gen address_gen(
	.pixelx(pixelx),
	.pixely(pixely),
   .posx(posx),
	.posy(posy),
	.xm31(xm31),
	.ym31(ym31),
	.address(address));

pikachu_sprite_rom sprite_rom (
	.address(address),
	.clock(clk),
	.q(color));

pikachu_deco decoder (
	.color(color),
	.RGB(RGB));	
		
visible_sprite visible_p (
	.xm31(xm31),
	.ym31(ym31),
	.enable(enable),
	.color(color),
	.visible(visible));		
				
endmodule
