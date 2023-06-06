`timescale 1ns/1ns

module Assume4R_TB();
    reg clk, rst;
    reg startAR4, getA, getX, putOut;
    reg [7:0] inBus;

    wire readyAR4;
    wire [0:6] out0, out1, out2, out3;

    Assume4R #(16) main(startAR4, getA, getX, putOut, clk, rst, inBus, readyAR4, out0, out1, out2, out3);

    always #10 clk = ~clk;

    initial begin
        #0 {clk, rst} = 0; {getA, getX, putOut, startAR4} = 4'b1111;
        #3 rst = 1;
        #6 rst = 0;

        #5 startAR4 = 0;
        #20 startAR4 = 1;

        #10 inBus = 8'b11001010; getA = 0;
        #20 getA = 1;
        #10 inBus = 8'b11111111; getA = 0;
        #20 getA = 1;
        #10 inBus = 8'b11100110; getX = 0;
        #20 getX = 1;
        #10 inBus = 8'b11111111; getX = 0;
        #20 getX = 1;

        #1000 putOut = 0;
        #200 putOut = 1;
        #100 $stop;
    end
endmodule
