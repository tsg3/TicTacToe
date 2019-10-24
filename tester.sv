module tester;

	logic clock_in;
	logic clock_out;
	logic rst;
	logic [9:0] countH;
	logic [9:0] countV;
	logic new_line;
	logic hsync;
	logic vsync;
	logic [9:0] posx;
	logic [9:0] posy;
	logic enable;

	clock_divider DUT1 (
		.clock_in(clock_in), 
		.clock_out(clock_out));
		
	horizontal_counter DUT2 (
		.clk(clock_out),
		.rst(rst),
		.new_line(new_line),
		.count(countH));
	
	vertical_counter DUT3 (
		.clk(clock_out), 
		.rst(rst),
		.new_line(new_line),
		.count(countV));
		
	horizontal_syncronization DUT4 (
		.clk(clock_out),
		.rst(rst),
		.hcount(countH),
		.hsync(hsync));
		
	vertical_syncronization DUT5 (
		.clk(clock_out),
		.rst(rst),	
		.vcount(countV),
		.vsync(vsync));
	
	display_syncronization DUT6 (
		.clk(clock_out), 
		.rst(rst),
		.hcount(countH),
		.vcount(countV),
		.posx(posx),
		.posy(posy));
		
	display_visible DUT7 (
		.clk(clock_out), 
		.rst(rst),
		.hcount(countH),
		.vcount(countV),
		.enable(enable));

	initial begin

		clock_in = 0;
		rst = 0;
		repeat(170) begin 
			repeat(1000) begin
				#1 clock_in = ~clock_in;
				#1 clock_in = ~clock_in;
				#1 clock_in = ~clock_in;
				#1 clock_in = ~clock_in;
				#1 clock_in = ~clock_in;
				#1 clock_in = ~clock_in;
				#1 clock_in = ~clock_in;
				#1 clock_in = ~clock_in;
				#1 clock_in = ~clock_in;
				#1 clock_in = ~clock_in;
			end
			end
		end
endmodule
