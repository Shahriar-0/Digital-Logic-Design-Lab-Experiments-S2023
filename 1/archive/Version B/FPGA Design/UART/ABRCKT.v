module ABRCKT (input ABAUD, UxRX, clk, rst, output UxRXIF, output [7:0] out, count);
    wire cnt_en, cnt_rst, ld_en;
    ABRCKT_Controller cu(ABAUD, UxRX, clk, rst, cnt_en, cnt_rst, UxRXIF, ld_en);
    ABRCKT_Datapath dp(cnt_en, cnt_rst, ld_en, clk, rst, count, out);
endmodule