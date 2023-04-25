module Adder #(
    parameter N = 8
)(
    input [N-1:0] a, b,
    output [N-1:0] out,
    output co
);
    assign {co, out} = a + b;
endmodule
