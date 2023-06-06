module Reg #(
    parameter N = 16
)(
    input ld, clk, rst,
    input [N-1:0] ldData,
    output reg [N-1:0] out
);
    always @(posedge clk or posedge rst) begin
        if (rst) out <= {N{1'b0}};
        else if (ld) out <= ldData;
    end
endmodule
