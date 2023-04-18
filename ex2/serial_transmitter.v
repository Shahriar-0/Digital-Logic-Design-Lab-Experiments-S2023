module serial_transmitter(clk, rst, clkPB, serIn,
                         serOut, serOutValid,
                         lowSegment, highSegment);

    input clk, rst, clkPB, serIn;
    output serOut, serOutValid;
    output [6:0] lowSegment, highSegment;
    wire [3:0] cnt_out; 
    wire Clk_EN;

    onepulser pulser(
        .clk(clk), .rst(rst), .clkPB(clkPB), .Clk_EN(Clk_EN)
    );

    OTHFSM sequece_detector(
        .clk(clk), .rst(rst), .Clk_EN(Clk_EN), 
        .serIn(serIn), .serOut(serOut), 
        .serOutValid(serOutValid), .cnt_out(cnt_out)
    );

    high_7_seg high_seg(
        .d_in(cnt_out), .d_out(highSegment)
    );

    low_7_seg low_seg(
        .d_in(cnt_out), .d_out(lowSegment)
    );

endmodule