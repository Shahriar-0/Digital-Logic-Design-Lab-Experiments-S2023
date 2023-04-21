`define ZERO 7'b100_0000
`define ONE 7'b111_1001
`define TWO 7'b010_0100
`define THREE 7'b011_0000
`define FOUR 7'b001_1001
`define FIVE 7'b001_0110
`define SIX 7'b000_0010
`define SEVEN 7'b111_1000
`define EIGHT 7'b000_0000
`define NINE 7'b001_0000
`define TEN 7'b000_1000
`define ELEVEN 7'b000_0011
`define TWELEVE 7'b100_0110
`define THIRTEEN 7'b010_0001
`define FOURTEEN 7'b000_0110
`define FIFTEEN 7'b000_1110

module hex_display(d_in, d_out);

    input [3:0] d_in;
    output reg [6:0] d_out;

    always @(d_in) begin
        case (d_in)
            4'd0:    d_out = `ZERO; 
            4'd1:    d_out = `ONE;
            4'd2:    d_out = `TWO;
            4'd3:    d_out = `THREE;
            4'd4:    d_out = `FOUR;
            4'd5:    d_out = `FIVE;
            4'd6:    d_out = `SIX;
            4'd7:    d_out =  `SEVEN;
            4'd8:    d_out = `EIGHT;
            4'd9:    d_out = `NINE;
            4'd10:   d_out = `TEN;
            4'd11:   d_out = `ELEVEN;
            4'd12:   d_out = `TWELEVE;
            4'd13:   d_out = `THIRTEEN;
            4'd14:   d_out = `FOURTEEN;
            4'd15:   d_out = `FIFTEEN;
            default: d_out = `ZERO;
        endcase
    end

endmodule