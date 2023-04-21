module serial_transmitter (clk, rst, lp, ser_in, 
            ser_out, ser_out_valid,
            hex_out);

    input clk, rst, lp, ser_in;
    output ser_out, ser_out_valid;
    output [6:0] hex_out;
    wire clk_en;

    wire [3:0] cnt_out; 

    one_pulser op (
        clk, rst, lp, clk_en
    );

    OTHFSM seqwc (
        clk, rst, clk_en, ser_in, 
        ser_out, ser_out_valid, cnt_out
    );

    hex_display hd (
        cnt_out, hex_out
    );

endmodule