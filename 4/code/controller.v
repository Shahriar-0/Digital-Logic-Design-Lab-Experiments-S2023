`define A 3'b000
`define B 3'b001
`define C 3'b010
`define D 3'b011
`define E 3'b100
`define F 3'b101

module Controller(input clk, rst, eng_done, start,
                  output reg ld, sh_en, wr_req, 
                  eng_start, ui_reg_ld, done);

    reg [2:0] ps, ns;
    reg [1:0] count;
    reg  cnt_en;
    
    wire co;
    assign co = &count;

    always @(ps or start or co or eng_done or rst) begin
        case (ps)
            `A: ns = ~start ? `A : `B;
            `B: ns = start ? `B : `C;
            `C: ns = `D;
            `D: ns = ~eng_done ? `D : `E;
            `E: ns = co ? `A : `F;
            `F: ns = `C;
            default: ns = `A;
        endcase
    end

    always @(ps) begin
        {done, ld, ui_reg_ld, eng_start, cnt_en, sh_en, wr_req} = 7'b0;
        case (ps)
            `A: done = 1'b1;
            `B: {ld, ui_reg_ld} = 2'b11;
            `C: eng_start = 1'b1;
            `E: {cnt_en, wr_req} = 2'b11;
            `F: sh_en = 1'b1;
            default:;
        endcase
    end
            
    always @(posedge clk or posedge rst) begin
        if (rst) begin
            ps <= `A;
            count <= 2'd0;
        end
        else begin
            ps <= ns;
            if(cnt_en)
                count <= count + 1;
        end
    end

endmodule