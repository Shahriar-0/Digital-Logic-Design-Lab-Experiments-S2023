module GenSineWave(
    input [7:0] cnt,
    input clk, rst,
    output [15:0] out
);
    wire signed [15:0] sinLdData, cosLdData;
    wire signed [15:0] sinOut, cosOut, pSinOut, pCosOut;
    wire regLd;
    assign regLd = 1'b1;

    Register #(16) sin(.loadData(sinLdData), .load(regLd), .clr(1'b0), .clk(clk), .rst(rst), .out(sinOut));
    Register #(.N(16), .Init(16'd29993)) cos(.loadData(cosLdData), .load(regLd), .clr(1'b0), .clk(clk), .rst(rst), .out(cosOut));
    Register #(16) prevSin(.loadData(sinOut), .load(regLd), .clr(1'b0), .clk(clk), .rst(rst), .out(pSinOut));
    Register #(.N(16), .Init(16'd30000)) prevCos(.loadData(cosOut), .load(regLd), .clr(1'b0), .clk(clk), .rst(rst), .out(pCosOut));

    wire signed [15:0] apCos, aSin;
    assign apCos = pCosOut >>> 6;
    assign aSin = sinLdData >>> 6;

    Adder      #(16) adr(.a(pSinOut), .b(apCos), .out(sinLdData));
    Subtractor #(16) sub(.a(pCosOut), .b(aSin), .out(cosLdData));

    assign out = sinOut;
endmodule
