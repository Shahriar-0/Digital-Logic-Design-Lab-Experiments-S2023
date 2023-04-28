module GenSinFullWave #(parameter [7:0] HALF = 8'd128)
                       (sine, out, cnt);

    input [7:0] sine, cnt;
    output reg [7:0] out;

    always @(sine or cnt) begin
        if (cnt < HALF) out = sine;
        else out = -sine;
    end

endmodule
