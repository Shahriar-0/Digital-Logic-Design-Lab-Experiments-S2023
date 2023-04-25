module WaveformGenerator(clk,rst,phase_cnt,slc,out);
    input [2:0] sel;
    input clk, rst, phase_cnt;
    output [7:0] out;
    // reg [7:0] cnt;
    wire [7:0] cnt;
    wire co;
    Counter counter(.loadData(8'b0), .load(1'b0), .en(1'b1), .clr(1'b0), .clk(clk), .rst(rst), .out(cnt), .co(co));
    


endmodule