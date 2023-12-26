module serial_transmitter(clk, rst, lp, serIn, 
                          serOut, serOutValid, hex_out);

    input clk, rst, lp, serIn;
    output serOut, serOutValid;
    output [6:0] hex_out;
    wire clk_en;

    wire [3:0] cnt_out; 

    one_pulser op (
        clk, rst, lp, clk_en
    );

    OTHFSM seqwc (
        clk, rst, clk_en, serIn, 
        serOut, serOutValid, cnt_out
    );
    
    hex_display hd (
        cnt_out, hex_out
    );
endmodule


