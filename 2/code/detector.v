module detector(clk, Clk_EN, rst, serIn, Co,
                serOut, serOutValid, inc_cnt, rst_cnt);
    
    input clk, Clk_EN, rst, serIn, Co;
    output reg serOut, serOutValid, inc_cnt, rst_cnt;

    parameter A = 3'b000, B = 3'b001, 
            C = 3'b010, D = 3'b011, E = 3'b100,
            F = 3'b101, G = 3'b110, H = 3'b111;

    reg [2:0] pstate = A;
    reg [2:0] nstate = A;

    always @(serIn or Co or Clk_EN) begin
        
        case (pstate)
            A : nstate <= serIn  ? B : A;
            B : nstate <= serIn  ? C : A;
            C : nstate <= ~serIn ? D : C;
            D : nstate <= ~serIn ? A : E;
            E : nstate <= ~serIn ? F : C;
            F : nstate <= serIn  ? G : A;
            G : nstate <= H;
            H : nstate <= Co     ? A : H;
        endcase
    end

    always @(pstate) begin
        {serOutValid, inc_cnt, rst_cnt} <= 3'b000;
        case (pstate)
            G : {serOutValid, rst_cnt} = 2'b11; 
            H : {serOutValid, inc_cnt} = 2'b1;
        endcase
    end

    always @(posedge clk, posedge rst) begin 
        if (rst)
            pstate <= A;
        else if (Clk_EN)
            pstate <= nstate;
    end

    assign serOut = (pstate == H)? serIn : 1'bz;

endmodule






