module FSM_Position (input logic clk, rst, victory,
							input logic [3:0] direccion,
							input logic [3:0] random_cell,
							input logic random_found,
							output logic [3:0] quadrant);

	logic [3:0] state, next;
	
	logic enable_out;
	logic action = 1'd0;
	
	position_counter counter(
	.action(action),
	.clk(clk),
	.rst(rst),
	.enable_out(enable_out));
		
	always_ff @(posedge clk, posedge rst)
		if (rst)
			state <= 4'b0000;
		else if(enable_out)
			state <= next;
		
	always_comb begin
		if(random_found & ~victory) begin
			next = random_cell;
			quadrant = next;
			action = 1'b1;
			end
		else if(~victory) begin
			case (state)
				4'b0000: begin
						case (direccion)
							4'b0001: next = 4'b0001; 
							4'b0100: next = 4'b0011;
							default: next = state;
						endcase
					end
				4'b0001: begin
						case (direccion)
							4'b0001: next = 4'b0010;
							4'b0010: next = 4'b0000;
							4'b0100: next = 4'b0100;
							default: next = state;
						endcase
					end
				4'b0010: begin
						case (direccion)
							4'b0010: next = 4'b0001;
							4'b0100: next = 4'b0101;
							default: next = state;
						endcase
					end
				4'b0011: begin
						case (direccion)
							4'b0001: next = 4'b0100;
							4'b0100: next = 4'b0110;
							4'b1000: next = 4'b0000;
							default: next = state;
						endcase
					end
				4'b0100: begin
						case (direccion)
							4'b0001: next = 4'b0101;
							4'b0010: next = 4'b0011;
							4'b0100: next = 4'b0111;
							4'b1000: next = 4'b0001;
							default: next = state;
						endcase
					end
				4'b0101: begin
						case (direccion)
							4'b0010: next = 4'b0100;
							4'b0100: next = 4'b1000;
							4'b1000: next = 4'b0010;
							default: next = state;
						endcase
					end
				4'b0110: begin
						case (direccion)
							4'b0001: next = 4'b0111; 
							4'b1000: next = 4'b0011;
							default: next = state;
						endcase
					end
				4'b0111: begin
						case (direccion)
							4'b0001: next = 4'b1000;
							4'b0010: next = 4'b0110;
							4'b1000: next = 4'b0100;
							default: next = state;
						endcase
					end
				4'b1000: begin
						case (direccion)
							4'b0010: next = 4'b0111;
							4'b1000: next = 4'b0101;
							default: next = state;
						endcase
					end
				default: begin 
					next = 4'd0;
				end
			endcase
			if(direccion == 4'b0001 | direccion == 4'b0010 |
				direccion == 4'b0100 | direccion == 4'b1000) begin
					action = 1'b1;
					end
			else begin
					action = 1'b0;
					end
			if(enable_out)
				quadrant = next;
			else
				quadrant = state;
			end
		else begin
			next = state;
			quadrant = next;
			action = 1'b1;
		end
	end
endmodule
