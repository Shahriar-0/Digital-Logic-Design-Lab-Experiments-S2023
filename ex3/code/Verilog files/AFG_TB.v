`timescale 1ns/1ns

module AFG_TB();

    reg [9:0] SW;
    reg clk, rst;

    wire [8:0] counter;
    wire [7:0] out, amp_out, dds_out, mux_out, sine_out;
    wire [2:0] mux_slc, Freq_slc;
    wire [1:0] Amp_slc, phase_cntrl;
    wire freq_out;

    AFG afg(
        .out(out), .clk(clk), .rst(rst), .Freq_slc(Freq_slc), 
        .phase_cntrl(phase_cntrl), .mux_slc(mux_slc),
        .freq_out(freq_out), .amp_out(amp_out), .dds_out(dds_out), 
        .mux_out(mux_out), .sine_out(sine_out), .Amp_slc(Amp_slc)
    ); 

    always #5 clk = ~clk;

    assign mux_slc = SW[9:7];
    assign Amp_slc = SW[6:5];
    assign phase_cntrl = SW[1:0];
    assign Freq_slc = SW[4:2];

    initial begin
        #10 rst = 1'b1;
        clk = 1'b0;
        #100 rst = 1'b0;
        #10000 SW = 10'b0001001011;
        #10000 SW = 10'b0101001010;
        #10000 SW = 10'b0111000011;
        #10000 SW = 10'b0001100001;
        #25600 $stop;
    end

endmodule
