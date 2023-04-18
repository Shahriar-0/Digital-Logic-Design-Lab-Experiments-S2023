`define A 2'b00
`define B 2'b01
`define C 2'b10

module one_pulser (clk, rst, lp, sp);

    input clk, rst, lp;
    output sp;
    
    reg [1:0] ps, ns;

    always @(ps or lp) begin
        case (ps)
            `A: ns = lp ? `B : `A;
            `B: ns = `C;
            `C: ns = lp ? `C : `A;
            default: ns = `A;
        endcase
    end

    assign sp = (ps == `B);

    always @(posedge clk or posedge rst) begin
        if (rst)
            ps <= `A;
        else
            ps <= ns;
    end
    
endmodule