module EngDatapath(input clk,rst,zx,initx,ldx,zt,initt,
				   ldt,zr,initr,ldr,zc,ldc,enc,s,input [15:0] x,
				   output co,output [17:0]result);

	wire [15:0] xptwo;
	wire [2:0] c_in = 0;
	wire [15:0] data,m_out,temp_in,ymux;
	wire [15:0] xptwor,temp_out,xr;
	wire [17:0] res_in;
	wire [3:0] adr;

	Register regx(clk,rst,zx,initx,ldx,x,xr);

	EngCounter counter(clk,rst,zc,ldc,enc,c_in,adr,co);

	LUT lut(adr,data);
	
	Mux2to1 mux(xr,data,s,m_out);

	Multiplier mult(m_out,temp_out,temp_in);

	Register rtemp(clk,rst,zt,initt,ldt,temp_in,temp_out);
	
	Adder add(result,{2'b00,temp_out},res_in);
	
	Register18bit rres(clk,rst,zr,initr,ldr,res_in,result);

endmodule

