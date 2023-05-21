`timescale 1ns/1ns

module ExpAccTB();
    reg start, read, clk, rst;

    wire done, ready;
    wire [17:0] q;
    wire [2:0] usedw;

    ExpAcc acc(.done(done), .start(start), .clk(clk), .rst(rst), .read(read), .ready(ready), .q(q), .usedw(usedw));

    always #5 clk = ~clk;

    initial begin
        #0 clk = 0; rst = 0; start = 0; read = 0;
        #3 rst = 1;
        #3 rst = 0;
        #10 start = 1;
        #10 start = 0;
        while (~done) #10;
        #30 read = 1;
        #30 read = 0;
        #30 read = 1;
        #30 read = 0;
        #30 read = 1;
        #30 read = 0;
        #30 read = 1;
        #30 read = 0;
        #30 read = 1;
        #30 read = 0;
        #100 $stop;
    end
endmodule
