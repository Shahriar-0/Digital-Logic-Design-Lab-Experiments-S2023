// 255/(32-x/8)
module GenReciprocalWave(
    input [7:0] cnt,
    output reg [7:0] out
);
    // 255 / (63 - x/4)
    parameter [7:0] INITIAL, FULL, X_COEFFICIENT_DENOMINATOR, 
    always @(cnt) begin
        if (cnt >= 8'd252) out = INITIAL;
        else out = 8'd255 / (8'd32 - (cnt >> 2));
    end
endmodule
