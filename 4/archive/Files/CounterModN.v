// `define BITS(x) $rtoi($ceil($clog2(x)))

module CounterModN #(
    parameter N = 5,
    parameter BITS = 3
)(
    input en, clr, clk, rst,
    output reg [BITS-1:0] cnt,
    output co
);
    always @(posedge clk or posedge rst) begin
        if (rst) cnt <= {BITS{1'b0}};
        else if (clr) cnt <= {BITS{1'b0}};
        else if (en) begin
            if (co) cnt <= {BITS{1'b0}};
            else cnt <= cnt + 1'b1;
        end
    end

    assign co = (cnt == N - 1);
endmodule
