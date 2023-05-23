`timescale 1ns/1ns
module top_tb();
    reg start, rst, clk;
    reg [4:0] V;
    reg [1:0] U;
    wire done, wr_req;
    wire [20:0] wr_data;
    
    accelerator_wrappers accwr(.clk(clk), .rst(rst), .start(start), 
                               .U(U), .V(V), .done(done), 
                               .wr_req(wr_req), .wr_data(wr_data));

    assign clk = 1'b0
    always #5 clk = ~clk;

    initial begin
        rst = 1'b1; start = 1'b0; V= 5'b0 ; U = 2'b0;
        #30 rst = 1'b0;
        #10 start = 1'b1;
        #20 start = 1'b0;
        #1000 $stop;
    end

endmodule