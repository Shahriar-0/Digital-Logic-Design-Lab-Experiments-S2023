module ABRCKT_datapath(
    input cntClr, cntEn, ldReg, clk,
    output [7:0] regOut
);
    wire [7:0] bReg, cnt;
    wire co;

    register #(.N(8)) brgReg(.load(ldReg), .ldData(cnt), .out(bReg), .clr(1'b0), .clk(clk));
    counter #(.N(8)) brgCnt(.en(cntEn), .clr(cntClr), .clk(clk), .co(co), .cnt(cnt));

    assign regOut = bReg;
endmodule
