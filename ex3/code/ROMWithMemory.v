module memoryRomImplementation(out, clk);
    input clk;
    output reg [7:0] out;

    reg [7:0] address;

    (* romstyle = "M9K" *)(* ram_inital_file = "sine.mif" *) reg [7:0] mem [3:0];

    always @(posedge clk) begin
        out = mem[address];
    end

endmodule