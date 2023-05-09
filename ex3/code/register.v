module Register #(parameter N = 16, 
                  parameter [N - 1:0] INIT = {N{1'b0}})
                 (load_data, load, clk, rst, out);

    input [N - 1:0] load_data;
    input clk, rst;
    output reg [N - 1:0] out;

    always @(posedge clk or posedge rst) begin
        if (rst) 
            out = INIT;
        else if (load) 
            out = load_data;
    end

endmodule
