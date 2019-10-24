module pixel_finder(input [9:0] posx, posy,
						  output [9:0] pixelx, pixely, pixelc);

	always_comb begin
	
		if(posx < 10'd214)
			pixelx = 10'd91;
		else if(10'd214 <= posx & posx < 10'd424)
			pixelx = 10'd305;
		else
			pixelx = 10'd518;
			
		if(posy < 10'd155) begin
			pixely = 10'd61;
			pixelc = 10'd111;
			end
		else if(10'd155 <= posy & posy < 10'd316) begin
			pixely = 10'd221;
			pixelc = 10'd271;
			end
		else begin
			pixely = 10'd384;
			pixelc = 10'd434;
			end
		
		end

endmodule
