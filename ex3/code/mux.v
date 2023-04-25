module Mux2to1 #(parameter N = 8)
                (a, b, sel, out);

    input [N - 1:0] a, b;
    input sel;
    output [N - 1:0] out;

    assign out = sel ? a : b;

endmodule
