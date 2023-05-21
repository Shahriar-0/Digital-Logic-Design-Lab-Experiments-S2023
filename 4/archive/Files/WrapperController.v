`define Idle    4'b0000
`define Init    4'b0001
`define RomWait 4'b0010
`define Start   4'b0011
`define Calc    4'b0100
`define Write   4'b0101
`define Done    4'b0110
`define Read    4'b0111
`define Wait    4'b1000

module WrapperController(
    input start, engDone, coCnt, read, empty, clk, rst,
    output reg done, ready, engStart, rstCnt, incCnt, writeReq, readReq, fifoClr
);
    reg [3:0] ps, ns;

    always @(posedge clk, posedge rst) begin
        if (rst) ps <= `Idle;
        else ps <= ns;
    end

    always @(ps, start, engDone, coCnt, read, empty) begin
        case (ps)
            `Idle:    ns = start ? `Init : `Idle;
            `Init:    ns = `RomWait;
            `RomWait: ns = `Start;
            `Start:   ns = `Calc;
            `Calc:    ns = engDone ? `Write : `Calc;
            `Write:   ns = coCnt ? `Done : `RomWait;
            `Done:    ns = read ? `Read : `Done;
            `Read:    ns = `Wait;
            `Wait:    ns = read ? `Wait : (empty ? `Idle : `Done);
            default:;
        endcase
    end

    always @(ps) begin
        {done, ready, engStart, rstCnt, incCnt, writeReq, readReq, fifoClr} = 8'd0;
        case (ps)
            `Idle: ready = 1'b1;
            `Init: {rstCnt, fifoClr} = 2'b11;
            `RomWait:;
            `Start: engStart = 1'b1;
            `Calc:;
            `Write: {writeReq, incCnt} = 2'b11;
            `Done: done = 1'b1;
            `Read: readReq = 1'b1;
            `Wait:;
            default:;
        endcase
    end
endmodule
