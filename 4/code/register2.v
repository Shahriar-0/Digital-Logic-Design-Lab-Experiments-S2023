
module Register2bit (input clk, rst, ld, input [1:0] r_in, output reg [1:0] r_out);

	always@(posedge clk, posedge rst)begin
		if(rst == 1'b1)
			r_out <= 0;
		else if(ld == 1'b1)
				r_out <= r_in;
	end
 endmodule
