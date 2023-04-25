module Counter #(parameter N = 8)
                (clk, rst, out, co);

    input clk, rst;
    output reg [N - 1:0] out;
    output co;
    
    always @(posedge clk or posedge rst) begin
        if (rst) out <= {N{1'b0}};
        else out = out + 1'b1;
    end

    assign co = &{out};

endmodule
