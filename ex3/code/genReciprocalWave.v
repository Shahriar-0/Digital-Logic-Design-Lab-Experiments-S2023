module GenReciprocalWave #(parameter [7:0] INITIAL = 8'd8,
                                           FULL = 8'd255,
                                           X_COEFFICIENT_DENOMINATOR = 8'd3, 
                                           THRESHOLD = 8'd254)
                          (cnt, out);

    input [7:0] cnt;
    output reg [7:0] out;

    // 255 / (32 - x / 8) 
    always @(cnt) begin
        if (cnt >= THRESHOLD) out = INITIAL;
        else out = FULL / (cnt >> X_COEFFICIENT_DENOMINATOR);
    end

endmodule
