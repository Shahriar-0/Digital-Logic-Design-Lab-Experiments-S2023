`timescale 1ns/1ns

module AFG_TB();
    reg [9:0] SW;
    wire [7:0] out;
    reg clk, rst;
    wire [2:0] mux_slc, freq_slc;
    wire [1:0] Amp_slc, phase_cntrl;

    AFG afg(out, clk, rst, freq_slc, phase_cntrl, mux_slc, Amp_slc); 

    always #5 clk = ~clk;

    assign mux_slc = SW[9:7];
    assign Amp_slc = SW[6:5];
    assign phase_cntrl = SW[1:0];
    assign freq_slc = SW[4:2];

    initial begin
        #10 rst = 1'b1; phase_cntrl = 2'b00; clk = 1'b0;
        #100 rst = 1'b0;

        #100 mux_slc = 3'b000; 
        #25600 $stop;
    end
endmodule
