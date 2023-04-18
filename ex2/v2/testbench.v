module MainTB ();
    reg clk, rst, lp, ser_in;
    wire ser_out, ser_out_valid, clk_en;
    wire [6:0] hex_out;

    main main_module(
        clk, rst, lp, ser_in, ser_out, 
        ser_out_valid, hex_out, clk_en
    );
    
    always #5 clk = ~clk;
    always #50 lp = ~lp;
    
    initial begin
        clk = 0;
        rst = 1;
        lp = 0;
        #50 rst = 0; 
        ser_in = 1;
        #100 ser_in = 1;
        #100 ser_in = 0;
        #100 ser_in = 1;
        #100 ser_in = 0;
        #100 ser_in = 1;
        #500 ser_in = 0;
        #200 ser_in = 1;
        #2000 $stop;
    end

endmodule