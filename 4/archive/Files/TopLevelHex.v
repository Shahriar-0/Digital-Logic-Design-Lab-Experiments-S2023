module TopLevelHex(
    input start, read, clk, rst,
    output ready, done,
    output [6:0] out0, out1, out2, out3
);
    reg [17:0] q;

    ExpAcc acc(.done(done), .start(start), .clk(clk), .rst(rst), .read(read), .ready(ready), .q(q));

    HexDisplay hx0(q[7:4], out0);
    HexDisplay hx1(q[11:8], out1);
    HexDisplay hx2(q[15:12], out2);
    HexDisplay hx3({2'b00, q[17:16]}, out3);
endmodule
