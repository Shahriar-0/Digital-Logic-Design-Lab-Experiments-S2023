`define Idle  4'b0000
`define LsbA  4'b0001
`define WaitA 4'b0010
`define MsbA  4'b0011
`define LsbX  4'b0100
`define WaitX 4'b0101
`define MsbX  4'b0110
`define Init  4'b0111
`define Calc  4'b1000
`define Sh1   4'b1001
`define Sh2   4'b1010

module Assume4R_Controller #(
    parameter N = 16
)(
    input start, getA, getX, overflow, clk, rst,
    input [2:0] lsb3,
    output reg lmA, lmX, ldA, ldX, ldP, shX, shP, clrP, sub, ready, shSignExtend, ldCo, ldOv,
    output reg [1:0] coefSel
);
    reg [3:0] ps, ns;

    reg cntEn, cntClr;
    wire cntCo;

    CounterModN #(.N(N/2), .BITS(3)) counter(.en(cntEn), .clr(cntClr), .clk(clk), .rst(rst), .co(cntCo));

    always @(posedge clk or posedge rst) begin
        if (rst) ps <= `Idle;
        else ps <= ns;
    end

    always @(ps or getA or getX or cntCo or start) begin
        case (ps)
            `Idle:  ns = start ? `Idle : `LsbA;
            `LsbA:  ns = getA ? `LsbA : `WaitA;
            `WaitA: ns = getA ? `MsbA : `WaitA;
            `MsbA:  ns = getA ? `MsbA : `LsbX;
            `LsbX:  ns = getX ? `LsbX : `WaitX;
            `WaitX: ns = getX ? `MsbX : `WaitX;
            `MsbX:  ns = getX ? `MsbX : `Init;
            `Init:  ns = `Calc;
            `Calc:  ns = `Sh1;
            `Sh1:   ns = `Sh2;
            `Sh2:   ns = cntCo ? `Idle : `Calc;
            default: ns = `Idle;
        endcase
    end

    always @(ps or lsb3 or getA or getX or overflow) begin
        {ready, lmA, lmX, ldA, ldX, ldP, shX, shP, clrP, sub} = 10'd0;
        {cntEn, cntClr} = 2'b00;
        {shSignExtend, ldCo, ldOv} = 3'd0;
        coefSel = 2'b00;
        case (ps)
            `Idle: ready = 1'b1;
            `LsbA: begin
                {clrP, lmA} = 2'b10;
                if (getA == 1'b0) ldA = 1'b1;
            end
            `WaitA:;
            `MsbA: begin
                lmA = 1'b1;
                if (getA == 1'b0) ldA = 1'b1;
            end
            `LsbX: begin
                lmX = 1'b0;
                if (getX == 1'b0) ldX = 1'b1;
            end
            `WaitX:;
            `MsbX: begin
                lmX = 1'b1;
                if (getX == 1'b0) ldX = 1'b1;
            end
            `Init: cntClr = 1'b1;
            `Calc: begin
                ldP = 1'b1;
                ldCo = 1'b1;
                ldOv = 1'b1;
                sub = lsb3[2];
                coefSel = lsb3[2] ? ~lsb3[1:0] : lsb3[1:0];
            end
            `Sh1: begin
                {shX, shP} = 2'b11;
                if (~overflow) shSignExtend = 1'b1;
            end
            `Sh2: {shX, shP, shSignExtend, cntEn} = 4'b1111;
            default:;
        endcase
    end
endmodule
