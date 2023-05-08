
module WG(clk, rst, square_out, triangle_out, full_wave_rectified_out, half_wave_rectified_out, reciprocal_out,sine_out);

    input clk, rst; 
    wire [7:0] cnt;
    wire co;

    output [7:0] square_out, triangle_out, full_wave_rectified_out, half_wave_rectified_out, reciprocal_out,sine_out;
    wire signed [7:0] sine_f;
    assign sine_out = sine_f + 8'd127;
    Counter counter(.clk(clk), .rst(rst), .out(cnt), .co(co));

    GenReciprocalWave    reciprocal(.cnt(cnt), .out(reciprocal_out));
    GenSquareWave        square(.cnt(cnt), .out(square_out));
    GenTriangleWave      triangle(.cnt(cnt), .out(triangle_out));
    GenSineWave          sine(.cnt(cnt), .out(sine_f), .clk(clk), .rst(rst));
    GenFullWaveRectified full_rectified(.cnt(cnt), .out(full_wave_rectified_out), .sine(sine_f));
    GenHalfWaveRectified half_rectified(.cnt(cnt), .out(half_wave_rectified_out),  .sine(sine_f));

endmodule


