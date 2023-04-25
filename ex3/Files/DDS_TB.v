`timescale 1ns/1ns

module DDS_TB ();
    reg clk = 0, rst = 1;
    reg [7:0] Phase_cntrl;
    wire [7:0] out;

    DDS dds(out, clk, rst, Phase_cntrl);

    always #5 clk = ~clk;

    initial begin
        rst = 1; Phase_cntrl = 8'd1;
        #5 rst = 0;
        #3000 Phase_cntrl = 8'd5;
        #3000 Phase_cntrl = 8'd10;
        #3000 $finish;
    end
endmodule
