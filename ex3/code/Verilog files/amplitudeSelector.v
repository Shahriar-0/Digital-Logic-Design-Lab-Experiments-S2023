module AmplitudeSelector(slc, in, out);

    input [1:0] slc;
    input [7:0] in;
    output [7:0] out;

    assign out = in >> slc;

endmodule
