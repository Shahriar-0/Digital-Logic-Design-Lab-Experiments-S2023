module tb();

    reg clk, rst, lp, serIn;
    wire serOut, serOutValid;
    wire [6:0] hex_out;

   serial_transmitter main_module(
        clk, rst, lp, serIn, serOut, 
        serOutValid, hex_out
    );
    
    always #5 clk = ~clk;
    always #50 lp = ~lp;
    
    initial begin
        clk = 1'b0;
        rst = 1'b1;
        lp = 1'b0;
        #50 rst = 1'b0; serIn = 1'b1;
        #100 serIn = 1'b1;
        #100 serIn = 1'b0;
        #100 serIn = 1'b1;
        #100 serIn = 1'b0;
        #100 serIn = 1'b1;
        #500 serIn = 1'b0;
        #200 serIn = 1'b1;
        #100 serIn = 1'b0;
        #100 serIn = 1'b1;
        #100 serIn = 1'b1;
        #100 serIn = 1'b1;
        #100 serIn = 1'b1;
        #100 serIn = 1'b1;
        #100 serIn = 1'b1;
        #100 serIn = 1'b1;
        #500 serIn = 1'b0;

        #2000 $stop;
    end

endmodule