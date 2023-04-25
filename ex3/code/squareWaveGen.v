module SquareWaveGen(
    input [7:0] cnt,
    output reg [7:0] out
);
    always @(cnt) begin
        if (cnt < 8'd128) out = 8'd255;
        else out = 8'd0;
    end
endmodule
