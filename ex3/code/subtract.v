module Subtractor #(parameter N = 8)
                   (a, b, out);

    input [N - 1:0] a, b,
    output [N - 1:0] out;
    assign out = a - b;

endmodule
