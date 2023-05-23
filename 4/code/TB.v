`timescale 1ns/1ns
module tb();
    reg clk, rst, start;
    reg [15:0] x;
    wire done;
    wire [1:0] intpart;
    wire [15:0] fracpart;
    exponential exp(.clk(clk), .rst(rst), .start(start), 
    .x(x), .done(done), .intpart(intpart), .fracpart(fracpart));
    
    always #5 clk = ~clk;

    initial begin
        clk = 1'b0; rst = 1'b1; start = 1'b0; x = 16'b1111111111111111;
        #30 rst = 1'b0;
        #30 start = 1'b1;
        #30 start = 1'b0;
        #1000 $stop;
    end

endmodule