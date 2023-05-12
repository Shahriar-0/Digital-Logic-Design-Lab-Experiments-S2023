module memoryRomImplementation(phase_cntrl, out, clk);
    input [1:0] phase_cntrl;
    input clk;
    output reg [7:0] out;

    reg [7:0] address;

    (* romstyle = "M9K" *)(* ram_inital_file = "sine.mif" *) reg [7:0] mem [3:0];

    initial begin
        address = 8'b0;
    end

    always @(posedge clk) begin
        address = address + phase_cntrl;
        out = mem[address];
    end

endmodule