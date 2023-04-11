module detector(input clk, Clk_EN, rst, serIn, Co,
                output reg serOut, serOutValid, inc_cnt, rst_cnt);
            
    parameter idle = 4'b0, A = 4'b0001, B = 4'b0010, 
            C = 4'b0011, D = 4'b0100, E = 4'b0101,
            F = 4'b0110, G = 4'b0111;

    reg [3:0] pstate = idle;
    reg [3:0] nstate = idle;

    always @(serIn, Co , Clk_EN, pstate) begin
        case(pstate)
            idle : nstate <= A; 
            A : nstate <= Clk_EN && serIn ? B : A;
            B : nstate <= Clk_EN && serIn ? C : Clk_EN && ~serIn ? A : B;
            C : nstate <= Clk_EN && ~serIn ? D : C;
            D : nstate <= Clk_EN && ~serIn ? A : Clk_EN && serIn ? E : D;
            E : nstate <= Clk_EN && ~serIn ?  F : Clk_EN && serIn ? C : E;
            F : nstate <= Clk_EN && serIn ? G : Clk_EN && ~serIn ? A : F;
            G : nstate <= ~Co ? G : idle;
        endcase
        end

        always @(pstate) begin
        {serOutValid, inc_cnt, rst_cnt} = 3'b0;
        serOut = 1'bz;
        case(pstate)
        idle : rst_cnt <= 1'b1;
        // if tb then delete condition
        A : ;
        B : ;
        D : ;
        E : ;
        F : ;
        C : ; 
        G : begin  serOutValid = 1'b1; inc_cnt = 1'b1;  end
        endcase
        end

    always @(posedge clk, posedge rst) begin 
        if(rst)
            pstate <= idle;
        else
            pstate <= nstate;

        serOut = ((pstate == G) & Clk_EN )? serIn : 1'bz ;
    end

endmodule