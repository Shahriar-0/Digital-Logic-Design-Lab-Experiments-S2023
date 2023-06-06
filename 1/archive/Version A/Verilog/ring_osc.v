`timescale 1ns/1ps

module ring_osc #(
    parameter N = 5,
    parameter Delay = 2
)(
    output out,
    input rst
);
    wire [N:0] w;
    assign w[0] = rst ? 1'b0 : w[N];

    generate
        genvar i;
        for (i = 0; i < N; i = i+1) begin: Inverters
            not #(Delay) inv(w[i+1], w[i]);
        end
    endgenerate

    assign out = w[0];
endmodule
