/////////////////////////////////////////////////////////////
// Created by: Synopsys DC Expert(TM) in wire load mode
// Version   : K-2015.06-SP1
// Date      : Sun Feb 14 15:25:39 2021
/////////////////////////////////////////////////////////////


module flex_counter ( clk, n_rst, clear, count_enable, rollover_val, count_out, 
        rollover_flag );
  input [3:0] rollover_val;
  output [3:0] count_out;
  input clk, n_rst, clear, count_enable;
  output rollover_flag;
  wire   n14, n15, n16, n17, n18, n19, n20, n21, n22, n23, n24, n25, n26, n27,
         n28, n29, n30, n31, n32, n33, n34, n35, n36, n37, n38, n39, n40, n41,
         n42, n43, n44, n45, n46, n47, n48, n49, n50, n51, n52, n53, n54, n55,
         n56, n57, n58;

  DFFSR \count_out_reg[0]  ( .D(n58), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        count_out[0]) );
  DFFSR \count_out_reg[1]  ( .D(n57), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        count_out[1]) );
  DFFSR \count_out_reg[2]  ( .D(n56), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        count_out[2]) );
  DFFSR \count_out_reg[3]  ( .D(n55), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        count_out[3]) );
  DFFSR rollover_flag_reg ( .D(n54), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        rollover_flag) );
  AND2X2 U8 ( .A(n30), .B(n31), .Y(n28) );
  INVX2 U9 ( .A(n30), .Y(n14) );
  INVX2 U10 ( .A(n42), .Y(n15) );
  INVX2 U11 ( .A(count_out[3]), .Y(n16) );
  INVX2 U12 ( .A(count_out[2]), .Y(n17) );
  INVX2 U13 ( .A(n44), .Y(n18) );
  INVX2 U14 ( .A(count_out[1]), .Y(n19) );
  INVX2 U15 ( .A(n39), .Y(n20) );
  INVX2 U16 ( .A(count_out[0]), .Y(n21) );
  INVX2 U17 ( .A(n29), .Y(n22) );
  INVX2 U18 ( .A(count_enable), .Y(n23) );
  INVX2 U19 ( .A(rollover_val[2]), .Y(n24) );
  OAI21X1 U20 ( .A(n25), .B(n26), .C(n27), .Y(n54) );
  OAI21X1 U21 ( .A(n28), .B(n29), .C(rollover_flag), .Y(n27) );
  NAND2X1 U22 ( .A(n32), .B(n33), .Y(n26) );
  XOR2X1 U23 ( .A(n34), .B(n35), .Y(n33) );
  XOR2X1 U24 ( .A(rollover_val[3]), .B(count_out[3]), .Y(n35) );
  NAND2X1 U25 ( .A(n36), .B(n24), .Y(n34) );
  XOR2X1 U26 ( .A(n37), .B(n36), .Y(n32) );
  XOR2X1 U27 ( .A(n24), .B(count_out[2]), .Y(n37) );
  NAND3X1 U28 ( .A(n38), .B(n39), .C(n31), .Y(n25) );
  XOR2X1 U29 ( .A(count_out[1]), .B(n40), .Y(n38) );
  AOI21X1 U30 ( .A(rollover_val[0]), .B(rollover_val[1]), .C(n36), .Y(n40) );
  NOR2X1 U31 ( .A(rollover_val[1]), .B(rollover_val[0]), .Y(n36) );
  OAI22X1 U32 ( .A(n16), .B(n22), .C(n41), .D(n42), .Y(n55) );
  XOR2X1 U33 ( .A(n16), .B(n43), .Y(n41) );
  NOR2X1 U34 ( .A(n17), .B(n44), .Y(n43) );
  OAI21X1 U35 ( .A(n45), .B(n17), .C(n46), .Y(n56) );
  NAND3X1 U36 ( .A(n18), .B(n17), .C(n15), .Y(n46) );
  AOI21X1 U37 ( .A(n15), .B(n44), .C(n29), .Y(n45) );
  NAND2X1 U38 ( .A(count_out[1]), .B(count_out[0]), .Y(n44) );
  OAI21X1 U39 ( .A(n47), .B(n19), .C(n48), .Y(n57) );
  NAND3X1 U40 ( .A(count_out[0]), .B(n19), .C(n15), .Y(n48) );
  AOI21X1 U41 ( .A(n15), .B(n21), .C(n29), .Y(n47) );
  NAND2X1 U42 ( .A(n31), .B(n30), .Y(n42) );
  OAI21X1 U43 ( .A(n21), .B(n22), .C(n49), .Y(n58) );
  OAI21X1 U44 ( .A(n14), .B(n21), .C(n31), .Y(n49) );
  NOR2X1 U45 ( .A(n23), .B(clear), .Y(n31) );
  NAND3X1 U46 ( .A(n50), .B(n20), .C(n51), .Y(n30) );
  NOR2X1 U47 ( .A(n52), .B(n53), .Y(n51) );
  XOR2X1 U48 ( .A(rollover_val[1]), .B(count_out[1]), .Y(n53) );
  XOR2X1 U49 ( .A(rollover_val[2]), .B(count_out[2]), .Y(n52) );
  XOR2X1 U50 ( .A(rollover_val[0]), .B(count_out[0]), .Y(n39) );
  XOR2X1 U51 ( .A(rollover_val[3]), .B(n16), .Y(n50) );
  NOR2X1 U52 ( .A(count_enable), .B(clear), .Y(n29) );
endmodule

