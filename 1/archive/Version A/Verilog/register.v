module register #(
    parameter N = 32
)(
    input load, clr, clk,
    input [N-1:0] ldData,
    output reg [N-1:0] out
);
    always @(posedge clk) begin
		if (clr) out <= {N{1'b0}};
        else if (load) out <= ldData;
    end
endmodule
