module functionGenerator(clk,rst,sw,out);
    input rst,clk;
    output [9:0] sw;
    output [7:0] out;
    wire [7:0] output_W, output_A;
    wire clk_w;
    FreqSelector Freq_Sel(.slc(sw[4:2]), .clk(clk), .rst(rst), .co(clk_w));
    WaveformGenerator wg(.rst(rst), .clk(clk_w), .slc(sw[9:7]), .out(output_W));
    AmplitudeSelector Amp_Sel(.slc(sw[6:5]), .in(output_W), .out(output_A));

    assign out = output_A;

endmodule


