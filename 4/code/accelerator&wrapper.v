module AcceleratorWrappers(input clk , rst, start, input [1:0] U, 
                           input [5:0] V,output done, wr_req, 
                           output [20:0] wr_data);

    wire ld, sh_en, eng_start, ui_reg_ld, eng_done;

    Datapath dp(.clk(clk), .rst(rst), .ld(ld), .sh_en(sh_en), 
                .eng_start(eng_start), .ui_reg_ld(ui_reg_ld) ,
                .V(V), .U(U), .eng_done(eng_done), .wr_data(wr_data));

    Controller cntrl(.clk(clk), .rst(rst), .eng_done(eng_done), .start(start),
                  .ld(ld), .sh_en(sh_en), .wr_req(wr_req), 
                  .eng_start(eng_start), .ui_reg_ld(ui_reg_ld), .done(done));

endmodule