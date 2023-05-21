module TopLevelDec(
    input start, read, clk, rst,
    output ready, done,
    output [6:0] out0, out1, out2, out3
);
    reg [17:0] q;
    reg [2:0] usedw;

    ExpAcc acc(.done(done), .start(start), .clk(clk), .rst(rst), .read(read), .ready(ready), .q(q), .usedw(usedw));

    HexDisplay hx0({1'b0, usedw}, out0);
    assign out1 = 7'b000_1001;

    wire [3:0] frac;
    assign frac = q[15:12] <= 4'd1 ? 4'd0 :
                  q[15:12] <= 4'd3 ? 4'd1 :
                  q[15:12] <= 4'd4 ? 4'd2 :
                  q[15:12] <= 4'd6 ? 4'd3 :
                  q[15:12] <= 4'd7 ? 4'd4 :
                  q[15:12] <= 4'd9 ? 4'd5 :
                  q[15:12] <= 4'd11 ? 4'd6 :
                  q[15:12] <= 4'd12 ? 4'd7 :
                  q[15:12] <= 4'd14 ? 4'd8 : 4'd9;
    HexDisplay hx2(frac, out2);

    HexDisplay hx3({2'b00, q[17:16]}, out3);
endmodule
