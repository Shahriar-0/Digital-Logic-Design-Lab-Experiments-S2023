module NBitCounter #(parameter N = 8) (input clk, rst, cnt_en, cnt_rst, output reg [N-1:0] cnt);
    always @(posedge clk or negedge rst) begin
        if (~rst)
            cnt <= {N{1'b0}};
        else if (cnt_rst)
            cnt <= {N{1'b0}};
        else if (cnt_en)
            cnt <= cnt + {1'b1};
    end
endmodule