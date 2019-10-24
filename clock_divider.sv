module clock_divider(input logic clock_in, output logic clock_out);

	logic[27:0] counter = 28'd0;
	parameter ratio = 28'd2;
	
	always_ff @(posedge clock_in) begin
	
		counter <= counter + 28'd1;
		
		if(counter >= (ratio - 1))
			counter <= 28'd0;
			
		end
	assign clock_out = (counter < ratio / 2) ? 1'b0 : 1'b1;

endmodule
