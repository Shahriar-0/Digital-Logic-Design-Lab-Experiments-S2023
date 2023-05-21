module GenRhomboidWave(
	input [7:0] cnt,
	output reg [7:0] out
);
	reg [7:0] triangle;

	always @(cnt) begin
		if (cnt < 8'd128) triangle = cnt + 8'd127;
		else triangle = 8'd127 - cnt;

		if (cnt[0] == 1'b0) out = triangle;
		else out = 8'd255 - triangle;
	end
endmodule
