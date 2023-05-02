module Mux2to1 #(
    parameter N = 8
)(
    input [N-1:0] a0, a1,
    input slc,
    output [N-1:0] out
);
    assign out = slc ? a1 : a0;
endmodule
