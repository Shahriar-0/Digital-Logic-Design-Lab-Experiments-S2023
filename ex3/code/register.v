module Register #(parameter N = 8, 
                  parameter [N-1:0] Init = {N{1'b0}})
                 (loadData, load, clk, rst, out);

    input [N-1:0] loadData;
    input load, clr, clk, rst;
    output reg [N-1:0] out;

    always @(posedge clk or posedge rst) begin
        if (rst) out <= Init;
        else if (load) out <= loadData;
    end

endmodule
