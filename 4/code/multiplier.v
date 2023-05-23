module Multiplier(a, b, out);
	
	input [15:0] a, b;
	
	output [15:0] out;
	
	wire [31:0] temp;
	assign temp = a * b;
	assign out = temp[31:16];

endmodule
