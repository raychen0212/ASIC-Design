/////////////////////////////////////////////////////////////
// Created by: Synopsys DC Expert(TM) in wire load mode
// Version   : K-2015.06-SP1
// Date      : Mon Feb 22 23:40:38 2021
/////////////////////////////////////////////////////////////


module flex_pts_sr ( clk, n_rst, load_enable, shift_enable, parallel_in, 
        serial_out );
  input [3:0] parallel_in;
  input clk, n_rst, load_enable, shift_enable;
  output serial_out;
  wire   n16, n17, n18, n19, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15;
  wire   [2:0] state;

  DFFSR \state_reg[0]  ( .D(n19), .CLK(clk), .R(1'b1), .S(n_rst), .Q(state[0])
         );
  DFFSR \state_reg[1]  ( .D(n18), .CLK(clk), .R(1'b1), .S(n_rst), .Q(state[1])
         );
  DFFSR \state_reg[2]  ( .D(n17), .CLK(clk), .R(1'b1), .S(n_rst), .Q(state[2])
         );
  DFFSR \state_reg[3]  ( .D(n16), .CLK(clk), .R(1'b1), .S(n_rst), .Q(
        serial_out) );
  NAND2X1 U7 ( .A(n5), .B(n6), .Y(n19) );
  INVX1 U8 ( .A(n7), .Y(n6) );
  MUX2X1 U9 ( .B(parallel_in[0]), .A(state[0]), .S(n8), .Y(n5) );
  OAI21X1 U10 ( .A(n9), .B(n10), .C(n11), .Y(n18) );
  AOI22X1 U11 ( .A(n7), .B(state[0]), .C(state[1]), .D(n8), .Y(n11) );
  INVX1 U12 ( .A(parallel_in[1]), .Y(n10) );
  OAI21X1 U13 ( .A(n9), .B(n12), .C(n13), .Y(n17) );
  AOI22X1 U14 ( .A(state[1]), .B(n7), .C(state[2]), .D(n8), .Y(n13) );
  INVX1 U15 ( .A(parallel_in[2]), .Y(n12) );
  OAI21X1 U16 ( .A(n9), .B(n14), .C(n15), .Y(n16) );
  AOI22X1 U17 ( .A(state[2]), .B(n7), .C(serial_out), .D(n8), .Y(n15) );
  NOR2X1 U18 ( .A(n8), .B(load_enable), .Y(n7) );
  NOR2X1 U19 ( .A(shift_enable), .B(load_enable), .Y(n8) );
  INVX1 U20 ( .A(parallel_in[3]), .Y(n14) );
  INVX1 U21 ( .A(load_enable), .Y(n9) );
endmodule


module pts_sr_4_msb ( clk, n_rst, shift_enable, load_enable, parallel_in, 
        serial_out );
  input [3:0] parallel_in;
  input clk, n_rst, shift_enable, load_enable;
  output serial_out;


  flex_pts_sr CORE ( .clk(clk), .n_rst(n_rst), .load_enable(load_enable), 
        .shift_enable(shift_enable), .parallel_in(parallel_in), .serial_out(
        serial_out) );
endmodule

