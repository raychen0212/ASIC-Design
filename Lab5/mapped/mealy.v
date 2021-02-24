/////////////////////////////////////////////////////////////
// Created by: Synopsys DC Expert(TM) in wire load mode
// Version   : K-2015.06-SP1
// Date      : Tue Feb 23 20:57:55 2021
/////////////////////////////////////////////////////////////


module mealy ( clk, n_rst, i, o );
  input clk, n_rst, i;
  output o;
  wire   N11, N12, N13, n11, n12, n13;
  wire   [2:0] state;
  assign o = N13;

  DFFSR \state_reg[0]  ( .D(N11), .CLK(clk), .R(n_rst), .S(1'b1), .Q(state[0])
         );
  DFFSR \state_reg[1]  ( .D(N12), .CLK(clk), .R(n_rst), .S(1'b1), .Q(state[1])
         );
  INVX1 U16 ( .A(n11), .Y(N13) );
  MUX2X1 U17 ( .B(n12), .A(state[0]), .S(state[1]), .Y(N12) );
  NAND2X1 U18 ( .A(state[0]), .B(i), .Y(n12) );
  OAI21X1 U19 ( .A(state[0]), .B(n13), .C(n11), .Y(N11) );
  NAND3X1 U20 ( .A(state[0]), .B(i), .C(state[1]), .Y(n11) );
  XNOR2X1 U21 ( .A(i), .B(state[1]), .Y(n13) );
endmodule

