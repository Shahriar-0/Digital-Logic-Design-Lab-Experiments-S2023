module Mux2to1(a, b, s, w);
	input [15:0] a, b;
	input s;
	output [15:0] w;

	assign y = s ? a : b;

endmodule 

