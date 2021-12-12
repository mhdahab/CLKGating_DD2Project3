module test1(input x, y, input s, input clk, output r);
	reg r;
	always @(posedge clk)
		if(s) r <= x+y;
endmodule
