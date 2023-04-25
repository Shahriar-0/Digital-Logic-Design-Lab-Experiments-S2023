module Register #(
    parameter N = 8,
    parameter [N-1:0] Init = {N{1'b0}}
)(
    input [N-1:0] loadData,
    input load, clr, clk, rst,
    output reg [N-1:0] out
);
    always @(posedge clk, posedge rst) begin
        if (rst) out <= Init;
        else if (clr) out <= Init;
        else if (load) out <= loadData;
    end
endmodule
