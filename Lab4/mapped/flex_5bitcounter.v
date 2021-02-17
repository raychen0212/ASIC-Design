/////////////////////////////////////////////////////////////
// Created by: Synopsys DC Expert(TM) in wire load mode
// Version   : K-2015.06-SP1
// Date      : Sun Feb 14 14:36:15 2021
/////////////////////////////////////////////////////////////


module flex_counter_NUM_CNT_BITS5 ( clk, n_rst, clear, count_enable, 
        rollover_val, count_out, rollover_flag );
  input [4:0] rollover_val;
  output [4:0] count_out;
  input clk, n_rst, clear, count_enable;
  output rollover_flag;
  wire   N8, N9, N10, N11, N12, N18, N19, N20, N21, n23, n24, n25, n26, n27,
         n28, n29, n30, n31, n32, n33, n34, n35, n36, n37, n38, n39, n40, n41,
         n42, n43, n44, n45, n46, n47, n48, n49, n50, n51, n52, n53,
         \r305/carry[4] , \r305/carry[3] , \r305/carry[2] , n1, n2, n3, n4, n5,
         n6, n7, n8, n15, n16, n17, n18, n19;

  DFFSR \count_out_reg[0]  ( .D(n53), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        count_out[0]) );
  DFFSR \count_out_reg[1]  ( .D(n52), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        count_out[1]) );
  DFFSR \count_out_reg[2]  ( .D(n51), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        count_out[2]) );
  DFFSR \count_out_reg[3]  ( .D(n50), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        count_out[3]) );
  DFFSR \count_out_reg[4]  ( .D(n49), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        count_out[4]) );
  DFFSR rollover_flag_reg ( .D(n48), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        rollover_flag) );
  AND2X2 U9 ( .A(n31), .B(n32), .Y(n26) );
  OAI21X1 U18 ( .A(n23), .B(n24), .C(n25), .Y(n48) );
  OAI21X1 U19 ( .A(n26), .B(n27), .C(rollover_flag), .Y(n25) );
  NAND3X1 U20 ( .A(n28), .B(n29), .C(n30), .Y(n24) );
  XNOR2X1 U21 ( .A(count_out[1]), .B(N9), .Y(n30) );
  XNOR2X1 U22 ( .A(count_out[2]), .B(N10), .Y(n29) );
  XNOR2X1 U23 ( .A(count_out[0]), .B(N8), .Y(n28) );
  NAND3X1 U24 ( .A(n31), .B(n32), .C(n33), .Y(n23) );
  NOR2X1 U25 ( .A(n34), .B(n35), .Y(n33) );
  XNOR2X1 U26 ( .A(n17), .B(N12), .Y(n35) );
  XNOR2X1 U27 ( .A(n16), .B(N11), .Y(n34) );
  OAI21X1 U28 ( .A(n17), .B(n18), .C(n36), .Y(n49) );
  NAND2X1 U29 ( .A(N21), .B(n26), .Y(n36) );
  OAI21X1 U30 ( .A(n16), .B(n18), .C(n37), .Y(n50) );
  NAND2X1 U31 ( .A(N20), .B(n26), .Y(n37) );
  OAI21X1 U32 ( .A(n15), .B(n18), .C(n38), .Y(n51) );
  NAND2X1 U33 ( .A(N19), .B(n26), .Y(n38) );
  OAI21X1 U34 ( .A(n8), .B(n18), .C(n39), .Y(n52) );
  NAND2X1 U35 ( .A(N18), .B(n26), .Y(n39) );
  OAI21X1 U36 ( .A(n7), .B(n18), .C(n40), .Y(n53) );
  OAI21X1 U37 ( .A(n7), .B(n6), .C(n31), .Y(n40) );
  NOR2X1 U38 ( .A(n19), .B(clear), .Y(n31) );
  NAND3X1 U39 ( .A(n41), .B(n42), .C(n43), .Y(n32) );
  NOR2X1 U40 ( .A(n44), .B(n45), .Y(n43) );
  XNOR2X1 U41 ( .A(rollover_val[1]), .B(n8), .Y(n45) );
  XNOR2X1 U42 ( .A(rollover_val[0]), .B(n7), .Y(n44) );
  XNOR2X1 U43 ( .A(count_out[2]), .B(rollover_val[2]), .Y(n42) );
  NOR2X1 U44 ( .A(n46), .B(n47), .Y(n41) );
  XNOR2X1 U45 ( .A(rollover_val[4]), .B(n17), .Y(n47) );
  XNOR2X1 U46 ( .A(rollover_val[3]), .B(n16), .Y(n46) );
  NOR2X1 U47 ( .A(count_enable), .B(clear), .Y(n27) );
  HAX1 \r305/U1_1_1  ( .A(count_out[1]), .B(count_out[0]), .YC(\r305/carry[2] ), .YS(N18) );
  HAX1 \r305/U1_1_2  ( .A(count_out[2]), .B(\r305/carry[2] ), .YC(
        \r305/carry[3] ), .YS(N19) );
  HAX1 \r305/U1_1_3  ( .A(count_out[3]), .B(\r305/carry[3] ), .YC(
        \r305/carry[4] ), .YS(N20) );
  NOR2X1 U10 ( .A(rollover_val[1]), .B(rollover_val[0]), .Y(n2) );
  AOI21X1 U11 ( .A(rollover_val[0]), .B(rollover_val[1]), .C(n2), .Y(n1) );
  NAND2X1 U12 ( .A(n2), .B(n5), .Y(n3) );
  OAI21X1 U13 ( .A(n2), .B(n5), .C(n3), .Y(N10) );
  XNOR2X1 U14 ( .A(rollover_val[3]), .B(n3), .Y(N11) );
  NOR2X1 U15 ( .A(rollover_val[3]), .B(n3), .Y(n4) );
  XOR2X1 U16 ( .A(rollover_val[4]), .B(n4), .Y(N12) );
  INVX2 U17 ( .A(rollover_val[0]), .Y(N8) );
  INVX2 U48 ( .A(n1), .Y(N9) );
  INVX2 U49 ( .A(rollover_val[2]), .Y(n5) );
  XOR2X1 U50 ( .A(\r305/carry[4] ), .B(count_out[4]), .Y(N21) );
  INVX2 U51 ( .A(n32), .Y(n6) );
  INVX2 U52 ( .A(count_out[0]), .Y(n7) );
  INVX2 U53 ( .A(count_out[1]), .Y(n8) );
  INVX2 U54 ( .A(count_out[2]), .Y(n15) );
  INVX2 U55 ( .A(count_out[3]), .Y(n16) );
  INVX2 U56 ( .A(count_out[4]), .Y(n17) );
  INVX2 U57 ( .A(n27), .Y(n18) );
  INVX2 U58 ( .A(count_enable), .Y(n19) );
endmodule


module flex_5bitcounter ( clk, n_rst, clear, count_enable, rollover_val, 
        count_out, rollover_flag );
  input [4:0] rollover_val;
  output [4:0] count_out;
  input clk, n_rst, clear, count_enable;
  output rollover_flag;


  flex_counter_NUM_CNT_BITS5 flex_5 ( .clk(clk), .n_rst(n_rst), .clear(clear), 
        .count_enable(count_enable), .rollover_val(rollover_val), .count_out(
        count_out), .rollover_flag(rollover_flag) );
endmodule

