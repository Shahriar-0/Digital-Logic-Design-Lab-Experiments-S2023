module ShiftReg #(
    parameter N = 16
)(
    input ld, sh, serIn, clr, clk, rst,
    input [N-1:0] ldData,
    output reg [N-1:0] out
);
    always @(posedge clk or posedge rst) begin
        if (rst) out <= {N{1'b0}};
        else if (clr) out <= {N{1'b0}};
        else if (ld) out <= ldData;
        else if (sh) out <= {serIn, out[N-1:1]};
    end
endmodule
