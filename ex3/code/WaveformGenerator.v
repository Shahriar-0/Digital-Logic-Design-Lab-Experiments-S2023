module WaveformGenerator(rst,clk,slc,out);
    input rst;
    input [2:0] slc;
    output [7:0] out;
    WG main(.clk(clk), .rst(rst),.square(square), .triangle(triangle), .full_wave_rectified(full_wave_rectified),
         .half_wave_rectified(half_wave_rectified), .reciprocal(reciprocal),.sine(sine));
    wire [7:0] square, triangle, full_wave_rectified, half_wave_rectified, reciprocal, sine, DDS;


always @(slc or reciprocal or square or
             triangle or sine or 
             full_wave_rectified or DDS) begin
        case (slc)
            3'b000: out = reciprocal; 
            3'b001: out = square;     
            3'b010: out = triangle; 
            3'b011: out = sine;
            3'b100: out = full_wave_rectified;    
            3'b101: out = half_wave_rectified;
            3'b110: out = DDS;
            3'b111: out = 8'bz;
        endcase
    end


endmodule 