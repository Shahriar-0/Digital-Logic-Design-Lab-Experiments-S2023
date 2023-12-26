module ROM(address, out, clk);
    input clk;
    output reg [7:0] out;
    input [1:0] address;

    (* romstyle = "M9K" *)(* ram_init_file = "sine.mif" *) reg [7:0] mem [3:0];

    always @(posedge clk) begin
        out = mem[address];
    end

endmodule