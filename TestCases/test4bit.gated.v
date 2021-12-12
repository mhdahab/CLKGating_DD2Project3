`include "primitives.v"
`include "sky130_hd.v"

module test4bit(D_IN, CLK, EN, D_OUT);

  wire _gCLK0_ ;
  input CLK;
  input [3:0] D_IN;
  output [3:0] D_OUT;
  input EN;
  sky130_fd_sc_hd__dlclkp_1 _1_ (
   .GCLK(_gCLK0_),
   .CLK(CLK),
   .GATE(EN)
  );
    sky130_fd_sc_hd__dfxtp_1 _02_ (
   .CLK(_gCLK0_),
   .D(D_IN[0]),
   .Q(D_OUT[0])
  );
    sky130_fd_sc_hd__dfxtp_1 _03_ (
   .CLK(_gCLK0_),
   .D(D_IN[1]),
   .Q(D_OUT[1])
  );
    sky130_fd_sc_hd__dfxtp_1 _14_ (
   .CLK(_gCLK0_),
   .D(D_IN[2]),
   .Q(D_OUT[2])
  );
    sky130_fd_sc_hd__dfxtp_1 _15_ (
   .CLK(_gCLK0_),
   .D(D_IN[3]),
   .Q(D_OUT[3])
  );
endmodule
