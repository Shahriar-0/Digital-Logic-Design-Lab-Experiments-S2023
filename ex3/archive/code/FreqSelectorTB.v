`timescale 1ns/1ns

module FreqSelectorTB();
    reg [7:0] sel;
    reg clr = 0, clk = 0, rst = 1;
    wire co;

    FreqSelector fs(.sel(sel), .clr(clr), .clk(clk), .rst(rst), .co(co));

    always #5 clk = ~clk;

    initial begin
        #3 rst = 0;
        #20 sel = 8'd100;
        #20000 $stop;
    end
endmodule
