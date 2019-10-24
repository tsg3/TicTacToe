module line_cursor(
	input logic [9:0] posx,
	input logic [9:0] posy,
	input logic [9:0] pixel_x,
	input logic [9:0] pixel_c,
	input logic [3:0] move,
	output logic cursor_visible);
	
	always_comb begin
		if ((pixel_x <= posx & posx <= (pixel_x + 10'd31)) & (pixel_c<= posy & posy <= (pixel_c + 10'd3))) begin
			case (move)
				4'b0000:if ((pixel_x == 10'd91) & (pixel_c == 10'd111))
							cursor_visible = 1'b1;
						else
							cursor_visible = 1'b0;
				4'b0001:if ((pixel_x == 10'd305) & (pixel_c == 10'd111))
							cursor_visible = 1'b1;
						else
							cursor_visible = 1'b0;
				4'b0010:if ((pixel_x == 10'd518) & (pixel_c == 10'd111))
							cursor_visible = 1'b1;
						else
							cursor_visible = 1'b0;
				4'b0011:if ((pixel_x == 10'd91) & (pixel_c == 10'd271))
							cursor_visible = 1'b1;
						else
							cursor_visible = 1'b0;
				4'b0100:if ((pixel_x == 10'd305) & (pixel_c == 10'd271))
							cursor_visible = 1'b1;
						else
							cursor_visible = 1'b0;
				4'b0101:if ((pixel_x == 10'd518) & (pixel_c == 10'd271))
							cursor_visible = 1'b1;
						else
							cursor_visible = 1'b0;
				4'b0110:if ((pixel_x == 10'd91) & (pixel_c == 10'd434))
							cursor_visible = 1'b1;
						else
							cursor_visible = 1'b0;
				4'b0111:if ((pixel_x == 10'd305) & (pixel_c == 10'd434))
							cursor_visible = 1'b1;
						else
							cursor_visible = 1'b0;
				4'b1000:if ((pixel_x == 10'd518) & (pixel_c == 10'd434))
							cursor_visible = 1'b1;
						else
							cursor_visible = 1'b0;
				default:
						cursor_visible = 1'b0;
			endcase 
		end
		else
			cursor_visible = 1'b0;
	end
	

endmodule
