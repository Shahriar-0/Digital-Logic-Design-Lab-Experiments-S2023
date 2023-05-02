module FreqSelector #(parameter N = 9)
                     (sel, clk, rst, co);
    
    input [2:0] sel;
    reg [N-1:0] counter;
    input  clk, rst;
    output co;
    always @(posedge rst,posedge clk) begin
        if (co || rst)
        counter <= {sel,6'b1};
        else {co,counter} <= counter +1 ;
    end


    
endmodule
