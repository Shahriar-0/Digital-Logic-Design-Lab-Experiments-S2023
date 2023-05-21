module GenTriangleWave #(parameter [7:0] HALF = 8'd128, 
                                         FULL = 8'd255)
                        (cnt, out);

    input [7:0] cnt;
    output reg [7:0] out;

    always @(cnt) begin
        if (cnt < HALF) out = cnt;
        else out = FULL - cnt;
    end

endmodule
