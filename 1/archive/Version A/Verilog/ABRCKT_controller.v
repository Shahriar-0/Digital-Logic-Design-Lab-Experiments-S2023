`define Idle  4'b0000
`define Init  4'b0001
`define Start 4'b0010
`define S0    4'b0011
`define S1    4'b0100
`define S2    4'b0101
`define S3    4'b0110
`define S4    4'b0111
`define S5    4'b1000
`define S6    4'b1001
`define S7    4'b1010
`define S8    4'b1011
`define Done  4'b1100

module ABRCKT_controller(
    input ABAUD, UxRX, clk,
    output reg cntClr, cntEn, UxRXIF, ldReg
);
    reg [3:0] ps, ns;

    always @(posedge clk) begin
        ps <= ns;
    end

    always @(ps, ABAUD, UxRX) begin
        case (ps)
            `Idle:  ns = ABAUD ? `Init : `Idle;
            `Init:  ns = UxRX ? `Init : `Start;
            `Start: ns = UxRX ? `S0 : `Start;
            `S0: ns = UxRX ? `S0 : `S1;
            `S1: ns = UxRX ? `S2 : `S1;
            `S2: ns = UxRX ? `S2 : `S3;
            `S3: ns = UxRX ? `S4 : `S3;
            `S4: ns = UxRX ? `S4 : `S5;
            `S5: ns = UxRX ? `S6 : `S5;
            `S6: ns = UxRX ? `S6 : `S7;
            `S7: ns = UxRX ? `S8 : `S7;
            `S8: ns = UxRX ? `Done : `S8;
            `Done: ns = `Idle;
            default: ns = `Idle;
        endcase
    end

    always @(ps) begin
        {cntClr, cntEn, ldReg, UxRXIF} = 4'd0;
        case (ps)
            `Idle:;
            `Init: cntClr = 1'b1;
            `Start:;
            `S0: cntEn = 1'b1;
            `S1: cntEn = 1'b1;
            `S2: cntEn = 1'b1;
            `S3: cntEn = 1'b1;
            `S4: cntEn = 1'b1;
            `S5: cntEn = 1'b1;
            `S6: cntEn = 1'b1;
            `S7: cntEn = 1'b1;
            `S8: cntEn = 1'b1;
            `Done: {ldReg, UxRXIF} = 2'b11;
            default:;
        endcase
    end
endmodule
