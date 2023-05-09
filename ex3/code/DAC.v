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
        ldIn = 1'b0;

        if (cntCo) 
            ldIn = 1'b1;
            
        if (cntOut <= inOut) 
            out = 1'b1;
        else 
            out = 1'b0;
    end
endmodule
