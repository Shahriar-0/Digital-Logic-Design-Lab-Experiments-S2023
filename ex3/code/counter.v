module Counter #(parameter N = 8)
                (loadData, load, en, clr, clk, rst);

    input [N-1:0] loadData,
    input load, en, clr, clk, rst,
    output reg [N-1:0] out,
    output co;

    always @(posedge clk or posedge rst) begin
        if (rst) out <= {N{1'b0}};
        else if (clr) out <= {N{1'b0}};
        else if (load) out <= loadData;
        else if (en) out <= out + 1'b1;
    end

    assign co = &{out, en};
    
endmodule
