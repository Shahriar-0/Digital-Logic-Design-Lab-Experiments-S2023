module jkFlipFlop(j, k, clk, rst, q);
    
    input j, k, clk, rst;
    output reg q;

    always @(posedge clk, posedge rst) begin
        if (rst) q <= 1'b0;
        else if (j & k) q <= ~q;
        else if (j) q <= 1'b1;
        else if (k) q <= 1'b0;
    end
    
endmodule
