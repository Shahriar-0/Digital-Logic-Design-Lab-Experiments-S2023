module GenSineWave (cnt, clk, rst, out);

    input [7:0] cnt;
    input clk, rst;
    output [7:0] out;

    reg signed [15:0] sine_load_data, cos_load_data;
    wire signed [15:0] sine_output, cos_out;

    wire [5:0] cos_shift, sine_shift;
    assign cos_shift = 6{cos_out[15]};
    assign sine_shift = 6{sine_out[15]};

    Register #(16) sin(.load_data(sin_load_data), .clk(clk), .rst(rst), .out(sine_output));
    Register #(.N(16), .INIT(16'd30000)) cos(.load_data(cos_load), .clk(clk), .rst(rst), .out(cos_out)); // the 30000 is the value of cos(0)

    always @(posedge clk) begin
        sine_load_data = sine_output + {cos_shift, cos_out[9:0]};
        cos_load_data = cos_output - {sine_shift, sine_load_data[9:0]}; 
    end

    assign out = sine_output[15:8];
    
endmodule
