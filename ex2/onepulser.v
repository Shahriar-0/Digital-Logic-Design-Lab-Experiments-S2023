module onepulser(input clk, rst, clkPB, output Clk_EN);
    reg can_assign = 1'b0;

    always @(posedge clkPB) begin
        can_assign = 1'b1;    
    end

    always @(posedge clk) begin
        if (clkPB && can_assign) begin
            Clk_EN <= 1'b1;
            can_assign <= 1'b0;
        end

    end

    always @(negedge clk) begin
        if (Clk_EN)
            Clk_EN <= 1'b0;
    end