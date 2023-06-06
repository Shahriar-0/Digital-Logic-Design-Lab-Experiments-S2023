`define Idle  4'b0000
`define Init  4'b0001
`define Start 4'b0010
`define B0    4'b0011
`define B1    4'b0100
`define B2    4'b0101
`define B3    4'b0110
`define B4    4'b0111
`define B5    4'b1000
`define B6    4'b1001
`define B7    4'b1010
`define B8    4'b1011

module ABRCKT_Controller (input ABAUD, UxRX, clk, rst, output reg cnt_en, cnt_rst, UxRXIF, ld_en);
    reg [3:0] ps, ns;

    always @(ABAUD, UxRX, ps) begin
        {cnt_en, cnt_rst, UxRXIF, ld_en} = 4'd0;
        case (ps)
            `Idle: ns = ABAUD ? `Init : `Idle;
            `Init: begin
                ns = UxRX ? `Init : `Start;
                cnt_rst = 1'b1;
            end
            `Start: begin
                ns = UxRX ? `B0 : `Start;
                cnt_en = UxRX ? 1'b1 : 1'b0;
            end
            `B0: begin
                ns = UxRX ? `B0 : `B1;
                cnt_en = 1'b1;
            end
            `B1: begin
                ns = UxRX ? `B2 : `B1;
                cnt_en = 1'b1;
            end
            `B2: begin
                ns = UxRX ? `B2 : `B3;
                cnt_en = 1'b1;
            end
            `B3: begin
                ns = UxRX ? `B4 : `B3;
                cnt_en = 1'b1;
            end
            `B4: begin
                ns = UxRX ? `B4 : `B5;
                cnt_en = 1'b1;
            end
            `B5: begin
                ns = UxRX ? `B6 : `B5;
                cnt_en = 1'b1;
            end
            `B6: begin
                ns = UxRX ? `B6 : `B7;
                cnt_en = 1'b1;
            end
            `B7: begin
                ns = UxRX ? `B8 : `B7;
                cnt_en = 1'b1;
            end
            `B8: begin
                ns = UxRX ? `B8 : `Idle;
                cnt_en = UxRX ? 1'b1 : 1'b0;
                ld_en = UxRX ? 1'b0 : 1'b1;
                UxRXIF = UxRX ? 1'b0 : 1'b1;
            end
            default: ns = `Idle;
        endcase
    end

    always @(posedge clk or negedge rst) begin
        if (~rst)
            ps = `Idle;
        else
            ps <= ns;
    end
endmodule