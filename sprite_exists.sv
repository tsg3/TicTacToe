module sprite_exists(input [9:0] pixelx, pixely,
							input [17:0] matrix,
							output enable_P, enable_C);
							
		always_comb
			if(pixelx == 10'd91 & pixely == 10'd61) begin
				enable_P = matrix[0];
				enable_C = matrix[1];
				end
			else if(pixelx == 10'd305 & pixely == 10'd61) begin
				enable_P = matrix[2];
				enable_C = matrix[3];
				end
			else if(pixelx == 10'd518 & pixely == 10'd61) begin
				enable_P = matrix[4];
				enable_C = matrix[5];
				end
			else if(pixelx == 10'd91 & pixely == 10'd221) begin
				enable_P = matrix[6];
				enable_C = matrix[7];
				end
			else if(pixelx == 10'd305 & pixely == 10'd221) begin
				enable_P = matrix[8];
				enable_C = matrix[9];
				end
			else if(pixelx == 10'd518 & pixely == 10'd221) begin
				enable_P = matrix[10];
				enable_C = matrix[11];
				end
			else if(pixelx == 10'd91 & pixely == 10'd384) begin
				enable_P = matrix[12];
				enable_C = matrix[13];
				end
			else if(pixelx == 10'd305 & pixely == 10'd384) begin
				enable_P = matrix[14];
				enable_C = matrix[15];
				end
			else if(pixelx == 10'd518 & pixely == 10'd384) begin
				enable_P = matrix[16];
				enable_C = matrix[17];
				end
			else begin
				enable_P = 1'd0;
				enable_C = 1'd0;
				end

endmodule
