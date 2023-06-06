module Datapath(input clk, rst, ld, sh_en, eng_start, ui_reg_ld ,
                input [4:0] V, input [1:0] U,
                output eng_done, output [20:0] wr_data);

        wire [15:0] eng_x , fracpart;
        wire [1:0] shift_numb;
        wire [1:0] intpart;

        ShiftRegisterII shift_reg(.clk(clk), .rst(rst), .ld(ld),
                        .sh_en(sh_en), .r_in(V), .r_out(eng_x));

        Register2bit ui_reg(.clk(clk), .rst(rst), .ld(ui_reg_ld), .r_in(U), .r_out(shift_numb));

        ShiftComb shift_comb(.in({intpart,fracpart}), .shiftNumb(shift_numb),.wrData(wr_data));

        Exponential exp_eng(.clk(clk), .rst(rst), .start(eng_start), .x(eng_x),
                        .done(eng_done),.intpart(intpart), .fracpart(fracpart));
        
endmodule 