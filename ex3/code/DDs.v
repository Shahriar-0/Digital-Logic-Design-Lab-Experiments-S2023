module DDS(phase_cntrl, clk, out, rst);
    input [1:0] phase_cntrl;
    input clk, rst;
    output [7:0] out;
    wire [7:0] load_data;

    Register #(8) regg(.load_data(load_data), .clk(clk), .rst(rst), .out(out), .load(1'b1)); 

    assign load_data = out + phase_cntrl;

endmodule