module OTHFSM_tb();
    reg clk, Clk_EN, serIn, rst;
    wire serOut, serOutValid;
    wire [3:0] cnt_out;

    OTHFSM OTHFSM_instance(
        .clk(clk), .rst(rst), .Clk_EN(Clk_EN), 
        .serIn(serIn), .serOut(serOut), 
        .serOutValid(serOutValid), .cnt_out(cnt_out)
    );

    always #5 clk = ~clk;
    
    initial begin
        clk = 1'b0;
        rst = 1'b1;
        Clk_EN = 1'b1;
        #1 rst = 1'b0; 
        serIn = 1'b1;
        #10 serIn = 1'b1;
        #10 serIn = 1'b0;
        #10 serIn = 1'b1;
        #10 serIn = 1'b0;
        #10 serIn = 1'b1;
        #10 serIn = 1'b0;
        #10 serIn = 1'b1;
        #2000 $stop;
    end
endmodule


