`include "primitives.v"
`include "sky130_hd.v"

module test1(x, y, s, clk, r);

  wire _gCLK0_ ;
  wire _inv4_ ;
  wire _inv3_ ;
  wire _inv2_ ;
  wire _inv1_ ;
  wire _04_;
  wire _05_;
  wire _07_;
  wire _08_;
  wire _09_;
  wire _11_;
  wire _12_;
  wire _13_;
  wire _16_;
  wire _17_;
  wire _18_;
  input clk;
  output [3:0] r;
  input s;
  input [3:0] x;
  input [3:0] y;
  sky130_fd_sc_hd__nand2_1 _11_ (
    .A(y[0]),
    .B(x[0]),
    .Y(_04_)
  );
  sky130_fd_sc_hd__xnor2_1 _22_ (
    .A(y[0]),
    .B(x[0]),
    .Y(_05_)
  );
  sky130_fd_sc_hd__inv_3_ (
   .A(_05_),
   .Y(_inv4_)
  );
  sky130_fd_sc_hd__dlclkp_1 _4_ (
   .GCLK(_gCLK0_),
   .CLK(CLK),
   .GATE(s)
  );
  sky130_fd_sc_hd__nand2_1 _25_ (
    .A(y[1]),
    .B(x[1]),
    .Y(_07_)
  );
  sky130_fd_sc_hd__xnor2_1 _26_ (
    .A(y[1]),
    .B(x[1]),
    .Y(_08_)
  );
  sky130_fd_sc_hd__xnor2_1 _27_ (
    .A(_04_),
    .B(_08_),
    .Y(_09_)
  );
  sky130_fd_sc_hd__inv_8_ (
   .A(_09_),
   .Y(_inv3_)
  );
  sky130_fd_sc_hd__o21ai_0 _29_ (
    .A1(_04_),
    .A2(_08_),
    .B1(_07_),
    .Y(_11_)
  );
  sky130_fd_sc_hd__xor2_1 _210_ (
    .A(y[2]),
    .B(x[2]),
    .X(_12_)
  );
  sky130_fd_sc_hd__xnor2_1 _311_ (
    .A(_11_),
    .B(_12_),
    .Y(_13_)
  );
  sky130_fd_sc_hd__inv_12_ (
   .A(_13_),
   .Y(_inv2_)
  );
  sky130_fd_sc_hd__maj3_1 _313_ (
    .A(y[2]),
    .B(x[2]),
    .C(_11_),
    .X(_16_)
  );
  sky130_fd_sc_hd__xor2_1 _314_ (
    .A(y[3]),
    .B(x[3]),
    .X(_17_)
  );
  sky130_fd_sc_hd__xnor2_1 _315_ (
    .A(_16_),
    .B(_17_),
    .Y(_18_)
  );
  sky130_fd_sc_hd__inv_16_ (
   .A(_18_),
   .Y(_inv1_)
  );
  sky130_fd_sc_hd__dfxtp_1 _317_ (
   .CLK(_gCLK0_),
   .D(_inv4_),
   .Q(r[0])
  );
  sky130_fd_sc_hd__dfxtp_1 _318_ (
   .CLK(_gCLK0_),
   .D(_inv3_),
   .Q(r[1])
  );
  sky130_fd_sc_hd__dfxtp_1 _419_ (
   .CLK(_gCLK0_),
   .D(_inv2_),
   .Q(r[2])
  );
  sky130_fd_sc_hd__dfxtp_1 _420_ (
   .CLK(_gCLK0_),
   .D(_inv1_),
   .Q(r[3])
  );
endmodule
