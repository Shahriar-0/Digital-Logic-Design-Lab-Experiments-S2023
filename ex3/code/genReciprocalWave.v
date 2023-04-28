module GenReciprocalWave #(parameter [7:0] INITIAL = 8'd8,
                                           FULL = 8'd255)
                          (cnt, out);

    input [7:0] cnt;
    output reg [7:0] out;

    // 255 / (256 - x) 
    assign out = FULL / (FULL + 8'd1 - cnt);

endmodule
