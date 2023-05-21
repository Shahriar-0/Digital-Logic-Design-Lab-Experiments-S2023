module FreqSelector #(
    parameter N = 8
)(
    input [N-1:0] slc,
    input clr, clk, rst,
    output co
);
    wire [N-1:0] comp;
    assign comp = {1'b1, {N{1'b0}}} - slc;

    wire coLsb, coMsb;
    wire [N/2-1:0] outLsb, outMsb;

    Counter #(N/2) lsb(.loadData(comp[N/2-1:0]), .load(coMsb), .en(1'b1), .clr(clr), .clk(clk), .rst(rst), .out(outLsb), .co(coLsb));
    Counter #(N/2) msb(.loadData(comp[N-1:N/2]), .load(coMsb), .en(coLsb), .clr(clr), .clk(clk), .rst(rst), .out(outMsb), .co(coMsb));

    jkFlipFlop duty(.j(1'b1), .k(1'b1), .clk(coMsb), .rst(rst), .q(co));
endmodule
