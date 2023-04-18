module OTHFSM(clk, rst, Clk_EN, serIn, 
             serOut, serOutValid, cnt_out);

    input clk, rst, Clk_EN, serIn;
    output serOut, serOutValid;
    output [3:0] cnt_out;
    wire Co, inc_cnt, rst_cnt;

    detector moore_110101_detector(
        .clk(clk), .Clk_EN(Clk_EN), .rst(rst), .serIn(serIn),
        .Co(Co), .serOut(serOut), .serOutValid(serOutValid), 
        .inc_cnt(inc_cnt), .rst_cnt(rst_cnt)
    );
    
    counter cntr(
        .clk(clk), .Clk_EN(Clk_EN), .inc_cnt(inc_cnt),
        .rst_cnt(rst_cnt), .cnt_out(cnt_out), .Co(Co)
    );
    
endmodule