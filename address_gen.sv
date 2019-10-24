module address_gen(input [9:0] pixelx, pixely,
									posx, posy,
									output xm31, ym31,
									output logic [9:0] address);

logic [9:0] idx, idy;
logic [9:0] max_pixel;
assign max_pixel = 10'd31;

assign idx = posx - pixelx;
assign idy = posy - pixely;
assign address = {idy[4:0], idx[4:0]}; 
assign xm31 = (idx > max_pixel);
assign ym31 = (idy > max_pixel);				
						
endmodule
