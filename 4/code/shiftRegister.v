module ShiftRegister (input clk,rst,zero,init,ld,sh_en, 
                      input [15:0] r_in, output reg [15:0] r_out);

	always@(posedge clk, posedge rst)begin
		if(rst == 1'b1)
			r_out <= 0;
		else
			if(zero == 1'b1)
				r_out <= 0;
			else if (init == 1'b1)
				r_out <= 16'hFFFF;
			else if(ld == 1'b1)
				r_out <= r_in;
            else if (sh_en == 1'b1)
                r_out <= r_out << 1;
	end
    
 endmodule
