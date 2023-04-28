module GenReciprocalWave #(parameter [7:0] INITIAL = 8'd8,
                                           FULL = 8'd255,
                                           X_COEFFICIENT_DENOMINATOR = 8'd3)
                          (cnt, out);

    input [7:0] cnt;
    output reg [7:0] out;

    // 255 / (256 - x) 
    assign out = FULL / (FULL + 8'd1 - (cnt >> X_COEFFICIENT_DENOMINATOR));

endmodule
