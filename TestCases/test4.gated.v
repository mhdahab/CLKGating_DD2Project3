`include "primitives.v"
`include "sky130_hd.v"

module test4(x, s, clk, r);

  wire _gCLK0_ ;
  wire _inv1_ ;
  input clk;
  output r;
  input s;
  input x;
  sky130_fd_sc_hd__inv_1_ (
   .A(x),
   .Y(_inv1_)
  );
  sky130_fd_sc_hd__dlclkp_1 _2_ (
   .GCLK(_gCLK0_),
   .CLK(CLK),
   .GATE(s)
  );
  sky130_fd_sc_hd__dfxtp_1 _3_ (
   .CLK(_gCLK0_),
   .D(_inv1_),
   .Q(r)
  );
endmodule
