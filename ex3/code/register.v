module Register #(parameter N = 8, 
                  parameter [N-1:0] INIT = {N{1'b0}})
                 (loadData, load, clk, rst, out);

    input [N-1:0] loadData;
    input load, clk, rst;
    output reg [N-1:0] out;

    always @(posedge clk or posedge rst) begin
        if (rst) out <= INIT;
        else if (load) out <= loadData;
    end

endmodule
