module counter(clk, Clk_EN, inc_cnt,
               rst_cnt, cnt_out, Co);
    
    input clk, Clk_EN, inc_cnt, rst_cnt;
    output reg [3:0] cnt_out;
    output Co;

    always @(posedge clk) begin
        if (rst_cnt)
            cnt_out <= 4'd6;
        else if (Clk_EN && inc_cnt)
            cnt_out <= cnt_out + 1;
    end

    assign Co = &cnt_out;

endmodule