module Exponential(input clk,rst,start, input [15:0] x, 
		   output done, output[1:0] intpart, output [15:0] fracpart);
	
	wire co,zx,initx,ldx,zt,initt,ldt,zr,initr,ldr,zc,ldc,enc,s;
	
	EngController control(clk,rst,start,co,done,zx,initx,ldx, 
			  zt,initt,ldt,zr,initr,ldr, zc,ldc,enc, s);

	EngDatapath dP(clk,rst,zx,initx,ldx,zt,initt,ldt,
		    zr,initr,ldr,zc,ldc,enc,s,x,co,{intpart,fracpart});

endmodule

