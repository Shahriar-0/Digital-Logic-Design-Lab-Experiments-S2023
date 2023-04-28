module GenHalfWaveRectified #(parameter [7:0] HALF = 8'd127, 
                                        ZERO = 8'd0)
                       (sine, out, cnt);

    input [7:0] sine, cnt;
    output reg [7:0] out;

    always @(sine or cnt) begin
        if (cnt < HALF) out = sine;
        else out = ZERO;
    end

endmodule
