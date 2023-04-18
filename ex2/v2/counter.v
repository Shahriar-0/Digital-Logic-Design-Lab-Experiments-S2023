module counter_4bit (clk, clk_en, rst_cnt, inc_cnt, co, cnt_out);
    input clk, clk_en, rst_cnt, inc_cnt;
    output co;
    output reg [3:0] cnt_out;
    assign co = &cnt_out;

    always @(posedge clk) begin
        if (rst_cnt)
            cnt_out <= 4'd6;
        else if(clk_en && inc_cnt)
            cnt_out = cnt_out + 1;
    end 
    always @(inc_cnt) begin
        $display("inc_cnt: %d", inc_cnt);
    end
endmodule