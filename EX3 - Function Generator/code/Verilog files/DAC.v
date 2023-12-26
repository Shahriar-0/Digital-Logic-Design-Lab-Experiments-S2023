module DAC(in, clk, rst, out);

    input [7:0] in;
    input clk, rst;
    output reg out;

    wire [7:0] inOut, cntOut;
    wire cntCo;
    reg ldIn;

    Counter cnt(.clk(clk), .rst(rst), .out(cntOut), .co(cntCo));
    Register inReg(.load_data(in), .load(ldIn), .clk(clk), .rst(rst), .out(inOut));

    always @(inOut, cntOut, cntCo) begin
        ldIn = cntCo;            
        out = (cntOut <= inOut) ? 1'b1 : 1'b0;
    end
endmodule
