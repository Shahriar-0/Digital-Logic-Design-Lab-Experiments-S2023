module shiftComb(input [17:0] in, input [1:0] shiftNumb, output [20:0] wrData);
    assign wrData = {in, {shiftNumb{1'b0}}};
endmodule