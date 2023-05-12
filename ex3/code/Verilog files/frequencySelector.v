module FreqSelector #(parameter N = 9)
                     (slc, clk, rst, counter, co);
    
    input [2:0] slc;
    output reg [N-1:0] counter;
    input  clk, rst;
    output co;
    always @(posedge rst , posedge clk) begin
        if (rst)
            counter = {slc, 6'b1}; // fixed value
        else if (co)
            counter = {slc, 6'b1};
        else 
            counter = counter + 1;
    end
	 assign co = &counter;
    
endmodule
