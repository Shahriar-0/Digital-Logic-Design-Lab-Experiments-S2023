module GenTriangleWave(
    input [7:0] cnt,
    output reg [7:0] out
);
    always @(cnt) begin
        if (cnt < 8'd128) out = cnt;
        else out = 8'd255 - cnt;
    end
endmodule
