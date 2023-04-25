`timescale 1ns/1ps

module FuncGenTB();
    reg clk, rst;
    reg [7:0] freqSel, phaseCntrl;
    reg [2:0] waveSel;
    reg [1:0] ampSel;

    wire [7:0] out;
    wire outPWM;

    FuncGen funcGen(.out(out), .clk(clk), .rst(rst), .freqSelect(freqSel), .Phase_cntrl(phaseCntrl), .waveSelect(waveSel), .ampSelect(ampSel));
    PWM pwm(.in(out), .clk(clk), .rst(rst), .out(outPWM));

    always #3 clk = ~clk;

    initial begin
        #0 clk = 0; rst = 1;
        #2 rst = 0;
        #20 freqSel = 8'd128; ampSel = 2'b00; phaseCntrl = 8'd1;
        #2560000 waveSel = 3'b000;
        #2560000 waveSel = 3'b001;
        #2560000 waveSel = 3'b010;
        #2560000 waveSel = 3'b011;
        #2560000 waveSel = 3'b100;
        #2560000 waveSel = 3'b101;
        #2560000 waveSel = 3'b110;
        #2560000 waveSel = 3'b111;
        #2560000 $stop;
    end
endmodule
