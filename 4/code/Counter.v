module Counter(clk, rst, ld, en, in, out, co);
	parameter N = 8;
	input clk, rst, ld, en;
	input [N-1:0] in;

	output co;
	output reg [N-1:0] out;

	always@(posedge clk or posedge rst)begin
		if(rst)
			out <= 0;
		else if(ld)
			out <= in;
		else if(en)
			out <= out + 1'b1;
	end

	assign co = &out;

endmodule 