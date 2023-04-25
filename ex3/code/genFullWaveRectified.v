module GenSinFullWave #(parameter [7:0] HALF = 8'128)
                       (sine, out);

    input [7:0] sine,
    output reg [7:0] out

    always @(sine) begin
        if (sine < 8'd128) out = sine;
        else out = -sine;
    end

endmodule
