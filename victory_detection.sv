module victory_detection (input [17:0] matrix, output victory);

	assign victory = (((~matrix[1] & matrix[0]) & (~matrix[3] & matrix[2]) & (~matrix[5] & matrix[4])) |
						  ((~matrix[7] & matrix[6]) & (~matrix[9] & matrix[8]) & (~matrix[11] & matrix[10])) |
						  ((~matrix[13] & matrix[12]) & (~matrix[15] & matrix[14]) & (~matrix[17] & matrix[16])) |
						  ((~matrix[1] & matrix[0]) & (~matrix[7] & matrix[6]) & (~matrix[13] & matrix[12])) |
						  ((~matrix[3] & matrix[2]) & (~matrix[9] & matrix[8]) & (~matrix[15] & matrix[14])) |
						  ((~matrix[5] & matrix[4]) & (~matrix[11] & matrix[10]) & (~matrix[17] & matrix[16])) |
						  ((~matrix[1] & matrix[0]) & (~matrix[9] & matrix[8]) & (~matrix[17] & matrix[16])) |
						  ((~matrix[13] & matrix[12]) & (~matrix[9] & matrix[8]) & (~matrix[5] & matrix[4]))) |
						  (((matrix[1] & ~matrix[0]) & (matrix[3] & ~matrix[2]) & (matrix[5] & ~matrix[4])) |
						  ((matrix[7] & ~matrix[6]) & (matrix[9] & ~matrix[8]) & (matrix[11] & ~matrix[10])) |
						  ((matrix[13] & ~matrix[12]) & (matrix[15] & ~matrix[14]) & (matrix[17] & ~matrix[16])) |
						  ((matrix[1] & ~matrix[0]) & (matrix[7] & ~matrix[6]) & (matrix[13] & ~matrix[12])) |
						  ((matrix[3] & ~matrix[2]) & (matrix[9] & ~matrix[8]) & (matrix[15] & ~matrix[14])) |
						  ((matrix[5] & ~matrix[4]) & (matrix[11] & ~matrix[10]) & (matrix[17] & ~matrix[16])) |
						  ((matrix[1] & ~matrix[0]) & (matrix[9] & ~matrix[8]) & (matrix[17] & ~matrix[16])) |
						  ((matrix[13] & ~matrix[12]) & (matrix[9] & ~matrix[8]) & (matrix[5] & ~matrix[4]))) |
						  (matrix[1:0] != 2'd0 & matrix[3:2] != 2'd0 & matrix[5:4] != 2'd0 &
						  matrix[7:6] != 2'd0 & matrix[9:8] != 2'd0 & matrix[11:10] != 2'd0 &
						  matrix[13:12] != 2'd0 & matrix[15:14] != 2'd0 & matrix[17:16] != 2'd0);

endmodule
