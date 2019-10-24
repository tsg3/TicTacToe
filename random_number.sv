module random_number (
	input clk,
	input logic enable,
	input logic [17:0] game_matrix,
	output logic [3:0] random_cell,
	output logic random_found);
	
	logic [1:0] evaluation;
	logic [3:0] position = 4'd0;
	always_ff @(posedge clk) begin
		random_found <= 1'b0;
		position <= position + 4'd1;
		if (position == 4'd8)
			position <= 0;
		if (enable) begin
			case (position)
				4'd0: evaluation <= game_matrix[1:0];
				4'd1: evaluation <= game_matrix[3:2];
				4'd2: evaluation <= game_matrix[5:4];
				4'd3: evaluation <= game_matrix[7:6];
				4'd4: evaluation <= game_matrix[9:8];
				4'd5: evaluation <= game_matrix[11:10];
				4'd6: evaluation <= game_matrix[13:12];
				4'd7: evaluation <= game_matrix[15:14];
				4'd8: evaluation <= game_matrix[17:16];
				default: evaluation <= game_matrix[17:16];
			endcase
			if (evaluation != 2'd0) begin
				if (game_matrix[1:0] == 2'd0)
					random_cell <= 4'd0;
				else if (game_matrix[3:2] == 2'd0)
					random_cell <= 4'd1;
				else if (game_matrix[5:4] == 2'd0)
					random_cell <= 4'd2;
				else if (game_matrix[7:6] == 2'd0)
					random_cell <= 4'd3;
				else if (game_matrix[9:8] == 2'd0)
					random_cell <= 4'd4;
				else if (game_matrix[11:10] == 2'd0)
					random_cell <= 4'd5;
				else if (game_matrix[13:12] == 2'd0)
					random_cell <= 4'd6;
				else if (game_matrix[15:14] == 2'd0)
					random_cell <= 4'd7;
				else
					random_cell <= 4'd8;
			end
			else
				random_cell <= position;
			random_found <= 1'b1;
			end
		else begin
			random_cell <= 4'd0;
			random_found <= 1'b0;
			end
		
	end
endmodule
