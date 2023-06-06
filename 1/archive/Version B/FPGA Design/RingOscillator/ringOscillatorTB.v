`include "ringOscillator.v"
`timescale 1ns/100ps

module ringOscillatorTB ();
    wire out;
    ringOscillator #(.InverterCount(5), .Delay(1.9)) ringOsc(out);

    initial begin
        #200;
        $stop;
    end
endmodule
