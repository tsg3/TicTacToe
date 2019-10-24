module matrix_memory(input logic [3:0] m_cell, 
							//input logic [1:0] player, 
							input logic clk, 
							input logic aceptar, 
							input logic rst, 
							output logic [17:0] matrix,
							output logic valid);

	logic [17:0] matrix_mem = 18'd0;
	logic [1:0] player = 2'b01;
	assign matrix = matrix_mem; 
	
	always_ff @(posedge clk)
		if(rst) begin
			matrix_mem <= 18'd0;
			player <= 2'b01;
			end
		else if(aceptar & valid) begin
			case(m_cell)
				4'b0000: begin matrix_mem[1:0] <= player; if(player == 2'b01) player <= 2'b10; else if(player == 2'b10) player <= 2'b01; end
				4'b0001: begin matrix_mem[3:2] <= player; if(player == 2'b01) player <= 2'b10; else if(player == 2'b10) player <= 2'b01; end
				4'b0010: begin matrix_mem[5:4] <= player; if(player == 2'b01) player <= 2'b10; else if(player == 2'b10) player <= 2'b01; end
				4'b0011: begin matrix_mem[7:6] <= player; if(player == 2'b01) player <= 2'b10; else if(player == 2'b10) player <= 2'b01; end
				4'b0100: begin matrix_mem[9:8] <= player; if(player == 2'b01) player <= 2'b10; else if(player == 2'b10) player <= 2'b01; end
				4'b0101: begin matrix_mem[11:10] <= player; if(player == 2'b01) player <= 2'b10; else if(player == 2'b10) player <= 2'b01; end
				4'b0110: begin matrix_mem[13:12] <= player; if(player == 2'b01) player <= 2'b10; else if(player == 2'b10) player <= 2'b01; end
				4'b0111: begin matrix_mem[15:14] <= player; if(player == 2'b01) player <= 2'b10; else if(player == 2'b10) player <= 2'b01; end
				4'b1000: begin matrix_mem[17:16] <= player; if(player == 2'b01) player <= 2'b10; else if(player == 2'b10) player <= 2'b01; end
				default: matrix_mem <= matrix_mem;
			endcase
			end
	always_comb begin
		case(m_cell)
			4'b0000: valid = matrix_mem[1:0] == 2'b00;
			4'b0001: valid = matrix_mem[3:2] == 2'b00;
			4'b0010: valid = matrix_mem[5:4] == 2'b00;
			4'b0011: valid = matrix_mem[7:6] == 2'b00;
			4'b0100: valid = matrix_mem[9:8] == 2'b00;
			4'b0101: valid = matrix_mem[11:10] == 2'b00;
			4'b0110: valid = matrix_mem[13:12] == 2'b00;
			4'b0111: valid = matrix_mem[15:14] == 2'b00;
			4'b1000: valid = matrix_mem[17:16] == 2'b00;
			default: valid = 1'b0;
		endcase
		end
endmodule
