module DFlipFlop (
    input ld, clk, rst,
    input ldData,
    output reg out
);
    always @(posedge clk or posedge rst) begin
        if (rst) out <= 1'b0;
        else if (ld) out <= ldData;
    end
endmodule
