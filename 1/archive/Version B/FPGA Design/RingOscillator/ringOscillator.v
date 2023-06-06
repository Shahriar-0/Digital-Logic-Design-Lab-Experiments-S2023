`timescale 1ns/100ps

module ringOscillator #(parameter InverterCount = 5, Delay = 1.9) (output w);
    reg [0:InverterCount-1] inverters = 0;
    integer i;

    assign w = inverters[0];


    initial begin
        while (1)
            for (i = 1; i <= InverterCount; i = i + 1) begin
                #Delay inverters[i % InverterCount] = ~inverters[i - 1];
            end
    end
endmodule