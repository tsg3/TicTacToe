module vga_controller(input logic clock_in,
							 input logic rst,
//							 input logic enable_P,
//							 input logic enable_C,
//							 input logic [3:0] direction,
							 input logic [1:0] player,
							 input logic [3:0] move,
							 input logic [17:0] matrix,
							 output logic hsync,
							 output logic vsync,
							 //output logic enable,
							 output logic [7:0] R,
							 output logic [7:0] G,
							 output logic [7:0] B,
							 output logic nblank,
							 output logic nsync,
							 output logic clk_out);
	//ebae34
	//assign R = 8'hEB;
	//assign G = 8'hAE;
	//assign B = 8'h34;
	assign nblank = 1;
	assign nsync = 0;
	logic enable; //eliminar y agregar en output

	logic clock_out;
	logic [9:0] countH;
	logic [9:0] countV;
	logic new_line;
	logic [9:0] posx;
	logic [9:0] posy;

	assign clk_out = clock_out;
	clock_divider clk_pixel (
		.clock_in(clock_in), 
		.clock_out(clock_out));
		
	horizontal_counter h_counter (
		.clk(clock_out),
		.rst(rst),
		.new_line(new_line),
		.count(countH));
	
	vertical_counter v_counter (
		.clk(clock_out), 
		.rst(rst),
		.new_line(new_line),
		.count(countV));
		
	horizontal_syncronization h_syncronization (
		.clk(clock_out),
		.rst(rst),
		.hcount(countH),
		.hsync(hsync));
		
	vertical_syncronization v_syncronization (
		.clk(clock_out),
		.rst(rst),	
		.vcount(countV),
		.vsync(vsync));
	
	display_syncronization disp_syncronization (
		.clk(clock_out), 
		.rst(rst),
		.hcount(countH),
		.vcount(countV),
		.posx(posx),
		.posy(posy));
		
	display_visible enable_logic (
		.clk(clock_out), 
		.rst(rst),
		.hcount(countH),
		.vcount(countV),
		.enable(enable));
	
	logic visible_line;
	
	sprite_line game_table (
		.clk(clock_out),
		.posx(countH),
		.posy(countV),
		.visible(visible_line));
		
	logic [9:0] pixelx, pixely, pixelc;
		
	pixel_finder pixels(
	.posx(countH),
	.posy(countV),
	.pixelx(pixelx),
	.pixely(pixely),
	.pixelc(pixelc));
							 
	logic visible_pikachu;
	logic [23:0] RGB_pikachu;
	
//	assign pixelx = 10'd304;
//	assign pixely = 10'd224;
	
	pikachu_module pikachu_sprite(
		.clk(clock_out),
		.enable(enable_P),
		.posx(countH),
		.posy(countV),
		.pixelx(pixelx),
		.pixely(pixely),
		.RGB(RGB_pikachu),
		.visible(visible_pikachu));
	
//	logic [9:0] pixelx_C, pixely_C;
	logic visible_charmander;
	logic [23:0] RGB_charmander;
	
//	assign pixelx_C = 10'd100;
//	assign pixely_C = 10'd50;
	
	charmander_module charmander_sprite(
		.clk(clock_out),
		.enable(enable_C),
		.posx(countH),
		.posy(countV),
		.pixelx(pixelx),
		.pixely(pixely),
		.RGB(RGB_charmander),
		.visible(visible_charmander));
		
	logic cursor_visible;
//	logic [3:0] move;
	
	line_cursor cursor(
		.posx(countH),
		.posy(countV),
		.pixel_x(pixelx),
		.pixel_c(pixelc),
		.move(move),
		.cursor_visible(cursor_visible));
	
//	FSM_Position moves_FSM(
//		.clk(clock_in),
//		.rst(rst),
//		.direccion(~direction),
//		.quadrant(move));

	logic enable_P, enable_C;
							
	sprite_exists sprite_enables(
		.pixelx(pixelx),
		.pixely(pixely),
		.matrix(matrix),
		.enable_P(enable_P),
		.enable_C(enable_C));
		
	always_comb begin
		if(cursor_visible)
			if(player == 2'b00) begin
				R = 8'hFF;
				G = 8'h2D;
				B = 8'h01;
				end
			else if(player == 2'b01) begin
				R = 8'h2F;
				G = 8'hFF;
				B = 8'h01;
				end
			else begin
				R = 8'h80;
				G = 8'hA8;
				B = 8'h99;
				end
		else if(visible_charmander) begin
			R = RGB_charmander[23:16];
			G = RGB_charmander[15:8];
			B = RGB_charmander[7:0];
		end 
		else if(visible_pikachu) begin
			R = RGB_pikachu[23:16];
			G = RGB_pikachu[15:8];
			B = RGB_pikachu[7:0];
		end 
		else if(visible_line)begin
			R = 8'h00;
			G = 8'h00;
			B = 8'h00;
		end 
		else if(enable) begin
			R = 8'h80;
			G = 8'hA8;
			B = 8'h99;
		end 
		else begin
			R = 8'h00;
			G = 8'h00;
			B = 8'h00;
		end
	end

endmodule
