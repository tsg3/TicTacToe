module FSM(input clk, rst, T,
			  output logic [3:0] quadrant);

logic [1:0] state, next;			  

//sequential logic
always_ff @(posedge clk, posedge rst)
	if (rst) state <= 'b0;
	else state <= next;

//next state
always_comb
	case (state)
	2'b00: begin quadrant = 4'b0001; 
			 if (T) next = 2'b01; else next = 2'b00; end
	2'b01: begin next = 2'b10; quadrant = 4'b0010; end
	2'b10: begin next = 2'b11; quadrant = 4'b0100; end
	2'b11: begin next = 2'b00; quadrant = 4'b1000; end
	default: begin next = 2'b00; quadrant = 4'b0000; end
	endcase
endmodule
