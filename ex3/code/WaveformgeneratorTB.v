`timescale 1ns/1ns

module WaveformGeneratorTB();
    reg [2:0] slc = 3'b001;
    wire [7:0] out;
    reg clk = 1'b0, rst = 1'b0;

    WaveformGenerator main(.clk(clk), .rst(rst), .slc(slc), .out(out));

    always #5 clk = ~clk;

    initial begin
        #3 rst = 1'b1;
        #100 rst = 1'b0;
        #25600 slc = 3'b011;
        #25600 slc = 3'b100;
        #25600 slc = 3'b101;
        #25600 slc = 3'b010;
        #25600 slc = 3'b000;
        #25600 $stop;
    end
endmodule
