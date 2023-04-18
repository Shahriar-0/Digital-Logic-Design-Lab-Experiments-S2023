module seq_with_cnt (clk, rst, clk_en, ser_in, ser_out, ser_out_valid, cnt_out);
    input clk, rst, clk_en, ser_in;
    output ser_out, ser_out_valid;
    output [3:0] cnt_out;
    wire co, inc_cnt, rst_cnt;
    seq_detector seq_d(clk, rst, clk_en, ser_in, co, ser_out, ser_out_valid, inc_cnt, rst_cnt);
    counter_4bit cntr(clk, clk_en, rst_cnt, inc_cnt, co, cnt_out);
    
endmodule