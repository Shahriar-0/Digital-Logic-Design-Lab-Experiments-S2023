module GenModulatedWave(
    input [7:0] sine,
    input clk, rst,
    output reg [7:0] out
);
    wire [4:0] cnt;
    Counter #(5) cnter(.clk(clk), .rst(rst), .out(cnt));

    always @(sine, cnt) begin
        if (cnt < 5'd16) out = sine;
        else out = 8'd255 - sine;
    end
endmodule
