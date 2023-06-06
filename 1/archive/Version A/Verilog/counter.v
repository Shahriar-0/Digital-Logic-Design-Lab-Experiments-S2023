module counter #(
    parameter N = 32
)(
    input en, clr, clk,
    output co,
    output reg [N-1:0] cnt
);
    always @(posedge clk) begin
        if (clr) cnt <= {N{1'b0}};
        else if (en) begin
            if (co) cnt <= {N{1'b0}};
            else cnt <= cnt + 1'b1;
        end
    end

    assign co = &cnt;
endmodule
