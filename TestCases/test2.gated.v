`include "primitives.v"
`include "sky130_hd.v"

module test2(d1, d2, clk, ld1, ld2, q1, q2);

  wire _gCLK0_ ;
  wire _gCLK1_ ;
  input clk;
  input d1;
  input d2;
  input ld1;
  input ld2;
  output q1;
  output q2;
  sky130_fd_sc_hd__dlclkp_1 _1_ (
   .GCLK(_gCLK1_),
   .CLK(CLK),
   .GATE(ld1)
  );
  sky130_fd_sc_hd__dlclkp_1 _2_ (
   .GCLK(_gCLK0_),
   .CLK(CLK),
   .GATE(ld2)
  );
    sky130_fd_sc_hd__dfxtp_1 _3_ (
   .CLK(_gCLK0_),
   .D(d2),
   .Q(q2)
  );
    sky130_fd_sc_hd__dfxtp_1 _4_ (
   .CLK(_gCLK1_),
   .D(d1),
   .Q(q1)
  );
endmodule
