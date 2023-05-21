module GenSinHalfWave(
    input [7:0] sine,
    output reg [7:0] out
);
    always @(sine) begin
        if (sine < 8'd128) out = 8'd127;
        else out = sine;
    end
endmodule
