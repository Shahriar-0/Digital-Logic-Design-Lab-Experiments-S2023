`define A 2'b000
`define B 2'b001
`define C 2'b010
`define D 2'b011
`define E 2'b100
`define F 2'b101

module controller(input clk, rst, eng_done, start,
                  output ld, sh_en, wr_req, 
                  eng_start, ui_reg_ld, done);

    reg [2:0] ps, ns;
    reg [1:0] count;
    
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
        {done, ld, ui_reg_ld, eng_start, eng_done, cnt_en, sh_en, wr_req} = 8'b0;
        case (ps)
            `A: done = 1'b1;
            `B: {ld, ui_reg_ld} = 2'b1;
            `C: eng_start = 1'b1;
            `E: {cnt_en, wr_req} = 2'b1;
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
            count <= count + 1;
        end
    end


endmodule