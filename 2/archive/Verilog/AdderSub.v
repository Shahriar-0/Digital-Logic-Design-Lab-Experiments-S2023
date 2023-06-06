module AdderSub #(
    parameter N = 16
)(
    input sub,
    input [N-1:0] a, b,
    output co, ov,
    output [N-1:0] out
);
    wire [N-1:0] inputB;
    assign inputB = {N{sub}} ^ b;

    assign ov = (inputB[N-1] & a[N-1] & ~out[N-1]) || (~inputB[N-1] & ~a[N-1] & out[N-1]);
    assign {co, out}= a + inputB + sub;
endmodule
