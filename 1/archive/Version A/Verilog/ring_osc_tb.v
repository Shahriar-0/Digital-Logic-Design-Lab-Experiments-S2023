`timescale 1ns/1ps

`include "ring_osc.v"

module ring_osc_tb();
    wire out;
    reg rst = 1'b1;

    ring_osc #(.N(5), .Delay(1.8)) osc(out, rst);

    initial begin
        #20 rst = 1'b0;
        #200 $stop;
    end
endmodule
