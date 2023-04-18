`define A 2'b00
`define B 2'b01
`define C 2'b10

module onepulser(clk, rst, clkPB, Clk_EN);
    input clk, rst, clkPB;
    output Clk_EN;

    reg [1:0] ps, ns;
    always @(ps or clkPB) begin
        case (ps)
            `A: ns = clkPB ? `B : `A;
            `B: ns = `C;
            `C: ns = clkPB ? `C : `A;
            default: ns = `A;
        endcase
    end

    always @(posedge clk or posedge rst) begin
        if (rst)
            ps <= `A;
        else
            ps <= ns;
    end

    assign Clk_EN = (ps == `B)? 1'b1 : 1'b0;

endmodule