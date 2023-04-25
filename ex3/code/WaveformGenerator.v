module WaveformGenerator(clk,rst,slc,out);
    input [2:0] sel;
    input clk, rst, phase_cnt;
    output [7:0] out;
    // reg [7:0] cnt;
    wire [7:0] cnt;
    wire co;
    Counter counter(.clk(clk), .rst(rst), .out(cnt), .co(co));
    wire [7:0] squareOut, triangleOut, sinFullOut, sinHalfOut, reciprocalOut,DDS ;
    wire [7:0] sineOut;
    wire [7:0] shiftedSineMSB;
    assign shiftedSineMSB = sineOut + 8'd127;

    GenSquareWave     square(.cnt(cnt), .out(squareOut));
    GenTriangleWave   triangle(.cnt(cnt), .out(triangleOut));
    GenSineWave       sine(.cnt(cnt), .out(sineOut), .clk(clk), .rst(rst));
    GenSinFullWave    sinFull(.sine(shiftedSineMSB), .out(sinFullOut));
    GenSinHalfWave    sinHalf(.sine(shiftedSineMSB), .out(sinHalfOut));
    GenReciprocalWave reciprocal(.cnt(cnt), .out(reciprocalOut));

    always @(*) begin
        case (sel)
            3'b000: out = reciprocalOut;   // Reciprocal
            3'b001: out = squareOut;     // Square
            3'b010: out = triangleOut; // Triangle
            3'b011: out = shiftedSineMSB;   // Sine
            3'b100: out = sinFullOut;    // Full-wave rectified
            3'b101: out = sinHalfOut;    // Half-wave rectified
            3'b110: out = DDS;  // DDS
            default: out = {8{clk}};
        endcase
    end


endmodule


