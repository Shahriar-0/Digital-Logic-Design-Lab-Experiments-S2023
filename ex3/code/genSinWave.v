module GenSineWave (cnt, clk, rst, out);

    input [7:0] cnt;
    input clk, rst;
    output [7:0] out;

    wire signed [15:0] sine_load_data, cos_load_data;
    wire signed [15:0] sine_output, cos_output, prev_sine_output, prev_cos_output;

    Register sin(.load_data(sine_load_data), .clk(clk), .rst(rst), .out(sine_output));
    Register #(.N(16), .INIT(16'd29993)) cos(.load_data(cos_load_data), .clk(clk), .rst(rst), .out(cos_output)); // the 29993 is the value of cos(1)
    Register prev_sin(.load_data(sine_output), .clk(clk), .rst(rst), .out(prev_sine_output));
    Register #(.N(16), .INIT(16'd30000)) prev_cos(.load_data(cos_output), .clk(clk), .rst(rst), .out(prev_cos_output)); // the 30000 is the value of cos(0)

    wire signed [15:0] shifted_cos, shifted_sine;
    wire [5:0] cos_shift, sine_shift;
    assign cos_shift = {6{cos_output[15]}};
    assign sine_shift = {6{sine_load_data[15]}};

    assign shifted_cos = {cos_shift, cos_output[15:6]};
    assign shifted_sine = {sine_shift, sine_load_data[15:6]};

    assign sine_load_data = prev_sine_output + shifted_cos;
    assign cos_load_data = prev_cos_output - shifted_sine;

    assign out = sine_output;

endmodule
