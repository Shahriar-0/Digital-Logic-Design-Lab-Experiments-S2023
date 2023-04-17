module detector(clk, Clk_EN, rst, serIn, Co,
                serOut, serOutValid, inc_cnt, rst_cnt);
    
    input clk, Clk_EN, rst, serIn, Co;
    output reg serOut, serOutValid, inc_cnt, rst_cnt;

    parameter idle = 4'b0000, A = 4'b0001, B = 4'b0010, 
            C = 4'b0011, D = 4'b0100, E = 4'b0101,
            F = 4'b0110, G = 4'b0111, H = 4'b1000;

    reg [3:0] pstate = idle;
    reg [3:0] nstate = idle;

    always @(serIn, Co , Clk_EN) begin
        
        case(pstate)
            idle : nstate <= A; 
            A : nstate <= serIn ? B : A;
            B : nstate <= serIn ? C : A;
            C : nstate <= ~serIn ? D : C;
            D : nstate <= ~serIn ? A : E;
            E : nstate <= ~serIn ?  F : C;
            F : nstate <= serIn ? G : A;
            G : nstate <= H;
            H : nstate <= Co ? A : H;
        endcase
    end

        always @(pstate) begin
            {serOutValid, inc_cnt, rst_cnt} <= 3'b0;
            serOut <= 1'bz;
            case(pstate)
                idle : rst_cnt <= 1'b1;
                G : begin  serOutValid <= 1'b1; inc_cnt = 1'b1; end
            endcase
        end

    always @(posedge clk, posedge rst) begin 
        if(rst)
            pstate <= idle;
        else if (Clk_EN)
            pstate <= nstate;

    end

    assign serOut = ((pstate == G) & Clk_EN )? serIn : 1'bz ;
endmodule