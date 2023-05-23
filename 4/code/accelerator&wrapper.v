module accelerator_wrappers(input clk , rst, start, input [1:0] U, input [5:0] V,output done, output [20:0] out);

    datapath(clk, rst, ld, sh_en, eng_start, ui_reg_ld ,
                    V, U,
                    eng_done, wr_data);

    controller(clk, rst, eng_done, start,
                  ld, sh_en, wr_req, 
                  eng_start, ui_reg_ld, .done(done));
endmodule