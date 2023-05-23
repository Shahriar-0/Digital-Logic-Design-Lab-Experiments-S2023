`timescale 1 ns/ 100 ps
module shiftRegisterII (input clk, rst, ld, sh_en, 
                      input [4:0] r_in, output reg [15:0] r_out);

	always@(posedge clk, posedge rst)begin
		if(rst == 1'b1)
			r_out <= 0;
		else if(ld == 1'b1)
			r_out <= {3'b0, r_in , 8'b0};
		else if (sh_en == 1'b1)
			r_out <= r_out << 1;
	end
    
 endmodule
