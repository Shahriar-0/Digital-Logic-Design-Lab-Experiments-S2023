`timescale 1ns/1ns

module ExpEngTB();
    reg start, clk, rst;
    reg [15:0] inp;

    wire done;
    wire [1:0] intpart;
    wire [15:0] fracpart;

    exponential exp(.x(inp), .start(start), .clk(clk), .rst(rst), .done(done), .intpart(intpart), .fracpart(fracpart));

    always #5 clk = ~clk;

    initial begin
        #0 clk = 0; rst = 0; start = 0;
        #3 rst = 1;
        #3 rst = 0;

        #10 inp = 16'h8000; start = 1;
        #10 start = 0;
        while (~done) #10;
        #100;

        #10 inp = 16'hCCCC; start = 1;
        #10 start = 0;
        while (~done) #10;
        #100;

        #10 inp = 16'h3333; start = 1;
        #10 start = 0;
        while (~done) #10;
        #100;

        #100 $stop;
    end
endmodule
