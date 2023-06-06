module Mux2to1 #(
    parameter N = 16
)(
    input sel,
    input [N-1:0] a0, a1,
    output [N-1:0] out
);
    assign out = sel ? a1 : a0;
endmodule

module Mux4to1 #(
    parameter N = 16
)(
    input [1:0] sel,
    input [N-1:0] a00, a01, a10, a11,
    output [N-1:0] out
);
    assign out = (sel == 2'b00) ? a00 :
                 (sel == 2'b01) ? a01 :
                 (sel == 2'b10) ? a10 :
                 (sel == 2'b11) ? a11 : 2'b00;
endmodule
