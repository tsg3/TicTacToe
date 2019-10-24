module FSM_Position_TB;

	logic clock_in, rst, victory, random_found;
	logic [3:0] direction, random_cell, quadrant;

	FSM_Position moves_FSM(
		.clk(clock_in),
		.rst(rst),
		.victory(victory),
		.random_found(random_found),
		.direccion(direction),
		.random_cell(random_cell),
		.quadrant(quadrant));
		
	initial begin
		rst = 1'b0; victory = 1'b0; random_found = 1'b0; clock_in = 1'b0;
		random_cell = 4'b0000; direction = 4'b0000;
		#10 clock_in = ~clock_in;
		#10 clock_in = ~clock_in;
		#10 clock_in = ~clock_in;
		#10 clock_in = ~clock_in; direction = 4'b0001;
		#10 clock_in = ~clock_in;
		#10 clock_in = ~clock_in;
		#10 clock_in = ~clock_in;
		#10 clock_in = ~clock_in; 
		#10 clock_in = ~clock_in;
		#10 clock_in = ~clock_in;
		#10 clock_in = ~clock_in;
		#10 clock_in = ~clock_in;
		#10 clock_in = ~clock_in;direction = 4'b0000;
		#10 clock_in = ~clock_in;
		#10 clock_in = ~clock_in; 
		#10 clock_in = ~clock_in;
		#10 clock_in = ~clock_in;direction = 4'b0001;
		#10 clock_in = ~clock_in;
		end

endmodule
