module FreqSelector #(parameter N = 9)
                     (slc, clk, rst, co);
    
    input [2:0] slc;
    reg [N-1:0] counter;
    input  clk, rst;
    output co;
    
    always @(posedge rst or posedge clk) begin
        if (co || rst)
            counter <= {slc, 6'b1};
        else 
            {co, counter} <= counter + 1;
    end

    
endmodule
