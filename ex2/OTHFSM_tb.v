module OTHFSM_tb();
    reg clk, Clk_EN, serIn, rst;
    wire cnt_out, serOut, serOutValid;
    
    OTHFSM sequece_detector(
        .clk(clk), .rst(rst), .Clk_EN(Clk_EN), 
        .serIn(serIn), .serOut(serOut), 
        .serOutValid(serOutValid), .cnt_out(cnt_out)
    );

    always #5 clk = ~clk;
    
    initial begin
        clk = 0;
        rst = 1;
        #5 rst = 0; 
        serIn = 1;
        #100 serIn = 1;
        #100 serIn = 0;
        #100 serIn = 1;
        #100 serIn = 0;
        #100 serIn = 1;
        #500 serIn = 0;
        #200 serIn = 1;
        #2000 $stop;
    end
endmodule