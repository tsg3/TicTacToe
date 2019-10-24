module TicTacToe_Top (input logic clk, rst_vga, rst_game,
							 input logic aceptar,
							 input logic [3:0] direction,
							 output logic hsync,
							 output logic vsync,
							 output logic [7:0] R,
							 output logic [7:0] G,
							 output logic [7:0] B,
							 output logic nblank,
							 output logic nsync,
							 output logic clk_out);
	
	logic [1:0] quadrant_player;
	logic [3:0] quadrant_position;
	logic victory, valid;
	logic [17:0] matrix;
	logic aceptar_FSM;
	
	FSM_player player_FSM(
		.clk(clk),
		.inputs({aceptar,rst_game,victory}),
		.valid(valid),
		.quadrant(quadrant_player),
		.aceptar(aceptar_FSM),
		.random_found(random_found));
	
	FSM_Position moves_FSM(
		.clk(clk),
		.rst(rst_game),
		.victory(victory),
		.direccion(~direction),
		.quadrant(quadrant_position),
		.random_cell(random_cell),
		.random_found(random_found));
	
	matrix_memory matrix_module(
		.m_cell(quadrant_position),
//		.player(quadrant_player[1:0]),
		.clk(clk),
		.aceptar(aceptar_FSM),
		.rst(rst_game),
		.matrix(matrix),
		.valid(valid));
	
	victory_detection victory_module(
		.matrix(matrix),
		.victory(victory));
	
	vga_controller vga_controller(
		.clock_in(clk),
		.rst(rst_vga),
		.player(quadrant_player),
		.move(quadrant_position),
		.matrix(matrix),
		.hsync(hsync),
		.vsync(vsync),
		.R(R),
		.G(G),
		.B(B),
		.nblank(nblank),
		.nsync(nsync),
		.clk_out(clk_out));
		
	logic gen_turn;
	logic random_found;
	logic [3:0] random_cell;
		
	random_number random_number(
		.clk(clk),
		.enable(gen_turn),
		.game_matrix(matrix),
		.random_cell(random_cell),
		.random_found(random_found));
	
	random_action_counter random_counter(
		.reset_game(rst_game),
		.next_turn(aceptar | victory),
		.clk(clk),
		.gen_turn(gen_turn));
		
//	logic [3:0] new_position;
		
//	always_comb begin
//		if(victory) begin
//			new_position = 4'b0000;
//			new_aceptar = 1'b0;
//			end
//		else if(random_found) begin
//			new_position = random_cell;
//			new_aceptar = random_found;
//			end
//		else begin
//			new_position = quadrant_position;
//			new_aceptar = aceptar_FSM;
//			end
//		end
		
endmodule
