module position_counter(input logic action, clk, rst, 
								output logic enable_out);

	logic [25:0] counter;
	logic enable_in;
	
	assign enable_out = ~enable_in;
		
	always_ff @(posedge clk) begin
		
		if(rst) begin
			counter <= 26'd0;
			enable_in <= 1'd0;
			end
		if(action)
			enable_in <= 1'd1;
		else if (enable_in & ~action) begin
			if(counter < 26'd52428799)
				counter <= counter + 26'd1;
			else begin
				counter <= 26'd0;
				enable_in <= 1'd0;
				end
			end
		end

endmodule
