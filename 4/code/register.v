module Register(in, ld, sRst, clk, rst, out);
    parameter N = 32;

    input [N-1:0] in;
    input ld, sRst, clk, rst;

    output reg [N-1:0] out;

    always @(posedge clk or posedge rst) begin
        if (rst)
            out <= {N{1'b0}};
        else if (sRst)
            out <= {N{1'b0}};
        else if (ld)
            out <= in;
    end

endmodule
