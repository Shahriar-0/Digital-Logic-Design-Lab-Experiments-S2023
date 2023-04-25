module GenReciprocalWave(
    input [7:0] cnt,
    output reg [7:0] out
);
    // 255 / (63 - x/4)
    always @(cnt) begin
        if (cnt >= 8'd252) out = 8'd4;
        else out = 8'd255 / (8'd63 - (cnt >> 2));
    end
endmodule
