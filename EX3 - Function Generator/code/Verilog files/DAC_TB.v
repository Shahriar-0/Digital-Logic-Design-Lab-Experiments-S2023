module DAC_TB();

    reg clk, rst;
    reg [7:0] in;

    wire out;

    DAC dac(.in(in), .clk(clk), .rst(rst), .out(out));

    always #5 clk = ~clk;

    initial begin
        #0 clk = 0; rst = 0;
        #0 in = 8'd200;
        #3 rst = 1;
        #3 rst = 0;
        #10000 $stop;
    end
    
endmodule
