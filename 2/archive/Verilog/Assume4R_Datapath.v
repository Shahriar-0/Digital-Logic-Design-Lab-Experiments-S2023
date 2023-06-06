module Assume4R_Datapath #(
    parameter N = 16
)(
    input [N/2 - 1:0] inBus,
    input lmA, lmX, ldA, ldX, ldP, shX, shP, clrP, sub, putOut, shSignExtend, ldCo, ldOv, clk, rst,
    input [1:0] coefSel,
    output overflow,
    output [2:0] lsb3,
    output [N-1:0] outBus
);
    wire [N-1:0] aRegOut, pRegOut, aRegIn, pRegIn;
    wire [N:0] xRegOut, xRegIn;
    wire [N-1:0] coef;
    wire co, ov, ovOut, serInP, coRegOut;

    assign serInP = shSignExtend ? pRegOut[N-1] : coRegOut;

    Mux2to1  #(N)   lmAmux(.sel(lmA), .a0( {{(N/2){1'b0}}, inBus} ), .a1( {inBus, aRegOut[N/2 - 1:0]} ), .out(aRegIn));
    Mux2to1  #(N+1) lmXmux(.sel(lmX), .a0( {{(N/2){1'b0}}, inBus, 1'b0} ), .a1( {inBus, xRegOut[N/2:0]} ), .out(xRegIn));
    Reg      #(N)   aReg(.ld(ldA), .ldData(aRegIn), .clk(clk), .rst(rst), .out(aRegOut));
    DFlipFlop       carryAdder(.ld(ldCo), .ldData(co), .clk(clk), .rst(rst), .out(coRegOut));
    DFlipFlop       ovFF(.ld(ldOv), .ldData(ov), .clk(clk), .rst(rst), .out(ovOut));
    ShiftReg #(N+1) xReg(.ld(ldX), .ldData(xRegIn), .sh(shX), .serIn(pRegOut[0]), .clr(1'b0), .clk(clk), .rst(rst), .out(xRegOut));
    ShiftReg #(N)   pReg(.ld(ldP), .ldData(pRegIn), .sh(shP), .serIn(serInP), .clr(clrP), .clk(clk), .rst(rst), .out(pRegOut));
    Mux4to1  #(N)   coefMux(.sel(coefSel), .a00({N{1'b0}}), .a01(aRegOut), .a10(aRegOut), .a11({aRegOut[N-2:0], 1'b0}), .out(coef));
    AdderSub #(N)   adder(.sub(sub), .a(pRegOut), .b(coef), .co(co), .out(pRegIn), .ov(ov));
    Mux2to1  #(N)   outMux(.sel(putOut), .a0(pRegOut), .a1(xRegOut[N:1]), .out(outBus));

    assign lsb3 = xRegOut[2:0];
    assign overflow = ovOut;
endmodule
