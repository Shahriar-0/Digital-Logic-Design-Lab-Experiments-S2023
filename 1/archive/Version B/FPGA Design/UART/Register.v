module NBitRegister #(parameter N = 8) (input [N-1:0] in, input ld_en, clk, rst, output reg [N-1:0] out);
    always @(posedge clk or negedge rst) begin
        if (~rst)
            out <= {N{1'b0}};
        else if (ld_en)
            out <= in;
    end
endmodule