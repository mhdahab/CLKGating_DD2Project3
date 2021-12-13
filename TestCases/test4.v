module test4(input x,input s, input clk, output r);
	reg r;
	always @(posedge clk)
		if(s) r <= ~ x ;
endmodule
