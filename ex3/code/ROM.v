module rom_module(phase_cntrl, data_out, clk);

    input [1:0] phase_cntrl;
    input clk;
    output reg [7:0] data_out;
    reg [7:0] address;

    reg [7:0] memory [255:0];

    initial begin
        $readmemb("sine.mif", memory);
        address = 8'b0;
    end

    always @(posedge clk) begin
        address = address + phase_cntrl;
        data_out = memory[phase_cntrl];
    end

endmodule