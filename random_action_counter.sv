module random_action_counter(
			input logic reset_game,
			input logic next_turn,
			input logic clk,
			output logic gen_turn);

	logic [34:0] counter = 0;
	always_ff @(posedge clk) begin
		if (counter == 35'd1500000000) begin
			gen_turn <= 1'b1;
			counter <= 35'd0;
			end
		else if (next_turn | reset_game) begin
			gen_turn <= 1'b0;
			counter <= 35'd0;
			end
		else begin
			gen_turn <= 1'b0;
			counter <= counter + 35'd1;
			end
		
	end
endmodule
