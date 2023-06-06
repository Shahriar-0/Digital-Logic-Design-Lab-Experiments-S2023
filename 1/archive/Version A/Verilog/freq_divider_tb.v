`timescale 1ns/1ps

`include "ring_osc.v"
`include "freq_divider.vo"

module freq_divider_tb();
    reg preset, rst;
    wire up, freq, freq50p;
    wire [7:0] i, q;
    assign i = 8'd153;

    ring_osc #(.N(5), .Delay(1.8)) osc(up, rst);

    freq_divider div(.inp7(i[7]), .inp6(i[6]), .inp5(i[5]), .inp4(i[4]), .inp3(i[3]), .inp2(i[2]), .inp1(i[1]), .inp0(i[0]),
                     .out7(q[7]), .out6(q[6]), .out5(q[5]), .out4(q[4]), .out3(q[3]), .out2(q[2]), .out1(q[1]), .out0(q[0]),
                     .up(up), .dn(1'b1), .preset(preset), .freq(freq), .freq50p(freq50p));

    initial begin
        #0 {rst, preset} = 2'b10;
        #20000 {rst, preset} = 2'b01;
        #4000000 $stop;
    end
endmodule
