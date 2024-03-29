`timescale 1 ns/ 100 ps
module expengtb();
    reg clk, rst, start;
    reg [15:0] x;
    wire done;
    wire [1:0] intpart;
    wire [15:0] fracpart;

    Exponential exp(.clk(clk), .rst(rst), .start(start), .x(x), 
                    .done(done), .intpart(intpart), .fracpart(fracpart));

    always #5 clk = ~clk;

    initial begin
      clk = 1'b0; 
      #20 rst = 1'b1;
      #10 rst = 1'b0; x = 15'b000000000010000;
      #3 start = 1'b1;
      #8 start = 1'b0;

      #1000 rst = 1'b1;
      #10 rst = 1'b0; x = 15'b000110000010000;
      #3 start = 1'b1;
      #8 start = 1'b0;

      #1000 rst = 1'b1;
      #10 rst = 1'b0; x = 15'b001000000100000;
      #3 start = 1'b1;
      #8 start = 1'b0;

      #1000 $stop;
    end   

endmodule