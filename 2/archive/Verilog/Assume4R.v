module Assume4R #(
    parameter N = 16
)(
    input startAR4, getA, getX, putOut, clk, rst,
    input [N/2 - 1:0] inBus,
    output readyAR4,
    output [6:0] out0, out1, out2, out3
);
    wire lmA, lmX, ldA, ldX, ldP, shX, shP, clrP, sub, shSignExtend, ldCo, ldOv, overflow;
    wire [1:0] coefSel;
    wire [2:0] lsb3;
    wire [N-1:0] outBus;

    Assume4R_Datapath   #(N) dp(inBus, lmA, lmX, ldA, ldX, ldP, shX, shP, clrP, sub, putOut, shSignExtend, ldCo, ldOv, clk, rst, coefSel, overflow, lsb3, outBus);
    Assume4R_Controller #(N) cu(startAR4, getA, getX, overflow, clk, rst, lsb3, lmA, lmX, ldA, ldX, ldP, shX, shP, clrP, sub, readyAR4, shSignExtend, ldCo, ldOv, coefSel);

    HexDisplay hx0(outBus[3:0], out0);
    HexDisplay hx1(outBus[7:4], out1);
    HexDisplay hx2(outBus[11:8], out2);
    HexDisplay hx3(outBus[15:12], out3);
endmodule
