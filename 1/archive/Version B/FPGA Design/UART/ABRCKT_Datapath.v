module ABRCKT_Datapath (input cnt_en, cnt_rst, ld_en, clk, rst, output [7:0] count, N);
    wire [7:0] cntOut;
    assign count = cntOut;
    NBitCounter #(.N(8)) counter(clk, rst, cnt_en, cnt_rst, cntOut);
    NBitRegister #(.N(8)) register(cntOut, ld_en, clk, rst, N);
endmodule