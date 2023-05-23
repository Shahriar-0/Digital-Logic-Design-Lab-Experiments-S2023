module Counter (clk, rst, ld, en, in, out, co);
	input clk, rst, ld, en;
	input [2:0] in;

	output co;
	output reg [3:0] out;

	always@(posedge clk or posedge rst)begin
		if(rst)
			out <= 0;
		else if(ld)
			out <= in;
		else if(en)
			out <= out + 1'b1;
	end

	assign co = (out >= 4'b1000)? 1'b1: 1'b0; // ?

endmodule 