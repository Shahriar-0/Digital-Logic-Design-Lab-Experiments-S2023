module GenHalfWaveRectified #(parameter [7:0] HALF = 8'd127, 
                                        ZERO = 8'd0)
                       (sine, out, cnt);

    input signed [7:0] sine;
    input [7:0] cnt;
    output reg [7:0] out;

    always @(sine or cnt) begin
        if (sine > 0) out = sine;
        else out = ZERO;
    end

endmodule
