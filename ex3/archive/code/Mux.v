module Mux2to1 #(
    parameter N = 8
)(
    input [N-1:0] a0, a1,
    input sel,
    output [N-1:0] out
);
    assign out = sel ? a1 : a0;
endmodule
