module onepulser_tb();
    reg clk, rst, clkPB;
    wire Clk_EN;
    onepulser pulser(clk, rst, clkPB, Clk_EN);
    always #5 clk = ~clk;
    always #50 clkPB = ~clkPB;

    initial begin
        clk = 1'b0;
        clkPB = 1'b0;
        rst = 1'b1;
        #10 rst = 1'b0;
    end
endmodule