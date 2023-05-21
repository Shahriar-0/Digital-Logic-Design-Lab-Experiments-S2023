`timescale 1ns/1ns

module WaveGenProcessorTB();
    reg [2:0] slc = 3'b001;
    wire [7:0] cnt, out;
    reg clk = 1'b0, rst = 1'b0;

    WaveGenProcessor main(.slc(slc), .cnt(cnt), .clk(clk), .rst(rst), .out(out));
    Counter counter(.en(1'b1), .clr(1'b0), .load(1'b0), .clk(clk), .rst(rst), .out(cnt));

    always #5 clk = ~clk;

    initial begin
        #3 rst = 1'b1;
        #5 rst = 1'b0;
        #25600 slc = 3'b011;
        #25600 slc = 3'b100;
        #25600 slc = 3'b101;
        #25600 slc = 3'b010;
        #25600 slc = 3'b110;
        #25600 slc = 3'b000;
        #25600 $stop;
    end
endmodule
