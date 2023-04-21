module OTHFSM(clk, rst, clk_en, serIn,
              serOut, serOutValid, cnt_out);

    input clk, rst, clk_en, serIn;
    output serOut, serOutValid;
    output [3:0] cnt_out;

    wire co, inc_cnt, rst_cnt;

    seq_detector seq_d(
        clk, rst, clk_en, serIn, co, 
        serOut, serOutValid, inc_cnt, rst_cnt
    );

    counter cntr(
        clk, clk_en, rst_cnt, inc_cnt, co, cnt_out
    );
    
endmodule