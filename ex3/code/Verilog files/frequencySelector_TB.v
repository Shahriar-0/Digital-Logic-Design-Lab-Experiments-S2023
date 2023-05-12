`timescale 1ns/1ns

module FreqSelectorTB();
    reg [2:0] slc;
    reg clk, rst;
    wire co;

    FreqSelector fs(.slc(slc), .clk(clk), .rst(rst), .co(co));

    always #5 clk = ~clk;

    initial begin
        clk = 1'b0; rst = 1'b1; slc = 3'd0;
        #30 rst = 1'b0;
        #20 slc = 3'd5;
        #20000 $stop;
    end
endmodule

