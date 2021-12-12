`include "primitives.v"
`include "sky130_hd.v"

module test32bit(D_IN, CLK, EN, D_OUT);

  wire _gCLK0_ ;
  input CLK;
  input [31:0] D_IN;
  output [31:0] D_OUT;
  input EN;
  sky130_fd_sc_hd__dlclkp_1 _1_ (
   .GCLK(_gCLK0_),
   .CLK(CLK),
   .GATE(EN)
  );
    sky130_fd_sc_hd__dfxtp_1 _62_ (
   .CLK(_gCLK0_),
   .D(D_IN[19]),
   .Q(D_OUT[19])
  );
    sky130_fd_sc_hd__dfxtp_1 _63_ (
   .CLK(_gCLK0_),
   .D(D_IN[20]),
   .Q(D_OUT[20])
  );
    sky130_fd_sc_hd__dfxtp_1 _64_ (
   .CLK(_gCLK0_),
   .D(D_IN[21]),
   .Q(D_OUT[21])
  );
    sky130_fd_sc_hd__dfxtp_1 _65_ (
   .CLK(_gCLK0_),
   .D(D_IN[22]),
   .Q(D_OUT[22])
  );
    sky130_fd_sc_hd__dfxtp_1 _66_ (
   .CLK(_gCLK0_),
   .D(D_IN[23]),
   .Q(D_OUT[23])
  );
    sky130_fd_sc_hd__dfxtp_1 _67_ (
   .CLK(_gCLK0_),
   .D(D_IN[24]),
   .Q(D_OUT[24])
  );
    sky130_fd_sc_hd__dfxtp_1 _78_ (
   .CLK(_gCLK0_),
   .D(D_IN[25]),
   .Q(D_OUT[25])
  );
    sky130_fd_sc_hd__dfxtp_1 _79_ (
   .CLK(_gCLK0_),
   .D(D_IN[26]),
   .Q(D_OUT[26])
  );
    sky130_fd_sc_hd__dfxtp_1 _710_ (
   .CLK(_gCLK0_),
   .D(D_IN[27]),
   .Q(D_OUT[27])
  );
    sky130_fd_sc_hd__dfxtp_1 _711_ (
   .CLK(_gCLK0_),
   .D(D_IN[28]),
   .Q(D_OUT[28])
  );
    sky130_fd_sc_hd__dfxtp_1 _712_ (
   .CLK(_gCLK0_),
   .D(D_IN[29]),
   .Q(D_OUT[29])
  );
    sky130_fd_sc_hd__dfxtp_1 _713_ (
   .CLK(_gCLK0_),
   .D(D_IN[30]),
   .Q(D_OUT[30])
  );
    sky130_fd_sc_hd__dfxtp_1 _714_ (
   .CLK(_gCLK0_),
   .D(D_IN[31]),
   .Q(D_OUT[31])
  );
    sky130_fd_sc_hd__dfxtp_1 _715_ (
   .CLK(_gCLK0_),
   .D(D_IN[0]),
   .Q(D_OUT[0])
  );
    sky130_fd_sc_hd__dfxtp_1 _716_ (
   .CLK(_gCLK0_),
   .D(D_IN[1]),
   .Q(D_OUT[1])
  );
    sky130_fd_sc_hd__dfxtp_1 _717_ (
   .CLK(_gCLK0_),
   .D(D_IN[2]),
   .Q(D_OUT[2])
  );
    sky130_fd_sc_hd__dfxtp_1 _818_ (
   .CLK(_gCLK0_),
   .D(D_IN[3]),
   .Q(D_OUT[3])
  );
    sky130_fd_sc_hd__dfxtp_1 _819_ (
   .CLK(_gCLK0_),
   .D(D_IN[4]),
   .Q(D_OUT[4])
  );
    sky130_fd_sc_hd__dfxtp_1 _820_ (
   .CLK(_gCLK0_),
   .D(D_IN[5]),
   .Q(D_OUT[5])
  );
    sky130_fd_sc_hd__dfxtp_1 _821_ (
   .CLK(_gCLK0_),
   .D(D_IN[6]),
   .Q(D_OUT[6])
  );
    sky130_fd_sc_hd__dfxtp_1 _822_ (
   .CLK(_gCLK0_),
   .D(D_IN[7]),
   .Q(D_OUT[7])
  );
    sky130_fd_sc_hd__dfxtp_1 _823_ (
   .CLK(_gCLK0_),
   .D(D_IN[8]),
   .Q(D_OUT[8])
  );
    sky130_fd_sc_hd__dfxtp_1 _824_ (
   .CLK(_gCLK0_),
   .D(D_IN[9]),
   .Q(D_OUT[9])
  );
    sky130_fd_sc_hd__dfxtp_1 _825_ (
   .CLK(_gCLK0_),
   .D(D_IN[10]),
   .Q(D_OUT[10])
  );
    sky130_fd_sc_hd__dfxtp_1 _826_ (
   .CLK(_gCLK0_),
   .D(D_IN[11]),
   .Q(D_OUT[11])
  );
    sky130_fd_sc_hd__dfxtp_1 _827_ (
   .CLK(_gCLK0_),
   .D(D_IN[12]),
   .Q(D_OUT[12])
  );
    sky130_fd_sc_hd__dfxtp_1 _928_ (
   .CLK(_gCLK0_),
   .D(D_IN[13]),
   .Q(D_OUT[13])
  );
    sky130_fd_sc_hd__dfxtp_1 _929_ (
   .CLK(_gCLK0_),
   .D(D_IN[14]),
   .Q(D_OUT[14])
  );
    sky130_fd_sc_hd__dfxtp_1 _930_ (
   .CLK(_gCLK0_),
   .D(D_IN[15]),
   .Q(D_OUT[15])
  );
    sky130_fd_sc_hd__dfxtp_1 _931_ (
   .CLK(_gCLK0_),
   .D(D_IN[16]),
   .Q(D_OUT[16])
  );
    sky130_fd_sc_hd__dfxtp_1 _932_ (
   .CLK(_gCLK0_),
   .D(D_IN[17]),
   .Q(D_OUT[17])
  );
    sky130_fd_sc_hd__dfxtp_1 _933_ (
   .CLK(_gCLK0_),
   .D(D_IN[18]),
   .Q(D_OUT[18])
  );
endmodule
