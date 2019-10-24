module FSM_player (input logic clk, valid,
							input logic [2:0] inputs,
							input logic random_found,
							output logic [1:0] quadrant,
							output logic aceptar);
	logic [1:0] state, next;
	
	logic enable_out;
	logic action = 1'd0;
	
	position_counter counter(
	.action(action),
	.clk(clk),
	.rst(inputs[1]),
	.enable_out(enable_out));
	
	always_ff @(posedge clk)
		if(enable_out | inputs[0])
			state <= next;
	
	always_comb begin
		if(random_found & ~inputs[0])
		begin
			if(state == 2'b00)
				next = 2'b01;
			else
				next = 2'b00;
			aceptar = 1'b1;
			action = 1'b1;
		end
//		else begin
//		case (state)
//			2'b00: begin
//				case (inputs)
//					3'b100: next = 2'b01;
//					3'b001: next = 2'b10;
//					default: next = state;
//					endcase
//				end
//			2'b01: begin
//				case (inputs)
//					3'b010: next = 2'b00;
//					3'b001: next = 2'b10;
//					3'b100: next = 2'b00;
//					default: next = state;
//				endcase
//				end
//			2'b10: begin
//				case (inputs)
//					3'b010: next = 2'b00;
//					default: next = state;
//				endcase
//				end
//			default: begin
//				next = 2'b00;
//				end
//		endcase
//		if(inputs == 3'b001 | inputs == 3'b010 | inputs == 3'b100) begin
//				action = 1'b1;
//				end
//		else begin
//				action = 1'b0;
//				end
//		if(inputs == 3'b100)
//			if(state == 2'b00 | state == 2'b01)
//				aceptar = 1'b1;
//			else
//				aceptar = 1'b0;
//		else
//			aceptar = 1'b0;
//		end
		else if(inputs == 3'b100 & valid) begin
			if (state == 2'b00)
				next = 2'b01;
			else if (state == 2'b10)
				next = 2'b10;
			else
				next = 2'b00;
			aceptar = 1'b1;
			action = 1'b1;
			end
		else if(inputs == 3'b010) begin
			next = 2'b00;
			aceptar = 1'b0;
			action = 1'b1;
			end
		else if(inputs == 3'b001) begin
			next = 2'b10;
			aceptar = 1'b0;
			action = 1'b1;
			end
		else begin
			next = state;
			aceptar = 1'b0;
			action = 1'b0;
		end
		quadrant = next;
	end
endmodule
			
			
			
		