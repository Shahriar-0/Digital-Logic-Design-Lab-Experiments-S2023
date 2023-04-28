module GenSineWave (cnt, clk, rst, out);

    input [7:0] cnt;
    input clk, rst;
    output [7:0] out;

    wire signed [15:0] sin_load_data, cos_load_data;
    wire signed [15:0] sin_reg_output, cos_reg_out, previous_sin_reg_output, pcos_reg_out;

    Register #(16) previous_sin(.load_data(sin_reg_output), .clk(clk), .rst(rst), .out(previous_sin_reg_output));
    Register #(.N(16), .INIT(16'd30000)) previous_cos(.load_data(cos_reg_out), .clk(clk), .rst(rst), .out(pcos_reg_out));

    Register #(16) sin(.load_data(sin_load_data), .clk(clk), .rst(rst), .out(sin_reg_output));
    Register #(.N(16), .INIT(16'29993)) cos(.load_data(cos_load), .clk(clk), .rst(rst), .out(cos_reg_out)); // the 29993 is the value of cos(1)

    wire signed [15:0] apCos, aSin;
    assign apCos = {6{pcos_reg_out[15]}, pcos_reg_out[9:0]};
    assign aSin = {6{sin_load_data[15]}, sin_load_data[9:0]};

    Adder      #(16) adr(.a(previous_sin_reg_output), .b(apCos), .out(sin_load_data));
    Subtractor #(16) sub(.a(pcos_reg_out), .b(aSin), .out(cos_load));

    assign out = sin_reg_output[15:8];
endmodule
