`timescale 1ns/1ns

module WG_TB();
    reg clk, rst;
    wire [7:0] reciprocal_out, square_out, sine_out, triangle_out, 
               full_wave_rectified_out, half_wave_rectified_out;

    WG wg(.clk(clk), .rst(rst), .reciprocal_out(reciprocal_out), .
          square_out(square_out), .sine_out(sine_out), .triangle_out(triangle_out), .
          full_wave_rectified_out(full_wave_rectified_out), .half_wave_rectified_out(half_wave_rectified_out));

    always #5 clk = ~clk;

    initial begin 
        clk = 1'b0;
        rst = 1'b1;
        #30 rst = 1'b0;
        #10000 $stop;
    end

endmodule