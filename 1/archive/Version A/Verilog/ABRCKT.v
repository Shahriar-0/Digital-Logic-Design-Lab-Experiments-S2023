module ABRCKT(
    input ABAUD, UxRX, clk,
    output UxRXIF,
    output [7:0] baudVal
);
    wire cntClr, cntEn, ldReg;
    wire [7:0] bReg;

    ABRCKT_datapath dp(cntClr, cntEn, ldReg, clk, bReg);
    ABRCKT_controller cu(ABAUD, UxRX, clk, cntClr, cntEn, UxRXIF, ldReg);

    assign baudVal = bReg;
endmodule
