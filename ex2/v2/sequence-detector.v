`define S0 4'b0000
`define S1 4'b0001
`define S2 4'b0010
`define S3 4'b0011
`define S4 4'b0100
`define S5 4'b0101
`define S6 4'b0110
`define S7 4'b0111

module seq_detector (clk, rst, clk_en, ser_in,
                     co, ser_out, ser_out_valid, 
                     inc_cnt, rst_cnt);

    input clk, rst, clk_en, ser_in, co;
    output reg ser_out, ser_out_valid, inc_cnt, rst_cnt;
    reg [2:0] ps, ns;


    always @(ps or ser_in or co) begin
        case (ps)
            `S0: ns = ser_in ? `S1 : `S0; 
            `S1: ns = ser_in ? `S2 : `S0;
            `S2: ns = ser_in ? `S2 : `S3;
            `S3: ns = ser_in ? `S4 : `S0;
            `S4: ns = ser_in ? `S2 : `S5;
            `S5: ns = ser_in ? `S6 : `S0;
            `S6: ns = `S7;
            `S7: ns = co ? `S0 : `S7;       
            default: ns = `S0;
        endcase
    end

    always @(ps) begin
        {ser_out_valid, inc_cnt, rst_cnt} = 3'b000;
        case (ps)
            `S6: {ser_out_valid, rst_cnt} = 2'b11;
            `S7: {ser_out_valid, inc_cnt} = 2'b11;       
            default:; 
        endcase
    end

    always @(posedge clk, posedge rst) begin
        if (rst)
            ps <= `S0;
        else if(clk_en)
            ps <= ns;
    end

    assign ser_out = (ps == `S7) ? ser_in : 0;

endmodule