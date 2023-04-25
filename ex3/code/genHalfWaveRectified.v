module GenSinHalfWave #(parameter [7:0] HALF = 127)
                       (sine, out);

    input [7:0] sine;
    output reg [7:0] out;

    always @(sine) begin
        if (sine >= HALF) out = sine;
        else out = HALF;
    end

endmodule
