module tb();
    reg clk, clkPB, serIn, rst;
    wire serOut, serOutValid;
    wire [6:0] lowSegment, highSegment;
    
    serial_transmitter serialTransmitter(
        .clk(clk), .rst(rst), .clkPB(clkPB), 
        .serIn(serIn), .serOut(serOut), .serOutValid(serOutValid),
        .lowSegment(lowSegment), .highSegment(highSegment)
    );                        

    always #5 clk = ~clk;
    always #50 clkPB = ~clkPB;
    
    initial begin
        clk = 0;
        rst = 1;
        clkPB = 0;
        #50 rst = 0; 
        serIn = 1;
        #100 serIn = 1;
        #100 serIn = 0;
        #100 serIn = 1;
        #100 serIn = 0;
        #100 serIn = 1;
        #500 serIn = 0;
        #200 serIn = 1;
        #2000 $stop;
    end
    
endmodule