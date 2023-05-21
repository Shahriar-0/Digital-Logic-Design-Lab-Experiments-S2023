module mux7_1(a, b, c, d, e, f, g, slc, w);
    input [7:0] a, b, c, d, e, f, g;
    input [2:0] slc;
    output [7:0] w;
    
    assign w =  (slc == 3'b000)  ? a :
                (slc == 3'b001)  ? b :
                (slc == 3'b010)  ? c :
                (slc == 3'b011)  ? d :
                (slc == 3'b100)  ? e :
                (slc == 3'b101)  ? f :
                (slc == 3'b110)  ? g : 8'bz;

endmodule