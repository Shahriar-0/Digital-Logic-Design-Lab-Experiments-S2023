module tb();

    reg clk, rst, lp, ser_in;
    wire ser_out, ser_out_valid;
    wire [6:0] hex_out;

   serial_transmitter main_module(
        clk, rst, lp, ser_in, ser_out, 
        ser_out_valid, hex_out
    );
    
    always #5 clk = ~clk;
    always #50 lp = ~lp;
    
    initial begin
        clk = 1'b0;
        rst = 1'b1;
        lp = 1'b0;
        #50 rst = 1'b0; ser_in = 1'b1;
        #100 ser_in = 1'b1;
        #100 ser_in = 1'b0;
        #100 ser_in = 1'b1;
        #100 ser_in = 1'b0;
        #100 ser_in = 1'b1;
        #500 ser_in = 1'b0;
        #200 ser_in = 1'b1;
        #100 ser_in = 1'b0;
        #100 ser_in = 1'b1;
        #100 ser_in = 1'b1;
        #100 ser_in = 1'b1;
        #100 ser_in = 1'b1;
        #100 ser_in = 1'b1;
        #100 ser_in = 1'b1;
        #100 ser_in = 1'b1;
        #500 ser_in = 1'b0;

        #2000 $stop;
    end

endmodule