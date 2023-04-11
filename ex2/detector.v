module detector(input clk, Clk_EN, rst, serIn, Co
                output serOut, serOutValid, inc_cnt, rst_cnt);
            parameter idle = 4'b0,A=4'b0001, B = 4'b0010 , C = 4'b0011, D = 4'b0100, E = 4'b0101, F = 4'b0110 , G = 4'b0111;

            reg [3:0] pstate,nstate;
            always @( serIn, co , Clk_EN) begin
                {serOutValid,inc_cnt,rst_cnt,serOut} <= 4'b0;
                case(pstate)
                idle : nstate <= Clk_EN ?  A : idle;
                // if tb then delete condition
                A : nstate <= Clk_EN & serIn ? B : A;
                B : nstate <= Clk_EN & serIn ? C : Clk_EN & ~serIn ? A : B;
                C : nstate <= Clk_EN & ~serIn ? D : C;
                D : nstate <= Clk_EN & ~serIn ? A : Clk_EN & serIn ? E : D;
                E : nstate <= Clk_EN & ~serIn ?  F : Clk_EN & serIn ? C : E;
                F : nstate <= Clk_EN & serIn ? G : Clk_EN & ~serIn ? A : F;
                G : nstate <= ~Co ? G : Co ? A;
                endcase
              end

              always @(pstate) begin
                case(pstate)
                idle : nstate <= Clk_EN ?  A : idle;
                // if tb then delete condition
                A : rst_cnt <= 1'b1;
                B : ;
                D : ;
                E : ;
                F : ;
                C : ; 
                G : begin  serOutValid <= 1'b1; inc_cnt = 1'b1; end
                endcase
              end

endmodule