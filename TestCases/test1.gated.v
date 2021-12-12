`include "primitives.v"
`include "sky130_hd.v"

module test1(x, y, s, clk, r);

  wire _gCLK0_ ;
  wire _2_ ;
  wire _1_ ;
  input clk;
  output r;
  input s;
  input x;
  input y;
  sky130_fd_sc_hd__xnor2_1 _3_ (
    .A(y),
    .B(x),
    .Y(_1_)
  );
  sky130_fd_sc_hd__inv_1_ (
   .A(_1_),
   .Y(_2_)
  );
  sky130_fd_sc_hd__dlclkp_1 _2_ (
   .GCLK(_gCLK0_),
   .CLK(CLK),
   .GATE(s)
  );
    sky130_fd_sc_hd__dfxtp_1 _3_ (
   .CLK(_gCLK0_),
   .D(_2_),
   .Q(r)
  );
endmodule