module Mux2to1(input [15:0] a,b, input s, output [15:0] y);
	assign y = (~s) ? a : b;
endmodule 

