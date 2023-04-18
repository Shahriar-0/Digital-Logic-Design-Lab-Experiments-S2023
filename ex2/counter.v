module counter(clk, Clk_EN, inc_cnt,
               rst_cnt, cnt_out, Co);
    
    input clk, Clk_EN, inc_cnt, rst_cnt;
    output reg [3:0] cnt_out;
    output Co;


    always @(posedge clk) begin
        if (rst_cnt) begin
            cnt_out <= 4'd6;
            Co <= 1'b0;
        end
        else if (Clk_EN && inc_cnt)
           {Co, cnt_out} <= cnt_out + 1;
    end

    // assign Co = &cnt_out;

endmodule