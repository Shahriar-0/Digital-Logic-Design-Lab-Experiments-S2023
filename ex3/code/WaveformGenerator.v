module WaveformGenerator(clk, rst, slc, out);

    input [2:0] slc;
    input clk, rst;
    output reg [7:0] out;
    wire [7:0] cnt;
    wire co;

    wire [7:0] square_output, triangle_output, full_wave_rectified_output, half_wave_rectified_output, reciprocal_output, DDS_output, sine_output;

    wire [7:0] sine_output_MSB;
    assign sine_output_MSB = sine_output + 8'd127;

    Counter counter(.clk(clk), .rst(rst), .out(cnt), .co(co));

    GenReciprocalWave    reciprocal(.cnt(cnt), .out(reciprocal_output));
    GenSquareWave        square(.cnt(cnt), .out(square_output));
    GenTriangleWave      triangle(.cnt(cnt), .out(triangle_output));
    GenSineWave          sine(.cnt(cnt), .out(sine_output), .clk(clk), .rst(rst));
    GenFullWaveRectified full_rectified(.cnt(cnt), .out(full_wave_rectified_output), .sine(sine_output_MSB));
    GenHalfWaveRectified half_rectified(.cnt(cnt), .out(half_wave_rectified_output),  .sine(sine_output_MSB));

    always @(slc or reciprocal_output or square_output or
             triangle_output or sine_output_MSB or 
             full_wave_rectified_output or DDS_output) begin
        case (slc)
            3'b000: out = reciprocal_output; 
            3'b001: out = square_output;     
            3'b010: out = triangle_output; 
            3'b011: out = sine_output_MSB;
            3'b100: out = full_wave_rectified_output;    
            3'b101: out = half_wave_rectified_output;    
            3'b110: out = DDS_output;
            default: out = 8'bz;
        endcase
    end

endmodule


