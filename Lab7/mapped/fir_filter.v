/////////////////////////////////////////////////////////////
// Created by: Synopsys DC Expert(TM) in wire load mode
// Version   : K-2015.06-SP1
// Date      : Mon Mar  8 21:42:38 2021
/////////////////////////////////////////////////////////////


module sync_low_1 ( clk, n_rst, async_in, sync_out );
  input clk, n_rst, async_in;
  output sync_out;
  wire   data;

  DFFSR data_reg ( .D(async_in), .CLK(clk), .R(n_rst), .S(1'b1), .Q(data) );
  DFFSR sync_out_reg ( .D(data), .CLK(clk), .R(n_rst), .S(1'b1), .Q(sync_out)
         );
endmodule


module sync_low_0 ( clk, n_rst, async_in, sync_out );
  input clk, n_rst, async_in;
  output sync_out;
  wire   data;

  DFFSR data_reg ( .D(async_in), .CLK(clk), .R(n_rst), .S(1'b1), .Q(data) );
  DFFSR sync_out_reg ( .D(data), .CLK(clk), .R(n_rst), .S(1'b1), .Q(sync_out)
         );
endmodule


module controller ( clk, n_rst, dr, lc, overflow, cnt_up, clear, modwait, err, 
        op, src1, src2, dest );
  output [2:0] op;
  output [3:0] src1;
  output [3:0] src2;
  output [3:0] dest;
  input clk, n_rst, dr, lc, overflow;
  output cnt_up, clear, modwait, err;
  wire   n167, nxt_mod, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16, n17,
         n18, n19, n20, n21, n22, n23, n24, n25, n26, n27, n28, n29, n30, n31,
         n32, n33, n34, n35, n37, n38, n39, n40, n42, n43, n45, n46, n47, n48,
         n49, n50, n51, n52, n53, n54, n55, n56, n57, n58, n59, n60, n61, n62,
         n63, n64, n65, n66, n67, n68, n69, n70, n71, n72, n73, n74, n75, n76,
         n77, n78, n79, n80, n81, n82, n83, n84, n85, n86, n87, n88, n89, n90,
         n91, n92, n93, n94, n95, n96, n97, n98, n99, n100, n101, n102, n103,
         n104, n105, n106, n107, n108, n109, n110, n111, n112, n113, n114,
         n115, n116, n117, n118, n119, n120, n121, n122, n123, n124, n125,
         n126, n127, n128, n129, n130, n131, n132, n133, n134, n135, n136,
         n137, n138, n139, n140, n141, n142, n143, n144, n145, n146, n147,
         n148, n149, n150, n151, n152, n153, n154, n155, n156, n157, n158,
         n159, n160, n161, n162, n163;
  wire   [4:0] state;
  wire   [4:0] nxt_state;

  DFFSR \state_reg[0]  ( .D(nxt_state[0]), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        state[0]) );
  DFFSR \state_reg[4]  ( .D(nxt_state[4]), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        state[4]) );
  DFFSR \state_reg[1]  ( .D(nxt_state[1]), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        state[1]) );
  DFFSR \state_reg[2]  ( .D(nxt_state[2]), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        state[2]) );
  DFFSR \state_reg[3]  ( .D(nxt_state[3]), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        state[3]) );
  DFFSR modwait_reg ( .D(nxt_mod), .CLK(clk), .R(n_rst), .S(1'b1), .Q(modwait)
         );
  BUFX2 U9 ( .A(state[1]), .Y(n26) );
  INVX2 U10 ( .A(n26), .Y(n133) );
  BUFX2 U11 ( .A(n133), .Y(n25) );
  INVX2 U12 ( .A(n53), .Y(n54) );
  OR2X2 U13 ( .A(n135), .B(n134), .Y(n139) );
  AND2X2 U14 ( .A(n138), .B(n94), .Y(n147) );
  INVX1 U15 ( .A(n112), .Y(n144) );
  INVX1 U16 ( .A(n107), .Y(n10) );
  INVX1 U17 ( .A(n148), .Y(n90) );
  INVX2 U18 ( .A(state[3]), .Y(n50) );
  INVX1 U19 ( .A(state[4]), .Y(n58) );
  BUFX2 U20 ( .A(state[3]), .Y(n48) );
  AND2X2 U21 ( .A(n127), .B(n126), .Y(n7) );
  AND2X2 U22 ( .A(n30), .B(n21), .Y(n42) );
  INVX2 U23 ( .A(n167), .Y(n12) );
  INVX2 U24 ( .A(n64), .Y(n16) );
  AND2X2 U25 ( .A(n37), .B(n140), .Y(n8) );
  NAND2X1 U26 ( .A(n46), .B(n42), .Y(n9) );
  AND2X2 U27 ( .A(n8), .B(n31), .Y(n156) );
  NAND2X1 U28 ( .A(n51), .B(n46), .Y(n11) );
  NAND2X1 U29 ( .A(n30), .B(n13), .Y(n94) );
  AND2X1 U30 ( .A(n21), .B(n47), .Y(n13) );
  AND2X2 U31 ( .A(n80), .B(n15), .Y(n14) );
  INVX1 U32 ( .A(n14), .Y(n125) );
  NAND2X1 U33 ( .A(n47), .B(n51), .Y(n15) );
  INVX1 U34 ( .A(n138), .Y(n141) );
  INVX1 U35 ( .A(n94), .Y(n142) );
  AND2X2 U36 ( .A(n146), .B(n148), .Y(n31) );
  INVX2 U37 ( .A(n38), .Y(n17) );
  BUFX2 U38 ( .A(n24), .Y(n33) );
  AND2X1 U39 ( .A(n56), .B(n24), .Y(n45) );
  INVX1 U40 ( .A(n32), .Y(n18) );
  INVX2 U41 ( .A(n54), .Y(n32) );
  INVX2 U42 ( .A(n34), .Y(n19) );
  INVX1 U43 ( .A(n50), .Y(n20) );
  INVX2 U44 ( .A(n57), .Y(n21) );
  INVX1 U45 ( .A(n56), .Y(n22) );
  INVX2 U46 ( .A(n55), .Y(n57) );
  INVX2 U47 ( .A(n150), .Y(n23) );
  INVX1 U48 ( .A(n58), .Y(n24) );
  AND2X2 U49 ( .A(n59), .B(n21), .Y(n27) );
  INVX2 U50 ( .A(n84), .Y(n28) );
  INVX2 U51 ( .A(n115), .Y(n29) );
  AND2X2 U52 ( .A(n48), .B(n58), .Y(n30) );
  INVX2 U53 ( .A(n55), .Y(n56) );
  INVX1 U54 ( .A(n80), .Y(n65) );
  INVX1 U55 ( .A(n31), .Y(n84) );
  INVX1 U56 ( .A(n136), .Y(n103) );
  INVX2 U57 ( .A(state[0]), .Y(n53) );
  INVX1 U58 ( .A(n25), .Y(n34) );
  INVX2 U59 ( .A(n90), .Y(n35) );
  INVX2 U60 ( .A(n11), .Y(n151) );
  BUFX2 U61 ( .A(n167), .Y(src1[3]) );
  INVX2 U62 ( .A(n151), .Y(n37) );
  INVX1 U63 ( .A(n33), .Y(n38) );
  OR2X2 U64 ( .A(n125), .B(n124), .Y(dest[1]) );
  AND2X2 U65 ( .A(n39), .B(n48), .Y(n51) );
  NOR2X1 U66 ( .A(n55), .B(state[4]), .Y(n39) );
  AND2X2 U67 ( .A(n128), .B(n12), .Y(n40) );
  AND2X2 U68 ( .A(n21), .B(n59), .Y(n43) );
  OR2X1 U69 ( .A(n132), .B(n131), .Y(dest[3]) );
  AND2X2 U70 ( .A(n26), .B(n54), .Y(n46) );
  AND2X2 U71 ( .A(n26), .B(n53), .Y(n47) );
  INVX1 U72 ( .A(n62), .Y(n72) );
  INVX1 U73 ( .A(n102), .Y(n49) );
  INVX1 U74 ( .A(n20), .Y(n63) );
  AND2X2 U75 ( .A(n30), .B(n56), .Y(n52) );
  INVX1 U76 ( .A(n111), .Y(n115) );
  INVX2 U77 ( .A(state[2]), .Y(n55) );
  NAND2X1 U78 ( .A(n60), .B(n45), .Y(n137) );
  INVX1 U79 ( .A(n15), .Y(n150) );
  OR2X2 U80 ( .A(n10), .B(n162), .Y(nxt_mod) );
  INVX2 U81 ( .A(n163), .Y(n107) );
  NAND2X1 U82 ( .A(state[4]), .B(n50), .Y(n135) );
  INVX2 U83 ( .A(n135), .Y(n59) );
  NAND2X1 U84 ( .A(n46), .B(n27), .Y(n112) );
  NAND2X1 U85 ( .A(n47), .B(n43), .Y(n111) );
  NAND2X1 U86 ( .A(n112), .B(n111), .Y(n167) );
  NAND2X1 U87 ( .A(n54), .B(n133), .Y(n62) );
  NOR2X1 U88 ( .A(n48), .B(n62), .Y(n60) );
  NAND3X1 U89 ( .A(n18), .B(n63), .C(n38), .Y(n61) );
  INVX2 U90 ( .A(n61), .Y(clear) );
  NAND2X1 U91 ( .A(clear), .B(n56), .Y(n126) );
  NAND2X1 U92 ( .A(n42), .B(n72), .Y(n153) );
  NAND3X1 U93 ( .A(n137), .B(n126), .C(n153), .Y(n70) );
  NAND3X1 U94 ( .A(n57), .B(n50), .C(n53), .Y(n64) );
  NAND3X1 U95 ( .A(n16), .B(n33), .C(n25), .Y(n136) );
  NAND3X1 U96 ( .A(clear), .B(n56), .C(n19), .Y(n93) );
  NAND3X1 U97 ( .A(clear), .B(n34), .C(n22), .Y(n130) );
  AND2X2 U98 ( .A(n93), .B(n130), .Y(n67) );
  NAND2X1 U99 ( .A(n46), .B(n42), .Y(n146) );
  NAND2X1 U100 ( .A(n52), .B(n72), .Y(n148) );
  NAND3X1 U101 ( .A(n52), .B(n25), .C(n32), .Y(n80) );
  NOR2X1 U102 ( .A(n84), .B(n65), .Y(n66) );
  NAND3X1 U103 ( .A(n136), .B(n67), .C(n66), .Y(n117) );
  INVX2 U104 ( .A(n117), .Y(n68) );
  NAND3X1 U105 ( .A(clear), .B(n22), .C(n19), .Y(n129) );
  NAND3X1 U106 ( .A(n68), .B(n94), .C(n129), .Y(n69) );
  OR2X1 U107 ( .A(n70), .B(n69), .Y(op[0]) );
  INVX2 U108 ( .A(overflow), .Y(n102) );
  NAND3X1 U109 ( .A(n42), .B(n19), .C(n32), .Y(n127) );
  NAND3X1 U110 ( .A(n17), .B(n34), .C(n16), .Y(n85) );
  NAND2X1 U111 ( .A(n127), .B(n85), .Y(n76) );
  INVX2 U112 ( .A(n76), .Y(n71) );
  OAI22X1 U113 ( .A(n137), .B(n102), .C(dr), .D(n71), .Y(n116) );
  INVX2 U114 ( .A(n116), .Y(n98) );
  NAND3X1 U115 ( .A(n32), .B(n25), .C(n43), .Y(n138) );
  NAND2X1 U116 ( .A(n51), .B(n46), .Y(n143) );
  NAND2X1 U117 ( .A(n27), .B(n72), .Y(n140) );
  NAND3X1 U118 ( .A(n138), .B(n37), .C(n140), .Y(n132) );
  INVX2 U119 ( .A(n132), .Y(n128) );
  NAND2X1 U120 ( .A(n47), .B(n38), .Y(n88) );
  NAND2X1 U121 ( .A(n16), .B(n38), .Y(n110) );
  NAND2X1 U122 ( .A(n88), .B(n110), .Y(n104) );
  NOR2X1 U123 ( .A(op[0]), .B(n104), .Y(n78) );
  NOR2X1 U124 ( .A(n56), .B(n20), .Y(n74) );
  NOR2X1 U125 ( .A(n17), .B(n18), .Y(n73) );
  NAND3X1 U126 ( .A(n74), .B(n19), .C(n73), .Y(n75) );
  INVX2 U127 ( .A(n75), .Y(n101) );
  NOR2X1 U128 ( .A(n101), .B(n76), .Y(n77) );
  NAND3X1 U129 ( .A(n78), .B(n40), .C(n77), .Y(n113) );
  INVX2 U130 ( .A(n113), .Y(n160) );
  NOR2X1 U131 ( .A(n103), .B(n160), .Y(n79) );
  NAND3X1 U132 ( .A(n98), .B(n40), .C(n79), .Y(nxt_state[4]) );
  INVX2 U133 ( .A(dr), .Y(n82) );
  NOR2X1 U134 ( .A(n142), .B(n125), .Y(n81) );
  OAI21X1 U135 ( .A(n82), .B(n127), .C(n81), .Y(n83) );
  INVX2 U136 ( .A(n83), .Y(n106) );
  INVX2 U137 ( .A(n85), .Y(err) );
  OAI21X1 U138 ( .A(n101), .B(err), .C(dr), .Y(n86) );
  NAND2X1 U139 ( .A(n86), .B(n153), .Y(n155) );
  AOI21X1 U140 ( .A(n160), .B(n20), .C(n155), .Y(n87) );
  NAND3X1 U141 ( .A(n106), .B(n28), .C(n87), .Y(nxt_state[3]) );
  INVX2 U142 ( .A(n153), .Y(cnt_up) );
  INVX2 U143 ( .A(n88), .Y(n89) );
  NOR2X1 U144 ( .A(n90), .B(n89), .Y(n91) );
  NAND3X1 U145 ( .A(n29), .B(n140), .C(n91), .Y(n92) );
  NOR2X1 U146 ( .A(cnt_up), .B(n92), .Y(n96) );
  NAND3X1 U147 ( .A(n129), .B(n94), .C(n93), .Y(n95) );
  INVX2 U148 ( .A(n95), .Y(n123) );
  NAND2X1 U149 ( .A(n96), .B(n123), .Y(n97) );
  AOI21X1 U150 ( .A(n160), .B(n34), .C(n97), .Y(n100) );
  OAI21X1 U151 ( .A(n103), .B(n144), .C(n49), .Y(n99) );
  NAND3X1 U152 ( .A(n100), .B(n99), .C(n98), .Y(nxt_state[1]) );
  OAI22X1 U153 ( .A(overflow), .B(n29), .C(n32), .D(n113), .Y(n109) );
  NAND2X1 U154 ( .A(lc), .B(n101), .Y(n157) );
  AOI22X1 U155 ( .A(lc), .B(n104), .C(n103), .D(n102), .Y(n105) );
  NAND3X1 U156 ( .A(n106), .B(n138), .C(n105), .Y(n163) );
  OAI21X1 U157 ( .A(dr), .B(n157), .C(n107), .Y(n108) );
  OR2X1 U158 ( .A(n109), .B(n108), .Y(nxt_state[0]) );
  AND2X2 U159 ( .A(n110), .B(n23), .Y(n120) );
  OAI21X1 U160 ( .A(n21), .B(n113), .C(n112), .Y(n114) );
  AOI21X1 U161 ( .A(n115), .B(n49), .C(n114), .Y(n119) );
  NOR2X1 U162 ( .A(n117), .B(n116), .Y(n118) );
  NAND3X1 U163 ( .A(n120), .B(n119), .C(n118), .Y(nxt_state[2]) );
  INVX2 U164 ( .A(n127), .Y(n121) );
  NOR2X1 U165 ( .A(n141), .B(n121), .Y(n122) );
  NAND3X1 U166 ( .A(n123), .B(n14), .C(n122), .Y(dest[0]) );
  NAND3X1 U167 ( .A(n140), .B(n9), .C(n126), .Y(n124) );
  NAND3X1 U168 ( .A(n7), .B(n128), .C(n35), .Y(dest[2]) );
  NAND3X1 U169 ( .A(n130), .B(n129), .C(n23), .Y(n131) );
  OAI21X1 U170 ( .A(n54), .B(n56), .C(n133), .Y(n134) );
  NAND2X1 U171 ( .A(n143), .B(n139), .Y(src2[0]) );
  NAND3X1 U172 ( .A(n136), .B(n143), .C(n15), .Y(src2[1]) );
  NAND3X1 U173 ( .A(n137), .B(n11), .C(n15), .Y(src2[2]) );
  NAND2X1 U174 ( .A(n139), .B(n138), .Y(src2[3]) );
  NAND3X1 U175 ( .A(n140), .B(n37), .C(n31), .Y(src1[0]) );
  NOR2X1 U176 ( .A(n151), .B(n144), .Y(n145) );
  NAND3X1 U177 ( .A(n147), .B(n9), .C(n145), .Y(src1[1]) );
  NAND3X1 U178 ( .A(n14), .B(n12), .C(n35), .Y(src1[2]) );
  INVX2 U179 ( .A(dest[3]), .Y(n149) );
  NAND2X1 U180 ( .A(n149), .B(n7), .Y(op[1]) );
  NOR2X1 U181 ( .A(src2[3]), .B(src1[3]), .Y(n154) );
  NOR2X1 U182 ( .A(n151), .B(n150), .Y(n152) );
  NAND3X1 U183 ( .A(n154), .B(n153), .C(n152), .Y(op[2]) );
  INVX2 U184 ( .A(n155), .Y(n158) );
  NAND3X1 U185 ( .A(n158), .B(n157), .C(n156), .Y(n159) );
  AOI21X1 U186 ( .A(modwait), .B(n160), .C(n159), .Y(n161) );
  OAI21X1 U187 ( .A(n49), .B(n12), .C(n161), .Y(n162) );
endmodule


module flex_counter_NUM_CNT_BITS10_DW01_inc_0 ( A, SUM );
  input [9:0] A;
  output [9:0] SUM;

  wire   [9:2] carry;

  HAX1 U1_1_8 ( .A(A[8]), .B(carry[8]), .YC(carry[9]), .YS(SUM[8]) );
  HAX1 U1_1_7 ( .A(A[7]), .B(carry[7]), .YC(carry[8]), .YS(SUM[7]) );
  HAX1 U1_1_6 ( .A(A[6]), .B(carry[6]), .YC(carry[7]), .YS(SUM[6]) );
  HAX1 U1_1_5 ( .A(A[5]), .B(carry[5]), .YC(carry[6]), .YS(SUM[5]) );
  HAX1 U1_1_4 ( .A(A[4]), .B(carry[4]), .YC(carry[5]), .YS(SUM[4]) );
  HAX1 U1_1_3 ( .A(A[3]), .B(carry[3]), .YC(carry[4]), .YS(SUM[3]) );
  HAX1 U1_1_2 ( .A(A[2]), .B(carry[2]), .YC(carry[3]), .YS(SUM[2]) );
  HAX1 U1_1_1 ( .A(A[1]), .B(A[0]), .YC(carry[2]), .YS(SUM[1]) );
  INVX2 U1 ( .A(A[0]), .Y(SUM[0]) );
  XOR2X1 U2 ( .A(carry[9]), .B(A[9]), .Y(SUM[9]) );
endmodule


module flex_counter_NUM_CNT_BITS10 ( clk, n_rst, clear, count_enable, 
        rollover_val, count_out, rollover_flag );
  input [9:0] rollover_val;
  output [9:0] count_out;
  input clk, n_rst, clear, count_enable;
  output rollover_flag;
  wire   N8, N9, N10, N11, N12, N13, N14, N15, N16, N17, N22, N23, N24, N25,
         N26, N27, N28, N29, N30, N31, n34, n35, n36, n37, n38, n39, n40, n41,
         n42, n43, n44, n45, n46, n47, n48, n49, n50, n51, n52, n53, n54, n55,
         n56, n57, n58, n59, n60, n61, n62, n63, n64, n65, n66, n67, n68, n69,
         n70, n71, n72, n73, n74, n75, n76, n77, n78, n79, n80, n81, n82, n83,
         n84, n85, n86, n87, n88, n89, n90, n91, n1, n2, n3, n4, n5, n6, n7,
         n8, n20, n21, n22, n23, n24, n25, n26, n27, n28, n29, n30, n31, n32,
         n33, n92, n93, n94, n95, n96, n97, n98;

  DFFSR \count_out_reg[0]  ( .D(n91), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        count_out[0]) );
  DFFSR \count_out_reg[1]  ( .D(n90), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        count_out[1]) );
  DFFSR \count_out_reg[2]  ( .D(n89), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        count_out[2]) );
  DFFSR \count_out_reg[3]  ( .D(n88), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        count_out[3]) );
  DFFSR \count_out_reg[4]  ( .D(n87), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        count_out[4]) );
  DFFSR \count_out_reg[5]  ( .D(n86), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        count_out[5]) );
  DFFSR \count_out_reg[6]  ( .D(n85), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        count_out[6]) );
  DFFSR \count_out_reg[7]  ( .D(n84), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        count_out[7]) );
  DFFSR \count_out_reg[8]  ( .D(n83), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        count_out[8]) );
  DFFSR \count_out_reg[9]  ( .D(n82), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        count_out[9]) );
  DFFSR rollover_flag_reg ( .D(n28), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        rollover_flag) );
  AOI22X1 U28 ( .A(rollover_flag), .B(n35), .C(n36), .D(n37), .Y(n34) );
  NOR2X1 U29 ( .A(n38), .B(n39), .Y(n37) );
  NAND3X1 U30 ( .A(n40), .B(n41), .C(n42), .Y(n39) );
  XNOR2X1 U31 ( .A(count_out[9]), .B(N17), .Y(n42) );
  XNOR2X1 U32 ( .A(count_out[8]), .B(N16), .Y(n41) );
  XNOR2X1 U33 ( .A(count_out[3]), .B(N11), .Y(n40) );
  NAND3X1 U34 ( .A(n43), .B(n44), .C(n45), .Y(n38) );
  XNOR2X1 U35 ( .A(count_out[7]), .B(N15), .Y(n45) );
  NOR2X1 U36 ( .A(n46), .B(n47), .Y(n36) );
  NAND3X1 U37 ( .A(n48), .B(n49), .C(n50), .Y(n47) );
  XNOR2X1 U38 ( .A(count_out[0]), .B(N8), .Y(n50) );
  XNOR2X1 U39 ( .A(count_out[2]), .B(N10), .Y(n49) );
  XNOR2X1 U40 ( .A(count_out[1]), .B(N9), .Y(n48) );
  NAND3X1 U41 ( .A(n51), .B(n52), .C(n53), .Y(n46) );
  XNOR2X1 U42 ( .A(count_out[5]), .B(N13), .Y(n53) );
  XNOR2X1 U43 ( .A(count_out[6]), .B(N14), .Y(n52) );
  XNOR2X1 U44 ( .A(count_out[4]), .B(N12), .Y(n51) );
  OAI21X1 U45 ( .A(n29), .B(n97), .C(n54), .Y(n35) );
  OAI21X1 U46 ( .A(n96), .B(n54), .C(n55), .Y(n82) );
  NAND2X1 U47 ( .A(N31), .B(n56), .Y(n55) );
  OAI21X1 U48 ( .A(n95), .B(n54), .C(n57), .Y(n83) );
  NAND2X1 U49 ( .A(N30), .B(n56), .Y(n57) );
  OAI21X1 U50 ( .A(n94), .B(n54), .C(n58), .Y(n84) );
  NAND2X1 U51 ( .A(N29), .B(n56), .Y(n58) );
  OAI21X1 U52 ( .A(n93), .B(n54), .C(n59), .Y(n85) );
  NAND2X1 U53 ( .A(N28), .B(n56), .Y(n59) );
  OAI21X1 U54 ( .A(n92), .B(n54), .C(n60), .Y(n86) );
  NAND2X1 U55 ( .A(N27), .B(n56), .Y(n60) );
  OAI21X1 U56 ( .A(n33), .B(n54), .C(n61), .Y(n87) );
  NAND2X1 U57 ( .A(N26), .B(n56), .Y(n61) );
  OAI21X1 U58 ( .A(n32), .B(n54), .C(n62), .Y(n88) );
  NAND2X1 U59 ( .A(N25), .B(n56), .Y(n62) );
  OAI21X1 U60 ( .A(n31), .B(n54), .C(n63), .Y(n89) );
  NAND2X1 U61 ( .A(N24), .B(n56), .Y(n63) );
  OAI21X1 U62 ( .A(n30), .B(n54), .C(n64), .Y(n90) );
  NAND2X1 U63 ( .A(N23), .B(n56), .Y(n64) );
  OAI21X1 U64 ( .A(n27), .B(n54), .C(n65), .Y(n91) );
  AOI22X1 U65 ( .A(n29), .B(n43), .C(N22), .D(n56), .Y(n65) );
  NOR2X1 U66 ( .A(n97), .B(n29), .Y(n56) );
  NOR2X1 U67 ( .A(n98), .B(clear), .Y(n43) );
  NAND2X1 U68 ( .A(n66), .B(n67), .Y(n44) );
  NOR2X1 U69 ( .A(n68), .B(n69), .Y(n67) );
  NAND2X1 U70 ( .A(n70), .B(n71), .Y(n69) );
  XNOR2X1 U71 ( .A(count_out[9]), .B(rollover_val[9]), .Y(n71) );
  XNOR2X1 U72 ( .A(count_out[6]), .B(rollover_val[6]), .Y(n70) );
  NAND3X1 U73 ( .A(n72), .B(n73), .C(n74), .Y(n68) );
  XNOR2X1 U74 ( .A(count_out[3]), .B(rollover_val[3]), .Y(n74) );
  XNOR2X1 U75 ( .A(count_out[7]), .B(rollover_val[7]), .Y(n73) );
  XNOR2X1 U76 ( .A(count_out[8]), .B(rollover_val[8]), .Y(n72) );
  NOR2X1 U77 ( .A(n75), .B(n76), .Y(n66) );
  NAND2X1 U78 ( .A(n77), .B(n78), .Y(n76) );
  XNOR2X1 U79 ( .A(count_out[1]), .B(rollover_val[1]), .Y(n78) );
  XNOR2X1 U80 ( .A(count_out[0]), .B(rollover_val[0]), .Y(n77) );
  NAND3X1 U81 ( .A(n79), .B(n80), .C(n81), .Y(n75) );
  XNOR2X1 U82 ( .A(count_out[2]), .B(rollover_val[2]), .Y(n81) );
  XNOR2X1 U83 ( .A(count_out[4]), .B(rollover_val[4]), .Y(n80) );
  XNOR2X1 U84 ( .A(count_out[5]), .B(rollover_val[5]), .Y(n79) );
  flex_counter_NUM_CNT_BITS10_DW01_inc_0 r305 ( .A(count_out), .SUM({N31, N30, 
        N29, N28, N27, N26, N25, N24, N23, N22}) );
  OR2X2 U14 ( .A(count_enable), .B(clear), .Y(n54) );
  NAND2X1 U15 ( .A(n23), .B(N8), .Y(n1) );
  OAI21X1 U16 ( .A(N8), .B(n23), .C(n1), .Y(N9) );
  NOR2X1 U17 ( .A(n1), .B(rollover_val[2]), .Y(n3) );
  AOI21X1 U18 ( .A(n1), .B(rollover_val[2]), .C(n3), .Y(n2) );
  NAND2X1 U19 ( .A(n3), .B(n26), .Y(n4) );
  OAI21X1 U20 ( .A(n3), .B(n26), .C(n4), .Y(N11) );
  NOR2X1 U21 ( .A(n4), .B(rollover_val[4]), .Y(n6) );
  AOI21X1 U22 ( .A(n4), .B(rollover_val[4]), .C(n6), .Y(n5) );
  NAND2X1 U23 ( .A(n6), .B(n25), .Y(n7) );
  OAI21X1 U24 ( .A(n6), .B(n25), .C(n7), .Y(N13) );
  NOR2X1 U25 ( .A(n7), .B(rollover_val[6]), .Y(n20) );
  AOI21X1 U26 ( .A(n7), .B(rollover_val[6]), .C(n20), .Y(n8) );
  NAND2X1 U27 ( .A(n20), .B(n24), .Y(n21) );
  OAI21X1 U85 ( .A(n20), .B(n24), .C(n21), .Y(N15) );
  XNOR2X1 U86 ( .A(rollover_val[8]), .B(n21), .Y(N16) );
  NOR2X1 U87 ( .A(rollover_val[8]), .B(n21), .Y(n22) );
  XOR2X1 U88 ( .A(rollover_val[9]), .B(n22), .Y(N17) );
  INVX2 U89 ( .A(rollover_val[1]), .Y(n23) );
  INVX2 U90 ( .A(rollover_val[0]), .Y(N8) );
  INVX2 U91 ( .A(n2), .Y(N10) );
  INVX2 U92 ( .A(rollover_val[7]), .Y(n24) );
  INVX2 U93 ( .A(rollover_val[5]), .Y(n25) );
  INVX2 U94 ( .A(rollover_val[3]), .Y(n26) );
  INVX2 U95 ( .A(n8), .Y(N14) );
  INVX2 U96 ( .A(n5), .Y(N12) );
  INVX2 U97 ( .A(count_out[0]), .Y(n27) );
  INVX2 U98 ( .A(n34), .Y(n28) );
  INVX2 U99 ( .A(n44), .Y(n29) );
  INVX2 U100 ( .A(count_out[1]), .Y(n30) );
  INVX2 U101 ( .A(count_out[2]), .Y(n31) );
  INVX2 U102 ( .A(count_out[3]), .Y(n32) );
  INVX2 U103 ( .A(count_out[4]), .Y(n33) );
  INVX2 U104 ( .A(count_out[5]), .Y(n92) );
  INVX2 U105 ( .A(count_out[6]), .Y(n93) );
  INVX2 U106 ( .A(count_out[7]), .Y(n94) );
  INVX2 U107 ( .A(count_out[8]), .Y(n95) );
  INVX2 U108 ( .A(count_out[9]), .Y(n96) );
  INVX2 U109 ( .A(n43), .Y(n97) );
  INVX2 U110 ( .A(count_enable), .Y(n98) );
endmodule


module counter ( clk, n_rst, cnt_up, clear, one_k_samples );
  input clk, n_rst, cnt_up, clear;
  output one_k_samples;


  flex_counter_NUM_CNT_BITS10 count_one_k ( .clk(clk), .n_rst(n_rst), .clear(
        clear), .count_enable(cnt_up), .rollover_val({1'b1, 1'b1, 1'b1, 1'b1, 
        1'b1, 1'b0, 1'b1, 1'b0, 1'b0, 1'b0}), .rollover_flag(one_k_samples) );
endmodule


module datapath_decode ( op, w_en, w_data_sel, alu_op );
  input [2:0] op;
  output [1:0] w_data_sel;
  output [1:0] alu_op;
  output w_en;
  wire   n4, n5, n1, n2, n3;

  NAND3X1 U6 ( .A(n2), .B(n3), .C(n1), .Y(w_en) );
  NOR2X1 U7 ( .A(n1), .B(w_data_sel[1]), .Y(w_data_sel[0]) );
  NAND2X1 U8 ( .A(op[1]), .B(n3), .Y(w_data_sel[1]) );
  OAI21X1 U9 ( .A(n3), .B(n4), .C(n5), .Y(alu_op[1]) );
  NAND3X1 U10 ( .A(op[0]), .B(n2), .C(op[2]), .Y(n5) );
  NAND2X1 U11 ( .A(op[1]), .B(n1), .Y(n4) );
  NOR2X1 U12 ( .A(op[0]), .B(n3), .Y(alu_op[0]) );
  INVX2 U3 ( .A(op[0]), .Y(n1) );
  INVX2 U4 ( .A(op[1]), .Y(n2) );
  INVX2 U5 ( .A(op[2]), .Y(n3) );
endmodule


module alu_DW_mult_uns_2 ( a, b, product );
  input [30:0] a;
  input [15:0] b;
  output [46:0] product;
  wire   n1, n6, n7, n12, n13, n16, n19, n25, n28, n31, n34, n37, n46, n49,
         n51, n52, n54, n55, n56, n57, n58, n59, n60, n61, n62, n63, n64, n65,
         n66, n67, n68, n69, n70, n72, n73, n74, n75, n77, n79, n80, n81, n82,
         n83, n84, n85, n86, n87, n88, n89, n90, n91, n92, n93, n94, n95, n96,
         n97, n98, n99, n100, n101, n102, n103, n104, n105, n106, n107, n109,
         n111, n112, n113, n114, n115, n116, n120, n122, n123, n124, n125,
         n126, n127, n128, n129, n130, n133, n134, n135, n136, n137, n140,
         n142, n144, n145, n146, n147, n148, n149, n151, n154, n156, n159,
         n160, n161, n162, n163, n164, n165, n166, n169, n170, n171, n172,
         n173, n174, n177, n178, n179, n181, n182, n183, n185, n186, n187,
         n188, n189, n190, n191, n192, n193, n194, n197, n198, n199, n200,
         n201, n202, n205, n206, n207, n209, n210, n211, n212, n213, n214,
         n215, n216, n217, n218, n219, n220, n221, n222, n223, n224, n233,
         n234, n235, n236, n237, n238, n239, n240, n241, n242, n243, n248,
         n249, n250, n251, n256, n257, n258, n259, n264, n265, n266, n267,
         n275, n279, n282, n283, n284, n285, n286, n287, n288, n289, n290,
         n291, n292, n293, n294, n295, n296, n297, n298, n299, n300, n301,
         n302, n303, n304, n305, n306, n307, n308, n309, n310, n311, n312,
         n313, n314, n315, n316, n317, n318, n319, n320, n321, n322, n323,
         n324, n325, n326, n327, n328, n329, n330, n331, n332, n333, n334,
         n335, n336, n337, n338, n339, n340, n341, n342, n343, n344, n345,
         n346, n347, n348, n349, n350, n351, n352, n353, n354, n355, n356,
         n357, n358, n359, n360, n361, n362, n363, n364, n365, n366, n367,
         n368, n369, n370, n371, n372, n373, n374, n375, n376, n377, n378,
         n379, n380, n381, n382, n383, n384, n387, n388, n389, n390, n391,
         n392, n393, n394, n395, n396, n397, n398, n399, n401, n402, n403,
         n404, n405, n406, n407, n408, n409, n410, n411, n412, n413, n414,
         n415, n416, n417, n418, n419, n420, n421, n422, n423, n424, n425,
         n426, n427, n428, n429, n430, n431, n432, n433, n434, n435, n436,
         n437, n438, n439, n440, n441, n442, n443, n444, n445, n446, n447,
         n448, n449, n450, n451, n452, n453, n454, n456, n457, n458, n459,
         n460, n461, n462, n463, n464, n465, n466, n467, n468, n469, n470,
         n471, n472, n473, n474, n475, n476, n477, n478, n479, n480, n481,
         n482, n483, n484, n485, n486, n487, n488, n489, n490, n491, n492,
         n493, n494, n495, n496, n497, n498, n499, n500, n501, n502, n503,
         n504, n505, n506, n507, n508, n509, n510, n511, n512, n513, n514,
         n515, n516, n517, n518, n519, n520, n521, n522, n523, n524, n525,
         n526, n527, n528, n529, n530, n531, n532, n533, n534, n535, n536,
         n537, n538, n539, n540, n541, n542, n545, n546, n548, n551, n552,
         n554, n557, n558, n560, n565, n566, n567, n568, n569, n570, n571,
         n572, n573, n574, n575, n576, n577, n578, n579, n580, n581, n582,
         n584, n585, n586, n587, n588, n589, n590, n591, n592, n593, n594,
         n595, n596, n597, n598, n599, n600, n601, n602, n603, n604, n605,
         n606, n607, n608, n609, n610, n611, n612, n613, n614, n615, n616,
         n617, n618, n619, n620, n621, n622, n623, n624, n625, n626, n627,
         n628, n629, n630, n631, n632, n633, n634, n635, n636, n637, n638,
         n639, n640, n641, n642, n643, n644, n645, n646, n647, n648, n649,
         n650, n651, n652, n653, n654, n655, n656, n657, n658, n659, n660,
         n661, n662, n663, n664, n665, n666, n667, n668, n669, n670, n671,
         n672, n673, n674, n675, n676, n677, n678, n679, n680, n681, n682,
         n683, n684, n685, n686, n687, n688, n689, n690, n691, n692, n693,
         n694, n695, n696, n697, n698, n699, n700, n701, n702, n703, n704,
         n705, n706, n707, n708, n710, n711, n712, n713, n714, n715, n716,
         n717, n718, n719, n720, n721, n722, n723, n724, n725, n727, n730,
         n733, n734, n736, n739, n741, n742, n743, n744, n745, n746, n747,
         n748, n749, n750, n751, n752, n753, n754, n755, n756, n757, n758,
         n759, n760, n761, n762, n763, n764, n765, n766, n767, n768, n769,
         n770, n771, n772, n773, n774, n775, n776, n777, n778, n779, n780,
         n781, n782, n783, n784, n785, n786, n787, n788, n789, n790, n791,
         n792, n793, n794, n795, n796, n797, n798, n799, n800, n801, n802,
         n803, n804, n805, n806, n807, n808, n809, n810, n811, n812, n813,
         n814, n815, n816, n817, n818, n819, n820, n821, n822, n823, n824,
         n825, n826, n827, n828, n829, n830, n831, n832, n833, n834, n835,
         n836, n837, n838, n839, n840, n841, n842, n843, n844, n845, n846,
         n847, n848, n849, n850, n851, n852, n853, n854, n855, n856, n857,
         n858, n859, n860, n861, n862, n863, n864, n865, n866, n867, n868,
         n869, n870, n871, n872, n873, n874, n875, n876, n877, n878, n879,
         n880, n881, n882, n883, n884, n885, n886, n887, n888, n889, n890,
         n891, n893, n895, n896, n897, n898, n900, n917, n918, n919, n920,
         n921, n922, n923, n924, n925, n995, n996, n997, n998, n999, n1000,
         n1001, n1002, n1003, n1004, n1005, n1006, n1007, n1008, n1009, n1010,
         n1011, n1012, n1013, n1014, n1015, n1016, n1017, n1018, n1019, n1020,
         n1021, n1022, n1023, n1024, n1025, n1026, n1027, n1028, n1029, n1030,
         n1031, n1032, n1033, n1034, n1035, n1036, n1037, n1038, n1039, n1040,
         n1041, n1042, n1043, n1044, n1045, n1046, n1047, n1048, n1049, n1050,
         n1051, n1052, n1053, n1054, n1055, n1056, n1057, n1058, n1059, n1060,
         n1061, n1062, n1063, n1064, n1065, n1066, n1067, n1068, n1069, n1070,
         n1071, n1072, n1073, n1074, n1075, n1076, n1077, n1078, n1079, n1080,
         n1081, n1082, n1083, n1084, n1085, n1086, n1087, n1088, n1089, n1090,
         n1091, n1092, n1093, n1094, n1095, n1096, n1097, n1098, n1099, n1100,
         n1101, n1102, n1103, n1104, n1105, n1106, n1107, n1108, n1109, n1110,
         n1111, n1112, n1113, n1114, n1115, n1116, n1117, n1118, n1119, n1120,
         n1121, n1122, n1123, n1124, n1125, n1126, n1127, n1128, n1129, n1130,
         n1131, n1132, n1133, n1134, n1135, n1136, n1137, n1138, n1139, n1140,
         n1141, n1142, n1143, n1144, n1145, n1146, n1147, n1148, n1149, n1150,
         n1151, n1152, n1153, n1154, n1155, n1156, n1157, n1158, n1159, n1160,
         n1161, n1162, n1163, n1164, n1165, n1166, n1167, n1168, n1169, n1170,
         n1171, n1172, n1173, n1174, n1175, n1176, n1177, n1178, n1179, n1180,
         n1181, n1182, n1183, n1184, n1185, n1186, n1187, n1188, n1189, n1190,
         n1191, n1192, n1193, n1194, n1195, n1196, n1197, n1198, n1199, n1200,
         n1201, n1202, n1203, n1204, n1205, n1206, n1207, n1208, n1209, n1210,
         n1211, n1212, n1213, n1214, n1215, n1216, n1217, n1218, n1219, n1220,
         n1221, n1222, n1223, n1224, n1225, n1226, n1227, n1228, n1229, n1230,
         n1231, n1232, n1233, n1234, n1235, n1236, n1237, n1238, n1239, n1240,
         n1241, n1242, n1243, n1244, n1245, n1246, n1247, n1248, n1249, n1250,
         n1251, n1252, n1253, n1254, n1255, n1256, n1257, n1258, n1259, n1260,
         n1261, n1262, n1263, n1264, n1265, n1266, n1267, n1268, n1269, n1270,
         n1271, n1272, n1273, n1274, n1275, n1276, n1277, n1278, n1279, n1280,
         n1281, n1282, n1283, n1284, n1285, n1286, n1287, n1288, n1289, n1290,
         n1291, n1292, n1293, n1294, n1295, n1296, n1297, n1298, n1299, n1300,
         n1301, n1302, n1303, n1304, n1305, n1306, n1307, n1308, n1309, n1310,
         n1311, n1312, n1313, n1314, n1315, n1316, n1317, n1318, n1319, n1320,
         n1321, n1322, n1323, n1324, n1325, n1326, n1327, n1328, n1329, n1330,
         n1331, n1332, n1333, n1334, n1335, n1336, n1337, n1338, n1339, n1340,
         n1341, n1342, n1343, n1344, n1345, n1346, n1347, n1348, n1349, n1350,
         n1351;
  assign n1 = b[1];
  assign n7 = b[3];
  assign n13 = b[5];
  assign n19 = b[7];
  assign n25 = b[9];
  assign n31 = b[11];
  assign n37 = b[13];
  assign n49 = a[15];
  assign n541 = b[15];
  assign n877 = a[30];
  assign n878 = a[29];
  assign n879 = a[28];
  assign n880 = a[27];
  assign n881 = a[26];
  assign n882 = a[25];
  assign n883 = a[24];
  assign n884 = a[23];
  assign n885 = a[22];
  assign n886 = a[21];
  assign n887 = a[20];
  assign n888 = a[19];
  assign n889 = a[18];
  assign n890 = a[17];
  assign n891 = a[16];

  XOR2X1 U54 ( .A(n73), .B(n54), .Y(product[46]) );
  NAND2X1 U55 ( .A(n72), .B(n1025), .Y(n54) );
  NAND2X1 U58 ( .A(n292), .B(n293), .Y(n72) );
  XOR2X1 U59 ( .A(n86), .B(n55), .Y(product[45]) );
  AOI21X1 U60 ( .A(n1313), .B(n74), .C(n75), .Y(n73) );
  NOR2X1 U61 ( .A(n1018), .B(n1259), .Y(n74) );
  OAI21X1 U62 ( .A(n52), .B(n1018), .C(n77), .Y(n75) );
  OAI21X1 U66 ( .A(n80), .B(n140), .C(n81), .Y(n79) );
  NAND2X1 U67 ( .A(n82), .B(n104), .Y(n80) );
  AOI21X1 U68 ( .A(n82), .B(n105), .C(n83), .Y(n81) );
  NOR2X1 U69 ( .A(n84), .B(n93), .Y(n82) );
  OAI21X1 U70 ( .A(n94), .B(n84), .C(n85), .Y(n83) );
  NAND2X1 U71 ( .A(n85), .B(n275), .Y(n55) );
  NOR2X1 U73 ( .A(n294), .B(n297), .Y(n84) );
  NAND2X1 U74 ( .A(n294), .B(n297), .Y(n85) );
  XOR2X1 U75 ( .A(n95), .B(n56), .Y(product[44]) );
  AOI21X1 U76 ( .A(n1313), .B(n87), .C(n88), .Y(n86) );
  NOR2X1 U77 ( .A(n89), .B(n1259), .Y(n87) );
  OAI21X1 U78 ( .A(n89), .B(n1265), .C(n90), .Y(n88) );
  NAND2X1 U79 ( .A(n91), .B(n100), .Y(n89) );
  AOI21X1 U80 ( .A(n91), .B(n101), .C(n92), .Y(n90) );
  NAND2X1 U83 ( .A(n94), .B(n91), .Y(n56) );
  NOR2X1 U85 ( .A(n298), .B(n301), .Y(n93) );
  NAND2X1 U86 ( .A(n298), .B(n301), .Y(n94) );
  XOR2X1 U87 ( .A(n112), .B(n57), .Y(product[43]) );
  AOI21X1 U88 ( .A(n1313), .B(n96), .C(n97), .Y(n95) );
  NOR2X1 U89 ( .A(n98), .B(n1259), .Y(n96) );
  OAI21X1 U90 ( .A(n1264), .B(n98), .C(n99), .Y(n97) );
  NOR2X1 U93 ( .A(n102), .B(n1262), .Y(n100) );
  OAI21X1 U94 ( .A(n140), .B(n102), .C(n103), .Y(n101) );
  NOR2X1 U97 ( .A(n106), .B(n130), .Y(n104) );
  OAI21X1 U98 ( .A(n106), .B(n133), .C(n107), .Y(n105) );
  NAND2X1 U99 ( .A(n1230), .B(n1022), .Y(n106) );
  AOI21X1 U100 ( .A(n120), .B(n1230), .C(n109), .Y(n107) );
  NAND2X1 U103 ( .A(n111), .B(n1230), .Y(n57) );
  NAND2X1 U106 ( .A(n302), .B(n307), .Y(n111) );
  XOR2X1 U107 ( .A(n123), .B(n58), .Y(product[42]) );
  AOI21X1 U108 ( .A(n1313), .B(n113), .C(n114), .Y(n112) );
  NOR2X1 U109 ( .A(n115), .B(n1259), .Y(n113) );
  OAI21X1 U110 ( .A(n115), .B(n1265), .C(n116), .Y(n114) );
  NAND2X1 U111 ( .A(n1022), .B(n128), .Y(n115) );
  AOI21X1 U112 ( .A(n1022), .B(n129), .C(n120), .Y(n116) );
  NAND2X1 U117 ( .A(n122), .B(n1022), .Y(n58) );
  NAND2X1 U120 ( .A(n308), .B(n313), .Y(n122) );
  XOR2X1 U121 ( .A(n134), .B(n59), .Y(product[41]) );
  AOI21X1 U122 ( .A(n1313), .B(n124), .C(n125), .Y(n123) );
  NOR2X1 U123 ( .A(n126), .B(n1259), .Y(n124) );
  OAI21X1 U124 ( .A(n1264), .B(n126), .C(n127), .Y(n125) );
  NOR2X1 U127 ( .A(n130), .B(n1262), .Y(n128) );
  OAI21X1 U128 ( .A(n140), .B(n130), .C(n133), .Y(n129) );
  NAND2X1 U131 ( .A(n133), .B(n279), .Y(n59) );
  NOR2X1 U133 ( .A(n314), .B(n321), .Y(n130) );
  NAND2X1 U134 ( .A(n314), .B(n321), .Y(n133) );
  XOR2X1 U135 ( .A(n145), .B(n60), .Y(product[40]) );
  AOI21X1 U136 ( .A(n1313), .B(n135), .C(n136), .Y(n134) );
  NOR2X1 U137 ( .A(n1262), .B(n1259), .Y(n135) );
  OAI21X1 U138 ( .A(n1265), .B(n1262), .C(n140), .Y(n136) );
  NAND2X1 U141 ( .A(n1229), .B(n1218), .Y(n137) );
  AOI21X1 U142 ( .A(n151), .B(n1229), .C(n142), .Y(n140) );
  NAND2X1 U145 ( .A(n144), .B(n1229), .Y(n60) );
  NAND2X1 U148 ( .A(n322), .B(n329), .Y(n144) );
  XOR2X1 U149 ( .A(n154), .B(n61), .Y(product[39]) );
  AOI21X1 U150 ( .A(n1313), .B(n146), .C(n147), .Y(n145) );
  NOR2X1 U151 ( .A(n148), .B(n1259), .Y(n146) );
  OAI21X1 U152 ( .A(n1264), .B(n148), .C(n149), .Y(n147) );
  NAND2X1 U157 ( .A(n149), .B(n1218), .Y(n61) );
  NAND2X1 U160 ( .A(n339), .B(n330), .Y(n149) );
  XOR2X1 U161 ( .A(n163), .B(n62), .Y(product[38]) );
  AOI21X1 U162 ( .A(n1228), .B(n1313), .C(n156), .Y(n154) );
  AOI21X1 U166 ( .A(n172), .B(n159), .C(n160), .Y(n52) );
  NOR2X1 U167 ( .A(n161), .B(n166), .Y(n159) );
  OAI21X1 U168 ( .A(n161), .B(n169), .C(n162), .Y(n160) );
  NAND2X1 U169 ( .A(n162), .B(n282), .Y(n62) );
  NOR2X1 U171 ( .A(n340), .B(n349), .Y(n161) );
  NAND2X1 U172 ( .A(n340), .B(n349), .Y(n162) );
  XOR2X1 U173 ( .A(n170), .B(n63), .Y(product[37]) );
  AOI21X1 U174 ( .A(n164), .B(n1313), .C(n165), .Y(n163) );
  NOR2X1 U175 ( .A(n1224), .B(n173), .Y(n164) );
  OAI21X1 U176 ( .A(n174), .B(n1224), .C(n169), .Y(n165) );
  NAND2X1 U179 ( .A(n169), .B(n283), .Y(n63) );
  NOR2X1 U181 ( .A(n350), .B(n361), .Y(n166) );
  NAND2X1 U182 ( .A(n350), .B(n361), .Y(n169) );
  XOR2X1 U183 ( .A(n179), .B(n64), .Y(product[36]) );
  AOI21X1 U184 ( .A(n1276), .B(n1082), .C(n172), .Y(n170) );
  NOR2X1 U189 ( .A(n182), .B(n177), .Y(n171) );
  OAI21X1 U190 ( .A(n177), .B(n183), .C(n178), .Y(n172) );
  NAND2X1 U191 ( .A(n178), .B(n284), .Y(n64) );
  NOR2X1 U193 ( .A(n373), .B(n362), .Y(n177) );
  NAND2X1 U194 ( .A(n373), .B(n362), .Y(n178) );
  XNOR2X1 U195 ( .A(n1082), .B(n65), .Y(product[35]) );
  AOI21X1 U196 ( .A(n285), .B(n1082), .C(n181), .Y(n179) );
  NAND2X1 U199 ( .A(n183), .B(n285), .Y(n65) );
  NOR2X1 U201 ( .A(n387), .B(n374), .Y(n182) );
  NAND2X1 U202 ( .A(n387), .B(n374), .Y(n183) );
  XOR2X1 U203 ( .A(n191), .B(n66), .Y(product[34]) );
  OAI21X1 U204 ( .A(n213), .B(n185), .C(n186), .Y(n51) );
  NAND2X1 U205 ( .A(n187), .B(n199), .Y(n185) );
  AOI21X1 U206 ( .A(n187), .B(n200), .C(n188), .Y(n186) );
  NOR2X1 U207 ( .A(n194), .B(n189), .Y(n187) );
  OAI21X1 U208 ( .A(n189), .B(n197), .C(n190), .Y(n188) );
  NAND2X1 U209 ( .A(n190), .B(n286), .Y(n66) );
  NOR2X1 U211 ( .A(n401), .B(n388), .Y(n189) );
  NAND2X1 U212 ( .A(n401), .B(n388), .Y(n190) );
  XOR2X1 U213 ( .A(n198), .B(n67), .Y(product[33]) );
  AOI21X1 U214 ( .A(n212), .B(n192), .C(n193), .Y(n191) );
  NOR2X1 U215 ( .A(n1222), .B(n201), .Y(n192) );
  OAI21X1 U216 ( .A(n202), .B(n1222), .C(n197), .Y(n193) );
  NAND2X1 U219 ( .A(n197), .B(n287), .Y(n67) );
  NOR2X1 U221 ( .A(n415), .B(n402), .Y(n194) );
  NAND2X1 U222 ( .A(n415), .B(n402), .Y(n197) );
  XOR2X1 U223 ( .A(n207), .B(n68), .Y(product[32]) );
  AOI21X1 U224 ( .A(n1063), .B(n212), .C(n1209), .Y(n198) );
  NOR2X1 U229 ( .A(n210), .B(n1064), .Y(n199) );
  OAI21X1 U230 ( .A(n205), .B(n211), .C(n206), .Y(n200) );
  NAND2X1 U231 ( .A(n206), .B(n288), .Y(n68) );
  NOR2X1 U233 ( .A(n429), .B(n416), .Y(n205) );
  NAND2X1 U234 ( .A(n429), .B(n416), .Y(n206) );
  XNOR2X1 U235 ( .A(n212), .B(n69), .Y(product[31]) );
  AOI21X1 U236 ( .A(n289), .B(n212), .C(n209), .Y(n207) );
  NAND2X1 U239 ( .A(n211), .B(n289), .Y(n69) );
  NOR2X1 U241 ( .A(n430), .B(n443), .Y(n210) );
  NAND2X1 U242 ( .A(n430), .B(n443), .Y(n211) );
  XNOR2X1 U243 ( .A(n218), .B(n70), .Y(product[30]) );
  AOI21X1 U245 ( .A(n222), .B(n214), .C(n215), .Y(n213) );
  NOR2X1 U246 ( .A(n219), .B(n216), .Y(n214) );
  OAI21X1 U247 ( .A(n216), .B(n220), .C(n217), .Y(n215) );
  NAND2X1 U248 ( .A(n217), .B(n290), .Y(n70) );
  NOR2X1 U250 ( .A(n457), .B(n444), .Y(n216) );
  NAND2X1 U251 ( .A(n457), .B(n1096), .Y(n217) );
  OAI21X1 U252 ( .A(n221), .B(n219), .C(n220), .Y(n218) );
  NOR2X1 U253 ( .A(n469), .B(n458), .Y(n219) );
  NAND2X1 U254 ( .A(n469), .B(n458), .Y(n220) );
  OAI21X1 U256 ( .A(n223), .B(n233), .C(n224), .Y(n222) );
  NAND2X1 U257 ( .A(n1235), .B(n1231), .Y(n223) );
  AOI21X1 U258 ( .A(n1234), .B(n1231), .C(n1236), .Y(n224) );
  AOI21X1 U267 ( .A(n240), .B(n234), .C(n235), .Y(n233) );
  NOR2X1 U268 ( .A(n238), .B(n236), .Y(n234) );
  OAI21X1 U269 ( .A(n236), .B(n239), .C(n237), .Y(n235) );
  NOR2X1 U270 ( .A(n501), .B(n492), .Y(n236) );
  NAND2X1 U271 ( .A(n501), .B(n492), .Y(n237) );
  NOR2X1 U272 ( .A(n509), .B(n502), .Y(n238) );
  NAND2X1 U273 ( .A(n509), .B(n502), .Y(n239) );
  OAI21X1 U274 ( .A(n243), .B(n241), .C(n242), .Y(n240) );
  NOR2X1 U275 ( .A(n517), .B(n510), .Y(n241) );
  NAND2X1 U276 ( .A(n517), .B(n510), .Y(n242) );
  AOI21X1 U277 ( .A(n1233), .B(n248), .C(n1237), .Y(n243) );
  OAI21X1 U282 ( .A(n251), .B(n249), .C(n250), .Y(n248) );
  NOR2X1 U283 ( .A(n529), .B(n524), .Y(n249) );
  NAND2X1 U284 ( .A(n529), .B(n524), .Y(n250) );
  AOI21X1 U285 ( .A(n256), .B(n1232), .C(n1238), .Y(n251) );
  OAI21X1 U290 ( .A(n257), .B(n259), .C(n258), .Y(n256) );
  NOR2X1 U291 ( .A(n537), .B(n534), .Y(n257) );
  NAND2X1 U292 ( .A(n537), .B(n534), .Y(n258) );
  AOI21X1 U293 ( .A(n264), .B(n1241), .C(n1242), .Y(n259) );
  OAI21X1 U298 ( .A(n265), .B(n267), .C(n266), .Y(n264) );
  NOR2X1 U299 ( .A(n707), .B(n540), .Y(n265) );
  NAND2X1 U300 ( .A(n707), .B(n540), .Y(n266) );
  AOI21X1 U301 ( .A(n1244), .B(n1019), .C(n1024), .Y(n267) );
  XOR2X1 U308 ( .A(n295), .B(n291), .Y(n292) );
  FAX1 U310 ( .A(n296), .B(n584), .C(n299), .YC(n293), .YS(n294) );
  FAX1 U312 ( .A(n585), .B(n300), .C(n303), .YC(n297), .YS(n298) );
  FAX1 U313 ( .A(n305), .B(n574), .C(n601), .YC(n299), .YS(n300) );
  FAX1 U314 ( .A(n311), .B(n304), .C(n309), .YC(n301), .YS(n302) );
  FAX1 U315 ( .A(n306), .B(n586), .C(n602), .YC(n303), .YS(n304) );
  FAX1 U317 ( .A(n317), .B(n315), .C(n310), .YC(n307), .YS(n308) );
  FAX1 U318 ( .A(n587), .B(n603), .C(n312), .YC(n309), .YS(n310) );
  FAX1 U319 ( .A(n319), .B(n575), .C(n619), .YC(n311), .YS(n312) );
  FAX1 U320 ( .A(n318), .B(n316), .C(n323), .YC(n313), .YS(n314) );
  FAX1 U321 ( .A(n588), .B(n327), .C(n325), .YC(n315), .YS(n316) );
  FAX1 U322 ( .A(n320), .B(n604), .C(n620), .YC(n317), .YS(n318) );
  FAX1 U324 ( .A(n333), .B(n324), .C(n331), .YC(n321), .YS(n322) );
  FAX1 U325 ( .A(n328), .B(n335), .C(n326), .YC(n323), .YS(n324) );
  FAX1 U326 ( .A(n589), .B(n605), .C(n621), .YC(n325), .YS(n326) );
  FAX1 U327 ( .A(n337), .B(n576), .C(n637), .YC(n327), .YS(n328) );
  FAX1 U328 ( .A(n343), .B(n332), .C(n341), .YC(n329), .YS(n330) );
  FAX1 U330 ( .A(n606), .B(n590), .C(n347), .YC(n333), .YS(n334) );
  FAX1 U331 ( .A(n338), .B(n622), .C(n638), .YC(n335), .YS(n336) );
  FAX1 U333 ( .A(n344), .B(n351), .C(n342), .YC(n339), .YS(n340) );
  FAX1 U334 ( .A(n355), .B(n346), .C(n353), .YC(n341), .YS(n342) );
  FAX1 U335 ( .A(n591), .B(n348), .C(n357), .YC(n343), .YS(n344) );
  FAX1 U336 ( .A(n607), .B(n623), .C(n639), .YC(n345), .YS(n346) );
  FAX1 U337 ( .A(n359), .B(n577), .C(n655), .YC(n347), .YS(n348) );
  FAX1 U338 ( .A(n354), .B(n352), .C(n363), .YC(n349), .YS(n350) );
  FAX1 U341 ( .A(n592), .B(n608), .C(n640), .YC(n355), .YS(n356) );
  FAX1 U348 ( .A(n609), .B(n673), .C(n657), .YC(n369), .YS(n370) );
  FAX1 U350 ( .A(n378), .B(n389), .C(n376), .YC(n373), .YS(n374) );
  FAX1 U352 ( .A(n395), .B(n384), .C(n382), .YC(n377), .YS(n378) );
  FAX1 U353 ( .A(n610), .B(n399), .C(n397), .YC(n379), .YS(n380) );
  FAX1 U354 ( .A(n658), .B(n594), .C(n626), .YC(n381), .YS(n382) );
  FAX1 U355 ( .A(n1223), .B(n642), .C(n674), .YC(n383), .YS(n384) );
  FAX1 U357 ( .A(n392), .B(n403), .C(n390), .YC(n387), .YS(n388) );
  FAX1 U359 ( .A(n1226), .B(n1017), .C(n398), .YC(n391), .YS(n392) );
  FAX1 U361 ( .A(n595), .B(n659), .C(n611), .YC(n395), .YS(n396) );
  FAX1 U362 ( .A(n627), .B(n691), .C(n675), .YC(n397), .YS(n398) );
  FAX1 U364 ( .A(n406), .B(n417), .C(n404), .YC(n401), .YS(n402) );
  FAX1 U365 ( .A(n421), .B(n408), .C(n419), .YC(n403), .YS(n404) );
  FAX1 U375 ( .A(n661), .B(n613), .C(n677), .YC(n423), .YS(n424) );
  FAX1 U377 ( .A(n1252), .B(n581), .C(n645), .YC(n427), .YS(n428) );
  FAX1 U378 ( .A(n434), .B(n445), .C(n432), .YC(n429), .YS(n430) );
  FAX1 U379 ( .A(n449), .B(n436), .C(n447), .YC(n431), .YS(n432) );
  FAX1 U380 ( .A(n1126), .B(n438), .C(n440), .YC(n433), .YS(n434) );
  FAX1 U384 ( .A(n582), .B(n614), .C(n662), .YC(n441), .YS(n442) );
  FAX1 U385 ( .A(n448), .B(n1014), .C(n446), .YC(n443), .YS(n444) );
  FAX1 U387 ( .A(n465), .B(n452), .C(n454), .YC(n447), .YS(n448) );
  FAX1 U392 ( .A(n462), .B(n471), .C(n460), .YC(n457), .YS(n458) );
  FAX1 U393 ( .A(n468), .B(n464), .C(n473), .YC(n459), .YS(n460) );
  FAX1 U395 ( .A(n696), .B(n680), .C(n479), .YC(n463), .YS(n464) );
  FAX1 U396 ( .A(n712), .B(n648), .C(n664), .YC(n465), .YS(n466) );
  FAX1 U397 ( .A(n600), .B(n632), .C(n616), .YC(n467), .YS(n468) );
  FAX1 U401 ( .A(n665), .B(n649), .C(n566), .YC(n475), .YS(n476) );
  FAX1 U402 ( .A(n633), .B(n681), .C(n617), .YC(n477), .YS(n478) );
  HAX1 U403 ( .A(n713), .B(n697), .YC(n479), .YS(n480) );
  FAX1 U404 ( .A(n486), .B(n493), .C(n484), .YC(n481), .YS(n482) );
  FAX1 U405 ( .A(n490), .B(n488), .C(n495), .YC(n483), .YS(n484) );
  FAX1 U408 ( .A(n618), .B(n650), .C(n634), .YC(n489), .YS(n490) );
  FAX1 U409 ( .A(n496), .B(n1015), .C(n494), .YC(n491), .YS(n492) );
  FAX1 U410 ( .A(n507), .B(n505), .C(n498), .YC(n493), .YS(n494) );
  FAX1 U411 ( .A(n699), .B(n567), .C(n500), .YC(n495), .YS(n496) );
  HAX1 U413 ( .A(n715), .B(n651), .YC(n499), .YS(n500) );
  FAX1 U414 ( .A(n506), .B(n511), .C(n504), .YC(n501), .YS(n502) );
  FAX1 U415 ( .A(n515), .B(n995), .C(n508), .YC(n503), .YS(n504) );
  FAX1 U416 ( .A(n716), .B(n684), .C(n700), .YC(n505), .YS(n506) );
  FAX1 U417 ( .A(n636), .B(n668), .C(n652), .YC(n507), .YS(n508) );
  FAX1 U418 ( .A(n514), .B(n519), .C(n512), .YC(n509), .YS(n510) );
  FAX1 U419 ( .A(n568), .B(n516), .C(n521), .YC(n511), .YS(n512) );
  FAX1 U420 ( .A(n685), .B(n669), .C(n653), .YC(n513), .YS(n514) );
  HAX1 U421 ( .A(n717), .B(n701), .YC(n515), .YS(n516) );
  FAX1 U422 ( .A(n525), .B(n522), .C(n520), .YC(n517), .YS(n518) );
  FAX1 U423 ( .A(n718), .B(n702), .C(n527), .YC(n519), .YS(n520) );
  FAX1 U424 ( .A(n654), .B(n686), .C(n670), .YC(n521), .YS(n522) );
  FAX1 U425 ( .A(n528), .B(n531), .C(n526), .YC(n523), .YS(n524) );
  FAX1 U426 ( .A(n719), .B(n569), .C(n671), .YC(n525), .YS(n526) );
  HAX1 U427 ( .A(n703), .B(n687), .YC(n527), .YS(n528) );
  FAX1 U428 ( .A(n704), .B(n535), .C(n532), .YC(n529), .YS(n530) );
  FAX1 U429 ( .A(n672), .B(n720), .C(n688), .YC(n531), .YS(n532) );
  FAX1 U430 ( .A(n570), .B(n689), .C(n536), .YC(n533), .YS(n534) );
  HAX1 U431 ( .A(n705), .B(n721), .YC(n535), .YS(n536) );
  FAX1 U432 ( .A(n690), .B(n722), .C(n706), .YC(n537), .YS(n538) );
  HAX1 U433 ( .A(n723), .B(n571), .YC(n539), .YS(n540) );
  NOR2X1 U434 ( .A(n918), .B(n1347), .Y(n573) );
  NOR2X1 U435 ( .A(n918), .B(n727), .Y(n295) );
  NOR2X1 U436 ( .A(n918), .B(n1345), .Y(n574) );
  NOR2X1 U437 ( .A(n918), .B(n1343), .Y(n305) );
  NOR2X1 U438 ( .A(n918), .B(n730), .Y(n575) );
  NOR2X1 U439 ( .A(n918), .B(n1340), .Y(n319) );
  NOR2X1 U440 ( .A(n918), .B(n1053), .Y(n576) );
  NOR2X1 U441 ( .A(n918), .B(n733), .Y(n337) );
  NOR2X1 U442 ( .A(n918), .B(n734), .Y(n577) );
  NOR2X1 U444 ( .A(n918), .B(n736), .Y(n578) );
  NOR2X1 U446 ( .A(n918), .B(n1334), .Y(n579) );
  NOR2X1 U447 ( .A(n918), .B(n739), .Y(n580) );
  OAI22X1 U466 ( .A(n918), .B(n1310), .C(n1309), .D(n757), .Y(n565) );
  OAI22X1 U469 ( .A(n918), .B(n1309), .C(n1311), .D(n741), .Y(n584) );
  OAI22X1 U470 ( .A(n1311), .B(n742), .C(n1309), .D(n741), .Y(n585) );
  OAI22X1 U471 ( .A(n1311), .B(n743), .C(n1309), .D(n742), .Y(n586) );
  OAI22X1 U472 ( .A(n1311), .B(n744), .C(n1309), .D(n743), .Y(n587) );
  OAI22X1 U473 ( .A(n1311), .B(n745), .C(n1309), .D(n744), .Y(n588) );
  OAI22X1 U474 ( .A(n1311), .B(n746), .C(n1309), .D(n745), .Y(n589) );
  OAI22X1 U475 ( .A(n1311), .B(n747), .C(n1309), .D(n746), .Y(n590) );
  OAI22X1 U476 ( .A(n1311), .B(n748), .C(n1309), .D(n747), .Y(n591) );
  OAI22X1 U477 ( .A(n1311), .B(n749), .C(n1309), .D(n748), .Y(n592) );
  OAI22X1 U478 ( .A(n1311), .B(n750), .C(n1309), .D(n749), .Y(n593) );
  OAI22X1 U479 ( .A(n1311), .B(n751), .C(n1309), .D(n750), .Y(n594) );
  OAI22X1 U480 ( .A(n1310), .B(n752), .C(n1309), .D(n751), .Y(n595) );
  OAI22X1 U481 ( .A(n1311), .B(n753), .C(n1309), .D(n752), .Y(n596) );
  OAI22X1 U482 ( .A(n1310), .B(n754), .C(n1309), .D(n753), .Y(n597) );
  OAI22X1 U483 ( .A(n1310), .B(n755), .C(n1309), .D(n754), .Y(n598) );
  OAI22X1 U484 ( .A(n1309), .B(n755), .C(n1310), .D(n756), .Y(n599) );
  XNOR2X1 U487 ( .A(n1348), .B(n1329), .Y(n741) );
  XNOR2X1 U488 ( .A(n878), .B(n1329), .Y(n742) );
  XNOR2X1 U489 ( .A(n1346), .B(n1329), .Y(n743) );
  XNOR2X1 U490 ( .A(n1344), .B(n1329), .Y(n744) );
  XNOR2X1 U491 ( .A(n881), .B(n1329), .Y(n745) );
  XNOR2X1 U492 ( .A(n1341), .B(n1329), .Y(n746) );
  XNOR2X1 U493 ( .A(n883), .B(n1329), .Y(n747) );
  XNOR2X1 U494 ( .A(n1084), .B(n1328), .Y(n748) );
  XNOR2X1 U495 ( .A(n885), .B(n1328), .Y(n749) );
  XNOR2X1 U496 ( .A(n1339), .B(n1328), .Y(n750) );
  XNOR2X1 U497 ( .A(n887), .B(n1328), .Y(n751) );
  XNOR2X1 U502 ( .A(n1349), .B(n1328), .Y(n756) );
  OAI22X1 U505 ( .A(n919), .B(n1307), .C(n1060), .D(n774), .Y(n566) );
  OAI22X1 U508 ( .A(n919), .B(n1122), .C(n1056), .D(n758), .Y(n602) );
  OAI22X1 U509 ( .A(n1148), .B(n759), .C(n1122), .D(n758), .Y(n603) );
  OAI22X1 U510 ( .A(n1307), .B(n760), .C(n1060), .D(n759), .Y(n604) );
  OAI22X1 U511 ( .A(n1056), .B(n761), .C(n1122), .D(n760), .Y(n605) );
  OAI22X1 U512 ( .A(n1307), .B(n762), .C(n1060), .D(n761), .Y(n606) );
  OAI22X1 U513 ( .A(n1148), .B(n763), .C(n1122), .D(n762), .Y(n607) );
  OAI22X1 U514 ( .A(n1307), .B(n764), .C(n1060), .D(n763), .Y(n608) );
  OAI22X1 U515 ( .A(n1307), .B(n765), .C(n1122), .D(n764), .Y(n609) );
  OAI22X1 U516 ( .A(n1056), .B(n766), .C(n1060), .D(n765), .Y(n610) );
  OAI22X1 U517 ( .A(n1307), .B(n767), .C(n1122), .D(n766), .Y(n611) );
  OAI22X1 U518 ( .A(n1148), .B(n768), .C(n1305), .D(n767), .Y(n612) );
  OAI22X1 U519 ( .A(n1055), .B(n1307), .C(n1122), .D(n768), .Y(n613) );
  OAI22X1 U520 ( .A(n1147), .B(n770), .C(n1305), .D(n769), .Y(n614) );
  OAI22X1 U521 ( .A(n1307), .B(n771), .C(n1122), .D(n770), .Y(n615) );
  OAI22X1 U522 ( .A(n1056), .B(n772), .C(n1060), .D(n771), .Y(n616) );
  OAI22X1 U523 ( .A(n1122), .B(n772), .C(n1148), .D(n773), .Y(n617) );
  XNOR2X1 U526 ( .A(n1348), .B(n1005), .Y(n758) );
  XNOR2X1 U527 ( .A(n878), .B(n1005), .Y(n759) );
  XNOR2X1 U528 ( .A(n1346), .B(n1005), .Y(n760) );
  XNOR2X1 U529 ( .A(n1344), .B(n1005), .Y(n761) );
  XNOR2X1 U530 ( .A(n881), .B(n1005), .Y(n762) );
  XNOR2X1 U531 ( .A(n1341), .B(n1005), .Y(n763) );
  XNOR2X1 U532 ( .A(n883), .B(n1005), .Y(n764) );
  XNOR2X1 U533 ( .A(n884), .B(n1005), .Y(n765) );
  XNOR2X1 U534 ( .A(n885), .B(n1005), .Y(n766) );
  XNOR2X1 U535 ( .A(n1339), .B(n1250), .Y(n767) );
  XNOR2X1 U536 ( .A(n887), .B(n1251), .Y(n768) );
  XNOR2X1 U539 ( .A(n1333), .B(n1250), .Y(n771) );
  XNOR2X1 U540 ( .A(n1331), .B(n1251), .Y(n772) );
  XNOR2X1 U541 ( .A(n1003), .B(n1250), .Y(n773) );
  OR2X1 U542 ( .A(n1350), .B(n919), .Y(n774) );
  OAI22X1 U544 ( .A(n920), .B(n1304), .C(n1303), .D(n791), .Y(n567) );
  OAI22X1 U547 ( .A(n920), .B(n1303), .C(n1304), .D(n775), .Y(n620) );
  OAI22X1 U548 ( .A(n1304), .B(n776), .C(n1303), .D(n775), .Y(n621) );
  OAI22X1 U549 ( .A(n1304), .B(n777), .C(n1303), .D(n776), .Y(n622) );
  OAI22X1 U550 ( .A(n1304), .B(n778), .C(n1303), .D(n777), .Y(n623) );
  OAI22X1 U551 ( .A(n1304), .B(n779), .C(n1303), .D(n778), .Y(n624) );
  OAI22X1 U552 ( .A(n1304), .B(n780), .C(n1303), .D(n779), .Y(n625) );
  OAI22X1 U553 ( .A(n1304), .B(n781), .C(n1303), .D(n780), .Y(n626) );
  OAI22X1 U554 ( .A(n1304), .B(n782), .C(n1303), .D(n781), .Y(n627) );
  OAI22X1 U555 ( .A(n1304), .B(n783), .C(n1303), .D(n782), .Y(n628) );
  OAI22X1 U556 ( .A(n1304), .B(n784), .C(n1303), .D(n783), .Y(n629) );
  OAI22X1 U557 ( .A(n1304), .B(n785), .C(n1303), .D(n784), .Y(n630) );
  OAI22X1 U558 ( .A(n1304), .B(n786), .C(n1303), .D(n785), .Y(n631) );
  OAI22X1 U559 ( .A(n1304), .B(n787), .C(n1303), .D(n786), .Y(n632) );
  OAI22X1 U560 ( .A(n1304), .B(n788), .C(n1303), .D(n787), .Y(n633) );
  OAI22X1 U561 ( .A(n1304), .B(n789), .C(n1303), .D(n788), .Y(n634) );
  OAI22X1 U562 ( .A(n1303), .B(n789), .C(n1304), .D(n790), .Y(n635) );
  XNOR2X1 U565 ( .A(n1348), .B(n1008), .Y(n775) );
  XNOR2X1 U566 ( .A(n878), .B(n1008), .Y(n776) );
  XNOR2X1 U567 ( .A(n1346), .B(n1008), .Y(n777) );
  XNOR2X1 U568 ( .A(n1344), .B(n1008), .Y(n778) );
  XNOR2X1 U570 ( .A(n1341), .B(n1008), .Y(n780) );
  XNOR2X1 U571 ( .A(n883), .B(n1008), .Y(n781) );
  XNOR2X1 U572 ( .A(n884), .B(n1008), .Y(n782) );
  XNOR2X1 U573 ( .A(n885), .B(n1008), .Y(n783) );
  XNOR2X1 U574 ( .A(n1339), .B(n1008), .Y(n784) );
  XNOR2X1 U575 ( .A(n887), .B(n1253), .Y(n785) );
  XNOR2X1 U577 ( .A(n1335), .B(n1253), .Y(n787) );
  XNOR2X1 U578 ( .A(n1333), .B(n1008), .Y(n788) );
  XNOR2X1 U579 ( .A(n1331), .B(n1253), .Y(n789) );
  XNOR2X1 U580 ( .A(n1350), .B(n1007), .Y(n790) );
  OR2X1 U581 ( .A(n1002), .B(n920), .Y(n791) );
  OAI22X1 U583 ( .A(n921), .B(n1012), .C(n1144), .D(n808), .Y(n568) );
  OAI22X1 U586 ( .A(n921), .B(n1145), .C(n1013), .D(n792), .Y(n638) );
  OAI22X1 U587 ( .A(n1013), .B(n793), .C(n1144), .D(n792), .Y(n639) );
  OAI22X1 U588 ( .A(n1013), .B(n794), .C(n1145), .D(n793), .Y(n640) );
  OAI22X1 U589 ( .A(n1012), .B(n795), .C(n1145), .D(n794), .Y(n641) );
  OAI22X1 U590 ( .A(n1012), .B(n796), .C(n1144), .D(n795), .Y(n642) );
  OAI22X1 U591 ( .A(n1012), .B(n797), .C(n796), .D(n1145), .Y(n643) );
  OAI22X1 U592 ( .A(n1013), .B(n1061), .C(n1145), .D(n797), .Y(n644) );
  OAI22X1 U593 ( .A(n1011), .B(n799), .C(n1144), .D(n798), .Y(n645) );
  OAI22X1 U594 ( .A(n1013), .B(n800), .C(n1144), .D(n799), .Y(n646) );
  OAI22X1 U595 ( .A(n1012), .B(n801), .C(n1144), .D(n800), .Y(n647) );
  OAI22X1 U596 ( .A(n1300), .B(n802), .C(n1145), .D(n801), .Y(n648) );
  OAI22X1 U597 ( .A(n1300), .B(n803), .C(n1144), .D(n802), .Y(n649) );
  OAI22X1 U598 ( .A(n1300), .B(n804), .C(n1144), .D(n803), .Y(n650) );
  OAI22X1 U599 ( .A(n1012), .B(n805), .C(n1144), .D(n804), .Y(n651) );
  OAI22X1 U600 ( .A(n1012), .B(n806), .C(n1145), .D(n805), .Y(n652) );
  OAI22X1 U601 ( .A(n1144), .B(n806), .C(n1013), .D(n807), .Y(n653) );
  AND2X1 U602 ( .A(n1002), .B(n552), .Y(n654) );
  XNOR2X1 U604 ( .A(n1348), .B(n1221), .Y(n792) );
  XNOR2X1 U605 ( .A(n878), .B(n1220), .Y(n793) );
  XNOR2X1 U606 ( .A(n1346), .B(n1221), .Y(n794) );
  XNOR2X1 U607 ( .A(n1344), .B(n1220), .Y(n795) );
  XNOR2X1 U608 ( .A(n881), .B(n1220), .Y(n796) );
  XNOR2X1 U609 ( .A(n1341), .B(n1221), .Y(n797) );
  XNOR2X1 U610 ( .A(n883), .B(n1220), .Y(n798) );
  XNOR2X1 U611 ( .A(n884), .B(n1221), .Y(n799) );
  XNOR2X1 U612 ( .A(n885), .B(n1220), .Y(n800) );
  XNOR2X1 U613 ( .A(n1339), .B(n1220), .Y(n801) );
  XNOR2X1 U614 ( .A(n887), .B(n1221), .Y(n802) );
  XNOR2X1 U615 ( .A(n1337), .B(n1221), .Y(n803) );
  XNOR2X1 U616 ( .A(n1335), .B(n1220), .Y(n804) );
  XNOR2X1 U617 ( .A(n1333), .B(n1221), .Y(n805) );
  XNOR2X1 U618 ( .A(n1331), .B(n1221), .Y(n806) );
  XNOR2X1 U619 ( .A(n1001), .B(n1220), .Y(n807) );
  OR2X1 U620 ( .A(n1003), .B(n921), .Y(n808) );
  OAI22X1 U622 ( .A(n922), .B(n1297), .C(n1295), .D(n825), .Y(n569) );
  OAI22X1 U625 ( .A(n922), .B(n1010), .C(n1298), .D(n809), .Y(n656) );
  OAI22X1 U626 ( .A(n1298), .B(n810), .C(n1010), .D(n809), .Y(n657) );
  OAI22X1 U627 ( .A(n1297), .B(n811), .C(n1295), .D(n810), .Y(n658) );
  OAI22X1 U628 ( .A(n1298), .B(n812), .C(n1010), .D(n811), .Y(n659) );
  OAI22X1 U629 ( .A(n1297), .B(n813), .C(n1295), .D(n812), .Y(n660) );
  OAI22X1 U630 ( .A(n1298), .B(n814), .C(n1010), .D(n813), .Y(n661) );
  OAI22X1 U631 ( .A(n1051), .B(n815), .C(n1295), .D(n814), .Y(n662) );
  OAI22X1 U632 ( .A(n1297), .B(n816), .C(n1010), .D(n815), .Y(n663) );
  OAI22X1 U633 ( .A(n1298), .B(n817), .C(n1295), .D(n816), .Y(n664) );
  OAI22X1 U634 ( .A(n1297), .B(n818), .C(n1010), .D(n817), .Y(n665) );
  OAI22X1 U635 ( .A(n1298), .B(n819), .C(n1295), .D(n818), .Y(n666) );
  OAI22X1 U636 ( .A(n1297), .B(n820), .C(n1010), .D(n819), .Y(n667) );
  OAI22X1 U637 ( .A(n1298), .B(n821), .C(n1295), .D(n820), .Y(n668) );
  OAI22X1 U638 ( .A(n1297), .B(n822), .C(n1010), .D(n821), .Y(n669) );
  OAI22X1 U639 ( .A(n1298), .B(n823), .C(n1295), .D(n822), .Y(n670) );
  OAI22X1 U640 ( .A(n1010), .B(n823), .C(n1298), .D(n824), .Y(n671) );
  AND2X1 U641 ( .A(n1350), .B(n1200), .Y(n672) );
  XNOR2X1 U643 ( .A(n1348), .B(n1321), .Y(n809) );
  XNOR2X1 U644 ( .A(n878), .B(n1321), .Y(n810) );
  XNOR2X1 U645 ( .A(n1346), .B(n1321), .Y(n811) );
  XNOR2X1 U646 ( .A(n1344), .B(n1321), .Y(n812) );
  XNOR2X1 U649 ( .A(n883), .B(n1321), .Y(n815) );
  XNOR2X1 U650 ( .A(n884), .B(n1321), .Y(n816) );
  XNOR2X1 U651 ( .A(n885), .B(n1321), .Y(n817) );
  XNOR2X1 U652 ( .A(n1339), .B(n996), .Y(n818) );
  XNOR2X1 U653 ( .A(n887), .B(n996), .Y(n819) );
  XNOR2X1 U654 ( .A(n1337), .B(n1258), .Y(n820) );
  XNOR2X1 U655 ( .A(n1335), .B(n1258), .Y(n821) );
  XNOR2X1 U656 ( .A(n1333), .B(n996), .Y(n822) );
  XNOR2X1 U657 ( .A(n1331), .B(n1258), .Y(n823) );
  XNOR2X1 U658 ( .A(n1350), .B(n996), .Y(n824) );
  OR2X1 U659 ( .A(n1003), .B(n922), .Y(n825) );
  OAI22X1 U661 ( .A(n923), .B(n1294), .C(n1293), .D(n842), .Y(n570) );
  OAI22X1 U664 ( .A(n923), .B(n1293), .C(n1294), .D(n826), .Y(n674) );
  OAI22X1 U665 ( .A(n1294), .B(n827), .C(n1293), .D(n826), .Y(n675) );
  OAI22X1 U666 ( .A(n1112), .B(n828), .C(n1050), .D(n827), .Y(n676) );
  OAI22X1 U667 ( .A(n1294), .B(n829), .C(n1293), .D(n828), .Y(n677) );
  OAI22X1 U668 ( .A(n1111), .B(n830), .C(n1050), .D(n829), .Y(n678) );
  OAI22X1 U669 ( .A(n1294), .B(n831), .C(n1050), .D(n830), .Y(n679) );
  OAI22X1 U670 ( .A(n1111), .B(n832), .C(n1293), .D(n831), .Y(n680) );
  OAI22X1 U671 ( .A(n1111), .B(n833), .C(n1293), .D(n832), .Y(n681) );
  OAI22X1 U672 ( .A(n1294), .B(n834), .C(n1293), .D(n833), .Y(n682) );
  OAI22X1 U673 ( .A(n1112), .B(n835), .C(n1293), .D(n834), .Y(n683) );
  OAI22X1 U674 ( .A(n1294), .B(n836), .C(n1293), .D(n835), .Y(n684) );
  OAI22X1 U675 ( .A(n1111), .B(n837), .C(n1293), .D(n836), .Y(n685) );
  OAI22X1 U676 ( .A(n1294), .B(n838), .C(n1293), .D(n837), .Y(n686) );
  OAI22X1 U677 ( .A(n1112), .B(n839), .C(n1293), .D(n838), .Y(n687) );
  OAI22X1 U678 ( .A(n1294), .B(n840), .C(n1293), .D(n839), .Y(n688) );
  OAI22X1 U679 ( .A(n1293), .B(n840), .C(n1294), .D(n841), .Y(n689) );
  AND2X1 U680 ( .A(n1003), .B(n558), .Y(n690) );
  XNOR2X1 U682 ( .A(n1348), .B(n998), .Y(n826) );
  XNOR2X1 U683 ( .A(n878), .B(n997), .Y(n827) );
  XNOR2X1 U684 ( .A(n1346), .B(n997), .Y(n828) );
  XNOR2X1 U685 ( .A(n1344), .B(n997), .Y(n829) );
  XNOR2X1 U687 ( .A(n1341), .B(n999), .Y(n831) );
  XNOR2X1 U688 ( .A(n883), .B(n998), .Y(n832) );
  XNOR2X1 U689 ( .A(n1084), .B(n999), .Y(n833) );
  XNOR2X1 U690 ( .A(n885), .B(n998), .Y(n834) );
  XNOR2X1 U691 ( .A(n1339), .B(n1260), .Y(n835) );
  XNOR2X1 U692 ( .A(n887), .B(n1261), .Y(n836) );
  XNOR2X1 U693 ( .A(n1337), .B(n1260), .Y(n837) );
  XNOR2X1 U694 ( .A(n1335), .B(n999), .Y(n838) );
  XNOR2X1 U695 ( .A(n1333), .B(n1260), .Y(n839) );
  XNOR2X1 U696 ( .A(n1331), .B(n1261), .Y(n840) );
  XNOR2X1 U697 ( .A(n1350), .B(n1260), .Y(n841) );
  OAI22X1 U700 ( .A(n924), .B(n1291), .C(n1031), .D(n859), .Y(n571) );
  OAI22X1 U703 ( .A(n924), .B(n1288), .C(n1291), .D(n843), .Y(n692) );
  OAI22X1 U704 ( .A(n1290), .B(n844), .C(n1288), .D(n843), .Y(n693) );
  OAI22X1 U706 ( .A(n1291), .B(n846), .C(n1288), .D(n845), .Y(n695) );
  OAI22X1 U707 ( .A(n1291), .B(n847), .C(n1031), .D(n846), .Y(n696) );
  OAI22X1 U708 ( .A(n1291), .B(n848), .C(n1288), .D(n847), .Y(n697) );
  OAI22X1 U709 ( .A(n1291), .B(n849), .C(n1031), .D(n848), .Y(n698) );
  OAI22X1 U710 ( .A(n1291), .B(n850), .C(n1288), .D(n849), .Y(n699) );
  OAI22X1 U711 ( .A(n1291), .B(n851), .C(n1031), .D(n850), .Y(n700) );
  OAI22X1 U712 ( .A(n1291), .B(n852), .C(n1288), .D(n851), .Y(n701) );
  OAI22X1 U713 ( .A(n1291), .B(n853), .C(n1031), .D(n852), .Y(n702) );
  OAI22X1 U714 ( .A(n1291), .B(n854), .C(n1288), .D(n853), .Y(n703) );
  OAI22X1 U715 ( .A(n1291), .B(n855), .C(n1031), .D(n854), .Y(n704) );
  OAI22X1 U716 ( .A(n1291), .B(n856), .C(n1288), .D(n855), .Y(n705) );
  OAI22X1 U717 ( .A(n1291), .B(n857), .C(n1031), .D(n856), .Y(n706) );
  OAI22X1 U718 ( .A(n1031), .B(n857), .C(n1291), .D(n858), .Y(n707) );
  AND2X1 U719 ( .A(n1350), .B(n1032), .Y(n708) );
  XNOR2X1 U722 ( .A(n878), .B(n1316), .Y(n844) );
  XNOR2X1 U723 ( .A(n1346), .B(n1316), .Y(n845) );
  XNOR2X1 U724 ( .A(n1344), .B(n1316), .Y(n846) );
  XNOR2X1 U725 ( .A(n881), .B(n1316), .Y(n847) );
  XNOR2X1 U726 ( .A(n1341), .B(n1316), .Y(n848) );
  XNOR2X1 U727 ( .A(n883), .B(n1316), .Y(n849) );
  XNOR2X1 U728 ( .A(n884), .B(n1316), .Y(n850) );
  XNOR2X1 U729 ( .A(n885), .B(n1316), .Y(n851) );
  XNOR2X1 U730 ( .A(n1339), .B(n1247), .Y(n852) );
  XNOR2X1 U731 ( .A(n1026), .B(n1247), .Y(n853) );
  XNOR2X1 U732 ( .A(n1337), .B(n1248), .Y(n854) );
  XNOR2X1 U733 ( .A(n1335), .B(n1247), .Y(n855) );
  XNOR2X1 U734 ( .A(n1333), .B(n1248), .Y(n856) );
  XNOR2X1 U735 ( .A(n1331), .B(n1248), .Y(n857) );
  XNOR2X1 U736 ( .A(n1002), .B(n1247), .Y(n858) );
  OR2X1 U737 ( .A(n1002), .B(n924), .Y(n859) );
  OAI22X1 U739 ( .A(n925), .B(n1121), .C(n1128), .D(n876), .Y(n572) );
  OAI22X1 U742 ( .A(n1128), .B(n925), .C(n1121), .D(n860), .Y(n710) );
  OAI22X1 U743 ( .A(n1121), .B(n861), .C(n1128), .D(n860), .Y(n711) );
  OAI22X1 U744 ( .A(n1121), .B(n862), .C(n1128), .D(n861), .Y(n712) );
  OAI22X1 U745 ( .A(n1121), .B(n863), .C(n1128), .D(n862), .Y(n713) );
  OAI22X1 U746 ( .A(n1121), .B(n864), .C(n1128), .D(n863), .Y(n714) );
  OAI22X1 U747 ( .A(n1121), .B(n865), .C(n1128), .D(n864), .Y(n715) );
  OAI22X1 U748 ( .A(n1121), .B(n866), .C(n1128), .D(n865), .Y(n716) );
  OAI22X1 U749 ( .A(n1287), .B(n867), .C(n1128), .D(n866), .Y(n717) );
  OAI22X1 U750 ( .A(n1121), .B(n868), .C(n1128), .D(n867), .Y(n718) );
  OAI22X1 U751 ( .A(n1121), .B(n869), .C(n1128), .D(n868), .Y(n719) );
  OAI22X1 U752 ( .A(n1287), .B(n870), .C(n1128), .D(n869), .Y(n720) );
  OAI22X1 U753 ( .A(n1121), .B(n871), .C(n1128), .D(n870), .Y(n721) );
  OAI22X1 U754 ( .A(n1121), .B(n872), .C(n1128), .D(n871), .Y(n722) );
  OAI22X1 U755 ( .A(n1287), .B(n873), .C(n1128), .D(n872), .Y(n723) );
  OAI22X1 U756 ( .A(n1121), .B(n874), .C(n1128), .D(n873), .Y(n724) );
  OAI22X1 U757 ( .A(n1128), .B(n874), .C(n1121), .D(n875), .Y(n725) );
  XNOR2X1 U758 ( .A(n1348), .B(n1108), .Y(n860) );
  XNOR2X1 U759 ( .A(n878), .B(n1108), .Y(n861) );
  XNOR2X1 U760 ( .A(n1346), .B(n1108), .Y(n862) );
  XNOR2X1 U761 ( .A(n1344), .B(n1000), .Y(n863) );
  XNOR2X1 U762 ( .A(n881), .B(n1000), .Y(n864) );
  XNOR2X1 U763 ( .A(n1341), .B(n1000), .Y(n865) );
  XNOR2X1 U764 ( .A(n883), .B(n1000), .Y(n866) );
  XNOR2X1 U765 ( .A(n1084), .B(n1000), .Y(n867) );
  XNOR2X1 U766 ( .A(n885), .B(n1000), .Y(n868) );
  XNOR2X1 U767 ( .A(n1339), .B(n1000), .Y(n869) );
  XNOR2X1 U768 ( .A(n887), .B(n1249), .Y(n870) );
  XNOR2X1 U769 ( .A(n1337), .B(n1249), .Y(n871) );
  XNOR2X1 U770 ( .A(n1335), .B(n1000), .Y(n872) );
  XNOR2X1 U771 ( .A(n1333), .B(n1249), .Y(n873) );
  XNOR2X1 U772 ( .A(n1331), .B(n1108), .Y(n874) );
  XNOR2X1 U773 ( .A(n1350), .B(n1249), .Y(n875) );
  OR2X1 U774 ( .A(n1350), .B(n925), .Y(n876) );
  XOR2X1 U802 ( .A(n1329), .B(b[14]), .Y(n893) );
  XOR2X1 U811 ( .A(n1219), .B(b[8]), .Y(n896) );
  XNOR2X1 U812 ( .A(n19), .B(b[8]), .Y(n28) );
  XOR2X1 U814 ( .A(n1258), .B(n1107), .Y(n897) );
  NAND2X1 U822 ( .A(n917), .B(n900), .Y(n6) );
  BUFX4 U828 ( .A(n513), .Y(n995) );
  INVX4 U829 ( .A(n1315), .Y(n1316) );
  INVX4 U830 ( .A(n1228), .Y(n1259) );
  BUFX2 U831 ( .A(n1257), .Y(n996) );
  AND2X2 U832 ( .A(n1350), .B(n546), .Y(n618) );
  INVX4 U833 ( .A(n1200), .Y(n1295) );
  INVX4 U834 ( .A(n1), .Y(n1314) );
  BUFX4 U835 ( .A(n1319), .Y(n997) );
  BUFX4 U836 ( .A(n1319), .Y(n998) );
  BUFX4 U837 ( .A(n1319), .Y(n999) );
  INVX2 U838 ( .A(n1318), .Y(n1319) );
  INVX4 U839 ( .A(n1120), .Y(n1294) );
  BUFX4 U840 ( .A(n1109), .Y(n1000) );
  BUFX4 U841 ( .A(n1306), .Y(n1122) );
  INVX8 U842 ( .A(n1192), .Y(n1307) );
  INVX4 U843 ( .A(n1299), .Y(n1144) );
  INVX4 U844 ( .A(n1189), .Y(n1297) );
  INVX4 U845 ( .A(n1292), .Y(n1293) );
  INVX8 U846 ( .A(n1347), .Y(n1348) );
  BUFX2 U847 ( .A(n1085), .Y(n1001) );
  BUFX4 U848 ( .A(n1085), .Y(n1002) );
  BUFX4 U849 ( .A(n1085), .Y(n1003) );
  INVX2 U850 ( .A(n1325), .Y(n1004) );
  INVX8 U851 ( .A(n1004), .Y(n1005) );
  INVX1 U852 ( .A(n1119), .Y(n1325) );
  INVX8 U853 ( .A(n1343), .Y(n1344) );
  INVX4 U854 ( .A(n880), .Y(n1343) );
  INVX4 U855 ( .A(n1323), .Y(n1006) );
  INVX2 U856 ( .A(n1006), .Y(n1007) );
  INVX8 U857 ( .A(n1006), .Y(n1008) );
  INVX8 U858 ( .A(n1054), .Y(n1328) );
  INVX2 U859 ( .A(n7), .Y(n1315) );
  INVX2 U860 ( .A(n1007), .Y(n1077) );
  INVX2 U861 ( .A(n635), .Y(n1058) );
  BUFX2 U862 ( .A(n428), .Y(n1263) );
  INVX2 U863 ( .A(n1289), .Y(n1290) );
  INVX2 U864 ( .A(n1057), .Y(n1323) );
  BUFX2 U865 ( .A(n1), .Y(n1109) );
  INVX2 U866 ( .A(n31), .Y(n1057) );
  BUFX2 U867 ( .A(n424), .Y(n1255) );
  INVX2 U868 ( .A(n1351), .Y(n1085) );
  INVX2 U869 ( .A(n6), .Y(n1286) );
  INVX4 U870 ( .A(n1345), .Y(n1346) );
  INVX4 U871 ( .A(n1338), .Y(n1339) );
  INVX2 U872 ( .A(n886), .Y(n1338) );
  INVX2 U873 ( .A(n1023), .Y(n1310) );
  BUFX2 U874 ( .A(n431), .Y(n1254) );
  INVX2 U875 ( .A(n1125), .Y(n1126) );
  BUFX2 U876 ( .A(n503), .Y(n1015) );
  INVX2 U877 ( .A(n1149), .Y(n600) );
  INVX2 U878 ( .A(n1048), .Y(n1049) );
  INVX2 U879 ( .A(n541), .Y(n1327) );
  BUFX2 U880 ( .A(n396), .Y(n1017) );
  BUFX2 U881 ( .A(n483), .Y(n1016) );
  BUFX2 U882 ( .A(n137), .Y(n1262) );
  INVX2 U883 ( .A(n366), .Y(n1094) );
  INVX2 U884 ( .A(n877), .Y(n1347) );
  INVX2 U885 ( .A(n51), .Y(n1312) );
  INVX4 U886 ( .A(n1312), .Y(n1313) );
  INVX2 U887 ( .A(n560), .Y(n691) );
  INVX4 U888 ( .A(n1320), .Y(n1321) );
  INVX2 U889 ( .A(n19), .Y(n1320) );
  BUFX4 U890 ( .A(n1296), .Y(n1009) );
  BUFX2 U891 ( .A(n1296), .Y(n1010) );
  INVX2 U892 ( .A(n1245), .Y(n1296) );
  INVX1 U893 ( .A(n183), .Y(n181) );
  BUFX2 U894 ( .A(n1301), .Y(n1011) );
  BUFX4 U895 ( .A(n1301), .Y(n1012) );
  BUFX4 U896 ( .A(n1301), .Y(n1013) );
  INVX2 U897 ( .A(n1246), .Y(n1301) );
  INVX1 U898 ( .A(n182), .Y(n285) );
  BUFX4 U899 ( .A(n459), .Y(n1014) );
  INVX4 U900 ( .A(n889), .Y(n1334) );
  INVX4 U901 ( .A(n1066), .Y(n1252) );
  INVX4 U902 ( .A(n1329), .Y(n918) );
  INVX2 U903 ( .A(n918), .Y(n1243) );
  OR2X2 U904 ( .A(n1262), .B(n80), .Y(n1018) );
  OR2X2 U905 ( .A(n708), .B(n724), .Y(n1019) );
  INVX2 U906 ( .A(n37), .Y(n1119) );
  AND2X2 U907 ( .A(n34), .B(n895), .Y(n1020) );
  AND2X2 U908 ( .A(n711), .B(n663), .Y(n1021) );
  OR2X2 U909 ( .A(n308), .B(n313), .Y(n1022) );
  AND2X2 U910 ( .A(n46), .B(n893), .Y(n1023) );
  INVX4 U911 ( .A(n1302), .Y(n1303) );
  INVX2 U912 ( .A(n34), .Y(n1302) );
  AND2X2 U913 ( .A(n708), .B(n724), .Y(n1024) );
  INVX2 U914 ( .A(n1351), .Y(n1349) );
  INVX2 U915 ( .A(n917), .Y(n1127) );
  INVX2 U916 ( .A(b[0]), .Y(n917) );
  INVX2 U917 ( .A(n879), .Y(n1345) );
  OR2X2 U918 ( .A(n292), .B(n293), .Y(n1025) );
  INVX2 U919 ( .A(n736), .Y(n1026) );
  AND2X2 U920 ( .A(n1350), .B(n1302), .Y(n636) );
  INVX2 U921 ( .A(n1312), .Y(n1082) );
  XOR2X1 U922 ( .A(n597), .B(n629), .Y(n1027) );
  XOR2X1 U923 ( .A(n693), .B(n1027), .Y(n426) );
  NAND2X1 U924 ( .A(n693), .B(n597), .Y(n1028) );
  NAND2X1 U925 ( .A(n693), .B(n629), .Y(n1029) );
  NAND2X1 U926 ( .A(n597), .B(n629), .Y(n1030) );
  NAND3X1 U927 ( .A(n1029), .B(n1028), .C(n1030), .Y(n425) );
  XOR2X1 U928 ( .A(n1314), .B(b[2]), .Y(n1031) );
  XOR2X1 U929 ( .A(n1347), .B(n1316), .Y(n843) );
  INVX2 U930 ( .A(n405), .Y(n1110) );
  XNOR2X1 U931 ( .A(n1314), .B(b[2]), .Y(n1032) );
  XOR2X1 U932 ( .A(n380), .B(n393), .Y(n1033) );
  XOR2X1 U933 ( .A(n391), .B(n1033), .Y(n376) );
  NAND2X1 U934 ( .A(n380), .B(n391), .Y(n1034) );
  NAND2X1 U935 ( .A(n391), .B(n393), .Y(n1035) );
  NAND2X1 U936 ( .A(n380), .B(n393), .Y(n1036) );
  NAND3X1 U937 ( .A(n1035), .B(n1034), .C(n1036), .Y(n375) );
  XNOR2X1 U938 ( .A(n1037), .B(n472), .Y(n470) );
  XNOR2X1 U939 ( .A(n474), .B(n1016), .Y(n1037) );
  XOR2X1 U940 ( .A(n1342), .B(n1321), .Y(n813) );
  INVX4 U941 ( .A(n49), .Y(n1351) );
  XOR2X1 U942 ( .A(n678), .B(n598), .Y(n1038) );
  XOR2X1 U943 ( .A(n1038), .B(n694), .Y(n438) );
  NAND2X1 U944 ( .A(n678), .B(n598), .Y(n1039) );
  NAND2X1 U945 ( .A(n678), .B(n694), .Y(n1040) );
  NAND2X1 U946 ( .A(n598), .B(n694), .Y(n1041) );
  NAND3X1 U947 ( .A(n1039), .B(n1040), .C(n1041), .Y(n437) );
  XOR2X1 U948 ( .A(n1263), .B(n441), .Y(n1042) );
  XOR2X1 U949 ( .A(n1042), .B(n437), .Y(n422) );
  NAND2X1 U950 ( .A(n1263), .B(n441), .Y(n1043) );
  NAND2X1 U951 ( .A(n1263), .B(n437), .Y(n1044) );
  NAND2X1 U952 ( .A(n441), .B(n437), .Y(n1045) );
  NAND3X1 U953 ( .A(n1043), .B(n1044), .C(n1045), .Y(n421) );
  OR2X2 U954 ( .A(n1290), .B(n845), .Y(n1046) );
  OR2X1 U955 ( .A(n1031), .B(n844), .Y(n1047) );
  NAND2X1 U956 ( .A(n1046), .B(n1047), .Y(n694) );
  NOR2X1 U957 ( .A(n918), .B(n1052), .Y(n581) );
  INVX4 U958 ( .A(n1052), .Y(n1331) );
  INVX2 U959 ( .A(n891), .Y(n1052) );
  INVX2 U960 ( .A(n489), .Y(n1048) );
  INVX2 U961 ( .A(n1062), .Y(n1050) );
  INVX2 U962 ( .A(n16), .Y(n1062) );
  INVX2 U963 ( .A(n1105), .Y(n1306) );
  NAND2X1 U964 ( .A(n897), .B(n1010), .Y(n1051) );
  INVX1 U965 ( .A(n891), .Y(n1330) );
  INVX2 U966 ( .A(n883), .Y(n1053) );
  BUFX2 U967 ( .A(n1327), .Y(n1054) );
  XOR2X1 U968 ( .A(n711), .B(n663), .Y(n456) );
  OR2X2 U969 ( .A(n918), .B(n1336), .Y(n1223) );
  XNOR2X1 U970 ( .A(n888), .B(n1251), .Y(n1055) );
  BUFX2 U971 ( .A(n1147), .Y(n1056) );
  OR2X1 U972 ( .A(n1083), .B(n1105), .Y(n1147) );
  BUFX2 U973 ( .A(n1317), .Y(n1248) );
  XNOR2X1 U974 ( .A(n888), .B(n1251), .Y(n769) );
  INVX2 U975 ( .A(n1318), .Y(n1260) );
  INVX2 U976 ( .A(n1009), .Y(n1200) );
  XOR2X1 U977 ( .A(n1340), .B(n1321), .Y(n814) );
  INVX4 U978 ( .A(n1340), .Y(n1341) );
  INVX2 U979 ( .A(n46), .Y(n1308) );
  INVX8 U980 ( .A(n881), .Y(n1342) );
  XOR2X1 U981 ( .A(n1059), .B(n1058), .Y(n498) );
  XNOR2X1 U982 ( .A(n667), .B(n683), .Y(n1059) );
  AND2X2 U983 ( .A(n1349), .B(n1329), .Y(n582) );
  INVX2 U984 ( .A(n546), .Y(n1060) );
  INVX1 U985 ( .A(n1105), .Y(n1305) );
  XOR2X1 U986 ( .A(n1330), .B(n1328), .Y(n755) );
  XNOR2X1 U987 ( .A(n883), .B(n1220), .Y(n1061) );
  INVX2 U988 ( .A(n201), .Y(n1063) );
  NOR2X1 U989 ( .A(n429), .B(n416), .Y(n1064) );
  INVX1 U990 ( .A(n16), .Y(n1292) );
  INVX8 U991 ( .A(n1020), .Y(n1304) );
  NAND3X1 U992 ( .A(n1211), .B(n1212), .C(n1213), .Y(n1065) );
  XNOR2X1 U993 ( .A(n37), .B(b[14]), .Y(n46) );
  OR2X2 U994 ( .A(n1003), .B(n923), .Y(n842) );
  INVX2 U995 ( .A(n1261), .Y(n923) );
  XNOR2X1 U996 ( .A(n1318), .B(b[4]), .Y(n898) );
  INVX1 U997 ( .A(n1318), .Y(n1261) );
  AOI22X1 U998 ( .A(n1127), .B(n1000), .C(n1286), .D(n1108), .Y(n1066) );
  INVX2 U999 ( .A(n1127), .Y(n1128) );
  XOR2X1 U1000 ( .A(n1336), .B(n1328), .Y(n752) );
  INVX4 U1001 ( .A(n1336), .Y(n1337) );
  BUFX2 U1002 ( .A(n615), .Y(n1067) );
  BUFX2 U1003 ( .A(n451), .Y(n1068) );
  XOR2X1 U1004 ( .A(n1332), .B(n1328), .Y(n754) );
  INVX1 U1005 ( .A(n887), .Y(n736) );
  XOR2X1 U1006 ( .A(n360), .B(n624), .Y(n1069) );
  XOR2X1 U1007 ( .A(n1069), .B(n656), .Y(n358) );
  XOR2X1 U1008 ( .A(n371), .B(n369), .Y(n1070) );
  XOR2X1 U1009 ( .A(n1070), .B(n358), .Y(n354) );
  NAND2X1 U1010 ( .A(n360), .B(n624), .Y(n1071) );
  NAND2X1 U1011 ( .A(n360), .B(n656), .Y(n1072) );
  NAND2X1 U1012 ( .A(n624), .B(n656), .Y(n1073) );
  NAND3X1 U1013 ( .A(n1071), .B(n1072), .C(n1073), .Y(n357) );
  NAND2X1 U1014 ( .A(n371), .B(n369), .Y(n1074) );
  NAND2X1 U1015 ( .A(n371), .B(n358), .Y(n1075) );
  NAND2X1 U1016 ( .A(n369), .B(n358), .Y(n1076) );
  NAND3X1 U1017 ( .A(n1074), .B(n1075), .C(n1076), .Y(n353) );
  XOR2X1 U1018 ( .A(n881), .B(n1077), .Y(n779) );
  XOR2X1 U1019 ( .A(n456), .B(n647), .Y(n1078) );
  XOR2X1 U1020 ( .A(n467), .B(n1078), .Y(n450) );
  NAND2X1 U1021 ( .A(n467), .B(n456), .Y(n1079) );
  NAND2X1 U1022 ( .A(n467), .B(n647), .Y(n1080) );
  NAND2X1 U1023 ( .A(n456), .B(n647), .Y(n1081) );
  NAND3X1 U1024 ( .A(n1080), .B(n1079), .C(n1081), .Y(n449) );
  INVX1 U1025 ( .A(n1221), .Y(n921) );
  INVX1 U1026 ( .A(n222), .Y(n221) );
  XNOR2X1 U1027 ( .A(n1326), .B(n1123), .Y(n1083) );
  INVX1 U1028 ( .A(n1246), .Y(n1300) );
  BUFX2 U1029 ( .A(n884), .Y(n1084) );
  XOR2X1 U1030 ( .A(n714), .B(n666), .Y(n1086) );
  XOR2X1 U1031 ( .A(n1086), .B(n682), .Y(n488) );
  NAND2X1 U1032 ( .A(n714), .B(n666), .Y(n1087) );
  NAND2X1 U1033 ( .A(n714), .B(n682), .Y(n1088) );
  NAND2X1 U1034 ( .A(n666), .B(n682), .Y(n1089) );
  NAND3X1 U1035 ( .A(n1087), .B(n1088), .C(n1089), .Y(n487) );
  XOR2X1 U1036 ( .A(n480), .B(n1049), .Y(n1090) );
  XOR2X1 U1037 ( .A(n1090), .B(n487), .Y(n474) );
  NAND2X1 U1038 ( .A(n480), .B(n1049), .Y(n1091) );
  NAND2X1 U1039 ( .A(n480), .B(n487), .Y(n1092) );
  NAND2X1 U1040 ( .A(n1049), .B(n487), .Y(n1093) );
  NAND3X1 U1041 ( .A(n1091), .B(n1092), .C(n1093), .Y(n473) );
  XOR2X1 U1042 ( .A(n1336), .B(n1253), .Y(n786) );
  NAND2X1 U1043 ( .A(n1351), .B(n1243), .Y(n757) );
  XOR2X1 U1044 ( .A(n1334), .B(n1328), .Y(n753) );
  INVX1 U1045 ( .A(n878), .Y(n727) );
  INVX1 U1046 ( .A(n884), .Y(n733) );
  INVX1 U1047 ( .A(n1333), .Y(n739) );
  XOR2X1 U1048 ( .A(n1094), .B(n1277), .Y(n1173) );
  INVX1 U1049 ( .A(n1277), .Y(n1278) );
  XOR2X1 U1050 ( .A(n13), .B(b[6]), .Y(n1245) );
  INVX1 U1051 ( .A(n1286), .Y(n1287) );
  INVX1 U1052 ( .A(n444), .Y(n1095) );
  INVX1 U1053 ( .A(n1095), .Y(n1096) );
  XOR2X1 U1054 ( .A(n1334), .B(n1250), .Y(n770) );
  INVX1 U1055 ( .A(n210), .Y(n289) );
  INVX1 U1056 ( .A(n213), .Y(n212) );
  XOR2X1 U1057 ( .A(n435), .B(n422), .Y(n1097) );
  XOR2X1 U1058 ( .A(n1097), .B(n433), .Y(n418) );
  XOR2X1 U1059 ( .A(n1254), .B(n420), .Y(n1098) );
  XOR2X1 U1060 ( .A(n1098), .B(n418), .Y(n416) );
  NAND2X1 U1061 ( .A(n435), .B(n422), .Y(n1099) );
  NAND2X1 U1062 ( .A(n435), .B(n433), .Y(n1100) );
  NAND2X1 U1063 ( .A(n422), .B(n433), .Y(n1101) );
  NAND3X1 U1064 ( .A(n1099), .B(n1100), .C(n1101), .Y(n417) );
  NAND2X1 U1065 ( .A(n420), .B(n1254), .Y(n1102) );
  NAND2X1 U1066 ( .A(n420), .B(n418), .Y(n1103) );
  NAND2X1 U1067 ( .A(n1254), .B(n418), .Y(n1104) );
  NAND3X1 U1068 ( .A(n1102), .B(n1103), .C(n1104), .Y(n415) );
  XNOR2X1 U1069 ( .A(n1057), .B(b[12]), .Y(n1105) );
  XOR2X1 U1070 ( .A(n1326), .B(n1123), .Y(n1106) );
  BUFX4 U1071 ( .A(b[12]), .Y(n1123) );
  BUFX2 U1072 ( .A(b[6]), .Y(n1107) );
  XNOR2X1 U1073 ( .A(b[0]), .B(n1314), .Y(n900) );
  INVX4 U1074 ( .A(n19), .Y(n1256) );
  INVX8 U1075 ( .A(n1256), .Y(n1258) );
  BUFX2 U1076 ( .A(n1), .Y(n1108) );
  INVX4 U1077 ( .A(n1308), .Y(n1309) );
  INVX2 U1078 ( .A(n13), .Y(n1318) );
  XOR2X1 U1079 ( .A(n1117), .B(n1110), .Y(n390) );
  NAND2X1 U1080 ( .A(n898), .B(n1050), .Y(n1111) );
  NAND2X1 U1081 ( .A(n898), .B(n1050), .Y(n1112) );
  XOR2X1 U1082 ( .A(n1021), .B(n451), .Y(n1113) );
  XOR2X1 U1083 ( .A(n453), .B(n1113), .Y(n436) );
  NAND2X1 U1084 ( .A(n453), .B(n1021), .Y(n1114) );
  NAND2X1 U1085 ( .A(n1068), .B(n453), .Y(n1115) );
  NAND2X1 U1086 ( .A(n1021), .B(n1068), .Y(n1116) );
  NAND3X1 U1087 ( .A(n1115), .B(n1114), .C(n1116), .Y(n435) );
  XNOR2X1 U1088 ( .A(n407), .B(n394), .Y(n1117) );
  BUFX4 U1089 ( .A(n25), .Y(n1221) );
  BUFX4 U1090 ( .A(n25), .Y(n1220) );
  XNOR2X1 U1091 ( .A(n1118), .B(n411), .Y(n394) );
  XNOR2X1 U1092 ( .A(n413), .B(n409), .Y(n1118) );
  XNOR2X1 U1093 ( .A(n1272), .B(n1252), .Y(n1226) );
  INVX2 U1094 ( .A(n1057), .Y(n1324) );
  AND2X2 U1095 ( .A(n898), .B(n16), .Y(n1120) );
  INVX8 U1096 ( .A(n888), .Y(n1336) );
  INVX4 U1097 ( .A(n1286), .Y(n1121) );
  OR2X2 U1098 ( .A(n1032), .B(n1124), .Y(n12) );
  XNOR2X1 U1099 ( .A(n1317), .B(b[2]), .Y(n1124) );
  INVX2 U1100 ( .A(n1032), .Y(n1288) );
  INVX2 U1101 ( .A(n442), .Y(n1125) );
  XOR2X1 U1102 ( .A(n477), .B(n475), .Y(n1129) );
  XOR2X1 U1103 ( .A(n1129), .B(n466), .Y(n462) );
  NAND2X1 U1104 ( .A(n477), .B(n475), .Y(n1130) );
  NAND2X1 U1105 ( .A(n477), .B(n466), .Y(n1131) );
  NAND2X1 U1106 ( .A(n475), .B(n466), .Y(n1132) );
  NAND3X1 U1107 ( .A(n1130), .B(n1131), .C(n1132), .Y(n461) );
  XOR2X1 U1108 ( .A(n463), .B(n450), .Y(n1133) );
  XOR2X1 U1109 ( .A(n1133), .B(n461), .Y(n446) );
  NAND2X1 U1110 ( .A(n463), .B(n450), .Y(n1134) );
  NAND2X1 U1111 ( .A(n463), .B(n461), .Y(n1135) );
  NAND2X1 U1112 ( .A(n450), .B(n461), .Y(n1136) );
  NAND3X1 U1113 ( .A(n1134), .B(n1135), .C(n1136), .Y(n445) );
  XOR2X1 U1114 ( .A(n423), .B(n410), .Y(n1137) );
  XOR2X1 U1115 ( .A(n1137), .B(n412), .Y(n406) );
  NAND2X1 U1116 ( .A(n423), .B(n410), .Y(n1138) );
  NAND2X1 U1117 ( .A(n423), .B(n412), .Y(n1139) );
  NAND2X1 U1118 ( .A(n410), .B(n412), .Y(n1140) );
  NAND3X1 U1119 ( .A(n1140), .B(n1139), .C(n1138), .Y(n405) );
  NAND2X1 U1120 ( .A(n407), .B(n394), .Y(n1141) );
  NAND2X1 U1121 ( .A(n407), .B(n405), .Y(n1142) );
  NAND2X1 U1122 ( .A(n394), .B(n405), .Y(n1143) );
  NAND3X1 U1123 ( .A(n1141), .B(n1142), .C(n1143), .Y(n389) );
  XOR2X1 U1124 ( .A(n1342), .B(n999), .Y(n830) );
  XOR2X1 U1125 ( .A(n427), .B(n1190), .Y(n1239) );
  INVX1 U1126 ( .A(n1190), .Y(n1191) );
  INVX2 U1127 ( .A(n1299), .Y(n1145) );
  INVX2 U1128 ( .A(n28), .Y(n1299) );
  XNOR2X1 U1129 ( .A(n612), .B(n1146), .Y(n410) );
  XNOR2X1 U1130 ( .A(n660), .B(n676), .Y(n1146) );
  NAND2X1 U1131 ( .A(n1106), .B(n1306), .Y(n1148) );
  BUFX2 U1132 ( .A(n1324), .Y(n1253) );
  NAND2X1 U1133 ( .A(n1349), .B(n1308), .Y(n1149) );
  XOR2X1 U1134 ( .A(n646), .B(n630), .Y(n1150) );
  XOR2X1 U1135 ( .A(n1150), .B(n710), .Y(n440) );
  NAND2X1 U1136 ( .A(n646), .B(n630), .Y(n1151) );
  NAND2X1 U1137 ( .A(n646), .B(n710), .Y(n1152) );
  NAND2X1 U1138 ( .A(n630), .B(n710), .Y(n1153) );
  NAND3X1 U1139 ( .A(n1151), .B(n1152), .C(n1153), .Y(n439) );
  XOR2X1 U1140 ( .A(n1255), .B(n426), .Y(n1154) );
  XOR2X1 U1141 ( .A(n1154), .B(n439), .Y(n420) );
  NAND2X1 U1142 ( .A(n1255), .B(n426), .Y(n1155) );
  NAND2X1 U1143 ( .A(n1255), .B(n439), .Y(n1156) );
  NAND2X1 U1144 ( .A(n426), .B(n439), .Y(n1157) );
  NAND3X1 U1145 ( .A(n1155), .B(n1156), .C(n1157), .Y(n419) );
  INVX2 U1146 ( .A(n25), .Y(n1322) );
  XOR2X1 U1147 ( .A(n476), .B(n478), .Y(n1158) );
  XOR2X1 U1148 ( .A(n1158), .B(n485), .Y(n472) );
  NAND2X1 U1149 ( .A(n476), .B(n478), .Y(n1159) );
  NAND2X1 U1150 ( .A(n476), .B(n485), .Y(n1160) );
  NAND2X1 U1151 ( .A(n478), .B(n485), .Y(n1161) );
  NAND3X1 U1152 ( .A(n1159), .B(n1160), .C(n1161), .Y(n471) );
  NAND2X1 U1153 ( .A(n474), .B(n1016), .Y(n1162) );
  NAND2X1 U1154 ( .A(n474), .B(n472), .Y(n1163) );
  NAND2X1 U1155 ( .A(n1016), .B(n472), .Y(n1164) );
  NAND3X1 U1156 ( .A(n1162), .B(n1163), .C(n1164), .Y(n469) );
  NAND2X1 U1157 ( .A(n667), .B(n683), .Y(n1165) );
  NAND2X1 U1158 ( .A(n667), .B(n635), .Y(n1166) );
  NAND2X1 U1159 ( .A(n683), .B(n635), .Y(n1167) );
  NAND3X1 U1160 ( .A(n1165), .B(n1166), .C(n1167), .Y(n497) );
  XOR2X1 U1161 ( .A(n698), .B(n499), .Y(n1168) );
  XOR2X1 U1162 ( .A(n1168), .B(n497), .Y(n486) );
  NAND2X1 U1163 ( .A(n698), .B(n499), .Y(n1169) );
  NAND2X1 U1164 ( .A(n698), .B(n497), .Y(n1170) );
  NAND2X1 U1165 ( .A(n499), .B(n497), .Y(n1171) );
  NAND3X1 U1166 ( .A(n1169), .B(n1170), .C(n1171), .Y(n485) );
  XOR2X1 U1167 ( .A(n368), .B(n379), .Y(n1172) );
  XOR2X1 U1168 ( .A(n1172), .B(n377), .Y(n364) );
  XOR2X1 U1169 ( .A(n1173), .B(n364), .Y(n362) );
  NAND2X1 U1170 ( .A(n368), .B(n379), .Y(n1174) );
  NAND2X1 U1171 ( .A(n368), .B(n377), .Y(n1175) );
  NAND2X1 U1172 ( .A(n379), .B(n377), .Y(n1176) );
  NAND3X1 U1173 ( .A(n1174), .B(n1175), .C(n1176), .Y(n363) );
  NAND2X1 U1174 ( .A(n366), .B(n1278), .Y(n1177) );
  NAND2X1 U1175 ( .A(n366), .B(n364), .Y(n1178) );
  NAND2X1 U1176 ( .A(n1278), .B(n364), .Y(n1179) );
  NAND3X1 U1177 ( .A(n1177), .B(n1178), .C(n1179), .Y(n361) );
  XOR2X1 U1178 ( .A(n1227), .B(n578), .Y(n1180) );
  XOR2X1 U1179 ( .A(n1180), .B(n641), .Y(n372) );
  XOR2X1 U1180 ( .A(n625), .B(n593), .Y(n1181) );
  XOR2X1 U1181 ( .A(n1181), .B(n372), .Y(n368) );
  NAND2X1 U1182 ( .A(n1227), .B(n578), .Y(n1182) );
  NAND2X1 U1183 ( .A(n1227), .B(n641), .Y(n1183) );
  NAND2X1 U1184 ( .A(n578), .B(n641), .Y(n1184) );
  NAND3X1 U1185 ( .A(n1182), .B(n1183), .C(n1184), .Y(n371) );
  NAND2X1 U1186 ( .A(n625), .B(n593), .Y(n1185) );
  NAND2X1 U1187 ( .A(n625), .B(n372), .Y(n1186) );
  NAND2X1 U1188 ( .A(n593), .B(n372), .Y(n1187) );
  NAND3X1 U1189 ( .A(n1185), .B(n1186), .C(n1187), .Y(n367) );
  AND2X2 U1190 ( .A(n897), .B(n1009), .Y(n1188) );
  AND2X2 U1191 ( .A(n897), .B(n1009), .Y(n1189) );
  INVX4 U1192 ( .A(n1023), .Y(n1311) );
  INVX2 U1193 ( .A(n425), .Y(n1190) );
  AND2X2 U1194 ( .A(n1106), .B(n1306), .Y(n1192) );
  XOR2X1 U1195 ( .A(n336), .B(n345), .Y(n1193) );
  XOR2X1 U1196 ( .A(n334), .B(n1193), .Y(n332) );
  NAND2X1 U1197 ( .A(n334), .B(n336), .Y(n1194) );
  NAND2X1 U1198 ( .A(n334), .B(n345), .Y(n1195) );
  NAND2X1 U1199 ( .A(n336), .B(n345), .Y(n1196) );
  NAND3X1 U1200 ( .A(n1195), .B(n1194), .C(n1196), .Y(n331) );
  NAND2X1 U1201 ( .A(n676), .B(n612), .Y(n1197) );
  NAND2X1 U1202 ( .A(n612), .B(n660), .Y(n1198) );
  NAND2X1 U1203 ( .A(n676), .B(n660), .Y(n1199) );
  NAND3X1 U1204 ( .A(n1197), .B(n1198), .C(n1199), .Y(n409) );
  XOR2X1 U1205 ( .A(n679), .B(n565), .Y(n1201) );
  XOR2X1 U1206 ( .A(n1201), .B(n1067), .Y(n452) );
  NAND2X1 U1207 ( .A(n615), .B(n679), .Y(n1202) );
  NAND2X1 U1208 ( .A(n565), .B(n615), .Y(n1203) );
  NAND2X1 U1209 ( .A(n679), .B(n565), .Y(n1204) );
  NAND3X1 U1210 ( .A(n1204), .B(n1202), .C(n1203), .Y(n451) );
  INVX4 U1211 ( .A(n890), .Y(n1332) );
  XOR2X1 U1212 ( .A(n599), .B(n695), .Y(n1205) );
  XOR2X1 U1213 ( .A(n1205), .B(n631), .Y(n454) );
  NAND2X1 U1214 ( .A(n631), .B(n695), .Y(n1206) );
  NAND2X1 U1215 ( .A(n631), .B(n599), .Y(n1207) );
  NAND2X1 U1216 ( .A(n695), .B(n599), .Y(n1208) );
  NAND3X1 U1217 ( .A(n1207), .B(n1206), .C(n1208), .Y(n453) );
  INVX1 U1218 ( .A(n202), .Y(n1209) );
  INVX1 U1219 ( .A(n200), .Y(n202) );
  XOR2X1 U1220 ( .A(n628), .B(n596), .Y(n1210) );
  XOR2X1 U1221 ( .A(n1210), .B(n692), .Y(n412) );
  NAND2X1 U1222 ( .A(n628), .B(n1217), .Y(n1211) );
  NAND2X1 U1223 ( .A(n628), .B(n692), .Y(n1212) );
  NAND2X1 U1224 ( .A(n1217), .B(n692), .Y(n1213) );
  NAND3X1 U1225 ( .A(n1211), .B(n1212), .C(n1213), .Y(n411) );
  NAND2X1 U1226 ( .A(n413), .B(n409), .Y(n1214) );
  NAND2X1 U1227 ( .A(n413), .B(n1065), .Y(n1215) );
  NAND2X1 U1228 ( .A(n409), .B(n1065), .Y(n1216) );
  NAND3X1 U1229 ( .A(n1214), .B(n1215), .C(n1216), .Y(n393) );
  BUFX2 U1230 ( .A(n596), .Y(n1217) );
  OR2X2 U1231 ( .A(n339), .B(n330), .Y(n1218) );
  INVX1 U1232 ( .A(n1218), .Y(n148) );
  BUFX2 U1233 ( .A(n25), .Y(n1219) );
  INVX2 U1234 ( .A(n287), .Y(n1222) );
  INVX4 U1235 ( .A(n1351), .Y(n1350) );
  AND2X2 U1236 ( .A(n159), .B(n171), .Y(n1228) );
  INVX8 U1237 ( .A(n1327), .Y(n1329) );
  INVX2 U1238 ( .A(n283), .Y(n1224) );
  INVX1 U1239 ( .A(n84), .Y(n275) );
  INVX1 U1240 ( .A(n94), .Y(n92) );
  OR2X2 U1241 ( .A(n302), .B(n307), .Y(n1230) );
  OR2X2 U1242 ( .A(n322), .B(n329), .Y(n1229) );
  OR2X2 U1243 ( .A(n470), .B(n481), .Y(n1231) );
  XOR2X1 U1244 ( .A(n1225), .B(n644), .Y(n414) );
  XOR2X1 U1245 ( .A(n1252), .B(n580), .Y(n1225) );
  INVX1 U1246 ( .A(n885), .Y(n734) );
  INVX1 U1247 ( .A(n881), .Y(n730) );
  NOR2X1 U1248 ( .A(n918), .B(n1336), .Y(n1227) );
  AND2X1 U1249 ( .A(n572), .B(n725), .Y(n1244) );
  XOR2X1 U1250 ( .A(n1324), .B(b[10]), .Y(n895) );
  BUFX2 U1251 ( .A(n52), .Y(n1264) );
  OR2X1 U1252 ( .A(n533), .B(n530), .Y(n1232) );
  OR2X1 U1253 ( .A(n523), .B(n518), .Y(n1233) );
  AND2X2 U1254 ( .A(n491), .B(n482), .Y(n1234) );
  OR2X1 U1255 ( .A(n491), .B(n482), .Y(n1235) );
  AND2X2 U1256 ( .A(n481), .B(n470), .Y(n1236) );
  AND2X2 U1257 ( .A(n523), .B(n518), .Y(n1237) );
  AND2X2 U1258 ( .A(n533), .B(n530), .Y(n1238) );
  XNOR2X1 U1259 ( .A(n1239), .B(n414), .Y(n408) );
  BUFX2 U1260 ( .A(n1317), .Y(n1247) );
  XNOR2X1 U1261 ( .A(n1240), .B(n365), .Y(n352) );
  XNOR2X1 U1262 ( .A(n356), .B(n367), .Y(n1240) );
  OR2X1 U1263 ( .A(n539), .B(n538), .Y(n1241) );
  AND2X2 U1264 ( .A(n539), .B(n538), .Y(n1242) );
  XNOR2X1 U1265 ( .A(n542), .B(n573), .Y(n291) );
  INVX2 U1266 ( .A(n545), .Y(n601) );
  INVX2 U1267 ( .A(n554), .Y(n655) );
  INVX2 U1268 ( .A(n548), .Y(n619) );
  AND2X2 U1269 ( .A(n1243), .B(n1339), .Y(n359) );
  INVX2 U1270 ( .A(n882), .Y(n1340) );
  INVX2 U1271 ( .A(n551), .Y(n637) );
  AND2X2 U1272 ( .A(n896), .B(n28), .Y(n1246) );
  INVX2 U1273 ( .A(n1315), .Y(n1317) );
  INVX1 U1274 ( .A(n1314), .Y(n1249) );
  BUFX4 U1275 ( .A(n1326), .Y(n1250) );
  BUFX4 U1276 ( .A(n1326), .Y(n1251) );
  INVX2 U1277 ( .A(n1119), .Y(n1326) );
  INVX1 U1278 ( .A(n1256), .Y(n1257) );
  INVX4 U1279 ( .A(n1188), .Y(n1298) );
  INVX1 U1280 ( .A(n189), .Y(n286) );
  INVX1 U1281 ( .A(n216), .Y(n290) );
  BUFX2 U1282 ( .A(n52), .Y(n1265) );
  INVX1 U1283 ( .A(n194), .Y(n287) );
  NAND2X1 U1284 ( .A(n1252), .B(n580), .Y(n1266) );
  NAND2X1 U1285 ( .A(n1252), .B(n644), .Y(n1267) );
  NAND2X1 U1286 ( .A(n580), .B(n644), .Y(n1268) );
  NAND3X1 U1287 ( .A(n1266), .B(n1267), .C(n1268), .Y(n413) );
  NAND2X1 U1288 ( .A(n427), .B(n1191), .Y(n1269) );
  NAND2X1 U1289 ( .A(n427), .B(n414), .Y(n1270) );
  NAND2X1 U1290 ( .A(n1191), .B(n414), .Y(n1271) );
  NAND3X1 U1291 ( .A(n1269), .B(n1270), .C(n1271), .Y(n407) );
  XOR2X1 U1292 ( .A(b[4]), .B(n1315), .Y(n16) );
  XOR2X1 U1293 ( .A(n643), .B(n579), .Y(n1272) );
  NAND2X1 U1294 ( .A(n643), .B(n1066), .Y(n1273) );
  NAND2X1 U1295 ( .A(n1066), .B(n579), .Y(n1274) );
  NAND2X1 U1296 ( .A(n643), .B(n579), .Y(n1275) );
  NAND3X1 U1297 ( .A(n1274), .B(n1273), .C(n1275), .Y(n399) );
  INVX1 U1298 ( .A(n1258), .Y(n922) );
  INVX1 U1299 ( .A(n173), .Y(n1276) );
  INVX1 U1300 ( .A(n172), .Y(n174) );
  INVX2 U1301 ( .A(n375), .Y(n1277) );
  INVX1 U1302 ( .A(n1064), .Y(n288) );
  INVX1 U1303 ( .A(n199), .Y(n201) );
  XOR2X1 U1304 ( .A(n383), .B(n381), .Y(n1279) );
  XOR2X1 U1305 ( .A(n1279), .B(n370), .Y(n366) );
  NAND2X1 U1306 ( .A(n383), .B(n381), .Y(n1280) );
  NAND2X1 U1307 ( .A(n383), .B(n370), .Y(n1281) );
  NAND2X1 U1308 ( .A(n381), .B(n370), .Y(n1282) );
  NAND3X1 U1309 ( .A(n1280), .B(n1281), .C(n1282), .Y(n365) );
  NAND2X1 U1310 ( .A(n356), .B(n367), .Y(n1283) );
  NAND2X1 U1311 ( .A(n356), .B(n365), .Y(n1284) );
  NAND2X1 U1312 ( .A(n367), .B(n365), .Y(n1285) );
  NAND3X1 U1313 ( .A(n1283), .B(n1284), .C(n1285), .Y(n351) );
  INVX2 U1314 ( .A(n557), .Y(n673) );
  INVX1 U1315 ( .A(n171), .Y(n173) );
  XOR2X1 U1316 ( .A(n1322), .B(b[10]), .Y(n34) );
  INVX1 U1317 ( .A(n166), .Y(n283) );
  INVX1 U1318 ( .A(n161), .Y(n282) );
  INVX4 U1319 ( .A(n12), .Y(n1289) );
  INVX1 U1320 ( .A(n177), .Y(n284) );
  INVX1 U1321 ( .A(n1264), .Y(n156) );
  INVX8 U1322 ( .A(n1289), .Y(n1291) );
  INVX8 U1323 ( .A(n1332), .Y(n1333) );
  INVX8 U1324 ( .A(n1334), .Y(n1335) );
  INVX2 U1325 ( .A(n101), .Y(n99) );
  INVX2 U1326 ( .A(n100), .Y(n98) );
  INVX2 U1327 ( .A(n79), .Y(n77) );
  INVX2 U1328 ( .A(n1108), .Y(n925) );
  OAI22X1 U1329 ( .A(n1288), .B(n924), .C(n1290), .D(n924), .Y(n560) );
  INVX2 U1330 ( .A(n1248), .Y(n924) );
  INVX2 U1331 ( .A(n1293), .Y(n558) );
  OAI22X1 U1332 ( .A(n1050), .B(n923), .C(n1294), .D(n923), .Y(n557) );
  OAI22X1 U1333 ( .A(n1295), .B(n922), .C(n1297), .D(n922), .Y(n554) );
  INVX2 U1334 ( .A(n1145), .Y(n552) );
  OAI22X1 U1335 ( .A(n1144), .B(n921), .C(n1013), .D(n921), .Y(n551) );
  OAI22X1 U1336 ( .A(n1303), .B(n920), .C(n1304), .D(n920), .Y(n548) );
  INVX2 U1337 ( .A(n1253), .Y(n920) );
  INVX2 U1338 ( .A(n1305), .Y(n546) );
  OAI22X1 U1339 ( .A(n1060), .B(n919), .C(n1307), .D(n919), .Y(n545) );
  INVX2 U1340 ( .A(n1251), .Y(n919) );
  OAI22X1 U1341 ( .A(n1309), .B(n918), .C(n1311), .D(n918), .Y(n542) );
  INVX2 U1342 ( .A(n359), .Y(n360) );
  INVX2 U1343 ( .A(n337), .Y(n338) );
  INVX2 U1344 ( .A(n319), .Y(n320) );
  INVX2 U1345 ( .A(n305), .Y(n306) );
  INVX2 U1346 ( .A(n295), .Y(n296) );
  INVX2 U1347 ( .A(n130), .Y(n279) );
  INVX2 U1348 ( .A(n93), .Y(n91) );
  INVX2 U1349 ( .A(n211), .Y(n209) );
  INVX2 U1350 ( .A(n149), .Y(n151) );
  INVX2 U1351 ( .A(n144), .Y(n142) );
  INVX2 U1352 ( .A(n129), .Y(n127) );
  INVX2 U1353 ( .A(n128), .Y(n126) );
  INVX2 U1354 ( .A(n122), .Y(n120) );
  INVX2 U1355 ( .A(n111), .Y(n109) );
  INVX2 U1356 ( .A(n105), .Y(n103) );
  INVX2 U1357 ( .A(n104), .Y(n102) );
endmodule


module alu_DW01_sub_2 ( A, B, CI, DIFF, CO );
  input [17:0] A;
  input [17:0] B;
  output [17:0] DIFF;
  input CI;
  output CO;
  wire   n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16,
         n17, n19, n21, n22, n23, n24, n25, n27, n29, n30, n31, n32, n33, n35,
         n37, n38, n39, n40, n41, n43, n45, n46, n47, n48, n49, n51, n53, n54,
         n55, n56, n58, n60, n61, n63, n65, n66, n67, n68, n69, n70, n71, n72,
         n73, n74, n75, n76, n77, n78, n79, n80, n82, n84, n86, n88, n92, n93,
         n94, n95, n96, n97, n98, n99, n100, n101, n102, n103, n104, n105,
         n106, n107, n108, n109, n110, n111, n170, n171, n172, n173, n174,
         n175, n176, n177, n178, n179, n180, n181, n182;

  FAX1 U3 ( .A(n95), .B(A[15]), .C(n80), .YC(n16), .YS(DIFF[15]) );
  XNOR2X1 U5 ( .A(n22), .B(n1), .Y(DIFF[14]) );
  AOI21X1 U6 ( .A(n182), .B(n22), .C(n19), .Y(n17) );
  NAND2X1 U9 ( .A(n21), .B(n182), .Y(n1) );
  NAND2X1 U12 ( .A(n96), .B(A[14]), .Y(n21) );
  XOR2X1 U13 ( .A(n25), .B(n2), .Y(DIFF[13]) );
  OAI21X1 U14 ( .A(n25), .B(n23), .C(n24), .Y(n22) );
  NAND2X1 U15 ( .A(n24), .B(n82), .Y(n2) );
  NOR2X1 U17 ( .A(n97), .B(A[13]), .Y(n23) );
  NAND2X1 U18 ( .A(n97), .B(A[13]), .Y(n24) );
  XNOR2X1 U19 ( .A(n30), .B(n3), .Y(DIFF[12]) );
  AOI21X1 U20 ( .A(n181), .B(n30), .C(n27), .Y(n25) );
  NAND2X1 U23 ( .A(n29), .B(n181), .Y(n3) );
  NAND2X1 U26 ( .A(n98), .B(A[12]), .Y(n29) );
  XOR2X1 U27 ( .A(n33), .B(n4), .Y(DIFF[11]) );
  OAI21X1 U28 ( .A(n33), .B(n31), .C(n32), .Y(n30) );
  NAND2X1 U29 ( .A(n32), .B(n84), .Y(n4) );
  NOR2X1 U31 ( .A(n99), .B(A[11]), .Y(n31) );
  NAND2X1 U32 ( .A(n99), .B(A[11]), .Y(n32) );
  XNOR2X1 U33 ( .A(n38), .B(n5), .Y(DIFF[10]) );
  AOI21X1 U34 ( .A(n170), .B(n38), .C(n35), .Y(n33) );
  NAND2X1 U37 ( .A(n37), .B(n170), .Y(n5) );
  NAND2X1 U40 ( .A(n100), .B(A[10]), .Y(n37) );
  XOR2X1 U41 ( .A(n41), .B(n6), .Y(DIFF[9]) );
  OAI21X1 U42 ( .A(n41), .B(n39), .C(n40), .Y(n38) );
  NAND2X1 U43 ( .A(n40), .B(n86), .Y(n6) );
  NOR2X1 U45 ( .A(n101), .B(A[9]), .Y(n39) );
  NAND2X1 U46 ( .A(n101), .B(A[9]), .Y(n40) );
  XNOR2X1 U47 ( .A(n46), .B(n7), .Y(DIFF[8]) );
  AOI21X1 U48 ( .A(n180), .B(n46), .C(n43), .Y(n41) );
  NAND2X1 U51 ( .A(n45), .B(n180), .Y(n7) );
  NAND2X1 U54 ( .A(n102), .B(A[8]), .Y(n45) );
  XOR2X1 U55 ( .A(n49), .B(n8), .Y(DIFF[7]) );
  OAI21X1 U56 ( .A(n49), .B(n47), .C(n48), .Y(n46) );
  NAND2X1 U57 ( .A(n48), .B(n88), .Y(n8) );
  NOR2X1 U59 ( .A(n103), .B(A[7]), .Y(n47) );
  NAND2X1 U60 ( .A(n103), .B(A[7]), .Y(n48) );
  XNOR2X1 U61 ( .A(n54), .B(n9), .Y(DIFF[6]) );
  AOI21X1 U62 ( .A(n177), .B(n54), .C(n51), .Y(n49) );
  NAND2X1 U65 ( .A(n53), .B(n177), .Y(n9) );
  NAND2X1 U68 ( .A(n104), .B(A[6]), .Y(n53) );
  XOR2X1 U69 ( .A(n61), .B(n10), .Y(DIFF[5]) );
  OAI21X1 U70 ( .A(n67), .B(n55), .C(n56), .Y(n54) );
  NAND2X1 U71 ( .A(n178), .B(n179), .Y(n55) );
  AOI21X1 U72 ( .A(n63), .B(n178), .C(n58), .Y(n56) );
  NAND2X1 U75 ( .A(n60), .B(n178), .Y(n10) );
  NAND2X1 U78 ( .A(n105), .B(A[5]), .Y(n60) );
  XNOR2X1 U79 ( .A(n66), .B(n11), .Y(DIFF[4]) );
  AOI21X1 U80 ( .A(n179), .B(n66), .C(n63), .Y(n61) );
  NAND2X1 U83 ( .A(n65), .B(n179), .Y(n11) );
  NAND2X1 U86 ( .A(n106), .B(A[4]), .Y(n65) );
  XNOR2X1 U87 ( .A(n72), .B(n12), .Y(DIFF[3]) );
  AOI21X1 U89 ( .A(n76), .B(n68), .C(n69), .Y(n67) );
  NOR2X1 U90 ( .A(n70), .B(n73), .Y(n68) );
  OAI21X1 U91 ( .A(n70), .B(n74), .C(n71), .Y(n69) );
  NAND2X1 U92 ( .A(n71), .B(n92), .Y(n12) );
  NOR2X1 U94 ( .A(n107), .B(A[3]), .Y(n70) );
  NAND2X1 U95 ( .A(n107), .B(A[3]), .Y(n71) );
  XOR2X1 U96 ( .A(n75), .B(n13), .Y(DIFF[2]) );
  OAI21X1 U97 ( .A(n75), .B(n73), .C(n74), .Y(n72) );
  NAND2X1 U98 ( .A(n74), .B(n93), .Y(n13) );
  NOR2X1 U100 ( .A(n108), .B(A[2]), .Y(n73) );
  NAND2X1 U101 ( .A(n108), .B(A[2]), .Y(n74) );
  XOR2X1 U102 ( .A(n14), .B(n176), .Y(DIFF[1]) );
  OAI21X1 U104 ( .A(n77), .B(n79), .C(n78), .Y(n76) );
  NAND2X1 U105 ( .A(n78), .B(n94), .Y(n14) );
  NOR2X1 U107 ( .A(n109), .B(A[1]), .Y(n77) );
  NAND2X1 U108 ( .A(n109), .B(A[1]), .Y(n78) );
  XNOR2X1 U109 ( .A(A[0]), .B(n110), .Y(DIFF[0]) );
  NOR2X1 U110 ( .A(n110), .B(A[0]), .Y(n79) );
  INVX2 U131 ( .A(n17), .Y(n80) );
  OR2X2 U132 ( .A(n100), .B(A[10]), .Y(n170) );
  FAX1 U133 ( .A(n95), .B(A[15]), .C(n80), .YC(n171) );
  INVX1 U134 ( .A(B[2]), .Y(n108) );
  INVX1 U135 ( .A(n67), .Y(n66) );
  INVX1 U136 ( .A(n70), .Y(n92) );
  INVX1 U137 ( .A(n73), .Y(n93) );
  INVX1 U138 ( .A(B[4]), .Y(n106) );
  INVX1 U139 ( .A(B[0]), .Y(n110) );
  INVX1 U140 ( .A(B[6]), .Y(n104) );
  INVX1 U141 ( .A(B[8]), .Y(n102) );
  XOR2X1 U142 ( .A(n111), .B(B[16]), .Y(n172) );
  XOR2X1 U143 ( .A(n171), .B(n172), .Y(DIFF[16]) );
  NAND2X1 U144 ( .A(n16), .B(n111), .Y(n173) );
  NAND2X1 U145 ( .A(n16), .B(B[16]), .Y(n174) );
  NAND2X1 U146 ( .A(n111), .B(B[16]), .Y(n175) );
  NAND3X1 U147 ( .A(n174), .B(n173), .C(n175), .Y(n15) );
  BUFX2 U148 ( .A(n79), .Y(n176) );
  OR2X2 U149 ( .A(n104), .B(A[6]), .Y(n177) );
  OR2X1 U150 ( .A(n105), .B(A[5]), .Y(n178) );
  OR2X1 U151 ( .A(n106), .B(A[4]), .Y(n179) );
  OR2X1 U152 ( .A(n102), .B(A[8]), .Y(n180) );
  OR2X1 U153 ( .A(n98), .B(A[12]), .Y(n181) );
  OR2X1 U154 ( .A(n96), .B(A[14]), .Y(n182) );
  INVX1 U155 ( .A(B[9]), .Y(n101) );
  INVX1 U156 ( .A(B[10]), .Y(n100) );
  INVX1 U157 ( .A(B[12]), .Y(n98) );
  INVX1 U158 ( .A(B[14]), .Y(n96) );
  INVX1 U159 ( .A(B[7]), .Y(n103) );
  INVX1 U160 ( .A(B[11]), .Y(n99) );
  INVX1 U161 ( .A(B[3]), .Y(n107) );
  INVX1 U162 ( .A(B[5]), .Y(n105) );
  INVX1 U163 ( .A(B[1]), .Y(n109) );
  INVX1 U164 ( .A(B[13]), .Y(n97) );
  INVX2 U165 ( .A(B[15]), .Y(n95) );
  INVX2 U166 ( .A(n77), .Y(n94) );
  INVX2 U167 ( .A(n47), .Y(n88) );
  INVX2 U168 ( .A(n39), .Y(n86) );
  INVX2 U169 ( .A(n31), .Y(n84) );
  INVX2 U170 ( .A(n23), .Y(n82) );
  INVX2 U171 ( .A(n76), .Y(n75) );
  INVX2 U172 ( .A(n65), .Y(n63) );
  INVX2 U173 ( .A(n60), .Y(n58) );
  INVX2 U174 ( .A(n53), .Y(n51) );
  INVX2 U175 ( .A(n45), .Y(n43) );
  INVX2 U176 ( .A(n37), .Y(n35) );
  INVX2 U177 ( .A(n29), .Y(n27) );
  INVX2 U178 ( .A(n21), .Y(n19) );
  INVX2 U179 ( .A(A[17]), .Y(n111) );
  INVX2 U180 ( .A(n15), .Y(DIFF[17]) );
endmodule


module alu_DW01_add_2 ( A, B, CI, SUM, CO );
  input [17:0] A;
  input [17:0] B;
  output [17:0] SUM;
  input CI;
  output CO;
  wire   n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n16, n17,
         n18, n20, n22, n23, n24, n25, n26, n28, n30, n31, n32, n33, n34, n36,
         n38, n39, n40, n41, n42, n44, n46, n47, n48, n49, n50, n52, n54, n55,
         n56, n57, n59, n61, n62, n64, n66, n67, n68, n69, n70, n71, n72, n73,
         n74, n75, n76, n77, n78, n79, n81, n82, n84, n86, n88, n90, n94, n95,
         n96, n98, n99, n159, n160, n161, n162, n163, n164, n165, n166, n167,
         n168, n169, n170, n171, n172, n173, n174, n175;

  XNOR2X1 U5 ( .A(n23), .B(n1), .Y(SUM[14]) );
  AOI21X1 U6 ( .A(n174), .B(n23), .C(n20), .Y(n18) );
  NAND2X1 U9 ( .A(n22), .B(n174), .Y(n1) );
  NAND2X1 U12 ( .A(B[14]), .B(A[14]), .Y(n22) );
  XOR2X1 U13 ( .A(n26), .B(n2), .Y(SUM[13]) );
  OAI21X1 U14 ( .A(n26), .B(n24), .C(n25), .Y(n23) );
  NAND2X1 U15 ( .A(n25), .B(n84), .Y(n2) );
  NOR2X1 U17 ( .A(B[13]), .B(A[13]), .Y(n24) );
  NAND2X1 U18 ( .A(B[13]), .B(A[13]), .Y(n25) );
  XNOR2X1 U19 ( .A(n31), .B(n3), .Y(SUM[12]) );
  AOI21X1 U20 ( .A(n173), .B(n31), .C(n28), .Y(n26) );
  NAND2X1 U23 ( .A(n30), .B(n173), .Y(n3) );
  NAND2X1 U26 ( .A(B[12]), .B(A[12]), .Y(n30) );
  XOR2X1 U27 ( .A(n34), .B(n4), .Y(SUM[11]) );
  OAI21X1 U28 ( .A(n34), .B(n32), .C(n33), .Y(n31) );
  NAND2X1 U29 ( .A(n33), .B(n86), .Y(n4) );
  NOR2X1 U31 ( .A(B[11]), .B(A[11]), .Y(n32) );
  NAND2X1 U32 ( .A(B[11]), .B(A[11]), .Y(n33) );
  XNOR2X1 U33 ( .A(n39), .B(n5), .Y(SUM[10]) );
  AOI21X1 U34 ( .A(n172), .B(n39), .C(n36), .Y(n34) );
  NAND2X1 U37 ( .A(n38), .B(n172), .Y(n5) );
  NAND2X1 U40 ( .A(B[10]), .B(A[10]), .Y(n38) );
  XOR2X1 U41 ( .A(n42), .B(n6), .Y(SUM[9]) );
  OAI21X1 U42 ( .A(n42), .B(n40), .C(n41), .Y(n39) );
  NAND2X1 U43 ( .A(n41), .B(n88), .Y(n6) );
  NOR2X1 U45 ( .A(B[9]), .B(A[9]), .Y(n40) );
  NAND2X1 U46 ( .A(B[9]), .B(A[9]), .Y(n41) );
  XNOR2X1 U47 ( .A(n47), .B(n7), .Y(SUM[8]) );
  AOI21X1 U48 ( .A(n171), .B(n47), .C(n44), .Y(n42) );
  NAND2X1 U51 ( .A(n46), .B(n171), .Y(n7) );
  NAND2X1 U54 ( .A(B[8]), .B(A[8]), .Y(n46) );
  XOR2X1 U55 ( .A(n50), .B(n8), .Y(SUM[7]) );
  OAI21X1 U56 ( .A(n50), .B(n48), .C(n49), .Y(n47) );
  NAND2X1 U57 ( .A(n49), .B(n90), .Y(n8) );
  NOR2X1 U59 ( .A(B[7]), .B(A[7]), .Y(n48) );
  NAND2X1 U60 ( .A(B[7]), .B(A[7]), .Y(n49) );
  XNOR2X1 U61 ( .A(n55), .B(n9), .Y(SUM[6]) );
  AOI21X1 U62 ( .A(n170), .B(n55), .C(n52), .Y(n50) );
  NAND2X1 U65 ( .A(n54), .B(n170), .Y(n9) );
  NAND2X1 U68 ( .A(B[6]), .B(A[6]), .Y(n54) );
  XOR2X1 U69 ( .A(n62), .B(n10), .Y(SUM[5]) );
  OAI21X1 U70 ( .A(n68), .B(n56), .C(n57), .Y(n55) );
  NAND2X1 U71 ( .A(n168), .B(n169), .Y(n56) );
  AOI21X1 U72 ( .A(n64), .B(n168), .C(n59), .Y(n57) );
  NAND2X1 U75 ( .A(n61), .B(n168), .Y(n10) );
  NAND2X1 U78 ( .A(B[5]), .B(A[5]), .Y(n61) );
  XNOR2X1 U79 ( .A(n67), .B(n11), .Y(SUM[4]) );
  AOI21X1 U80 ( .A(n169), .B(n67), .C(n64), .Y(n62) );
  NAND2X1 U83 ( .A(n66), .B(n169), .Y(n11) );
  NAND2X1 U86 ( .A(B[4]), .B(A[4]), .Y(n66) );
  XNOR2X1 U87 ( .A(n73), .B(n12), .Y(SUM[3]) );
  AOI21X1 U89 ( .A(n77), .B(n69), .C(n70), .Y(n68) );
  NOR2X1 U90 ( .A(n71), .B(n74), .Y(n69) );
  OAI21X1 U91 ( .A(n71), .B(n75), .C(n72), .Y(n70) );
  NAND2X1 U92 ( .A(n72), .B(n94), .Y(n12) );
  NOR2X1 U94 ( .A(B[3]), .B(A[3]), .Y(n71) );
  NAND2X1 U95 ( .A(B[3]), .B(A[3]), .Y(n72) );
  XOR2X1 U96 ( .A(n76), .B(n13), .Y(SUM[2]) );
  OAI21X1 U97 ( .A(n76), .B(n74), .C(n75), .Y(n73) );
  NAND2X1 U98 ( .A(n75), .B(n95), .Y(n13) );
  NOR2X1 U100 ( .A(B[2]), .B(A[2]), .Y(n74) );
  NAND2X1 U101 ( .A(B[2]), .B(A[2]), .Y(n75) );
  XOR2X1 U102 ( .A(n14), .B(n167), .Y(SUM[1]) );
  OAI21X1 U104 ( .A(n78), .B(n81), .C(n79), .Y(n77) );
  NAND2X1 U105 ( .A(n79), .B(n96), .Y(n14) );
  NOR2X1 U107 ( .A(B[1]), .B(A[1]), .Y(n78) );
  NAND2X1 U108 ( .A(B[1]), .B(A[1]), .Y(n79) );
  NAND2X1 U113 ( .A(B[0]), .B(A[0]), .Y(n81) );
  OR2X2 U119 ( .A(B[5]), .B(A[5]), .Y(n168) );
  INVX1 U120 ( .A(n68), .Y(n67) );
  AND2X2 U121 ( .A(n167), .B(n175), .Y(SUM[0]) );
  XOR2X1 U122 ( .A(B[15]), .B(A[15]), .Y(n159) );
  XOR2X1 U123 ( .A(n159), .B(n82), .Y(SUM[15]) );
  NAND2X1 U124 ( .A(B[15]), .B(A[15]), .Y(n160) );
  NAND2X1 U125 ( .A(B[15]), .B(n82), .Y(n161) );
  NAND2X1 U126 ( .A(A[15]), .B(n82), .Y(n162) );
  NAND3X1 U127 ( .A(n160), .B(n161), .C(n162), .Y(n17) );
  XOR2X1 U128 ( .A(n98), .B(n99), .Y(n163) );
  XOR2X1 U129 ( .A(n17), .B(n163), .Y(SUM[16]) );
  NAND2X1 U130 ( .A(n98), .B(n99), .Y(n164) );
  NAND2X1 U131 ( .A(n98), .B(n17), .Y(n165) );
  NAND2X1 U132 ( .A(n99), .B(n17), .Y(n166) );
  NAND3X1 U133 ( .A(n164), .B(n165), .C(n166), .Y(n16) );
  OR2X2 U134 ( .A(B[0]), .B(A[0]), .Y(n175) );
  OR2X2 U135 ( .A(B[4]), .B(A[4]), .Y(n169) );
  BUFX2 U136 ( .A(n81), .Y(n167) );
  INVX1 U137 ( .A(n71), .Y(n94) );
  OR2X2 U138 ( .A(B[8]), .B(A[8]), .Y(n171) );
  OR2X2 U139 ( .A(B[6]), .B(A[6]), .Y(n170) );
  OR2X2 U140 ( .A(B[10]), .B(A[10]), .Y(n172) );
  OR2X1 U141 ( .A(B[12]), .B(A[12]), .Y(n173) );
  OR2X1 U142 ( .A(B[14]), .B(A[14]), .Y(n174) );
  INVX2 U143 ( .A(A[17]), .Y(n99) );
  INVX2 U144 ( .A(B[17]), .Y(n98) );
  INVX2 U145 ( .A(n78), .Y(n96) );
  INVX2 U146 ( .A(n74), .Y(n95) );
  INVX2 U147 ( .A(n48), .Y(n90) );
  INVX2 U148 ( .A(n40), .Y(n88) );
  INVX2 U149 ( .A(n32), .Y(n86) );
  INVX2 U150 ( .A(n24), .Y(n84) );
  INVX2 U151 ( .A(n18), .Y(n82) );
  INVX2 U152 ( .A(n77), .Y(n76) );
  INVX2 U153 ( .A(n66), .Y(n64) );
  INVX2 U154 ( .A(n61), .Y(n59) );
  INVX2 U155 ( .A(n54), .Y(n52) );
  INVX2 U156 ( .A(n46), .Y(n44) );
  INVX2 U157 ( .A(n38), .Y(n36) );
  INVX2 U158 ( .A(n30), .Y(n28) );
  INVX2 U159 ( .A(n22), .Y(n20) );
  INVX2 U160 ( .A(n16), .Y(SUM[17]) );
endmodule


module alu ( src1_data, src2_data, alu_op, result, overflow );
  input [16:0] src1_data;
  input [16:0] src2_data;
  input [1:0] alu_op;
  output [16:0] result;
  output overflow;
  wire   N26, n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15,
         n16, n17, n18, n19, n20, n21, n22, n23, n24, n25, n26, n29, n30, n31,
         n32, n33, n34, n35, n36, n37, n38, n39, n40, n41, n42, n43, n44, n45,
         n46, n47, n48, n49, n50, n51, n52, n53, n54, n55, n56, n57, n58, n59,
         n60, n61, n62, n63, n64, n65, n66, n67, n68, n69, n70, n71, n72, n73,
         n74, n75, n76;
  wire   [46:30] full_mult;
  wire   [17:0] large_sum;
  wire   [17:0] large_dif;
  wire   SYNOPSYS_UNCONNECTED__0, SYNOPSYS_UNCONNECTED__1, 
        SYNOPSYS_UNCONNECTED__2, SYNOPSYS_UNCONNECTED__3, 
        SYNOPSYS_UNCONNECTED__4, SYNOPSYS_UNCONNECTED__5, 
        SYNOPSYS_UNCONNECTED__6, SYNOPSYS_UNCONNECTED__7, 
        SYNOPSYS_UNCONNECTED__8, SYNOPSYS_UNCONNECTED__9, 
        SYNOPSYS_UNCONNECTED__10, SYNOPSYS_UNCONNECTED__11, 
        SYNOPSYS_UNCONNECTED__12, SYNOPSYS_UNCONNECTED__13, 
        SYNOPSYS_UNCONNECTED__14, SYNOPSYS_UNCONNECTED__15, 
        SYNOPSYS_UNCONNECTED__16, SYNOPSYS_UNCONNECTED__17, 
        SYNOPSYS_UNCONNECTED__18, SYNOPSYS_UNCONNECTED__19, 
        SYNOPSYS_UNCONNECTED__20, SYNOPSYS_UNCONNECTED__21, 
        SYNOPSYS_UNCONNECTED__22, SYNOPSYS_UNCONNECTED__23, 
        SYNOPSYS_UNCONNECTED__24, SYNOPSYS_UNCONNECTED__25, 
        SYNOPSYS_UNCONNECTED__26, SYNOPSYS_UNCONNECTED__27, 
        SYNOPSYS_UNCONNECTED__28, SYNOPSYS_UNCONNECTED__29;

  alu_DW_mult_uns_2 mult_35 ( .a({src1_data[15:1], n34, 1'b0, 1'b0, 1'b0, 1'b0, 
        1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0}), 
        .b({src2_data[15:10], n3, src2_data[8:5], n25, src2_data[3], n29, 
        src2_data[1:0]}), .product({N26, full_mult[45:30], 
        SYNOPSYS_UNCONNECTED__0, SYNOPSYS_UNCONNECTED__1, 
        SYNOPSYS_UNCONNECTED__2, SYNOPSYS_UNCONNECTED__3, 
        SYNOPSYS_UNCONNECTED__4, SYNOPSYS_UNCONNECTED__5, 
        SYNOPSYS_UNCONNECTED__6, SYNOPSYS_UNCONNECTED__7, 
        SYNOPSYS_UNCONNECTED__8, SYNOPSYS_UNCONNECTED__9, 
        SYNOPSYS_UNCONNECTED__10, SYNOPSYS_UNCONNECTED__11, 
        SYNOPSYS_UNCONNECTED__12, SYNOPSYS_UNCONNECTED__13, 
        SYNOPSYS_UNCONNECTED__14, SYNOPSYS_UNCONNECTED__15, 
        SYNOPSYS_UNCONNECTED__16, SYNOPSYS_UNCONNECTED__17, 
        SYNOPSYS_UNCONNECTED__18, SYNOPSYS_UNCONNECTED__19, 
        SYNOPSYS_UNCONNECTED__20, SYNOPSYS_UNCONNECTED__21, 
        SYNOPSYS_UNCONNECTED__22, SYNOPSYS_UNCONNECTED__23, 
        SYNOPSYS_UNCONNECTED__24, SYNOPSYS_UNCONNECTED__25, 
        SYNOPSYS_UNCONNECTED__26, SYNOPSYS_UNCONNECTED__27, 
        SYNOPSYS_UNCONNECTED__28, SYNOPSYS_UNCONNECTED__29}) );
  alu_DW01_sub_2 sub_44 ( .A({src1_data[16], src1_data[16], n13, src1_data[14], 
        n18, n17, src1_data[11], n31, n19, n6, src1_data[7], n32, 
        src1_data[5:3], n12, src1_data[1], n34}), .B({src2_data[16], 
        src2_data[16], n8, n30, n14, src2_data[12:10], n3, src2_data[8], n5, 
        n16, src2_data[5], n25, n20, n29, n33, n15}), .CI(1'b0), .DIFF(
        large_dif) );
  alu_DW01_add_2 add_41 ( .A({src1_data[16], src1_data[16], n13, src1_data[14], 
        n18, n17, src1_data[11], n31, n19, n6, src1_data[7], n32, 
        src1_data[5:1], n34}), .B({src2_data[16], src2_data[16], n8, n30, n14, 
        src2_data[12:10], n3, src2_data[8], n5, n16, n1, n25, n20, n29, n33, 
        n15}), .CI(1'b0), .SUM(large_sum) );
  BUFX2 U3 ( .A(src2_data[5]), .Y(n1) );
  INVX8 U4 ( .A(n26), .Y(n29) );
  BUFX2 U6 ( .A(src2_data[4]), .Y(n25) );
  INVX2 U7 ( .A(n35), .Y(n34) );
  INVX2 U9 ( .A(src2_data[9]), .Y(n2) );
  INVX4 U10 ( .A(n2), .Y(n3) );
  INVX2 U11 ( .A(src1_data[0]), .Y(n35) );
  INVX1 U12 ( .A(src2_data[7]), .Y(n4) );
  INVX2 U13 ( .A(n4), .Y(n5) );
  BUFX2 U14 ( .A(src1_data[8]), .Y(n6) );
  INVX1 U15 ( .A(src2_data[15]), .Y(n7) );
  INVX2 U16 ( .A(n7), .Y(n8) );
  INVX1 U17 ( .A(src2_data[14]), .Y(n9) );
  INVX2 U18 ( .A(n9), .Y(n10) );
  INVX2 U19 ( .A(src1_data[2]), .Y(n11) );
  INVX2 U20 ( .A(n11), .Y(n12) );
  INVX2 U21 ( .A(src2_data[2]), .Y(n26) );
  BUFX2 U22 ( .A(src1_data[15]), .Y(n13) );
  BUFX2 U23 ( .A(src2_data[13]), .Y(n14) );
  BUFX2 U24 ( .A(src2_data[0]), .Y(n15) );
  BUFX2 U25 ( .A(n10), .Y(n30) );
  BUFX2 U26 ( .A(src2_data[6]), .Y(n16) );
  BUFX2 U27 ( .A(src1_data[12]), .Y(n17) );
  BUFX2 U28 ( .A(src1_data[13]), .Y(n18) );
  BUFX2 U29 ( .A(src1_data[9]), .Y(n19) );
  BUFX2 U30 ( .A(src2_data[3]), .Y(n20) );
  OR2X1 U31 ( .A(n38), .B(n76), .Y(n21) );
  NAND2X1 U32 ( .A(n37), .B(n21), .Y(overflow) );
  INVX2 U33 ( .A(n76), .Y(n71) );
  AND2X2 U34 ( .A(n40), .B(n39), .Y(n22) );
  AND2X2 U35 ( .A(alu_op[1]), .B(n39), .Y(n23) );
  AND2X2 U36 ( .A(alu_op[0]), .B(alu_op[1]), .Y(n24) );
  BUFX2 U37 ( .A(src1_data[10]), .Y(n31) );
  BUFX2 U38 ( .A(src1_data[6]), .Y(n32) );
  BUFX2 U39 ( .A(src2_data[1]), .Y(n33) );
  INVX2 U40 ( .A(large_sum[16]), .Y(n75) );
  XOR2X1 U41 ( .A(n75), .B(large_sum[17]), .Y(n38) );
  INVX2 U42 ( .A(alu_op[1]), .Y(n40) );
  NAND2X1 U43 ( .A(alu_op[0]), .B(n40), .Y(n76) );
  INVX2 U44 ( .A(alu_op[0]), .Y(n39) );
  XOR2X1 U45 ( .A(large_dif[17]), .B(large_dif[16]), .Y(n36) );
  AOI22X1 U46 ( .A(n24), .B(N26), .C(n23), .D(n36), .Y(n37) );
  AOI22X1 U47 ( .A(n34), .B(n22), .C(full_mult[30]), .D(n24), .Y(n42) );
  AOI22X1 U48 ( .A(large_dif[0]), .B(n23), .C(large_sum[0]), .D(n71), .Y(n41)
         );
  NAND2X1 U49 ( .A(n42), .B(n41), .Y(result[0]) );
  AOI22X1 U50 ( .A(src1_data[1]), .B(n22), .C(full_mult[31]), .D(n24), .Y(n44)
         );
  AOI22X1 U51 ( .A(large_dif[1]), .B(n23), .C(large_sum[1]), .D(n71), .Y(n43)
         );
  NAND2X1 U52 ( .A(n44), .B(n43), .Y(result[1]) );
  AOI22X1 U53 ( .A(n12), .B(n22), .C(full_mult[32]), .D(n24), .Y(n46) );
  AOI22X1 U54 ( .A(large_dif[2]), .B(n23), .C(large_sum[2]), .D(n71), .Y(n45)
         );
  NAND2X1 U55 ( .A(n46), .B(n45), .Y(result[2]) );
  AOI22X1 U56 ( .A(src1_data[3]), .B(n22), .C(full_mult[33]), .D(n24), .Y(n48)
         );
  AOI22X1 U57 ( .A(large_dif[3]), .B(n23), .C(large_sum[3]), .D(n71), .Y(n47)
         );
  NAND2X1 U58 ( .A(n48), .B(n47), .Y(result[3]) );
  AOI22X1 U59 ( .A(src1_data[4]), .B(n22), .C(full_mult[34]), .D(n24), .Y(n50)
         );
  AOI22X1 U60 ( .A(large_dif[4]), .B(n23), .C(large_sum[4]), .D(n71), .Y(n49)
         );
  NAND2X1 U61 ( .A(n50), .B(n49), .Y(result[4]) );
  AOI22X1 U62 ( .A(src1_data[5]), .B(n22), .C(full_mult[35]), .D(n24), .Y(n52)
         );
  AOI22X1 U63 ( .A(large_dif[5]), .B(n23), .C(large_sum[5]), .D(n71), .Y(n51)
         );
  NAND2X1 U64 ( .A(n52), .B(n51), .Y(result[5]) );
  AOI22X1 U65 ( .A(n32), .B(n22), .C(full_mult[36]), .D(n24), .Y(n54) );
  AOI22X1 U66 ( .A(large_dif[6]), .B(n23), .C(large_sum[6]), .D(n71), .Y(n53)
         );
  NAND2X1 U67 ( .A(n54), .B(n53), .Y(result[6]) );
  AOI22X1 U68 ( .A(src1_data[7]), .B(n22), .C(full_mult[37]), .D(n24), .Y(n56)
         );
  AOI22X1 U69 ( .A(large_dif[7]), .B(n23), .C(large_sum[7]), .D(n71), .Y(n55)
         );
  NAND2X1 U70 ( .A(n56), .B(n55), .Y(result[7]) );
  AOI22X1 U71 ( .A(n6), .B(n22), .C(full_mult[38]), .D(n24), .Y(n58) );
  AOI22X1 U72 ( .A(large_dif[8]), .B(n23), .C(large_sum[8]), .D(n71), .Y(n57)
         );
  NAND2X1 U73 ( .A(n58), .B(n57), .Y(result[8]) );
  AOI22X1 U74 ( .A(n19), .B(n22), .C(full_mult[39]), .D(n24), .Y(n60) );
  AOI22X1 U75 ( .A(large_dif[9]), .B(n23), .C(large_sum[9]), .D(n71), .Y(n59)
         );
  NAND2X1 U76 ( .A(n60), .B(n59), .Y(result[9]) );
  AOI22X1 U77 ( .A(n31), .B(n22), .C(full_mult[40]), .D(n24), .Y(n62) );
  AOI22X1 U78 ( .A(large_dif[10]), .B(n23), .C(large_sum[10]), .D(n71), .Y(n61) );
  NAND2X1 U79 ( .A(n62), .B(n61), .Y(result[10]) );
  AOI22X1 U80 ( .A(src1_data[11]), .B(n22), .C(full_mult[41]), .D(n24), .Y(n64) );
  AOI22X1 U81 ( .A(large_dif[11]), .B(n23), .C(large_sum[11]), .D(n71), .Y(n63) );
  NAND2X1 U82 ( .A(n64), .B(n63), .Y(result[11]) );
  AOI22X1 U83 ( .A(n17), .B(n22), .C(full_mult[42]), .D(n24), .Y(n66) );
  AOI22X1 U84 ( .A(large_dif[12]), .B(n23), .C(large_sum[12]), .D(n71), .Y(n65) );
  NAND2X1 U85 ( .A(n66), .B(n65), .Y(result[12]) );
  AOI22X1 U86 ( .A(n18), .B(n22), .C(full_mult[43]), .D(n24), .Y(n68) );
  AOI22X1 U87 ( .A(large_dif[13]), .B(n23), .C(large_sum[13]), .D(n71), .Y(n67) );
  NAND2X1 U88 ( .A(n68), .B(n67), .Y(result[13]) );
  AOI22X1 U89 ( .A(src1_data[14]), .B(n22), .C(full_mult[44]), .D(n24), .Y(n70) );
  AOI22X1 U90 ( .A(large_dif[14]), .B(n23), .C(large_sum[14]), .D(n71), .Y(n69) );
  NAND2X1 U91 ( .A(n70), .B(n69), .Y(result[14]) );
  AOI22X1 U92 ( .A(n13), .B(n22), .C(full_mult[45]), .D(n24), .Y(n73) );
  AOI22X1 U93 ( .A(large_dif[15]), .B(n23), .C(large_sum[15]), .D(n71), .Y(n72) );
  NAND2X1 U94 ( .A(n73), .B(n72), .Y(result[15]) );
  AOI22X1 U95 ( .A(src1_data[16]), .B(n22), .C(large_dif[16]), .D(n23), .Y(n74) );
  OAI21X1 U96 ( .A(n76), .B(n75), .C(n74), .Y(result[16]) );
endmodule


module flex_sreg_NUM_BITS17_15 ( clk, n_reset, write_enable, new_value, 
        current_value );
  input [16:0] new_value;
  output [16:0] current_value;
  input clk, n_reset, write_enable;
  wire   n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16,
         n17, n18, n20, n22, n24, n26, n28, n30, n32, n34, n36, n38, n40, n42,
         n44, n46, n48, n50, n52, n53, n54, n55;

  DFFSR \value_reg[16]  ( .D(n26), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[16]) );
  DFFSR \value_reg[15]  ( .D(n28), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[15]) );
  DFFSR \value_reg[14]  ( .D(n30), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[14]) );
  DFFSR \value_reg[13]  ( .D(n32), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[13]) );
  DFFSR \value_reg[12]  ( .D(n34), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[12]) );
  DFFSR \value_reg[11]  ( .D(n36), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[11]) );
  DFFSR \value_reg[10]  ( .D(n38), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[10]) );
  DFFSR \value_reg[9]  ( .D(n40), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[9]) );
  DFFSR \value_reg[8]  ( .D(n42), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[8]) );
  DFFSR \value_reg[7]  ( .D(n44), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[7]) );
  DFFSR \value_reg[6]  ( .D(n46), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[6]) );
  DFFSR \value_reg[5]  ( .D(n48), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[5]) );
  DFFSR \value_reg[4]  ( .D(n50), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[4]) );
  DFFSR \value_reg[3]  ( .D(n52), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[3]) );
  DFFSR \value_reg[2]  ( .D(n53), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[2]) );
  DFFSR \value_reg[1]  ( .D(n54), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[1]) );
  DFFSR \value_reg[0]  ( .D(n55), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[0]) );
  INVX1 U2 ( .A(n17), .Y(n34) );
  INVX1 U3 ( .A(n20), .Y(n30) );
  INVX1 U4 ( .A(n15), .Y(n38) );
  INVX2 U5 ( .A(n1), .Y(n2) );
  INVX2 U6 ( .A(write_enable), .Y(n1) );
  INVX2 U7 ( .A(n4), .Y(n3) );
  INVX2 U8 ( .A(n_reset), .Y(n4) );
  MUX2X1 U9 ( .B(current_value[0]), .A(new_value[0]), .S(n2), .Y(n5) );
  INVX2 U10 ( .A(n5), .Y(n55) );
  MUX2X1 U11 ( .B(current_value[1]), .A(new_value[1]), .S(n2), .Y(n6) );
  INVX2 U12 ( .A(n6), .Y(n54) );
  MUX2X1 U13 ( .B(current_value[2]), .A(new_value[2]), .S(n2), .Y(n7) );
  INVX2 U14 ( .A(n7), .Y(n53) );
  MUX2X1 U15 ( .B(current_value[3]), .A(new_value[3]), .S(write_enable), .Y(n8) );
  INVX2 U16 ( .A(n8), .Y(n52) );
  MUX2X1 U17 ( .B(current_value[4]), .A(new_value[4]), .S(n2), .Y(n9) );
  INVX2 U18 ( .A(n9), .Y(n50) );
  MUX2X1 U19 ( .B(current_value[5]), .A(new_value[5]), .S(n2), .Y(n10) );
  INVX2 U20 ( .A(n10), .Y(n48) );
  MUX2X1 U21 ( .B(current_value[6]), .A(new_value[6]), .S(n2), .Y(n11) );
  INVX2 U22 ( .A(n11), .Y(n46) );
  MUX2X1 U23 ( .B(current_value[7]), .A(new_value[7]), .S(write_enable), .Y(
        n12) );
  INVX2 U24 ( .A(n12), .Y(n44) );
  MUX2X1 U25 ( .B(current_value[8]), .A(new_value[8]), .S(n2), .Y(n13) );
  INVX2 U26 ( .A(n13), .Y(n42) );
  MUX2X1 U27 ( .B(current_value[9]), .A(new_value[9]), .S(write_enable), .Y(
        n14) );
  INVX2 U28 ( .A(n14), .Y(n40) );
  MUX2X1 U29 ( .B(current_value[10]), .A(new_value[10]), .S(n2), .Y(n15) );
  MUX2X1 U30 ( .B(current_value[11]), .A(new_value[11]), .S(write_enable), .Y(
        n16) );
  INVX2 U31 ( .A(n16), .Y(n36) );
  MUX2X1 U32 ( .B(current_value[12]), .A(new_value[12]), .S(n2), .Y(n17) );
  MUX2X1 U33 ( .B(current_value[13]), .A(new_value[13]), .S(write_enable), .Y(
        n18) );
  INVX2 U34 ( .A(n18), .Y(n32) );
  MUX2X1 U35 ( .B(current_value[14]), .A(new_value[14]), .S(n2), .Y(n20) );
  MUX2X1 U36 ( .B(current_value[15]), .A(new_value[15]), .S(write_enable), .Y(
        n22) );
  INVX2 U54 ( .A(n22), .Y(n28) );
  MUX2X1 U55 ( .B(current_value[16]), .A(new_value[16]), .S(n2), .Y(n24) );
  INVX2 U56 ( .A(n24), .Y(n26) );
endmodule


module flex_sreg_NUM_BITS17_14 ( clk, n_reset, write_enable, new_value, 
        current_value );
  input [16:0] new_value;
  output [16:0] current_value;
  input clk, n_reset, write_enable;
  wire   n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16,
         n17, n18, n20, n22, n24, n26, n28, n30, n32, n34, n36, n38, n40, n42,
         n44, n46, n48, n50, n52, n53, n54, n55;

  DFFSR \value_reg[16]  ( .D(n26), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[16]) );
  DFFSR \value_reg[15]  ( .D(n28), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[15]) );
  DFFSR \value_reg[14]  ( .D(n30), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[14]) );
  DFFSR \value_reg[13]  ( .D(n32), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[13]) );
  DFFSR \value_reg[12]  ( .D(n34), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[12]) );
  DFFSR \value_reg[11]  ( .D(n36), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[11]) );
  DFFSR \value_reg[10]  ( .D(n38), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[10]) );
  DFFSR \value_reg[9]  ( .D(n40), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[9]) );
  DFFSR \value_reg[8]  ( .D(n42), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[8]) );
  DFFSR \value_reg[7]  ( .D(n44), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[7]) );
  DFFSR \value_reg[6]  ( .D(n46), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[6]) );
  DFFSR \value_reg[5]  ( .D(n48), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[5]) );
  DFFSR \value_reg[4]  ( .D(n50), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[4]) );
  DFFSR \value_reg[3]  ( .D(n52), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[3]) );
  DFFSR \value_reg[2]  ( .D(n53), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[2]) );
  DFFSR \value_reg[1]  ( .D(n54), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[1]) );
  DFFSR \value_reg[0]  ( .D(n55), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[0]) );
  INVX2 U2 ( .A(n1), .Y(n2) );
  INVX2 U3 ( .A(write_enable), .Y(n1) );
  INVX2 U4 ( .A(n4), .Y(n3) );
  INVX2 U5 ( .A(n_reset), .Y(n4) );
  MUX2X1 U6 ( .B(current_value[0]), .A(new_value[0]), .S(n2), .Y(n5) );
  INVX2 U7 ( .A(n5), .Y(n55) );
  MUX2X1 U8 ( .B(current_value[1]), .A(new_value[1]), .S(n2), .Y(n6) );
  INVX2 U9 ( .A(n6), .Y(n54) );
  MUX2X1 U10 ( .B(current_value[2]), .A(new_value[2]), .S(n2), .Y(n7) );
  INVX2 U11 ( .A(n7), .Y(n53) );
  MUX2X1 U12 ( .B(current_value[3]), .A(new_value[3]), .S(n2), .Y(n8) );
  INVX2 U13 ( .A(n8), .Y(n52) );
  MUX2X1 U14 ( .B(current_value[4]), .A(new_value[4]), .S(n2), .Y(n9) );
  INVX2 U15 ( .A(n9), .Y(n50) );
  MUX2X1 U16 ( .B(current_value[5]), .A(new_value[5]), .S(write_enable), .Y(
        n10) );
  INVX2 U17 ( .A(n10), .Y(n48) );
  MUX2X1 U18 ( .B(current_value[6]), .A(new_value[6]), .S(n2), .Y(n11) );
  INVX2 U19 ( .A(n11), .Y(n46) );
  MUX2X1 U20 ( .B(current_value[7]), .A(new_value[7]), .S(write_enable), .Y(
        n12) );
  INVX2 U21 ( .A(n12), .Y(n44) );
  MUX2X1 U22 ( .B(current_value[8]), .A(new_value[8]), .S(n2), .Y(n13) );
  INVX2 U23 ( .A(n13), .Y(n42) );
  MUX2X1 U24 ( .B(current_value[9]), .A(new_value[9]), .S(write_enable), .Y(
        n14) );
  INVX2 U25 ( .A(n14), .Y(n40) );
  MUX2X1 U26 ( .B(current_value[10]), .A(new_value[10]), .S(n2), .Y(n15) );
  INVX2 U27 ( .A(n15), .Y(n38) );
  MUX2X1 U28 ( .B(current_value[11]), .A(new_value[11]), .S(write_enable), .Y(
        n16) );
  INVX2 U29 ( .A(n16), .Y(n36) );
  MUX2X1 U30 ( .B(current_value[12]), .A(new_value[12]), .S(n2), .Y(n17) );
  INVX2 U31 ( .A(n17), .Y(n34) );
  MUX2X1 U32 ( .B(current_value[13]), .A(new_value[13]), .S(write_enable), .Y(
        n18) );
  INVX2 U33 ( .A(n18), .Y(n32) );
  MUX2X1 U34 ( .B(current_value[14]), .A(new_value[14]), .S(n2), .Y(n20) );
  INVX2 U35 ( .A(n20), .Y(n30) );
  MUX2X1 U36 ( .B(current_value[15]), .A(new_value[15]), .S(write_enable), .Y(
        n22) );
  INVX2 U54 ( .A(n22), .Y(n28) );
  MUX2X1 U55 ( .B(current_value[16]), .A(new_value[16]), .S(n2), .Y(n24) );
  INVX2 U56 ( .A(n24), .Y(n26) );
endmodule


module flex_sreg_NUM_BITS17_13 ( clk, n_reset, write_enable, new_value, 
        current_value );
  input [16:0] new_value;
  output [16:0] current_value;
  input clk, n_reset, write_enable;
  wire   n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16,
         n17, n18, n20, n22, n24, n26, n28, n30, n32, n34, n36, n38, n40, n42,
         n44, n46, n48, n50, n52, n53, n54, n55;

  DFFSR \value_reg[16]  ( .D(n26), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[16]) );
  DFFSR \value_reg[15]  ( .D(n28), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[15]) );
  DFFSR \value_reg[14]  ( .D(n30), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[14]) );
  DFFSR \value_reg[13]  ( .D(n32), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[13]) );
  DFFSR \value_reg[12]  ( .D(n34), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[12]) );
  DFFSR \value_reg[11]  ( .D(n36), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[11]) );
  DFFSR \value_reg[10]  ( .D(n38), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[10]) );
  DFFSR \value_reg[9]  ( .D(n40), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[9]) );
  DFFSR \value_reg[8]  ( .D(n42), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[8]) );
  DFFSR \value_reg[7]  ( .D(n44), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[7]) );
  DFFSR \value_reg[6]  ( .D(n46), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[6]) );
  DFFSR \value_reg[5]  ( .D(n48), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[5]) );
  DFFSR \value_reg[4]  ( .D(n50), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[4]) );
  DFFSR \value_reg[3]  ( .D(n52), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[3]) );
  DFFSR \value_reg[2]  ( .D(n53), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[2]) );
  DFFSR \value_reg[1]  ( .D(n54), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[1]) );
  DFFSR \value_reg[0]  ( .D(n55), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[0]) );
  INVX2 U2 ( .A(n1), .Y(n2) );
  INVX2 U3 ( .A(write_enable), .Y(n1) );
  INVX2 U4 ( .A(n4), .Y(n3) );
  INVX2 U5 ( .A(n_reset), .Y(n4) );
  MUX2X1 U6 ( .B(current_value[0]), .A(new_value[0]), .S(n2), .Y(n5) );
  INVX2 U7 ( .A(n5), .Y(n55) );
  MUX2X1 U8 ( .B(current_value[1]), .A(new_value[1]), .S(n2), .Y(n6) );
  INVX2 U9 ( .A(n6), .Y(n54) );
  MUX2X1 U10 ( .B(current_value[2]), .A(new_value[2]), .S(n2), .Y(n7) );
  INVX2 U11 ( .A(n7), .Y(n53) );
  MUX2X1 U12 ( .B(current_value[3]), .A(new_value[3]), .S(n2), .Y(n8) );
  INVX2 U13 ( .A(n8), .Y(n52) );
  MUX2X1 U14 ( .B(current_value[4]), .A(new_value[4]), .S(n2), .Y(n9) );
  INVX2 U15 ( .A(n9), .Y(n50) );
  MUX2X1 U16 ( .B(current_value[5]), .A(new_value[5]), .S(write_enable), .Y(
        n10) );
  INVX2 U17 ( .A(n10), .Y(n48) );
  MUX2X1 U18 ( .B(current_value[6]), .A(new_value[6]), .S(n2), .Y(n11) );
  INVX2 U19 ( .A(n11), .Y(n46) );
  MUX2X1 U20 ( .B(current_value[7]), .A(new_value[7]), .S(write_enable), .Y(
        n12) );
  INVX2 U21 ( .A(n12), .Y(n44) );
  MUX2X1 U22 ( .B(current_value[8]), .A(new_value[8]), .S(n2), .Y(n13) );
  INVX2 U23 ( .A(n13), .Y(n42) );
  MUX2X1 U24 ( .B(current_value[9]), .A(new_value[9]), .S(write_enable), .Y(
        n14) );
  INVX2 U25 ( .A(n14), .Y(n40) );
  MUX2X1 U26 ( .B(current_value[10]), .A(new_value[10]), .S(n2), .Y(n15) );
  INVX2 U27 ( .A(n15), .Y(n38) );
  MUX2X1 U28 ( .B(current_value[11]), .A(new_value[11]), .S(write_enable), .Y(
        n16) );
  INVX2 U29 ( .A(n16), .Y(n36) );
  MUX2X1 U30 ( .B(current_value[12]), .A(new_value[12]), .S(n2), .Y(n17) );
  INVX2 U31 ( .A(n17), .Y(n34) );
  MUX2X1 U32 ( .B(current_value[13]), .A(new_value[13]), .S(write_enable), .Y(
        n18) );
  INVX2 U33 ( .A(n18), .Y(n32) );
  MUX2X1 U34 ( .B(current_value[14]), .A(new_value[14]), .S(n2), .Y(n20) );
  INVX2 U35 ( .A(n20), .Y(n30) );
  MUX2X1 U36 ( .B(current_value[15]), .A(new_value[15]), .S(write_enable), .Y(
        n22) );
  INVX2 U54 ( .A(n22), .Y(n28) );
  MUX2X1 U55 ( .B(current_value[16]), .A(new_value[16]), .S(n2), .Y(n24) );
  INVX2 U56 ( .A(n24), .Y(n26) );
endmodule


module flex_sreg_NUM_BITS17_12 ( clk, n_reset, write_enable, new_value, 
        current_value );
  input [16:0] new_value;
  output [16:0] current_value;
  input clk, n_reset, write_enable;
  wire   n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16,
         n17, n18, n20, n22, n24, n26, n28, n30, n32, n34, n36, n38, n40, n42,
         n44, n46, n48, n50, n52, n53, n54, n55;

  DFFSR \value_reg[16]  ( .D(n26), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[16]) );
  DFFSR \value_reg[15]  ( .D(n28), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[15]) );
  DFFSR \value_reg[14]  ( .D(n30), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[14]) );
  DFFSR \value_reg[13]  ( .D(n32), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[13]) );
  DFFSR \value_reg[12]  ( .D(n34), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[12]) );
  DFFSR \value_reg[11]  ( .D(n36), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[11]) );
  DFFSR \value_reg[10]  ( .D(n38), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[10]) );
  DFFSR \value_reg[9]  ( .D(n40), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[9]) );
  DFFSR \value_reg[8]  ( .D(n42), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[8]) );
  DFFSR \value_reg[7]  ( .D(n44), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[7]) );
  DFFSR \value_reg[6]  ( .D(n46), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[6]) );
  DFFSR \value_reg[5]  ( .D(n48), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[5]) );
  DFFSR \value_reg[4]  ( .D(n50), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[4]) );
  DFFSR \value_reg[3]  ( .D(n52), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[3]) );
  DFFSR \value_reg[2]  ( .D(n53), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[2]) );
  DFFSR \value_reg[1]  ( .D(n54), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[1]) );
  DFFSR \value_reg[0]  ( .D(n55), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[0]) );
  INVX2 U2 ( .A(n1), .Y(n2) );
  INVX2 U3 ( .A(write_enable), .Y(n1) );
  INVX2 U4 ( .A(n4), .Y(n3) );
  INVX2 U5 ( .A(n_reset), .Y(n4) );
  MUX2X1 U6 ( .B(current_value[0]), .A(new_value[0]), .S(n2), .Y(n5) );
  INVX2 U7 ( .A(n5), .Y(n55) );
  MUX2X1 U8 ( .B(current_value[1]), .A(new_value[1]), .S(n2), .Y(n6) );
  INVX2 U9 ( .A(n6), .Y(n54) );
  MUX2X1 U10 ( .B(current_value[2]), .A(new_value[2]), .S(n2), .Y(n7) );
  INVX2 U11 ( .A(n7), .Y(n53) );
  MUX2X1 U12 ( .B(current_value[3]), .A(new_value[3]), .S(n2), .Y(n8) );
  INVX2 U13 ( .A(n8), .Y(n52) );
  MUX2X1 U14 ( .B(current_value[4]), .A(new_value[4]), .S(n2), .Y(n9) );
  INVX2 U15 ( .A(n9), .Y(n50) );
  MUX2X1 U16 ( .B(current_value[5]), .A(new_value[5]), .S(write_enable), .Y(
        n10) );
  INVX2 U17 ( .A(n10), .Y(n48) );
  MUX2X1 U18 ( .B(current_value[6]), .A(new_value[6]), .S(n2), .Y(n11) );
  INVX2 U19 ( .A(n11), .Y(n46) );
  MUX2X1 U20 ( .B(current_value[7]), .A(new_value[7]), .S(write_enable), .Y(
        n12) );
  INVX2 U21 ( .A(n12), .Y(n44) );
  MUX2X1 U22 ( .B(current_value[8]), .A(new_value[8]), .S(n2), .Y(n13) );
  INVX2 U23 ( .A(n13), .Y(n42) );
  MUX2X1 U24 ( .B(current_value[9]), .A(new_value[9]), .S(write_enable), .Y(
        n14) );
  INVX2 U25 ( .A(n14), .Y(n40) );
  MUX2X1 U26 ( .B(current_value[10]), .A(new_value[10]), .S(n2), .Y(n15) );
  INVX2 U27 ( .A(n15), .Y(n38) );
  MUX2X1 U28 ( .B(current_value[11]), .A(new_value[11]), .S(write_enable), .Y(
        n16) );
  INVX2 U29 ( .A(n16), .Y(n36) );
  MUX2X1 U30 ( .B(current_value[12]), .A(new_value[12]), .S(n2), .Y(n17) );
  INVX2 U31 ( .A(n17), .Y(n34) );
  MUX2X1 U32 ( .B(current_value[13]), .A(new_value[13]), .S(write_enable), .Y(
        n18) );
  INVX2 U33 ( .A(n18), .Y(n32) );
  MUX2X1 U34 ( .B(current_value[14]), .A(new_value[14]), .S(n2), .Y(n20) );
  INVX2 U35 ( .A(n20), .Y(n30) );
  MUX2X1 U36 ( .B(current_value[15]), .A(new_value[15]), .S(write_enable), .Y(
        n22) );
  INVX2 U54 ( .A(n22), .Y(n28) );
  MUX2X1 U55 ( .B(current_value[16]), .A(new_value[16]), .S(n2), .Y(n24) );
  INVX2 U56 ( .A(n24), .Y(n26) );
endmodule


module flex_sreg_NUM_BITS17_11 ( clk, n_reset, write_enable, new_value, 
        current_value );
  input [16:0] new_value;
  output [16:0] current_value;
  input clk, n_reset, write_enable;
  wire   n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16,
         n17, n18, n20, n22, n24, n26, n28, n30, n32, n34, n36, n38, n40, n42,
         n44, n46, n48, n50, n52, n53, n54, n55;

  DFFSR \value_reg[16]  ( .D(n26), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[16]) );
  DFFSR \value_reg[15]  ( .D(n28), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[15]) );
  DFFSR \value_reg[14]  ( .D(n30), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[14]) );
  DFFSR \value_reg[13]  ( .D(n32), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[13]) );
  DFFSR \value_reg[12]  ( .D(n34), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[12]) );
  DFFSR \value_reg[11]  ( .D(n36), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[11]) );
  DFFSR \value_reg[10]  ( .D(n38), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[10]) );
  DFFSR \value_reg[9]  ( .D(n40), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[9]) );
  DFFSR \value_reg[8]  ( .D(n42), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[8]) );
  DFFSR \value_reg[7]  ( .D(n44), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[7]) );
  DFFSR \value_reg[6]  ( .D(n46), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[6]) );
  DFFSR \value_reg[5]  ( .D(n48), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[5]) );
  DFFSR \value_reg[4]  ( .D(n50), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[4]) );
  DFFSR \value_reg[3]  ( .D(n52), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[3]) );
  DFFSR \value_reg[2]  ( .D(n53), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[2]) );
  DFFSR \value_reg[1]  ( .D(n54), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[1]) );
  DFFSR \value_reg[0]  ( .D(n55), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[0]) );
  INVX2 U2 ( .A(n1), .Y(n2) );
  INVX2 U3 ( .A(write_enable), .Y(n1) );
  INVX2 U4 ( .A(n4), .Y(n3) );
  INVX2 U5 ( .A(n_reset), .Y(n4) );
  MUX2X1 U6 ( .B(current_value[0]), .A(new_value[0]), .S(n2), .Y(n5) );
  INVX2 U7 ( .A(n5), .Y(n55) );
  MUX2X1 U8 ( .B(current_value[1]), .A(new_value[1]), .S(n2), .Y(n6) );
  INVX2 U9 ( .A(n6), .Y(n54) );
  MUX2X1 U10 ( .B(current_value[2]), .A(new_value[2]), .S(n2), .Y(n7) );
  INVX2 U11 ( .A(n7), .Y(n53) );
  MUX2X1 U12 ( .B(current_value[3]), .A(new_value[3]), .S(n2), .Y(n8) );
  INVX2 U13 ( .A(n8), .Y(n52) );
  MUX2X1 U14 ( .B(current_value[4]), .A(new_value[4]), .S(n2), .Y(n9) );
  INVX2 U15 ( .A(n9), .Y(n50) );
  MUX2X1 U16 ( .B(current_value[5]), .A(new_value[5]), .S(write_enable), .Y(
        n10) );
  INVX2 U17 ( .A(n10), .Y(n48) );
  MUX2X1 U18 ( .B(current_value[6]), .A(new_value[6]), .S(n2), .Y(n11) );
  INVX2 U19 ( .A(n11), .Y(n46) );
  MUX2X1 U20 ( .B(current_value[7]), .A(new_value[7]), .S(write_enable), .Y(
        n12) );
  INVX2 U21 ( .A(n12), .Y(n44) );
  MUX2X1 U22 ( .B(current_value[8]), .A(new_value[8]), .S(n2), .Y(n13) );
  INVX2 U23 ( .A(n13), .Y(n42) );
  MUX2X1 U24 ( .B(current_value[9]), .A(new_value[9]), .S(write_enable), .Y(
        n14) );
  INVX2 U25 ( .A(n14), .Y(n40) );
  MUX2X1 U26 ( .B(current_value[10]), .A(new_value[10]), .S(n2), .Y(n15) );
  INVX2 U27 ( .A(n15), .Y(n38) );
  MUX2X1 U28 ( .B(current_value[11]), .A(new_value[11]), .S(write_enable), .Y(
        n16) );
  INVX2 U29 ( .A(n16), .Y(n36) );
  MUX2X1 U30 ( .B(current_value[12]), .A(new_value[12]), .S(n2), .Y(n17) );
  INVX2 U31 ( .A(n17), .Y(n34) );
  MUX2X1 U32 ( .B(current_value[13]), .A(new_value[13]), .S(write_enable), .Y(
        n18) );
  INVX2 U33 ( .A(n18), .Y(n32) );
  MUX2X1 U34 ( .B(current_value[14]), .A(new_value[14]), .S(n2), .Y(n20) );
  INVX2 U35 ( .A(n20), .Y(n30) );
  MUX2X1 U36 ( .B(current_value[15]), .A(new_value[15]), .S(write_enable), .Y(
        n22) );
  INVX2 U54 ( .A(n22), .Y(n28) );
  MUX2X1 U55 ( .B(current_value[16]), .A(new_value[16]), .S(n2), .Y(n24) );
  INVX2 U56 ( .A(n24), .Y(n26) );
endmodule


module flex_sreg_NUM_BITS17_10 ( clk, n_reset, write_enable, new_value, 
        current_value );
  input [16:0] new_value;
  output [16:0] current_value;
  input clk, n_reset, write_enable;
  wire   n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16,
         n17, n18, n20, n22, n24, n26, n28, n30, n32, n34, n36, n38, n40, n42,
         n44, n46, n48, n50, n52, n53, n54, n55;

  DFFSR \value_reg[16]  ( .D(n26), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[16]) );
  DFFSR \value_reg[15]  ( .D(n28), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[15]) );
  DFFSR \value_reg[14]  ( .D(n30), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[14]) );
  DFFSR \value_reg[13]  ( .D(n32), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[13]) );
  DFFSR \value_reg[12]  ( .D(n34), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[12]) );
  DFFSR \value_reg[11]  ( .D(n36), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[11]) );
  DFFSR \value_reg[10]  ( .D(n38), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[10]) );
  DFFSR \value_reg[9]  ( .D(n40), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[9]) );
  DFFSR \value_reg[8]  ( .D(n42), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[8]) );
  DFFSR \value_reg[7]  ( .D(n44), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[7]) );
  DFFSR \value_reg[6]  ( .D(n46), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[6]) );
  DFFSR \value_reg[5]  ( .D(n48), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[5]) );
  DFFSR \value_reg[4]  ( .D(n50), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[4]) );
  DFFSR \value_reg[3]  ( .D(n52), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[3]) );
  DFFSR \value_reg[2]  ( .D(n53), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[2]) );
  DFFSR \value_reg[1]  ( .D(n54), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[1]) );
  DFFSR \value_reg[0]  ( .D(n55), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[0]) );
  INVX2 U2 ( .A(n1), .Y(n2) );
  INVX2 U3 ( .A(write_enable), .Y(n1) );
  INVX2 U4 ( .A(n4), .Y(n3) );
  INVX2 U5 ( .A(n_reset), .Y(n4) );
  MUX2X1 U6 ( .B(current_value[0]), .A(new_value[0]), .S(n2), .Y(n5) );
  INVX2 U7 ( .A(n5), .Y(n55) );
  MUX2X1 U8 ( .B(current_value[1]), .A(new_value[1]), .S(n2), .Y(n6) );
  INVX2 U9 ( .A(n6), .Y(n54) );
  MUX2X1 U10 ( .B(current_value[2]), .A(new_value[2]), .S(n2), .Y(n7) );
  INVX2 U11 ( .A(n7), .Y(n53) );
  MUX2X1 U12 ( .B(current_value[3]), .A(new_value[3]), .S(n2), .Y(n8) );
  INVX2 U13 ( .A(n8), .Y(n52) );
  MUX2X1 U14 ( .B(current_value[4]), .A(new_value[4]), .S(n2), .Y(n9) );
  INVX2 U15 ( .A(n9), .Y(n50) );
  MUX2X1 U16 ( .B(current_value[5]), .A(new_value[5]), .S(write_enable), .Y(
        n10) );
  INVX2 U17 ( .A(n10), .Y(n48) );
  MUX2X1 U18 ( .B(current_value[6]), .A(new_value[6]), .S(n2), .Y(n11) );
  INVX2 U19 ( .A(n11), .Y(n46) );
  MUX2X1 U20 ( .B(current_value[7]), .A(new_value[7]), .S(write_enable), .Y(
        n12) );
  INVX2 U21 ( .A(n12), .Y(n44) );
  MUX2X1 U22 ( .B(current_value[8]), .A(new_value[8]), .S(n2), .Y(n13) );
  INVX2 U23 ( .A(n13), .Y(n42) );
  MUX2X1 U24 ( .B(current_value[9]), .A(new_value[9]), .S(write_enable), .Y(
        n14) );
  INVX2 U25 ( .A(n14), .Y(n40) );
  MUX2X1 U26 ( .B(current_value[10]), .A(new_value[10]), .S(n2), .Y(n15) );
  INVX2 U27 ( .A(n15), .Y(n38) );
  MUX2X1 U28 ( .B(current_value[11]), .A(new_value[11]), .S(write_enable), .Y(
        n16) );
  INVX2 U29 ( .A(n16), .Y(n36) );
  MUX2X1 U30 ( .B(current_value[12]), .A(new_value[12]), .S(n2), .Y(n17) );
  INVX2 U31 ( .A(n17), .Y(n34) );
  MUX2X1 U32 ( .B(current_value[13]), .A(new_value[13]), .S(write_enable), .Y(
        n18) );
  INVX2 U33 ( .A(n18), .Y(n32) );
  MUX2X1 U34 ( .B(current_value[14]), .A(new_value[14]), .S(n2), .Y(n20) );
  INVX2 U35 ( .A(n20), .Y(n30) );
  MUX2X1 U36 ( .B(current_value[15]), .A(new_value[15]), .S(write_enable), .Y(
        n22) );
  INVX2 U54 ( .A(n22), .Y(n28) );
  MUX2X1 U55 ( .B(current_value[16]), .A(new_value[16]), .S(n2), .Y(n24) );
  INVX2 U56 ( .A(n24), .Y(n26) );
endmodule


module flex_sreg_NUM_BITS17_9 ( clk, n_reset, write_enable, new_value, 
        current_value );
  input [16:0] new_value;
  output [16:0] current_value;
  input clk, n_reset, write_enable;
  wire   n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16,
         n17, n18, n20, n22, n24, n26, n28, n30, n32, n34, n36, n38, n40, n42,
         n44, n46, n48, n50, n52, n53, n54, n55;

  DFFSR \value_reg[16]  ( .D(n26), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[16]) );
  DFFSR \value_reg[15]  ( .D(n28), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[15]) );
  DFFSR \value_reg[14]  ( .D(n30), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[14]) );
  DFFSR \value_reg[13]  ( .D(n32), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[13]) );
  DFFSR \value_reg[12]  ( .D(n34), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[12]) );
  DFFSR \value_reg[11]  ( .D(n36), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[11]) );
  DFFSR \value_reg[10]  ( .D(n38), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[10]) );
  DFFSR \value_reg[9]  ( .D(n40), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[9]) );
  DFFSR \value_reg[8]  ( .D(n42), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[8]) );
  DFFSR \value_reg[7]  ( .D(n44), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[7]) );
  DFFSR \value_reg[6]  ( .D(n46), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[6]) );
  DFFSR \value_reg[5]  ( .D(n48), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[5]) );
  DFFSR \value_reg[4]  ( .D(n50), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[4]) );
  DFFSR \value_reg[3]  ( .D(n52), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[3]) );
  DFFSR \value_reg[2]  ( .D(n53), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[2]) );
  DFFSR \value_reg[1]  ( .D(n54), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[1]) );
  DFFSR \value_reg[0]  ( .D(n55), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[0]) );
  INVX2 U2 ( .A(n1), .Y(n2) );
  INVX2 U3 ( .A(write_enable), .Y(n1) );
  INVX2 U4 ( .A(n4), .Y(n3) );
  INVX2 U5 ( .A(n_reset), .Y(n4) );
  MUX2X1 U6 ( .B(current_value[0]), .A(new_value[0]), .S(n2), .Y(n5) );
  INVX2 U7 ( .A(n5), .Y(n55) );
  MUX2X1 U8 ( .B(current_value[1]), .A(new_value[1]), .S(n2), .Y(n6) );
  INVX2 U9 ( .A(n6), .Y(n54) );
  MUX2X1 U10 ( .B(current_value[2]), .A(new_value[2]), .S(n2), .Y(n7) );
  INVX2 U11 ( .A(n7), .Y(n53) );
  MUX2X1 U12 ( .B(current_value[3]), .A(new_value[3]), .S(n2), .Y(n8) );
  INVX2 U13 ( .A(n8), .Y(n52) );
  MUX2X1 U14 ( .B(current_value[4]), .A(new_value[4]), .S(n2), .Y(n9) );
  INVX2 U15 ( .A(n9), .Y(n50) );
  MUX2X1 U16 ( .B(current_value[5]), .A(new_value[5]), .S(write_enable), .Y(
        n10) );
  INVX2 U17 ( .A(n10), .Y(n48) );
  MUX2X1 U18 ( .B(current_value[6]), .A(new_value[6]), .S(n2), .Y(n11) );
  INVX2 U19 ( .A(n11), .Y(n46) );
  MUX2X1 U20 ( .B(current_value[7]), .A(new_value[7]), .S(write_enable), .Y(
        n12) );
  INVX2 U21 ( .A(n12), .Y(n44) );
  MUX2X1 U22 ( .B(current_value[8]), .A(new_value[8]), .S(n2), .Y(n13) );
  INVX2 U23 ( .A(n13), .Y(n42) );
  MUX2X1 U24 ( .B(current_value[9]), .A(new_value[9]), .S(write_enable), .Y(
        n14) );
  INVX2 U25 ( .A(n14), .Y(n40) );
  MUX2X1 U26 ( .B(current_value[10]), .A(new_value[10]), .S(n2), .Y(n15) );
  INVX2 U27 ( .A(n15), .Y(n38) );
  MUX2X1 U28 ( .B(current_value[11]), .A(new_value[11]), .S(write_enable), .Y(
        n16) );
  INVX2 U29 ( .A(n16), .Y(n36) );
  MUX2X1 U30 ( .B(current_value[12]), .A(new_value[12]), .S(n2), .Y(n17) );
  INVX2 U31 ( .A(n17), .Y(n34) );
  MUX2X1 U32 ( .B(current_value[13]), .A(new_value[13]), .S(write_enable), .Y(
        n18) );
  INVX2 U33 ( .A(n18), .Y(n32) );
  MUX2X1 U34 ( .B(current_value[14]), .A(new_value[14]), .S(n2), .Y(n20) );
  INVX2 U35 ( .A(n20), .Y(n30) );
  MUX2X1 U36 ( .B(current_value[15]), .A(new_value[15]), .S(write_enable), .Y(
        n22) );
  INVX2 U54 ( .A(n22), .Y(n28) );
  MUX2X1 U55 ( .B(current_value[16]), .A(new_value[16]), .S(n2), .Y(n24) );
  INVX2 U56 ( .A(n24), .Y(n26) );
endmodule


module flex_sreg_NUM_BITS17_8 ( clk, n_reset, write_enable, new_value, 
        current_value );
  input [16:0] new_value;
  output [16:0] current_value;
  input clk, n_reset, write_enable;
  wire   n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16,
         n17, n18, n20, n22, n24, n26, n28, n30, n32, n34, n36, n38, n40, n42,
         n44, n46, n48, n50, n52, n53, n54, n55;

  DFFSR \value_reg[16]  ( .D(n26), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[16]) );
  DFFSR \value_reg[15]  ( .D(n28), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[15]) );
  DFFSR \value_reg[14]  ( .D(n30), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[14]) );
  DFFSR \value_reg[13]  ( .D(n32), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[13]) );
  DFFSR \value_reg[12]  ( .D(n34), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[12]) );
  DFFSR \value_reg[11]  ( .D(n36), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[11]) );
  DFFSR \value_reg[10]  ( .D(n38), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[10]) );
  DFFSR \value_reg[9]  ( .D(n40), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[9]) );
  DFFSR \value_reg[8]  ( .D(n42), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[8]) );
  DFFSR \value_reg[7]  ( .D(n44), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[7]) );
  DFFSR \value_reg[6]  ( .D(n46), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[6]) );
  DFFSR \value_reg[5]  ( .D(n48), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[5]) );
  DFFSR \value_reg[4]  ( .D(n50), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[4]) );
  DFFSR \value_reg[3]  ( .D(n52), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[3]) );
  DFFSR \value_reg[2]  ( .D(n53), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[2]) );
  DFFSR \value_reg[1]  ( .D(n54), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[1]) );
  DFFSR \value_reg[0]  ( .D(n55), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[0]) );
  INVX2 U2 ( .A(n1), .Y(n2) );
  INVX2 U3 ( .A(write_enable), .Y(n1) );
  INVX2 U4 ( .A(n4), .Y(n3) );
  INVX2 U5 ( .A(n_reset), .Y(n4) );
  MUX2X1 U6 ( .B(current_value[0]), .A(new_value[0]), .S(n2), .Y(n5) );
  INVX2 U7 ( .A(n5), .Y(n55) );
  MUX2X1 U8 ( .B(current_value[1]), .A(new_value[1]), .S(n2), .Y(n6) );
  INVX2 U9 ( .A(n6), .Y(n54) );
  MUX2X1 U10 ( .B(current_value[2]), .A(new_value[2]), .S(n2), .Y(n7) );
  INVX2 U11 ( .A(n7), .Y(n53) );
  MUX2X1 U12 ( .B(current_value[3]), .A(new_value[3]), .S(n2), .Y(n8) );
  INVX2 U13 ( .A(n8), .Y(n52) );
  MUX2X1 U14 ( .B(current_value[4]), .A(new_value[4]), .S(n2), .Y(n9) );
  INVX2 U15 ( .A(n9), .Y(n50) );
  MUX2X1 U16 ( .B(current_value[5]), .A(new_value[5]), .S(write_enable), .Y(
        n10) );
  INVX2 U17 ( .A(n10), .Y(n48) );
  MUX2X1 U18 ( .B(current_value[6]), .A(new_value[6]), .S(n2), .Y(n11) );
  INVX2 U19 ( .A(n11), .Y(n46) );
  MUX2X1 U20 ( .B(current_value[7]), .A(new_value[7]), .S(write_enable), .Y(
        n12) );
  INVX2 U21 ( .A(n12), .Y(n44) );
  MUX2X1 U22 ( .B(current_value[8]), .A(new_value[8]), .S(n2), .Y(n13) );
  INVX2 U23 ( .A(n13), .Y(n42) );
  MUX2X1 U24 ( .B(current_value[9]), .A(new_value[9]), .S(write_enable), .Y(
        n14) );
  INVX2 U25 ( .A(n14), .Y(n40) );
  MUX2X1 U26 ( .B(current_value[10]), .A(new_value[10]), .S(n2), .Y(n15) );
  INVX2 U27 ( .A(n15), .Y(n38) );
  MUX2X1 U28 ( .B(current_value[11]), .A(new_value[11]), .S(write_enable), .Y(
        n16) );
  INVX2 U29 ( .A(n16), .Y(n36) );
  MUX2X1 U30 ( .B(current_value[12]), .A(new_value[12]), .S(n2), .Y(n17) );
  INVX2 U31 ( .A(n17), .Y(n34) );
  MUX2X1 U32 ( .B(current_value[13]), .A(new_value[13]), .S(write_enable), .Y(
        n18) );
  INVX2 U33 ( .A(n18), .Y(n32) );
  MUX2X1 U34 ( .B(current_value[14]), .A(new_value[14]), .S(n2), .Y(n20) );
  INVX2 U35 ( .A(n20), .Y(n30) );
  MUX2X1 U36 ( .B(current_value[15]), .A(new_value[15]), .S(write_enable), .Y(
        n22) );
  INVX2 U54 ( .A(n22), .Y(n28) );
  MUX2X1 U55 ( .B(current_value[16]), .A(new_value[16]), .S(n2), .Y(n24) );
  INVX2 U56 ( .A(n24), .Y(n26) );
endmodule


module flex_sreg_NUM_BITS17_7 ( clk, n_reset, write_enable, new_value, 
        current_value );
  input [16:0] new_value;
  output [16:0] current_value;
  input clk, n_reset, write_enable;
  wire   n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16,
         n17, n18, n20, n22, n24, n26, n28, n30, n32, n34, n36, n38, n40, n42,
         n44, n46, n48, n50, n52, n53, n54, n55;

  DFFSR \value_reg[16]  ( .D(n26), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[16]) );
  DFFSR \value_reg[15]  ( .D(n28), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[15]) );
  DFFSR \value_reg[14]  ( .D(n30), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[14]) );
  DFFSR \value_reg[13]  ( .D(n32), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[13]) );
  DFFSR \value_reg[12]  ( .D(n34), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[12]) );
  DFFSR \value_reg[11]  ( .D(n36), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[11]) );
  DFFSR \value_reg[10]  ( .D(n38), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[10]) );
  DFFSR \value_reg[9]  ( .D(n40), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[9]) );
  DFFSR \value_reg[8]  ( .D(n42), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[8]) );
  DFFSR \value_reg[7]  ( .D(n44), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[7]) );
  DFFSR \value_reg[6]  ( .D(n46), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[6]) );
  DFFSR \value_reg[5]  ( .D(n48), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[5]) );
  DFFSR \value_reg[4]  ( .D(n50), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[4]) );
  DFFSR \value_reg[3]  ( .D(n52), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[3]) );
  DFFSR \value_reg[2]  ( .D(n53), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[2]) );
  DFFSR \value_reg[1]  ( .D(n54), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[1]) );
  DFFSR \value_reg[0]  ( .D(n55), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[0]) );
  INVX2 U2 ( .A(n1), .Y(n2) );
  INVX2 U3 ( .A(write_enable), .Y(n1) );
  INVX2 U4 ( .A(n4), .Y(n3) );
  INVX2 U5 ( .A(n_reset), .Y(n4) );
  MUX2X1 U6 ( .B(current_value[0]), .A(new_value[0]), .S(n2), .Y(n5) );
  INVX2 U7 ( .A(n5), .Y(n55) );
  MUX2X1 U8 ( .B(current_value[1]), .A(new_value[1]), .S(n2), .Y(n6) );
  INVX2 U9 ( .A(n6), .Y(n54) );
  MUX2X1 U10 ( .B(current_value[2]), .A(new_value[2]), .S(n2), .Y(n7) );
  INVX2 U11 ( .A(n7), .Y(n53) );
  MUX2X1 U12 ( .B(current_value[3]), .A(new_value[3]), .S(n2), .Y(n8) );
  INVX2 U13 ( .A(n8), .Y(n52) );
  MUX2X1 U14 ( .B(current_value[4]), .A(new_value[4]), .S(n2), .Y(n9) );
  INVX2 U15 ( .A(n9), .Y(n50) );
  MUX2X1 U16 ( .B(current_value[5]), .A(new_value[5]), .S(write_enable), .Y(
        n10) );
  INVX2 U17 ( .A(n10), .Y(n48) );
  MUX2X1 U18 ( .B(current_value[6]), .A(new_value[6]), .S(n2), .Y(n11) );
  INVX2 U19 ( .A(n11), .Y(n46) );
  MUX2X1 U20 ( .B(current_value[7]), .A(new_value[7]), .S(write_enable), .Y(
        n12) );
  INVX2 U21 ( .A(n12), .Y(n44) );
  MUX2X1 U22 ( .B(current_value[8]), .A(new_value[8]), .S(n2), .Y(n13) );
  INVX2 U23 ( .A(n13), .Y(n42) );
  MUX2X1 U24 ( .B(current_value[9]), .A(new_value[9]), .S(write_enable), .Y(
        n14) );
  INVX2 U25 ( .A(n14), .Y(n40) );
  MUX2X1 U26 ( .B(current_value[10]), .A(new_value[10]), .S(n2), .Y(n15) );
  INVX2 U27 ( .A(n15), .Y(n38) );
  MUX2X1 U28 ( .B(current_value[11]), .A(new_value[11]), .S(write_enable), .Y(
        n16) );
  INVX2 U29 ( .A(n16), .Y(n36) );
  MUX2X1 U30 ( .B(current_value[12]), .A(new_value[12]), .S(n2), .Y(n17) );
  INVX2 U31 ( .A(n17), .Y(n34) );
  MUX2X1 U32 ( .B(current_value[13]), .A(new_value[13]), .S(write_enable), .Y(
        n18) );
  INVX2 U33 ( .A(n18), .Y(n32) );
  MUX2X1 U34 ( .B(current_value[14]), .A(new_value[14]), .S(n2), .Y(n20) );
  INVX2 U35 ( .A(n20), .Y(n30) );
  MUX2X1 U36 ( .B(current_value[15]), .A(new_value[15]), .S(write_enable), .Y(
        n22) );
  INVX2 U54 ( .A(n22), .Y(n28) );
  MUX2X1 U55 ( .B(current_value[16]), .A(new_value[16]), .S(n2), .Y(n24) );
  INVX2 U56 ( .A(n24), .Y(n26) );
endmodule


module flex_sreg_NUM_BITS17_6 ( clk, n_reset, write_enable, new_value, 
        current_value );
  input [16:0] new_value;
  output [16:0] current_value;
  input clk, n_reset, write_enable;
  wire   n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16,
         n17, n18, n20, n22, n24, n26, n28, n30, n32, n34, n36, n38, n40, n42,
         n44, n46, n48, n50, n52, n53, n54, n55;

  DFFSR \value_reg[16]  ( .D(n26), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[16]) );
  DFFSR \value_reg[15]  ( .D(n28), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[15]) );
  DFFSR \value_reg[14]  ( .D(n30), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[14]) );
  DFFSR \value_reg[13]  ( .D(n32), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[13]) );
  DFFSR \value_reg[12]  ( .D(n34), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[12]) );
  DFFSR \value_reg[11]  ( .D(n36), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[11]) );
  DFFSR \value_reg[10]  ( .D(n38), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[10]) );
  DFFSR \value_reg[9]  ( .D(n40), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[9]) );
  DFFSR \value_reg[8]  ( .D(n42), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[8]) );
  DFFSR \value_reg[7]  ( .D(n44), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[7]) );
  DFFSR \value_reg[6]  ( .D(n46), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[6]) );
  DFFSR \value_reg[5]  ( .D(n48), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[5]) );
  DFFSR \value_reg[4]  ( .D(n50), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[4]) );
  DFFSR \value_reg[3]  ( .D(n52), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[3]) );
  DFFSR \value_reg[2]  ( .D(n53), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[2]) );
  DFFSR \value_reg[1]  ( .D(n54), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[1]) );
  DFFSR \value_reg[0]  ( .D(n55), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[0]) );
  INVX2 U2 ( .A(n1), .Y(n2) );
  INVX2 U3 ( .A(write_enable), .Y(n1) );
  INVX2 U4 ( .A(n4), .Y(n3) );
  INVX2 U5 ( .A(n_reset), .Y(n4) );
  MUX2X1 U6 ( .B(current_value[0]), .A(new_value[0]), .S(n2), .Y(n5) );
  INVX2 U7 ( .A(n5), .Y(n55) );
  MUX2X1 U8 ( .B(current_value[1]), .A(new_value[1]), .S(n2), .Y(n6) );
  INVX2 U9 ( .A(n6), .Y(n54) );
  MUX2X1 U10 ( .B(current_value[2]), .A(new_value[2]), .S(n2), .Y(n7) );
  INVX2 U11 ( .A(n7), .Y(n53) );
  MUX2X1 U12 ( .B(current_value[3]), .A(new_value[3]), .S(n2), .Y(n8) );
  INVX2 U13 ( .A(n8), .Y(n52) );
  MUX2X1 U14 ( .B(current_value[4]), .A(new_value[4]), .S(n2), .Y(n9) );
  INVX2 U15 ( .A(n9), .Y(n50) );
  MUX2X1 U16 ( .B(current_value[5]), .A(new_value[5]), .S(write_enable), .Y(
        n10) );
  INVX2 U17 ( .A(n10), .Y(n48) );
  MUX2X1 U18 ( .B(current_value[6]), .A(new_value[6]), .S(n2), .Y(n11) );
  INVX2 U19 ( .A(n11), .Y(n46) );
  MUX2X1 U20 ( .B(current_value[7]), .A(new_value[7]), .S(write_enable), .Y(
        n12) );
  INVX2 U21 ( .A(n12), .Y(n44) );
  MUX2X1 U22 ( .B(current_value[8]), .A(new_value[8]), .S(n2), .Y(n13) );
  INVX2 U23 ( .A(n13), .Y(n42) );
  MUX2X1 U24 ( .B(current_value[9]), .A(new_value[9]), .S(write_enable), .Y(
        n14) );
  INVX2 U25 ( .A(n14), .Y(n40) );
  MUX2X1 U26 ( .B(current_value[10]), .A(new_value[10]), .S(n2), .Y(n15) );
  INVX2 U27 ( .A(n15), .Y(n38) );
  MUX2X1 U28 ( .B(current_value[11]), .A(new_value[11]), .S(write_enable), .Y(
        n16) );
  INVX2 U29 ( .A(n16), .Y(n36) );
  MUX2X1 U30 ( .B(current_value[12]), .A(new_value[12]), .S(n2), .Y(n17) );
  INVX2 U31 ( .A(n17), .Y(n34) );
  MUX2X1 U32 ( .B(current_value[13]), .A(new_value[13]), .S(write_enable), .Y(
        n18) );
  INVX2 U33 ( .A(n18), .Y(n32) );
  MUX2X1 U34 ( .B(current_value[14]), .A(new_value[14]), .S(n2), .Y(n20) );
  INVX2 U35 ( .A(n20), .Y(n30) );
  MUX2X1 U36 ( .B(current_value[15]), .A(new_value[15]), .S(write_enable), .Y(
        n22) );
  INVX2 U54 ( .A(n22), .Y(n28) );
  MUX2X1 U55 ( .B(current_value[16]), .A(new_value[16]), .S(n2), .Y(n24) );
  INVX2 U56 ( .A(n24), .Y(n26) );
endmodule


module flex_sreg_NUM_BITS17_5 ( clk, n_reset, write_enable, new_value, 
        current_value );
  input [16:0] new_value;
  output [16:0] current_value;
  input clk, n_reset, write_enable;
  wire   n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16,
         n17, n18, n20, n22, n24, n26, n28, n30, n32, n34, n36, n38, n40, n42,
         n44, n46, n48, n50, n52, n53, n54, n55;

  DFFSR \value_reg[16]  ( .D(n26), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[16]) );
  DFFSR \value_reg[15]  ( .D(n28), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[15]) );
  DFFSR \value_reg[14]  ( .D(n30), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[14]) );
  DFFSR \value_reg[13]  ( .D(n32), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[13]) );
  DFFSR \value_reg[12]  ( .D(n34), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[12]) );
  DFFSR \value_reg[11]  ( .D(n36), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[11]) );
  DFFSR \value_reg[10]  ( .D(n38), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[10]) );
  DFFSR \value_reg[9]  ( .D(n40), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[9]) );
  DFFSR \value_reg[8]  ( .D(n42), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[8]) );
  DFFSR \value_reg[7]  ( .D(n44), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[7]) );
  DFFSR \value_reg[6]  ( .D(n46), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[6]) );
  DFFSR \value_reg[5]  ( .D(n48), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[5]) );
  DFFSR \value_reg[4]  ( .D(n50), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[4]) );
  DFFSR \value_reg[3]  ( .D(n52), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[3]) );
  DFFSR \value_reg[2]  ( .D(n53), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[2]) );
  DFFSR \value_reg[1]  ( .D(n54), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[1]) );
  DFFSR \value_reg[0]  ( .D(n55), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[0]) );
  INVX2 U2 ( .A(n1), .Y(n2) );
  INVX2 U3 ( .A(write_enable), .Y(n1) );
  INVX2 U4 ( .A(n4), .Y(n3) );
  INVX2 U5 ( .A(n_reset), .Y(n4) );
  MUX2X1 U6 ( .B(current_value[0]), .A(new_value[0]), .S(n2), .Y(n5) );
  INVX2 U7 ( .A(n5), .Y(n55) );
  MUX2X1 U8 ( .B(current_value[1]), .A(new_value[1]), .S(n2), .Y(n6) );
  INVX2 U9 ( .A(n6), .Y(n54) );
  MUX2X1 U10 ( .B(current_value[2]), .A(new_value[2]), .S(n2), .Y(n7) );
  INVX2 U11 ( .A(n7), .Y(n53) );
  MUX2X1 U12 ( .B(current_value[3]), .A(new_value[3]), .S(n2), .Y(n8) );
  INVX2 U13 ( .A(n8), .Y(n52) );
  MUX2X1 U14 ( .B(current_value[4]), .A(new_value[4]), .S(n2), .Y(n9) );
  INVX2 U15 ( .A(n9), .Y(n50) );
  MUX2X1 U16 ( .B(current_value[5]), .A(new_value[5]), .S(write_enable), .Y(
        n10) );
  INVX2 U17 ( .A(n10), .Y(n48) );
  MUX2X1 U18 ( .B(current_value[6]), .A(new_value[6]), .S(n2), .Y(n11) );
  INVX2 U19 ( .A(n11), .Y(n46) );
  MUX2X1 U20 ( .B(current_value[7]), .A(new_value[7]), .S(write_enable), .Y(
        n12) );
  INVX2 U21 ( .A(n12), .Y(n44) );
  MUX2X1 U22 ( .B(current_value[8]), .A(new_value[8]), .S(n2), .Y(n13) );
  INVX2 U23 ( .A(n13), .Y(n42) );
  MUX2X1 U24 ( .B(current_value[9]), .A(new_value[9]), .S(write_enable), .Y(
        n14) );
  INVX2 U25 ( .A(n14), .Y(n40) );
  MUX2X1 U26 ( .B(current_value[10]), .A(new_value[10]), .S(n2), .Y(n15) );
  INVX2 U27 ( .A(n15), .Y(n38) );
  MUX2X1 U28 ( .B(current_value[11]), .A(new_value[11]), .S(write_enable), .Y(
        n16) );
  INVX2 U29 ( .A(n16), .Y(n36) );
  MUX2X1 U30 ( .B(current_value[12]), .A(new_value[12]), .S(n2), .Y(n17) );
  INVX2 U31 ( .A(n17), .Y(n34) );
  MUX2X1 U32 ( .B(current_value[13]), .A(new_value[13]), .S(write_enable), .Y(
        n18) );
  INVX2 U33 ( .A(n18), .Y(n32) );
  MUX2X1 U34 ( .B(current_value[14]), .A(new_value[14]), .S(n2), .Y(n20) );
  INVX2 U35 ( .A(n20), .Y(n30) );
  MUX2X1 U36 ( .B(current_value[15]), .A(new_value[15]), .S(write_enable), .Y(
        n22) );
  INVX2 U54 ( .A(n22), .Y(n28) );
  MUX2X1 U55 ( .B(current_value[16]), .A(new_value[16]), .S(n2), .Y(n24) );
  INVX2 U56 ( .A(n24), .Y(n26) );
endmodule


module flex_sreg_NUM_BITS17_4 ( clk, n_reset, write_enable, new_value, 
        current_value );
  input [16:0] new_value;
  output [16:0] current_value;
  input clk, n_reset, write_enable;
  wire   n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16,
         n17, n18, n20, n22, n24, n26, n28, n30, n32, n34, n36, n38, n40, n42,
         n44, n46, n48, n50, n52, n53, n54, n55;

  DFFSR \value_reg[16]  ( .D(n26), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[16]) );
  DFFSR \value_reg[15]  ( .D(n28), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[15]) );
  DFFSR \value_reg[14]  ( .D(n30), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[14]) );
  DFFSR \value_reg[13]  ( .D(n32), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[13]) );
  DFFSR \value_reg[12]  ( .D(n34), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[12]) );
  DFFSR \value_reg[11]  ( .D(n36), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[11]) );
  DFFSR \value_reg[10]  ( .D(n38), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[10]) );
  DFFSR \value_reg[9]  ( .D(n40), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[9]) );
  DFFSR \value_reg[8]  ( .D(n42), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[8]) );
  DFFSR \value_reg[7]  ( .D(n44), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[7]) );
  DFFSR \value_reg[6]  ( .D(n46), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[6]) );
  DFFSR \value_reg[5]  ( .D(n48), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[5]) );
  DFFSR \value_reg[4]  ( .D(n50), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[4]) );
  DFFSR \value_reg[3]  ( .D(n52), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[3]) );
  DFFSR \value_reg[2]  ( .D(n53), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[2]) );
  DFFSR \value_reg[1]  ( .D(n54), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[1]) );
  DFFSR \value_reg[0]  ( .D(n55), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[0]) );
  INVX2 U2 ( .A(n1), .Y(n2) );
  INVX2 U3 ( .A(write_enable), .Y(n1) );
  INVX2 U4 ( .A(n4), .Y(n3) );
  INVX2 U5 ( .A(n_reset), .Y(n4) );
  MUX2X1 U6 ( .B(current_value[0]), .A(new_value[0]), .S(n2), .Y(n5) );
  INVX2 U7 ( .A(n5), .Y(n55) );
  MUX2X1 U8 ( .B(current_value[1]), .A(new_value[1]), .S(n2), .Y(n6) );
  INVX2 U9 ( .A(n6), .Y(n54) );
  MUX2X1 U10 ( .B(current_value[2]), .A(new_value[2]), .S(n2), .Y(n7) );
  INVX2 U11 ( .A(n7), .Y(n53) );
  MUX2X1 U12 ( .B(current_value[3]), .A(new_value[3]), .S(n2), .Y(n8) );
  INVX2 U13 ( .A(n8), .Y(n52) );
  MUX2X1 U14 ( .B(current_value[4]), .A(new_value[4]), .S(n2), .Y(n9) );
  INVX2 U15 ( .A(n9), .Y(n50) );
  MUX2X1 U16 ( .B(current_value[5]), .A(new_value[5]), .S(write_enable), .Y(
        n10) );
  INVX2 U17 ( .A(n10), .Y(n48) );
  MUX2X1 U18 ( .B(current_value[6]), .A(new_value[6]), .S(n2), .Y(n11) );
  INVX2 U19 ( .A(n11), .Y(n46) );
  MUX2X1 U20 ( .B(current_value[7]), .A(new_value[7]), .S(write_enable), .Y(
        n12) );
  INVX2 U21 ( .A(n12), .Y(n44) );
  MUX2X1 U22 ( .B(current_value[8]), .A(new_value[8]), .S(n2), .Y(n13) );
  INVX2 U23 ( .A(n13), .Y(n42) );
  MUX2X1 U24 ( .B(current_value[9]), .A(new_value[9]), .S(write_enable), .Y(
        n14) );
  INVX2 U25 ( .A(n14), .Y(n40) );
  MUX2X1 U26 ( .B(current_value[10]), .A(new_value[10]), .S(n2), .Y(n15) );
  INVX2 U27 ( .A(n15), .Y(n38) );
  MUX2X1 U28 ( .B(current_value[11]), .A(new_value[11]), .S(write_enable), .Y(
        n16) );
  INVX2 U29 ( .A(n16), .Y(n36) );
  MUX2X1 U30 ( .B(current_value[12]), .A(new_value[12]), .S(n2), .Y(n17) );
  INVX2 U31 ( .A(n17), .Y(n34) );
  MUX2X1 U32 ( .B(current_value[13]), .A(new_value[13]), .S(write_enable), .Y(
        n18) );
  INVX2 U33 ( .A(n18), .Y(n32) );
  MUX2X1 U34 ( .B(current_value[14]), .A(new_value[14]), .S(n2), .Y(n20) );
  INVX2 U35 ( .A(n20), .Y(n30) );
  MUX2X1 U36 ( .B(current_value[15]), .A(new_value[15]), .S(write_enable), .Y(
        n22) );
  INVX2 U54 ( .A(n22), .Y(n28) );
  MUX2X1 U55 ( .B(current_value[16]), .A(new_value[16]), .S(n2), .Y(n24) );
  INVX2 U56 ( .A(n24), .Y(n26) );
endmodule


module flex_sreg_NUM_BITS17_3 ( clk, n_reset, write_enable, new_value, 
        current_value );
  input [16:0] new_value;
  output [16:0] current_value;
  input clk, n_reset, write_enable;
  wire   n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16,
         n17, n18, n20, n22, n24, n26, n28, n30, n32, n34, n36, n38, n40, n42,
         n44, n46, n48, n50, n52, n53, n54, n55;

  DFFSR \value_reg[16]  ( .D(n26), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[16]) );
  DFFSR \value_reg[15]  ( .D(n28), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[15]) );
  DFFSR \value_reg[14]  ( .D(n30), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[14]) );
  DFFSR \value_reg[13]  ( .D(n32), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[13]) );
  DFFSR \value_reg[12]  ( .D(n34), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[12]) );
  DFFSR \value_reg[11]  ( .D(n36), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[11]) );
  DFFSR \value_reg[10]  ( .D(n38), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[10]) );
  DFFSR \value_reg[9]  ( .D(n40), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[9]) );
  DFFSR \value_reg[8]  ( .D(n42), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[8]) );
  DFFSR \value_reg[7]  ( .D(n44), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[7]) );
  DFFSR \value_reg[6]  ( .D(n46), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[6]) );
  DFFSR \value_reg[5]  ( .D(n48), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[5]) );
  DFFSR \value_reg[4]  ( .D(n50), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[4]) );
  DFFSR \value_reg[3]  ( .D(n52), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[3]) );
  DFFSR \value_reg[2]  ( .D(n53), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[2]) );
  DFFSR \value_reg[1]  ( .D(n54), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[1]) );
  DFFSR \value_reg[0]  ( .D(n55), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[0]) );
  INVX2 U2 ( .A(n1), .Y(n2) );
  INVX2 U3 ( .A(write_enable), .Y(n1) );
  INVX2 U4 ( .A(n4), .Y(n3) );
  INVX2 U5 ( .A(n_reset), .Y(n4) );
  MUX2X1 U6 ( .B(current_value[0]), .A(new_value[0]), .S(n2), .Y(n5) );
  INVX2 U7 ( .A(n5), .Y(n55) );
  MUX2X1 U8 ( .B(current_value[1]), .A(new_value[1]), .S(n2), .Y(n6) );
  INVX2 U9 ( .A(n6), .Y(n54) );
  MUX2X1 U10 ( .B(current_value[2]), .A(new_value[2]), .S(n2), .Y(n7) );
  INVX2 U11 ( .A(n7), .Y(n53) );
  MUX2X1 U12 ( .B(current_value[3]), .A(new_value[3]), .S(n2), .Y(n8) );
  INVX2 U13 ( .A(n8), .Y(n52) );
  MUX2X1 U14 ( .B(current_value[4]), .A(new_value[4]), .S(n2), .Y(n9) );
  INVX2 U15 ( .A(n9), .Y(n50) );
  MUX2X1 U16 ( .B(current_value[5]), .A(new_value[5]), .S(write_enable), .Y(
        n10) );
  INVX2 U17 ( .A(n10), .Y(n48) );
  MUX2X1 U18 ( .B(current_value[6]), .A(new_value[6]), .S(n2), .Y(n11) );
  INVX2 U19 ( .A(n11), .Y(n46) );
  MUX2X1 U20 ( .B(current_value[7]), .A(new_value[7]), .S(write_enable), .Y(
        n12) );
  INVX2 U21 ( .A(n12), .Y(n44) );
  MUX2X1 U22 ( .B(current_value[8]), .A(new_value[8]), .S(n2), .Y(n13) );
  INVX2 U23 ( .A(n13), .Y(n42) );
  MUX2X1 U24 ( .B(current_value[9]), .A(new_value[9]), .S(write_enable), .Y(
        n14) );
  INVX2 U25 ( .A(n14), .Y(n40) );
  MUX2X1 U26 ( .B(current_value[10]), .A(new_value[10]), .S(n2), .Y(n15) );
  INVX2 U27 ( .A(n15), .Y(n38) );
  MUX2X1 U28 ( .B(current_value[11]), .A(new_value[11]), .S(write_enable), .Y(
        n16) );
  INVX2 U29 ( .A(n16), .Y(n36) );
  MUX2X1 U30 ( .B(current_value[12]), .A(new_value[12]), .S(n2), .Y(n17) );
  INVX2 U31 ( .A(n17), .Y(n34) );
  MUX2X1 U32 ( .B(current_value[13]), .A(new_value[13]), .S(write_enable), .Y(
        n18) );
  INVX2 U33 ( .A(n18), .Y(n32) );
  MUX2X1 U34 ( .B(current_value[14]), .A(new_value[14]), .S(n2), .Y(n20) );
  INVX2 U35 ( .A(n20), .Y(n30) );
  MUX2X1 U36 ( .B(current_value[15]), .A(new_value[15]), .S(write_enable), .Y(
        n22) );
  INVX2 U54 ( .A(n22), .Y(n28) );
  MUX2X1 U55 ( .B(current_value[16]), .A(new_value[16]), .S(n2), .Y(n24) );
  INVX2 U56 ( .A(n24), .Y(n26) );
endmodule


module flex_sreg_NUM_BITS17_2 ( clk, n_reset, write_enable, new_value, 
        current_value );
  input [16:0] new_value;
  output [16:0] current_value;
  input clk, n_reset, write_enable;
  wire   n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16,
         n17, n18, n20, n22, n24, n26, n28, n30, n32, n34, n36, n38, n40, n42,
         n44, n46, n48, n50, n52, n53, n54, n55;

  DFFSR \value_reg[16]  ( .D(n26), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[16]) );
  DFFSR \value_reg[15]  ( .D(n28), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[15]) );
  DFFSR \value_reg[14]  ( .D(n30), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[14]) );
  DFFSR \value_reg[13]  ( .D(n32), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[13]) );
  DFFSR \value_reg[12]  ( .D(n34), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[12]) );
  DFFSR \value_reg[11]  ( .D(n36), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[11]) );
  DFFSR \value_reg[10]  ( .D(n38), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[10]) );
  DFFSR \value_reg[9]  ( .D(n40), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[9]) );
  DFFSR \value_reg[8]  ( .D(n42), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[8]) );
  DFFSR \value_reg[7]  ( .D(n44), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[7]) );
  DFFSR \value_reg[6]  ( .D(n46), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[6]) );
  DFFSR \value_reg[5]  ( .D(n48), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[5]) );
  DFFSR \value_reg[4]  ( .D(n50), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[4]) );
  DFFSR \value_reg[3]  ( .D(n52), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[3]) );
  DFFSR \value_reg[2]  ( .D(n53), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[2]) );
  DFFSR \value_reg[1]  ( .D(n54), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[1]) );
  DFFSR \value_reg[0]  ( .D(n55), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[0]) );
  INVX2 U2 ( .A(n1), .Y(n2) );
  INVX2 U3 ( .A(write_enable), .Y(n1) );
  INVX2 U4 ( .A(n4), .Y(n3) );
  INVX2 U5 ( .A(n_reset), .Y(n4) );
  MUX2X1 U6 ( .B(current_value[0]), .A(new_value[0]), .S(n2), .Y(n5) );
  INVX2 U7 ( .A(n5), .Y(n55) );
  MUX2X1 U8 ( .B(current_value[1]), .A(new_value[1]), .S(n2), .Y(n6) );
  INVX2 U9 ( .A(n6), .Y(n54) );
  MUX2X1 U10 ( .B(current_value[2]), .A(new_value[2]), .S(n2), .Y(n7) );
  INVX2 U11 ( .A(n7), .Y(n53) );
  MUX2X1 U12 ( .B(current_value[3]), .A(new_value[3]), .S(n2), .Y(n8) );
  INVX2 U13 ( .A(n8), .Y(n52) );
  MUX2X1 U14 ( .B(current_value[4]), .A(new_value[4]), .S(n2), .Y(n9) );
  INVX2 U15 ( .A(n9), .Y(n50) );
  MUX2X1 U16 ( .B(current_value[5]), .A(new_value[5]), .S(write_enable), .Y(
        n10) );
  INVX2 U17 ( .A(n10), .Y(n48) );
  MUX2X1 U18 ( .B(current_value[6]), .A(new_value[6]), .S(n2), .Y(n11) );
  INVX2 U19 ( .A(n11), .Y(n46) );
  MUX2X1 U20 ( .B(current_value[7]), .A(new_value[7]), .S(write_enable), .Y(
        n12) );
  INVX2 U21 ( .A(n12), .Y(n44) );
  MUX2X1 U22 ( .B(current_value[8]), .A(new_value[8]), .S(n2), .Y(n13) );
  INVX2 U23 ( .A(n13), .Y(n42) );
  MUX2X1 U24 ( .B(current_value[9]), .A(new_value[9]), .S(write_enable), .Y(
        n14) );
  INVX2 U25 ( .A(n14), .Y(n40) );
  MUX2X1 U26 ( .B(current_value[10]), .A(new_value[10]), .S(n2), .Y(n15) );
  INVX2 U27 ( .A(n15), .Y(n38) );
  MUX2X1 U28 ( .B(current_value[11]), .A(new_value[11]), .S(write_enable), .Y(
        n16) );
  INVX2 U29 ( .A(n16), .Y(n36) );
  MUX2X1 U30 ( .B(current_value[12]), .A(new_value[12]), .S(n2), .Y(n17) );
  INVX2 U31 ( .A(n17), .Y(n34) );
  MUX2X1 U32 ( .B(current_value[13]), .A(new_value[13]), .S(write_enable), .Y(
        n18) );
  INVX2 U33 ( .A(n18), .Y(n32) );
  MUX2X1 U34 ( .B(current_value[14]), .A(new_value[14]), .S(n2), .Y(n20) );
  INVX2 U35 ( .A(n20), .Y(n30) );
  MUX2X1 U36 ( .B(current_value[15]), .A(new_value[15]), .S(write_enable), .Y(
        n22) );
  INVX2 U54 ( .A(n22), .Y(n28) );
  MUX2X1 U55 ( .B(current_value[16]), .A(new_value[16]), .S(n2), .Y(n24) );
  INVX2 U56 ( .A(n24), .Y(n26) );
endmodule


module flex_sreg_NUM_BITS17_1 ( clk, n_reset, write_enable, new_value, 
        current_value );
  input [16:0] new_value;
  output [16:0] current_value;
  input clk, n_reset, write_enable;
  wire   n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16,
         n17, n18, n20, n22, n24, n26, n28, n30, n32, n34, n36, n38, n40, n42,
         n44, n46, n48, n50, n52, n53, n54, n55;

  DFFSR \value_reg[16]  ( .D(n26), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[16]) );
  DFFSR \value_reg[15]  ( .D(n28), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[15]) );
  DFFSR \value_reg[14]  ( .D(n30), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[14]) );
  DFFSR \value_reg[13]  ( .D(n32), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[13]) );
  DFFSR \value_reg[12]  ( .D(n34), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[12]) );
  DFFSR \value_reg[11]  ( .D(n36), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[11]) );
  DFFSR \value_reg[10]  ( .D(n38), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[10]) );
  DFFSR \value_reg[9]  ( .D(n40), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[9]) );
  DFFSR \value_reg[8]  ( .D(n42), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[8]) );
  DFFSR \value_reg[7]  ( .D(n44), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[7]) );
  DFFSR \value_reg[6]  ( .D(n46), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[6]) );
  DFFSR \value_reg[5]  ( .D(n48), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[5]) );
  DFFSR \value_reg[4]  ( .D(n50), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[4]) );
  DFFSR \value_reg[3]  ( .D(n52), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[3]) );
  DFFSR \value_reg[2]  ( .D(n53), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[2]) );
  DFFSR \value_reg[1]  ( .D(n54), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[1]) );
  DFFSR \value_reg[0]  ( .D(n55), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[0]) );
  INVX2 U2 ( .A(n1), .Y(n2) );
  INVX2 U3 ( .A(write_enable), .Y(n1) );
  INVX2 U4 ( .A(n4), .Y(n3) );
  INVX2 U5 ( .A(n_reset), .Y(n4) );
  MUX2X1 U6 ( .B(current_value[0]), .A(new_value[0]), .S(n2), .Y(n5) );
  INVX2 U7 ( .A(n5), .Y(n55) );
  MUX2X1 U8 ( .B(current_value[1]), .A(new_value[1]), .S(n2), .Y(n6) );
  INVX2 U9 ( .A(n6), .Y(n54) );
  MUX2X1 U10 ( .B(current_value[2]), .A(new_value[2]), .S(n2), .Y(n7) );
  INVX2 U11 ( .A(n7), .Y(n53) );
  MUX2X1 U12 ( .B(current_value[3]), .A(new_value[3]), .S(n2), .Y(n8) );
  INVX2 U13 ( .A(n8), .Y(n52) );
  MUX2X1 U14 ( .B(current_value[4]), .A(new_value[4]), .S(n2), .Y(n9) );
  INVX2 U15 ( .A(n9), .Y(n50) );
  MUX2X1 U16 ( .B(current_value[5]), .A(new_value[5]), .S(write_enable), .Y(
        n10) );
  INVX2 U17 ( .A(n10), .Y(n48) );
  MUX2X1 U18 ( .B(current_value[6]), .A(new_value[6]), .S(n2), .Y(n11) );
  INVX2 U19 ( .A(n11), .Y(n46) );
  MUX2X1 U20 ( .B(current_value[7]), .A(new_value[7]), .S(write_enable), .Y(
        n12) );
  INVX2 U21 ( .A(n12), .Y(n44) );
  MUX2X1 U22 ( .B(current_value[8]), .A(new_value[8]), .S(n2), .Y(n13) );
  INVX2 U23 ( .A(n13), .Y(n42) );
  MUX2X1 U24 ( .B(current_value[9]), .A(new_value[9]), .S(write_enable), .Y(
        n14) );
  INVX2 U25 ( .A(n14), .Y(n40) );
  MUX2X1 U26 ( .B(current_value[10]), .A(new_value[10]), .S(n2), .Y(n15) );
  INVX2 U27 ( .A(n15), .Y(n38) );
  MUX2X1 U28 ( .B(current_value[11]), .A(new_value[11]), .S(write_enable), .Y(
        n16) );
  INVX2 U29 ( .A(n16), .Y(n36) );
  MUX2X1 U30 ( .B(current_value[12]), .A(new_value[12]), .S(n2), .Y(n17) );
  INVX2 U31 ( .A(n17), .Y(n34) );
  MUX2X1 U32 ( .B(current_value[13]), .A(new_value[13]), .S(write_enable), .Y(
        n18) );
  INVX2 U33 ( .A(n18), .Y(n32) );
  MUX2X1 U34 ( .B(current_value[14]), .A(new_value[14]), .S(n2), .Y(n20) );
  INVX2 U35 ( .A(n20), .Y(n30) );
  MUX2X1 U36 ( .B(current_value[15]), .A(new_value[15]), .S(write_enable), .Y(
        n22) );
  INVX2 U54 ( .A(n22), .Y(n28) );
  MUX2X1 U55 ( .B(current_value[16]), .A(new_value[16]), .S(n2), .Y(n24) );
  INVX2 U56 ( .A(n24), .Y(n26) );
endmodule


module flex_sreg_NUM_BITS17_0 ( clk, n_reset, write_enable, new_value, 
        current_value );
  input [16:0] new_value;
  output [16:0] current_value;
  input clk, n_reset, write_enable;
  wire   n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16,
         n17, n18, n20, n22, n24, n26, n28, n30, n32, n34, n36, n38, n40, n42,
         n44, n46, n48, n50, n52, n53, n54, n55;

  DFFSR \value_reg[16]  ( .D(n26), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[16]) );
  DFFSR \value_reg[15]  ( .D(n28), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[15]) );
  DFFSR \value_reg[14]  ( .D(n30), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[14]) );
  DFFSR \value_reg[13]  ( .D(n32), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[13]) );
  DFFSR \value_reg[12]  ( .D(n34), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[12]) );
  DFFSR \value_reg[11]  ( .D(n36), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[11]) );
  DFFSR \value_reg[10]  ( .D(n38), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[10]) );
  DFFSR \value_reg[9]  ( .D(n40), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[9]) );
  DFFSR \value_reg[8]  ( .D(n42), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[8]) );
  DFFSR \value_reg[7]  ( .D(n44), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[7]) );
  DFFSR \value_reg[6]  ( .D(n46), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[6]) );
  DFFSR \value_reg[5]  ( .D(n48), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[5]) );
  DFFSR \value_reg[4]  ( .D(n50), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[4]) );
  DFFSR \value_reg[3]  ( .D(n52), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[3]) );
  DFFSR \value_reg[2]  ( .D(n53), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[2]) );
  DFFSR \value_reg[1]  ( .D(n54), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[1]) );
  DFFSR \value_reg[0]  ( .D(n55), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[0]) );
  INVX2 U2 ( .A(n1), .Y(n2) );
  INVX2 U3 ( .A(write_enable), .Y(n1) );
  INVX2 U4 ( .A(n4), .Y(n3) );
  INVX2 U5 ( .A(n_reset), .Y(n4) );
  MUX2X1 U6 ( .B(current_value[0]), .A(new_value[0]), .S(n2), .Y(n5) );
  INVX2 U7 ( .A(n5), .Y(n55) );
  MUX2X1 U8 ( .B(current_value[1]), .A(new_value[1]), .S(n2), .Y(n6) );
  INVX2 U9 ( .A(n6), .Y(n54) );
  MUX2X1 U10 ( .B(current_value[2]), .A(new_value[2]), .S(n2), .Y(n7) );
  INVX2 U11 ( .A(n7), .Y(n53) );
  MUX2X1 U12 ( .B(current_value[3]), .A(new_value[3]), .S(n2), .Y(n8) );
  INVX2 U13 ( .A(n8), .Y(n52) );
  MUX2X1 U14 ( .B(current_value[4]), .A(new_value[4]), .S(n2), .Y(n9) );
  INVX2 U15 ( .A(n9), .Y(n50) );
  MUX2X1 U16 ( .B(current_value[5]), .A(new_value[5]), .S(write_enable), .Y(
        n10) );
  INVX2 U17 ( .A(n10), .Y(n48) );
  MUX2X1 U18 ( .B(current_value[6]), .A(new_value[6]), .S(n2), .Y(n11) );
  INVX2 U19 ( .A(n11), .Y(n46) );
  MUX2X1 U20 ( .B(current_value[7]), .A(new_value[7]), .S(write_enable), .Y(
        n12) );
  INVX2 U21 ( .A(n12), .Y(n44) );
  MUX2X1 U22 ( .B(current_value[8]), .A(new_value[8]), .S(n2), .Y(n13) );
  INVX2 U23 ( .A(n13), .Y(n42) );
  MUX2X1 U24 ( .B(current_value[9]), .A(new_value[9]), .S(write_enable), .Y(
        n14) );
  INVX2 U25 ( .A(n14), .Y(n40) );
  MUX2X1 U26 ( .B(current_value[10]), .A(new_value[10]), .S(n2), .Y(n15) );
  INVX2 U27 ( .A(n15), .Y(n38) );
  MUX2X1 U28 ( .B(current_value[11]), .A(new_value[11]), .S(write_enable), .Y(
        n16) );
  INVX2 U29 ( .A(n16), .Y(n36) );
  MUX2X1 U30 ( .B(current_value[12]), .A(new_value[12]), .S(n2), .Y(n17) );
  INVX2 U31 ( .A(n17), .Y(n34) );
  MUX2X1 U32 ( .B(current_value[13]), .A(new_value[13]), .S(write_enable), .Y(
        n18) );
  INVX2 U33 ( .A(n18), .Y(n32) );
  MUX2X1 U34 ( .B(current_value[14]), .A(new_value[14]), .S(n2), .Y(n20) );
  INVX2 U35 ( .A(n20), .Y(n30) );
  MUX2X1 U36 ( .B(current_value[15]), .A(new_value[15]), .S(write_enable), .Y(
        n22) );
  INVX2 U54 ( .A(n22), .Y(n28) );
  MUX2X1 U55 ( .B(current_value[16]), .A(new_value[16]), .S(n2), .Y(n24) );
  INVX2 U56 ( .A(n24), .Y(n26) );
endmodule


module register_file ( clk, n_reset, w_en, r1_sel, r2_sel, w_sel, w_data, 
        r1_data, r2_data, outreg_data );
  input [3:0] r1_sel;
  input [3:0] r2_sel;
  input [3:0] w_sel;
  input [16:0] w_data;
  output [16:0] r1_data;
  output [16:0] r2_data;
  output [16:0] outreg_data;
  input clk, n_reset, w_en;
  wire   N10, N11, N12, N13, N14, N15, N16, N17, n698, \regs_matrix[15][16] ,
         \regs_matrix[15][15] , \regs_matrix[15][14] , \regs_matrix[15][13] ,
         \regs_matrix[15][12] , \regs_matrix[15][11] , \regs_matrix[15][10] ,
         \regs_matrix[15][9] , \regs_matrix[15][8] , \regs_matrix[15][7] ,
         \regs_matrix[15][6] , \regs_matrix[15][5] , \regs_matrix[15][4] ,
         \regs_matrix[15][3] , \regs_matrix[15][2] , \regs_matrix[15][1] ,
         \regs_matrix[15][0] , \regs_matrix[14][16] , \regs_matrix[14][15] ,
         \regs_matrix[14][14] , \regs_matrix[14][13] , \regs_matrix[14][12] ,
         \regs_matrix[14][11] , \regs_matrix[14][10] , \regs_matrix[14][9] ,
         \regs_matrix[14][8] , \regs_matrix[14][7] , \regs_matrix[14][6] ,
         \regs_matrix[14][5] , \regs_matrix[14][4] , \regs_matrix[14][3] ,
         \regs_matrix[14][2] , \regs_matrix[14][1] , \regs_matrix[14][0] ,
         \regs_matrix[13][16] , \regs_matrix[13][15] , \regs_matrix[13][14] ,
         \regs_matrix[13][13] , \regs_matrix[13][12] , \regs_matrix[13][11] ,
         \regs_matrix[13][10] , \regs_matrix[13][9] , \regs_matrix[13][8] ,
         \regs_matrix[13][7] , \regs_matrix[13][6] , \regs_matrix[13][5] ,
         \regs_matrix[13][4] , \regs_matrix[13][3] , \regs_matrix[13][2] ,
         \regs_matrix[13][1] , \regs_matrix[13][0] , \regs_matrix[12][16] ,
         \regs_matrix[12][15] , \regs_matrix[12][14] , \regs_matrix[12][13] ,
         \regs_matrix[12][12] , \regs_matrix[12][11] , \regs_matrix[12][10] ,
         \regs_matrix[12][9] , \regs_matrix[12][8] , \regs_matrix[12][7] ,
         \regs_matrix[12][6] , \regs_matrix[12][5] , \regs_matrix[12][4] ,
         \regs_matrix[12][3] , \regs_matrix[12][2] , \regs_matrix[12][1] ,
         \regs_matrix[12][0] , \regs_matrix[11][16] , \regs_matrix[11][15] ,
         \regs_matrix[11][14] , \regs_matrix[11][13] , \regs_matrix[11][12] ,
         \regs_matrix[11][11] , \regs_matrix[11][10] , \regs_matrix[11][9] ,
         \regs_matrix[11][8] , \regs_matrix[11][7] , \regs_matrix[11][6] ,
         \regs_matrix[11][5] , \regs_matrix[11][4] , \regs_matrix[11][3] ,
         \regs_matrix[11][2] , \regs_matrix[11][1] , \regs_matrix[11][0] ,
         \regs_matrix[10][16] , \regs_matrix[10][15] , \regs_matrix[10][14] ,
         \regs_matrix[10][13] , \regs_matrix[10][12] , \regs_matrix[10][11] ,
         \regs_matrix[10][10] , \regs_matrix[10][9] , \regs_matrix[10][8] ,
         \regs_matrix[10][7] , \regs_matrix[10][6] , \regs_matrix[10][5] ,
         \regs_matrix[10][4] , \regs_matrix[10][3] , \regs_matrix[10][2] ,
         \regs_matrix[10][1] , \regs_matrix[10][0] , \regs_matrix[9][16] ,
         \regs_matrix[9][15] , \regs_matrix[9][14] , \regs_matrix[9][13] ,
         \regs_matrix[9][12] , \regs_matrix[9][11] , \regs_matrix[9][10] ,
         \regs_matrix[9][9] , \regs_matrix[9][8] , \regs_matrix[9][7] ,
         \regs_matrix[9][6] , \regs_matrix[9][5] , \regs_matrix[9][4] ,
         \regs_matrix[9][3] , \regs_matrix[9][2] , \regs_matrix[9][1] ,
         \regs_matrix[9][0] , \regs_matrix[8][16] , \regs_matrix[8][15] ,
         \regs_matrix[8][14] , \regs_matrix[8][13] , \regs_matrix[8][12] ,
         \regs_matrix[8][11] , \regs_matrix[8][10] , \regs_matrix[8][9] ,
         \regs_matrix[8][8] , \regs_matrix[8][7] , \regs_matrix[8][6] ,
         \regs_matrix[8][5] , \regs_matrix[8][4] , \regs_matrix[8][3] ,
         \regs_matrix[8][2] , \regs_matrix[8][1] , \regs_matrix[8][0] ,
         \regs_matrix[7][16] , \regs_matrix[7][15] , \regs_matrix[7][14] ,
         \regs_matrix[7][13] , \regs_matrix[7][12] , \regs_matrix[7][11] ,
         \regs_matrix[7][10] , \regs_matrix[7][9] , \regs_matrix[7][8] ,
         \regs_matrix[7][7] , \regs_matrix[7][6] , \regs_matrix[7][5] ,
         \regs_matrix[7][4] , \regs_matrix[7][3] , \regs_matrix[7][2] ,
         \regs_matrix[7][1] , \regs_matrix[7][0] , \regs_matrix[6][16] ,
         \regs_matrix[6][15] , \regs_matrix[6][14] , \regs_matrix[6][13] ,
         \regs_matrix[6][12] , \regs_matrix[6][11] , \regs_matrix[6][10] ,
         \regs_matrix[6][9] , \regs_matrix[6][8] , \regs_matrix[6][7] ,
         \regs_matrix[6][6] , \regs_matrix[6][5] , \regs_matrix[6][4] ,
         \regs_matrix[6][3] , \regs_matrix[6][2] , \regs_matrix[6][1] ,
         \regs_matrix[6][0] , \regs_matrix[5][16] , \regs_matrix[5][15] ,
         \regs_matrix[5][14] , \regs_matrix[5][13] , \regs_matrix[5][12] ,
         \regs_matrix[5][11] , \regs_matrix[5][10] , \regs_matrix[5][9] ,
         \regs_matrix[5][8] , \regs_matrix[5][7] , \regs_matrix[5][6] ,
         \regs_matrix[5][5] , \regs_matrix[5][4] , \regs_matrix[5][3] ,
         \regs_matrix[5][2] , \regs_matrix[5][1] , \regs_matrix[5][0] ,
         \regs_matrix[4][16] , \regs_matrix[4][15] , \regs_matrix[4][14] ,
         \regs_matrix[4][13] , \regs_matrix[4][12] , \regs_matrix[4][11] ,
         \regs_matrix[4][10] , \regs_matrix[4][9] , \regs_matrix[4][8] ,
         \regs_matrix[4][7] , \regs_matrix[4][6] , \regs_matrix[4][5] ,
         \regs_matrix[4][4] , \regs_matrix[4][3] , \regs_matrix[4][2] ,
         \regs_matrix[4][1] , \regs_matrix[4][0] , \regs_matrix[3][16] ,
         \regs_matrix[3][15] , \regs_matrix[3][14] , \regs_matrix[3][13] ,
         \regs_matrix[3][12] , \regs_matrix[3][11] , \regs_matrix[3][10] ,
         \regs_matrix[3][9] , \regs_matrix[3][8] , \regs_matrix[3][7] ,
         \regs_matrix[3][6] , \regs_matrix[3][5] , \regs_matrix[3][4] ,
         \regs_matrix[3][3] , \regs_matrix[3][2] , \regs_matrix[3][1] ,
         \regs_matrix[3][0] , \regs_matrix[2][16] , \regs_matrix[2][15] ,
         \regs_matrix[2][14] , \regs_matrix[2][13] , \regs_matrix[2][12] ,
         \regs_matrix[2][11] , \regs_matrix[2][10] , \regs_matrix[2][9] ,
         \regs_matrix[2][8] , \regs_matrix[2][7] , \regs_matrix[2][6] ,
         \regs_matrix[2][5] , \regs_matrix[2][4] , \regs_matrix[2][3] ,
         \regs_matrix[2][2] , \regs_matrix[2][1] , \regs_matrix[2][0] ,
         \regs_matrix[1][16] , \regs_matrix[1][15] , \regs_matrix[1][14] ,
         \regs_matrix[1][13] , \regs_matrix[1][12] , \regs_matrix[1][11] ,
         \regs_matrix[1][10] , \regs_matrix[1][9] , \regs_matrix[1][8] ,
         \regs_matrix[1][7] , \regs_matrix[1][6] , \regs_matrix[1][5] ,
         \regs_matrix[1][4] , \regs_matrix[1][3] , \regs_matrix[1][2] ,
         \regs_matrix[1][1] , \regs_matrix[1][0] , n5, n6, n7, n8, n9, n10,
         n11, n12, n13, n1, n2, n3, n4, n14, n15, n16, n17, n18, n19, n20, n21,
         n22, n23, n24, n25, n26, n27, n28, n29, n30, n31, n32, n33, n34, n35,
         n37, n38, n39, n40, n41, n42, n43, n44, n45, n46, n47, n48, n49, n50,
         n51, n52, n53, n54, n55, n56, n57, n58, n59, n60, n61, n62, n63, n64,
         n65, n66, n67, n68, n69, n70, n71, n72, n73, n74, n75, n76, n77, n78,
         n79, n80, n81, n82, n83, n84, n85, n86, n87, n88, n89, n90, n91, n92,
         n93, n94, n95, n96, n97, n98, n99, n100, n101, n102, n103, n104, n105,
         n106, n107, n108, n109, n110, n111, n112, n113, n114, n115, n116,
         n117, n118, n119, n120, n121, n122, n123, n124, n125, n126, n127,
         n128, n129, n130, n131, n132, n133, n134, n135, n136, n137, n138,
         n139, n140, n141, n142, n143, n144, n145, n146, n147, n148, n149,
         n150, n151, n152, n153, n154, n155, n156, n157, n158, n159, n160,
         n161, n162, n163, n164, n165, n166, n167, n168, n169, n170, n171,
         n172, n173, n174, n175, n176, n177, n178, n179, n180, n181, n182,
         n183, n184, n185, n186, n187, n188, n189, n190, n191, n192, n193,
         n194, n195, n196, n197, n198, n199, n200, n201, n202, n203, n204,
         n205, n206, n207, n208, n209, n210, n211, n212, n213, n214, n215,
         n216, n217, n218, n219, n220, n221, n222, n223, n224, n225, n226,
         n227, n228, n229, n230, n231, n232, n233, n234, n235, n236, n237,
         n238, n239, n240, n241, n242, n243, n244, n245, n246, n247, n248,
         n249, n250, n251, n252, n253, n254, n255, n256, n257, n258, n259,
         n260, n261, n262, n263, n264, n265, n266, n267, n268, n269, n270,
         n271, n272, n273, n274, n275, n276, n277, n278, n279, n280, n281,
         n282, n283, n284, n285, n286, n287, n288, n289, n290, n291, n292,
         n293, n294, n295, n296, n297, n298, n299, n300, n301, n302, n303,
         n304, n305, n306, n307, n308, n309, n310, n311, n312, n313, n314,
         n315, n316, n317, n318, n319, n320, n321, n322, n323, n324, n325,
         n326, n327, n328, n329, n330, n331, n332, n333, n334, n335, n336,
         n337, n338, n339, n340, n341, n342, n343, n344, n345, n346, n347,
         n348, n349, n350, n351, n352, n353, n354, n355, n356, n357, n358,
         n359, n360, n361, n362, n363, n364, n365, n366, n367, n368, n369,
         n370, n371, n372, n373, n374, n375, n376, n377, n378, n379, n380,
         n381, n382, n383, n384, n385, n386, n387, n388, n389, n390, n391,
         n392, n393, n394, n395, n396, n397, n398, n399, n400, n401, n402,
         n403, n404, n405, n406, n407, n408, n409, n410, n411, n412, n413,
         n414, n415, n416, n417, n418, n419, n420, n421, n422, n423, n424,
         n425, n426, n427, n428, n429, n430, n431, n432, n433, n434, n435,
         n436, n437, n438, n439, n440, n441, n442, n443, n444, n445, n446,
         n447, n448, n449, n450, n451, n452, n453, n454, n455, n456, n457,
         n458, n459, n460, n461, n462, n463, n464, n465, n466, n467, n468,
         n469, n470, n471, n472, n473, n474, n475, n476, n477, n478, n479,
         n480, n481, n482, n483, n484, n485, n486, n487, n488, n489, n490,
         n491, n492, n493, n494, n495, n496, n497, n498, n499, n500, n501,
         n502, n503, n504, n505, n506, n507, n508, n509, n510, n511, n512,
         n513, n514, n515, n516, n517, n518, n519, n520, n521, n522, n523,
         n524, n525, n526, n527, n528, n529, n530, n531, n532, n533, n534,
         n535, n536, n537, n538, n539, n540, n541, n542, n543, n544, n545,
         n546, n547, n548, n549, n550, n551, n552, n553, n554, n555, n556,
         n557, n558, n559, n560, n561, n562, n563, n564, n565, n566, n567,
         n568, n569, n570, n571, n572, n573, n574, n575, n576, n577, n578,
         n579, n580, n581, n582, n583, n584, n585, n586, n587, n588, n589,
         n590, n591, n592, n593, n594, n595, n596, n597, n598, n599, n600,
         n601, n602, n603, n604, n605, n606, n607, n608, n609, n610, n611,
         n612, n613, n614, n615, n616, n617, n618, n619, n620, n621, n622,
         n623, n624, n625, n626, n627, n628, n629, n630, n631, n632, n633,
         n634, n635, n636, n637, n638, n639, n640, n641, n642, n643, n644,
         n645, n646, n647, n648, n649, n650, n651, n652, n653, n654, n655,
         n656, n657, n658, n659, n660, n661, n662, n663, n664, n665, n666,
         n667, n668, n669, n670, n671, n672, n673, n674, n675, n676, n677,
         n678, n679, n680, n681, n682, n683, n684, n685, n686, n687, n688,
         n689, n690, n691, n692, n693, n694, n695, n696, n697;
  wire   [15:0] write_enables;
  assign N10 = r1_sel[0];
  assign N11 = r1_sel[1];
  assign N12 = r1_sel[2];
  assign N13 = r1_sel[3];
  assign N14 = r2_sel[0];
  assign N15 = r2_sel[1];
  assign N16 = r2_sel[2];
  assign N17 = r2_sel[3];

  NOR2X1 U6 ( .A(n5), .B(n6), .Y(write_enables[9]) );
  NOR2X1 U7 ( .A(n6), .B(n7), .Y(write_enables[8]) );
  NOR2X1 U8 ( .A(n8), .B(n9), .Y(write_enables[7]) );
  NOR2X1 U9 ( .A(n8), .B(n10), .Y(write_enables[6]) );
  NOR2X1 U10 ( .A(n9), .B(n11), .Y(write_enables[5]) );
  NOR2X1 U11 ( .A(n10), .B(n11), .Y(write_enables[4]) );
  NOR2X1 U12 ( .A(n9), .B(n12), .Y(write_enables[3]) );
  NOR2X1 U13 ( .A(n10), .B(n12), .Y(write_enables[2]) );
  NOR2X1 U14 ( .A(n6), .B(n9), .Y(write_enables[1]) );
  NAND3X1 U15 ( .A(w_en), .B(n695), .C(w_sel[0]), .Y(n9) );
  NOR2X1 U16 ( .A(n5), .B(n8), .Y(write_enables[15]) );
  NOR2X1 U17 ( .A(n7), .B(n8), .Y(write_enables[14]) );
  NAND2X1 U18 ( .A(w_sel[2]), .B(w_sel[1]), .Y(n8) );
  NOR2X1 U19 ( .A(n5), .B(n11), .Y(write_enables[13]) );
  NOR2X1 U20 ( .A(n7), .B(n11), .Y(write_enables[12]) );
  NAND2X1 U21 ( .A(w_sel[2]), .B(n696), .Y(n11) );
  NOR2X1 U22 ( .A(n5), .B(n12), .Y(write_enables[11]) );
  NAND3X1 U23 ( .A(w_sel[0]), .B(w_en), .C(w_sel[3]), .Y(n5) );
  NOR2X1 U24 ( .A(n7), .B(n12), .Y(write_enables[10]) );
  NAND2X1 U25 ( .A(w_sel[1]), .B(n697), .Y(n12) );
  NAND2X1 U26 ( .A(n13), .B(w_sel[3]), .Y(n7) );
  NOR2X1 U27 ( .A(n6), .B(n10), .Y(write_enables[0]) );
  NAND2X1 U28 ( .A(n13), .B(n695), .Y(n10) );
  NOR2X1 U29 ( .A(n694), .B(w_sel[0]), .Y(n13) );
  NAND2X1 U30 ( .A(n696), .B(n697), .Y(n6) );
  flex_sreg_NUM_BITS17_15 \genblk1[0].REGX  ( .clk(clk), .n_reset(n693), 
        .write_enable(write_enables[0]), .new_value({w_data[16], n685, n43, 
        n680, n42, n675, n44, n670, n54, n665, n50, n660, n657, n654, n651, 
        n648, n645}), .current_value(outreg_data) );
  flex_sreg_NUM_BITS17_14 \genblk1[1].REGX  ( .clk(clk), .n_reset(n686), 
        .write_enable(write_enables[1]), .new_value({w_data[16], n55, n43, n59, 
        n42, n45, n44, n51, n53, n47, n49, n659, n656, n653, n650, n647, n645}), .current_value({\regs_matrix[1][16] , \regs_matrix[1][15] , 
        \regs_matrix[1][14] , \regs_matrix[1][13] , \regs_matrix[1][12] , 
        \regs_matrix[1][11] , \regs_matrix[1][10] , \regs_matrix[1][9] , 
        \regs_matrix[1][8] , \regs_matrix[1][7] , \regs_matrix[1][6] , 
        \regs_matrix[1][5] , \regs_matrix[1][4] , \regs_matrix[1][3] , 
        \regs_matrix[1][2] , \regs_matrix[1][1] , \regs_matrix[1][0] }) );
  flex_sreg_NUM_BITS17_13 \genblk1[2].REGX  ( .clk(clk), .n_reset(n686), 
        .write_enable(write_enables[2]), .new_value({w_data[16], n685, n43, 
        n680, n42, n675, n44, n670, n53, n665, n49, n660, n657, n654, n651, 
        n648, w_data[0]}), .current_value({\regs_matrix[2][16] , 
        \regs_matrix[2][15] , \regs_matrix[2][14] , \regs_matrix[2][13] , 
        \regs_matrix[2][12] , \regs_matrix[2][11] , \regs_matrix[2][10] , 
        \regs_matrix[2][9] , \regs_matrix[2][8] , \regs_matrix[2][7] , 
        \regs_matrix[2][6] , \regs_matrix[2][5] , \regs_matrix[2][4] , 
        \regs_matrix[2][3] , \regs_matrix[2][2] , \regs_matrix[2][1] , 
        \regs_matrix[2][0] }) );
  flex_sreg_NUM_BITS17_12 \genblk1[3].REGX  ( .clk(clk), .n_reset(n687), 
        .write_enable(write_enables[3]), .new_value({w_data[16], n684, n682, 
        n679, n677, n674, n672, n669, n667, n664, n662, n659, n656, n653, n650, 
        n647, n645}), .current_value({\regs_matrix[3][16] , 
        \regs_matrix[3][15] , \regs_matrix[3][14] , \regs_matrix[3][13] , 
        \regs_matrix[3][12] , \regs_matrix[3][11] , \regs_matrix[3][10] , 
        \regs_matrix[3][9] , \regs_matrix[3][8] , \regs_matrix[3][7] , 
        \regs_matrix[3][6] , \regs_matrix[3][5] , \regs_matrix[3][4] , 
        \regs_matrix[3][3] , \regs_matrix[3][2] , \regs_matrix[3][1] , 
        \regs_matrix[3][0] }) );
  flex_sreg_NUM_BITS17_11 \genblk1[4].REGX  ( .clk(clk), .n_reset(n687), 
        .write_enable(write_enables[4]), .new_value({w_data[16], n685, n43, 
        n680, n42, n675, n44, n670, w_data[8], n665, w_data[6], n660, n657, 
        n654, n651, n648, w_data[0]}), .current_value({\regs_matrix[4][16] , 
        \regs_matrix[4][15] , \regs_matrix[4][14] , \regs_matrix[4][13] , 
        \regs_matrix[4][12] , \regs_matrix[4][11] , \regs_matrix[4][10] , 
        \regs_matrix[4][9] , \regs_matrix[4][8] , \regs_matrix[4][7] , 
        \regs_matrix[4][6] , \regs_matrix[4][5] , \regs_matrix[4][4] , 
        \regs_matrix[4][3] , \regs_matrix[4][2] , \regs_matrix[4][1] , 
        \regs_matrix[4][0] }) );
  flex_sreg_NUM_BITS17_10 \genblk1[5].REGX  ( .clk(clk), .n_reset(n688), 
        .write_enable(write_enables[5]), .new_value({w_data[16], n56, n43, n60, 
        n42, n46, n44, n52, n54, n48, n50, n659, n656, n653, n650, n647, n645}), .current_value({\regs_matrix[5][16] , \regs_matrix[5][15] , 
        \regs_matrix[5][14] , \regs_matrix[5][13] , \regs_matrix[5][12] , 
        \regs_matrix[5][11] , \regs_matrix[5][10] , \regs_matrix[5][9] , 
        \regs_matrix[5][8] , \regs_matrix[5][7] , \regs_matrix[5][6] , 
        \regs_matrix[5][5] , \regs_matrix[5][4] , \regs_matrix[5][3] , 
        \regs_matrix[5][2] , \regs_matrix[5][1] , \regs_matrix[5][0] }) );
  flex_sreg_NUM_BITS17_9 \genblk1[6].REGX  ( .clk(clk), .n_reset(n688), 
        .write_enable(write_enables[6]), .new_value({w_data[16], n685, n682, 
        n680, n677, n675, n672, n670, n667, n665, n662, n660, n657, n654, n651, 
        n648, w_data[0]}), .current_value({\regs_matrix[6][16] , 
        \regs_matrix[6][15] , \regs_matrix[6][14] , \regs_matrix[6][13] , 
        \regs_matrix[6][12] , \regs_matrix[6][11] , \regs_matrix[6][10] , 
        \regs_matrix[6][9] , \regs_matrix[6][8] , \regs_matrix[6][7] , 
        \regs_matrix[6][6] , \regs_matrix[6][5] , \regs_matrix[6][4] , 
        \regs_matrix[6][3] , \regs_matrix[6][2] , \regs_matrix[6][1] , 
        \regs_matrix[6][0] }) );
  flex_sreg_NUM_BITS17_8 \genblk1[7].REGX  ( .clk(clk), .n_reset(n689), 
        .write_enable(write_enables[7]), .new_value({w_data[16], n55, n43, n59, 
        n42, n45, n44, n51, n53, n47, n49, n659, n656, n653, n650, n647, n645}), .current_value({\regs_matrix[7][16] , \regs_matrix[7][15] , 
        \regs_matrix[7][14] , \regs_matrix[7][13] , \regs_matrix[7][12] , 
        \regs_matrix[7][11] , \regs_matrix[7][10] , \regs_matrix[7][9] , 
        \regs_matrix[7][8] , \regs_matrix[7][7] , \regs_matrix[7][6] , 
        \regs_matrix[7][5] , \regs_matrix[7][4] , \regs_matrix[7][3] , 
        \regs_matrix[7][2] , \regs_matrix[7][1] , \regs_matrix[7][0] }) );
  flex_sreg_NUM_BITS17_7 \genblk1[8].REGX  ( .clk(clk), .n_reset(n689), 
        .write_enable(write_enables[8]), .new_value({w_data[16], n56, n43, n60, 
        n42, n46, n44, n52, n54, n48, n50, n660, n657, n654, n651, n648, 
        w_data[0]}), .current_value({\regs_matrix[8][16] , 
        \regs_matrix[8][15] , \regs_matrix[8][14] , \regs_matrix[8][13] , 
        \regs_matrix[8][12] , \regs_matrix[8][11] , \regs_matrix[8][10] , 
        \regs_matrix[8][9] , \regs_matrix[8][8] , \regs_matrix[8][7] , 
        \regs_matrix[8][6] , \regs_matrix[8][5] , \regs_matrix[8][4] , 
        \regs_matrix[8][3] , \regs_matrix[8][2] , \regs_matrix[8][1] , 
        \regs_matrix[8][0] }) );
  flex_sreg_NUM_BITS17_6 \genblk1[9].REGX  ( .clk(clk), .n_reset(n690), 
        .write_enable(write_enables[9]), .new_value({w_data[16], n684, n682, 
        n679, n677, n674, n672, n669, n667, n664, n662, n659, n656, n653, n650, 
        n647, n645}), .current_value({\regs_matrix[9][16] , 
        \regs_matrix[9][15] , \regs_matrix[9][14] , \regs_matrix[9][13] , 
        \regs_matrix[9][12] , \regs_matrix[9][11] , \regs_matrix[9][10] , 
        \regs_matrix[9][9] , \regs_matrix[9][8] , \regs_matrix[9][7] , 
        \regs_matrix[9][6] , \regs_matrix[9][5] , \regs_matrix[9][4] , 
        \regs_matrix[9][3] , \regs_matrix[9][2] , \regs_matrix[9][1] , 
        \regs_matrix[9][0] }) );
  flex_sreg_NUM_BITS17_5 \genblk1[10].REGX  ( .clk(clk), .n_reset(n690), 
        .write_enable(write_enables[10]), .new_value({w_data[16], n55, n43, 
        n59, n42, n45, n44, n51, n53, n47, n49, n660, n657, n654, n651, n648, 
        w_data[0]}), .current_value({\regs_matrix[10][16] , 
        \regs_matrix[10][15] , \regs_matrix[10][14] , \regs_matrix[10][13] , 
        \regs_matrix[10][12] , \regs_matrix[10][11] , \regs_matrix[10][10] , 
        \regs_matrix[10][9] , \regs_matrix[10][8] , \regs_matrix[10][7] , 
        \regs_matrix[10][6] , \regs_matrix[10][5] , \regs_matrix[10][4] , 
        \regs_matrix[10][3] , \regs_matrix[10][2] , \regs_matrix[10][1] , 
        \regs_matrix[10][0] }) );
  flex_sreg_NUM_BITS17_4 \genblk1[11].REGX  ( .clk(clk), .n_reset(n691), 
        .write_enable(write_enables[11]), .new_value({w_data[16], n56, n43, 
        n60, n42, n46, n44, n52, n54, n48, n50, n659, n656, n653, n650, n647, 
        n645}), .current_value({\regs_matrix[11][16] , \regs_matrix[11][15] , 
        \regs_matrix[11][14] , \regs_matrix[11][13] , \regs_matrix[11][12] , 
        \regs_matrix[11][11] , \regs_matrix[11][10] , \regs_matrix[11][9] , 
        \regs_matrix[11][8] , \regs_matrix[11][7] , \regs_matrix[11][6] , 
        \regs_matrix[11][5] , \regs_matrix[11][4] , \regs_matrix[11][3] , 
        \regs_matrix[11][2] , \regs_matrix[11][1] , \regs_matrix[11][0] }) );
  flex_sreg_NUM_BITS17_3 \genblk1[12].REGX  ( .clk(clk), .n_reset(n691), 
        .write_enable(write_enables[12]), .new_value({w_data[16], n684, n682, 
        n679, n677, n674, n672, n669, n667, n664, n662, n660, n657, n654, n651, 
        n648, w_data[0]}), .current_value({\regs_matrix[12][16] , 
        \regs_matrix[12][15] , \regs_matrix[12][14] , \regs_matrix[12][13] , 
        \regs_matrix[12][12] , \regs_matrix[12][11] , \regs_matrix[12][10] , 
        \regs_matrix[12][9] , \regs_matrix[12][8] , \regs_matrix[12][7] , 
        \regs_matrix[12][6] , \regs_matrix[12][5] , \regs_matrix[12][4] , 
        \regs_matrix[12][3] , \regs_matrix[12][2] , \regs_matrix[12][1] , 
        \regs_matrix[12][0] }) );
  flex_sreg_NUM_BITS17_2 \genblk1[13].REGX  ( .clk(clk), .n_reset(n692), 
        .write_enable(write_enables[13]), .new_value({w_data[16], n55, n43, 
        n59, n42, n45, n44, n51, n53, n47, n49, n659, n656, n653, n650, n647, 
        n645}), .current_value({\regs_matrix[13][16] , \regs_matrix[13][15] , 
        \regs_matrix[13][14] , \regs_matrix[13][13] , \regs_matrix[13][12] , 
        \regs_matrix[13][11] , \regs_matrix[13][10] , \regs_matrix[13][9] , 
        \regs_matrix[13][8] , \regs_matrix[13][7] , \regs_matrix[13][6] , 
        \regs_matrix[13][5] , \regs_matrix[13][4] , \regs_matrix[13][3] , 
        \regs_matrix[13][2] , \regs_matrix[13][1] , \regs_matrix[13][0] }) );
  flex_sreg_NUM_BITS17_1 \genblk1[14].REGX  ( .clk(clk), .n_reset(n692), 
        .write_enable(write_enables[14]), .new_value({w_data[16], n56, n43, 
        n60, n42, n46, n44, n52, n54, n48, n50, n660, n657, n654, n651, n648, 
        w_data[0]}), .current_value({\regs_matrix[14][16] , 
        \regs_matrix[14][15] , \regs_matrix[14][14] , \regs_matrix[14][13] , 
        \regs_matrix[14][12] , \regs_matrix[14][11] , \regs_matrix[14][10] , 
        \regs_matrix[14][9] , \regs_matrix[14][8] , \regs_matrix[14][7] , 
        \regs_matrix[14][6] , \regs_matrix[14][5] , \regs_matrix[14][4] , 
        \regs_matrix[14][3] , \regs_matrix[14][2] , \regs_matrix[14][1] , 
        \regs_matrix[14][0] }) );
  flex_sreg_NUM_BITS17_0 \genblk1[15].REGX  ( .clk(clk), .n_reset(n693), 
        .write_enable(write_enables[15]), .new_value({w_data[16], n684, n682, 
        n679, n677, n674, n672, n669, n667, n664, n662, n659, n656, n653, n650, 
        n647, n645}), .current_value({\regs_matrix[15][16] , 
        \regs_matrix[15][15] , \regs_matrix[15][14] , \regs_matrix[15][13] , 
        \regs_matrix[15][12] , \regs_matrix[15][11] , \regs_matrix[15][10] , 
        \regs_matrix[15][9] , \regs_matrix[15][8] , \regs_matrix[15][7] , 
        \regs_matrix[15][6] , \regs_matrix[15][5] , \regs_matrix[15][4] , 
        \regs_matrix[15][3] , \regs_matrix[15][2] , \regs_matrix[15][1] , 
        \regs_matrix[15][0] }) );
  AND2X2 U2 ( .A(N11), .B(N10), .Y(n63) );
  INVX4 U3 ( .A(N10), .Y(n319) );
  BUFX2 U4 ( .A(N11), .Y(n1) );
  BUFX4 U5 ( .A(n615), .Y(n616) );
  INVX4 U31 ( .A(w_data[8]), .Y(n666) );
  BUFX2 U32 ( .A(n322), .Y(n323) );
  INVX8 U33 ( .A(n328), .Y(n331) );
  INVX4 U34 ( .A(w_data[15]), .Y(n683) );
  INVX4 U35 ( .A(w_data[13]), .Y(n678) );
  INVX4 U36 ( .A(w_data[11]), .Y(n673) );
  INVX4 U37 ( .A(n676), .Y(n42) );
  INVX4 U38 ( .A(n681), .Y(n43) );
  INVX4 U39 ( .A(n671), .Y(n44) );
  INVX8 U40 ( .A(n355), .Y(r1_data[14]) );
  INVX2 U41 ( .A(n324), .Y(n20) );
  INVX4 U42 ( .A(n375), .Y(n630) );
  INVX4 U43 ( .A(w_data[12]), .Y(n676) );
  INVX4 U44 ( .A(w_data[14]), .Y(n681) );
  INVX4 U45 ( .A(w_data[10]), .Y(n671) );
  INVX4 U46 ( .A(n85), .Y(n335) );
  INVX4 U47 ( .A(n84), .Y(n333) );
  INVX1 U48 ( .A(n322), .Y(n2) );
  INVX1 U49 ( .A(n322), .Y(n3) );
  INVX1 U50 ( .A(n322), .Y(n4) );
  INVX1 U51 ( .A(n322), .Y(n14) );
  INVX1 U52 ( .A(n322), .Y(n15) );
  INVX1 U53 ( .A(n323), .Y(n16) );
  INVX1 U54 ( .A(n323), .Y(n17) );
  INVX2 U55 ( .A(n323), .Y(n18) );
  INVX1 U56 ( .A(n324), .Y(n19) );
  INVX1 U57 ( .A(n324), .Y(n21) );
  INVX1 U58 ( .A(n324), .Y(n22) );
  INVX2 U59 ( .A(n324), .Y(n23) );
  INVX1 U60 ( .A(n325), .Y(n24) );
  INVX1 U61 ( .A(n325), .Y(n25) );
  INVX1 U62 ( .A(n325), .Y(n26) );
  INVX1 U63 ( .A(n325), .Y(n27) );
  INVX2 U64 ( .A(n325), .Y(n28) );
  INVX4 U65 ( .A(n82), .Y(n322) );
  INVX8 U66 ( .A(n611), .Y(n614) );
  INVX2 U67 ( .A(n605), .Y(n32) );
  BUFX2 U68 ( .A(n326), .Y(n328) );
  INVX4 U69 ( .A(n610), .Y(n613) );
  BUFX2 U70 ( .A(n326), .Y(n327) );
  BUFX2 U71 ( .A(n322), .Y(n325) );
  INVX2 U72 ( .A(n371), .Y(n623) );
  INVX2 U73 ( .A(n41), .Y(r1_data[2]) );
  INVX4 U74 ( .A(n351), .Y(r1_data[9]) );
  INVX2 U75 ( .A(n74), .Y(n351) );
  INVX2 U76 ( .A(n90), .Y(n344) );
  INVX2 U77 ( .A(n88), .Y(n338) );
  INVX2 U78 ( .A(n89), .Y(n341) );
  BUFX2 U79 ( .A(n608), .Y(n611) );
  INVX4 U80 ( .A(n350), .Y(r1_data[8]) );
  INVX2 U81 ( .A(n73), .Y(n350) );
  INVX2 U82 ( .A(n71), .Y(n352) );
  INVX4 U83 ( .A(n356), .Y(r1_data[7]) );
  INVX2 U84 ( .A(n72), .Y(n356) );
  INVX2 U85 ( .A(n698), .Y(n35) );
  BUFX2 U86 ( .A(n322), .Y(n324) );
  INVX4 U87 ( .A(n341), .Y(n343) );
  INVX2 U88 ( .A(n335), .Y(n337) );
  INVX4 U89 ( .A(n341), .Y(n342) );
  INVX2 U90 ( .A(w_data[7]), .Y(n663) );
  INVX2 U91 ( .A(w_data[9]), .Y(n668) );
  INVX4 U92 ( .A(N14), .Y(n605) );
  AND2X2 U93 ( .A(n319), .B(N11), .Y(n34) );
  INVX2 U94 ( .A(n328), .Y(n31) );
  AND2X1 U95 ( .A(N15), .B(N14), .Y(n29) );
  INVX2 U96 ( .A(N11), .Y(n318) );
  INVX4 U97 ( .A(N12), .Y(n354) );
  INVX8 U98 ( .A(n335), .Y(n336) );
  INVX2 U99 ( .A(w_data[6]), .Y(n661) );
  INVX2 U100 ( .A(n617), .Y(n30) );
  INVX4 U101 ( .A(n617), .Y(n618) );
  INVX2 U102 ( .A(n75), .Y(n355) );
  MUX2X1 U103 ( .B(n168), .A(n167), .S(n349), .Y(r1_data[6]) );
  MUX2X1 U104 ( .B(n98), .A(n97), .S(n349), .Y(n69) );
  BUFX2 U105 ( .A(N16), .Y(n33) );
  INVX8 U106 ( .A(n630), .Y(n632) );
  BUFX2 U107 ( .A(n608), .Y(n609) );
  INVX4 U108 ( .A(n609), .Y(n612) );
  BUFX2 U109 ( .A(n608), .Y(n610) );
  MUX2X1 U110 ( .B(n195), .A(n196), .S(N13), .Y(n73) );
  INVX2 U111 ( .A(N16), .Y(n604) );
  NAND2X1 U112 ( .A(n354), .B(n34), .Y(n83) );
  INVX4 U113 ( .A(n338), .Y(n339) );
  MUX2X1 U114 ( .B(n525), .A(n524), .S(n642), .Y(r2_data[11]) );
  INVX8 U115 ( .A(n35), .Y(r1_data[11]) );
  BUFX2 U116 ( .A(n621), .Y(n37) );
  INVX4 U117 ( .A(n344), .Y(n346) );
  INVX4 U118 ( .A(n344), .Y(n347) );
  INVX4 U119 ( .A(n344), .Y(n61) );
  INVX4 U120 ( .A(n333), .Y(n334) );
  INVX4 U121 ( .A(n333), .Y(n57) );
  INVX4 U122 ( .A(n333), .Y(n58) );
  MUX2X1 U123 ( .B(n238), .A(n237), .S(n349), .Y(n698) );
  BUFX2 U124 ( .A(N15), .Y(n38) );
  MUX2X1 U125 ( .B(n511), .A(n510), .S(n642), .Y(r2_data[10]) );
  NAND2X1 U126 ( .A(n111), .B(n349), .Y(n39) );
  NAND2X1 U127 ( .A(N13), .B(n112), .Y(n40) );
  NAND2X1 U128 ( .A(n39), .B(n40), .Y(n41) );
  INVX2 U129 ( .A(n673), .Y(n45) );
  INVX2 U130 ( .A(n673), .Y(n46) );
  INVX2 U131 ( .A(n663), .Y(n47) );
  INVX2 U132 ( .A(n663), .Y(n48) );
  INVX2 U133 ( .A(n661), .Y(n49) );
  INVX2 U134 ( .A(n661), .Y(n50) );
  INVX2 U135 ( .A(n668), .Y(n51) );
  INVX2 U136 ( .A(n668), .Y(n52) );
  INVX2 U137 ( .A(n666), .Y(n53) );
  INVX2 U138 ( .A(n666), .Y(n54) );
  INVX2 U139 ( .A(n683), .Y(n55) );
  INVX2 U140 ( .A(n683), .Y(n56) );
  INVX2 U141 ( .A(n678), .Y(n59) );
  INVX2 U142 ( .A(n678), .Y(n60) );
  INVX8 U143 ( .A(n62), .Y(n348) );
  INVX2 U144 ( .A(N17), .Y(n642) );
  INVX2 U145 ( .A(w_data[5]), .Y(n658) );
  INVX2 U146 ( .A(w_data[2]), .Y(n649) );
  INVX2 U147 ( .A(w_data[3]), .Y(n652) );
  INVX2 U148 ( .A(w_data[4]), .Y(n655) );
  AND2X2 U149 ( .A(n353), .B(n63), .Y(n62) );
  INVX2 U150 ( .A(n344), .Y(n345) );
  INVX2 U151 ( .A(n642), .Y(n641) );
  INVX2 U152 ( .A(n642), .Y(n640) );
  INVX2 U153 ( .A(n678), .Y(n680) );
  INVX2 U154 ( .A(n678), .Y(n679) );
  INVX2 U155 ( .A(n683), .Y(n685) );
  INVX2 U156 ( .A(n683), .Y(n684) );
  INVX2 U157 ( .A(n673), .Y(n675) );
  INVX2 U158 ( .A(n673), .Y(n674) );
  INVX2 U159 ( .A(n668), .Y(n670) );
  INVX2 U160 ( .A(n676), .Y(n677) );
  INVX2 U161 ( .A(n663), .Y(n665) );
  INVX2 U162 ( .A(n666), .Y(n667) );
  INVX2 U163 ( .A(n668), .Y(n669) );
  INVX2 U164 ( .A(n661), .Y(n662) );
  INVX2 U165 ( .A(n663), .Y(n664) );
  INVX2 U166 ( .A(n681), .Y(n682) );
  INVX2 U167 ( .A(n671), .Y(n672) );
  INVX2 U168 ( .A(n658), .Y(n660) );
  INVX2 U169 ( .A(n658), .Y(n659) );
  INVX2 U170 ( .A(n644), .Y(n645) );
  INVX2 U171 ( .A(n649), .Y(n651) );
  INVX2 U172 ( .A(n652), .Y(n654) );
  INVX2 U173 ( .A(n649), .Y(n650) );
  INVX2 U174 ( .A(n652), .Y(n653) );
  INVX2 U175 ( .A(n655), .Y(n657) );
  INVX2 U176 ( .A(n655), .Y(n656) );
  INVX2 U177 ( .A(n646), .Y(n648) );
  INVX2 U178 ( .A(n646), .Y(n647) );
  INVX2 U179 ( .A(w_data[0]), .Y(n644) );
  INVX2 U180 ( .A(w_data[1]), .Y(n646) );
  BUFX2 U181 ( .A(n_reset), .Y(n686) );
  BUFX2 U182 ( .A(n_reset), .Y(n687) );
  BUFX2 U183 ( .A(n_reset), .Y(n688) );
  BUFX2 U184 ( .A(n_reset), .Y(n689) );
  BUFX2 U185 ( .A(n_reset), .Y(n690) );
  BUFX2 U186 ( .A(n_reset), .Y(n691) );
  BUFX2 U187 ( .A(n_reset), .Y(n692) );
  BUFX2 U188 ( .A(n_reset), .Y(n693) );
  AOI22X1 U189 ( .A(n67), .B(n66), .C(n65), .D(n64), .Y(n68) );
  INVX2 U190 ( .A(n68), .Y(r1_data[16]) );
  MUX2X1 U191 ( .B(n76), .A(n77), .S(N13), .Y(r1_data[0]) );
  NAND2X1 U192 ( .A(n79), .B(n78), .Y(n77) );
  NOR2X1 U193 ( .A(n80), .B(n81), .Y(n79) );
  OAI22X1 U194 ( .A(\regs_matrix[8][0] ), .B(n16), .C(\regs_matrix[10][0] ), 
        .D(n330), .Y(n81) );
  OAI22X1 U195 ( .A(\regs_matrix[12][0] ), .B(n334), .C(\regs_matrix[14][0] ), 
        .D(n336), .Y(n80) );
  NOR2X1 U196 ( .A(n86), .B(n87), .Y(n78) );
  OAI22X1 U197 ( .A(\regs_matrix[11][0] ), .B(n339), .C(\regs_matrix[9][0] ), 
        .D(n343), .Y(n87) );
  OAI22X1 U198 ( .A(\regs_matrix[13][0] ), .B(n347), .C(\regs_matrix[15][0] ), 
        .D(n348), .Y(n86) );
  NAND2X1 U199 ( .A(n92), .B(n91), .Y(n76) );
  NOR2X1 U200 ( .A(n93), .B(n94), .Y(n92) );
  OAI22X1 U201 ( .A(outreg_data[0]), .B(n15), .C(\regs_matrix[2][0] ), .D(n330), .Y(n94) );
  OAI22X1 U202 ( .A(\regs_matrix[4][0] ), .B(n57), .C(\regs_matrix[6][0] ), 
        .D(n336), .Y(n93) );
  NOR2X1 U203 ( .A(n95), .B(n96), .Y(n91) );
  OAI22X1 U204 ( .A(\regs_matrix[3][0] ), .B(n339), .C(\regs_matrix[1][0] ), 
        .D(n343), .Y(n96) );
  OAI22X1 U205 ( .A(\regs_matrix[5][0] ), .B(n345), .C(\regs_matrix[7][0] ), 
        .D(n348), .Y(n95) );
  NAND2X1 U206 ( .A(n100), .B(n99), .Y(n98) );
  NOR2X1 U207 ( .A(n101), .B(n102), .Y(n100) );
  OAI22X1 U208 ( .A(\regs_matrix[8][1] ), .B(n2), .C(\regs_matrix[10][1] ), 
        .D(n331), .Y(n102) );
  OAI22X1 U209 ( .A(\regs_matrix[12][1] ), .B(n334), .C(\regs_matrix[14][1] ), 
        .D(n336), .Y(n101) );
  NOR2X1 U210 ( .A(n103), .B(n104), .Y(n99) );
  OAI22X1 U211 ( .A(\regs_matrix[11][1] ), .B(n339), .C(\regs_matrix[9][1] ), 
        .D(n343), .Y(n104) );
  OAI22X1 U212 ( .A(\regs_matrix[13][1] ), .B(n346), .C(\regs_matrix[15][1] ), 
        .D(n348), .Y(n103) );
  NAND2X1 U213 ( .A(n106), .B(n105), .Y(n97) );
  NOR2X1 U214 ( .A(n107), .B(n108), .Y(n106) );
  OAI22X1 U215 ( .A(outreg_data[1]), .B(n17), .C(\regs_matrix[2][1] ), .D(n330), .Y(n108) );
  OAI22X1 U216 ( .A(\regs_matrix[4][1] ), .B(n57), .C(\regs_matrix[6][1] ), 
        .D(n336), .Y(n107) );
  NOR2X1 U217 ( .A(n109), .B(n110), .Y(n105) );
  OAI22X1 U218 ( .A(\regs_matrix[3][1] ), .B(n339), .C(\regs_matrix[1][1] ), 
        .D(n343), .Y(n110) );
  OAI22X1 U219 ( .A(\regs_matrix[5][1] ), .B(n61), .C(\regs_matrix[7][1] ), 
        .D(n348), .Y(n109) );
  NAND2X1 U220 ( .A(n114), .B(n113), .Y(n112) );
  NOR2X1 U221 ( .A(n115), .B(n116), .Y(n114) );
  OAI22X1 U222 ( .A(\regs_matrix[8][2] ), .B(n3), .C(\regs_matrix[10][2] ), 
        .D(n330), .Y(n116) );
  OAI22X1 U223 ( .A(\regs_matrix[12][2] ), .B(n58), .C(\regs_matrix[14][2] ), 
        .D(n337), .Y(n115) );
  NOR2X1 U224 ( .A(n117), .B(n118), .Y(n113) );
  OAI22X1 U225 ( .A(\regs_matrix[11][2] ), .B(n339), .C(\regs_matrix[9][2] ), 
        .D(n343), .Y(n118) );
  OAI22X1 U226 ( .A(\regs_matrix[13][2] ), .B(n61), .C(\regs_matrix[15][2] ), 
        .D(n348), .Y(n117) );
  NAND2X1 U227 ( .A(n119), .B(n120), .Y(n111) );
  NOR2X1 U228 ( .A(n121), .B(n122), .Y(n120) );
  OAI22X1 U229 ( .A(outreg_data[2]), .B(n17), .C(\regs_matrix[2][2] ), .D(n330), .Y(n122) );
  OAI22X1 U230 ( .A(\regs_matrix[4][2] ), .B(n58), .C(\regs_matrix[6][2] ), 
        .D(n337), .Y(n121) );
  NOR2X1 U231 ( .A(n123), .B(n124), .Y(n119) );
  OAI22X1 U232 ( .A(\regs_matrix[3][2] ), .B(n339), .C(\regs_matrix[1][2] ), 
        .D(n343), .Y(n124) );
  OAI22X1 U233 ( .A(\regs_matrix[5][2] ), .B(n61), .C(\regs_matrix[7][2] ), 
        .D(n348), .Y(n123) );
  MUX2X1 U234 ( .B(n125), .A(n126), .S(N13), .Y(n70) );
  NAND2X1 U235 ( .A(n127), .B(n128), .Y(n126) );
  NOR2X1 U236 ( .A(n129), .B(n130), .Y(n128) );
  OAI22X1 U237 ( .A(\regs_matrix[8][3] ), .B(n27), .C(\regs_matrix[10][3] ), 
        .D(n330), .Y(n130) );
  OAI22X1 U238 ( .A(\regs_matrix[12][3] ), .B(n57), .C(\regs_matrix[14][3] ), 
        .D(n336), .Y(n129) );
  NOR2X1 U239 ( .A(n131), .B(n132), .Y(n127) );
  OAI22X1 U240 ( .A(\regs_matrix[11][3] ), .B(n339), .C(\regs_matrix[9][3] ), 
        .D(n343), .Y(n132) );
  OAI22X1 U241 ( .A(\regs_matrix[13][3] ), .B(n345), .C(\regs_matrix[15][3] ), 
        .D(n348), .Y(n131) );
  NAND2X1 U242 ( .A(n133), .B(n134), .Y(n125) );
  NOR2X1 U243 ( .A(n135), .B(n136), .Y(n134) );
  OAI22X1 U244 ( .A(outreg_data[3]), .B(n18), .C(\regs_matrix[2][3] ), .D(n330), .Y(n136) );
  OAI22X1 U245 ( .A(\regs_matrix[4][3] ), .B(n334), .C(\regs_matrix[6][3] ), 
        .D(n336), .Y(n135) );
  NOR2X1 U246 ( .A(n137), .B(n138), .Y(n133) );
  OAI22X1 U247 ( .A(\regs_matrix[3][3] ), .B(n339), .C(\regs_matrix[1][3] ), 
        .D(n343), .Y(n138) );
  OAI22X1 U248 ( .A(\regs_matrix[5][3] ), .B(n346), .C(\regs_matrix[7][3] ), 
        .D(n348), .Y(n137) );
  MUX2X1 U249 ( .B(n139), .A(n140), .S(N13), .Y(n71) );
  NAND2X1 U250 ( .A(n141), .B(n142), .Y(n140) );
  NOR2X1 U251 ( .A(n143), .B(n144), .Y(n142) );
  OAI22X1 U252 ( .A(\regs_matrix[8][4] ), .B(n16), .C(\regs_matrix[10][4] ), 
        .D(n331), .Y(n144) );
  OAI22X1 U253 ( .A(\regs_matrix[12][4] ), .B(n334), .C(\regs_matrix[14][4] ), 
        .D(n336), .Y(n143) );
  NOR2X1 U254 ( .A(n145), .B(n146), .Y(n141) );
  OAI22X1 U255 ( .A(\regs_matrix[11][4] ), .B(n340), .C(\regs_matrix[9][4] ), 
        .D(n343), .Y(n146) );
  OAI22X1 U256 ( .A(\regs_matrix[13][4] ), .B(n347), .C(\regs_matrix[15][4] ), 
        .D(n348), .Y(n145) );
  NAND2X1 U257 ( .A(n147), .B(n148), .Y(n139) );
  NOR2X1 U258 ( .A(n149), .B(n150), .Y(n148) );
  OAI22X1 U259 ( .A(outreg_data[4]), .B(n15), .C(\regs_matrix[2][4] ), .D(n331), .Y(n150) );
  OAI22X1 U260 ( .A(\regs_matrix[4][4] ), .B(n57), .C(\regs_matrix[6][4] ), 
        .D(n336), .Y(n149) );
  NOR2X1 U261 ( .A(n151), .B(n152), .Y(n147) );
  OAI22X1 U262 ( .A(\regs_matrix[3][4] ), .B(n340), .C(\regs_matrix[1][4] ), 
        .D(n343), .Y(n152) );
  OAI22X1 U263 ( .A(\regs_matrix[5][4] ), .B(n346), .C(\regs_matrix[7][4] ), 
        .D(n348), .Y(n151) );
  MUX2X1 U264 ( .B(n153), .A(n154), .S(N13), .Y(r1_data[5]) );
  NAND2X1 U265 ( .A(n156), .B(n155), .Y(n154) );
  NOR2X1 U266 ( .A(n157), .B(n158), .Y(n156) );
  OAI22X1 U267 ( .A(\regs_matrix[8][5] ), .B(n14), .C(\regs_matrix[10][5] ), 
        .D(n331), .Y(n158) );
  OAI22X1 U268 ( .A(\regs_matrix[12][5] ), .B(n58), .C(\regs_matrix[14][5] ), 
        .D(n337), .Y(n157) );
  NOR2X1 U269 ( .A(n160), .B(n159), .Y(n155) );
  OAI22X1 U270 ( .A(\regs_matrix[11][5] ), .B(n340), .C(\regs_matrix[9][5] ), 
        .D(n343), .Y(n160) );
  OAI22X1 U271 ( .A(\regs_matrix[13][5] ), .B(n346), .C(\regs_matrix[15][5] ), 
        .D(n348), .Y(n159) );
  NAND2X1 U272 ( .A(n161), .B(n162), .Y(n153) );
  NOR2X1 U273 ( .A(n163), .B(n164), .Y(n162) );
  OAI22X1 U274 ( .A(n2), .B(outreg_data[5]), .C(\regs_matrix[2][5] ), .D(n331), 
        .Y(n164) );
  OAI22X1 U275 ( .A(\regs_matrix[4][5] ), .B(n334), .C(\regs_matrix[6][5] ), 
        .D(n337), .Y(n163) );
  NOR2X1 U276 ( .A(n166), .B(n165), .Y(n161) );
  OAI22X1 U277 ( .A(\regs_matrix[3][5] ), .B(n340), .C(\regs_matrix[1][5] ), 
        .D(n343), .Y(n166) );
  OAI22X1 U278 ( .A(\regs_matrix[5][5] ), .B(n347), .C(\regs_matrix[7][5] ), 
        .D(n348), .Y(n165) );
  NAND2X1 U279 ( .A(n169), .B(n170), .Y(n168) );
  NOR2X1 U280 ( .A(n171), .B(n172), .Y(n170) );
  OAI22X1 U281 ( .A(\regs_matrix[8][6] ), .B(n4), .C(\regs_matrix[10][6] ), 
        .D(n31), .Y(n172) );
  OAI22X1 U282 ( .A(\regs_matrix[12][6] ), .B(n57), .C(\regs_matrix[14][6] ), 
        .D(n336), .Y(n171) );
  NOR2X1 U283 ( .A(n173), .B(n174), .Y(n169) );
  OAI22X1 U284 ( .A(\regs_matrix[11][6] ), .B(n340), .C(\regs_matrix[9][6] ), 
        .D(n342), .Y(n174) );
  OAI22X1 U285 ( .A(\regs_matrix[13][6] ), .B(n345), .C(\regs_matrix[15][6] ), 
        .D(n348), .Y(n173) );
  NAND2X1 U286 ( .A(n175), .B(n176), .Y(n167) );
  NOR2X1 U287 ( .A(n177), .B(n178), .Y(n176) );
  OAI22X1 U288 ( .A(outreg_data[6]), .B(n24), .C(\regs_matrix[2][6] ), .D(n331), .Y(n178) );
  OAI22X1 U289 ( .A(\regs_matrix[4][6] ), .B(n58), .C(\regs_matrix[6][6] ), 
        .D(n337), .Y(n177) );
  NOR2X1 U290 ( .A(n179), .B(n180), .Y(n175) );
  OAI22X1 U291 ( .A(\regs_matrix[3][6] ), .B(n339), .C(\regs_matrix[1][6] ), 
        .D(n342), .Y(n180) );
  OAI22X1 U292 ( .A(\regs_matrix[5][6] ), .B(n61), .C(\regs_matrix[7][6] ), 
        .D(n348), .Y(n179) );
  MUX2X1 U293 ( .B(n181), .A(n182), .S(N13), .Y(n72) );
  NAND2X1 U294 ( .A(n183), .B(n184), .Y(n182) );
  NOR2X1 U295 ( .A(n185), .B(n186), .Y(n184) );
  OAI22X1 U296 ( .A(\regs_matrix[8][7] ), .B(n3), .C(\regs_matrix[10][7] ), 
        .D(n330), .Y(n186) );
  OAI22X1 U297 ( .A(\regs_matrix[12][7] ), .B(n58), .C(\regs_matrix[14][7] ), 
        .D(n336), .Y(n185) );
  NOR2X1 U298 ( .A(n187), .B(n188), .Y(n183) );
  OAI22X1 U299 ( .A(\regs_matrix[11][7] ), .B(n340), .C(\regs_matrix[9][7] ), 
        .D(n342), .Y(n188) );
  OAI22X1 U300 ( .A(\regs_matrix[13][7] ), .B(n345), .C(\regs_matrix[15][7] ), 
        .D(n348), .Y(n187) );
  NAND2X1 U301 ( .A(n189), .B(n190), .Y(n181) );
  NOR2X1 U302 ( .A(n191), .B(n192), .Y(n190) );
  OAI22X1 U303 ( .A(outreg_data[7]), .B(n14), .C(\regs_matrix[2][7] ), .D(n332), .Y(n192) );
  OAI22X1 U304 ( .A(\regs_matrix[4][7] ), .B(n58), .C(\regs_matrix[6][7] ), 
        .D(n336), .Y(n191) );
  NOR2X1 U305 ( .A(n193), .B(n194), .Y(n189) );
  OAI22X1 U306 ( .A(\regs_matrix[3][7] ), .B(n340), .C(\regs_matrix[1][7] ), 
        .D(n342), .Y(n194) );
  OAI22X1 U307 ( .A(\regs_matrix[5][7] ), .B(n61), .C(\regs_matrix[7][7] ), 
        .D(n348), .Y(n193) );
  NAND2X1 U308 ( .A(n197), .B(n198), .Y(n196) );
  NOR2X1 U309 ( .A(n199), .B(n200), .Y(n198) );
  OAI22X1 U310 ( .A(\regs_matrix[8][8] ), .B(n19), .C(\regs_matrix[10][8] ), 
        .D(n31), .Y(n200) );
  OAI22X1 U311 ( .A(\regs_matrix[12][8] ), .B(n334), .C(\regs_matrix[14][8] ), 
        .D(n337), .Y(n199) );
  NOR2X1 U312 ( .A(n202), .B(n201), .Y(n197) );
  OAI22X1 U313 ( .A(\regs_matrix[11][8] ), .B(n340), .C(\regs_matrix[9][8] ), 
        .D(n342), .Y(n202) );
  OAI22X1 U314 ( .A(\regs_matrix[13][8] ), .B(n346), .C(\regs_matrix[15][8] ), 
        .D(n348), .Y(n201) );
  NAND2X1 U315 ( .A(n203), .B(n204), .Y(n195) );
  NOR2X1 U316 ( .A(n205), .B(n206), .Y(n204) );
  OAI22X1 U317 ( .A(outreg_data[8]), .B(n18), .C(\regs_matrix[2][8] ), .D(n31), 
        .Y(n206) );
  OAI22X1 U318 ( .A(\regs_matrix[4][8] ), .B(n58), .C(\regs_matrix[6][8] ), 
        .D(n337), .Y(n205) );
  NOR2X1 U319 ( .A(n208), .B(n207), .Y(n203) );
  OAI22X1 U320 ( .A(\regs_matrix[3][8] ), .B(n339), .C(\regs_matrix[1][8] ), 
        .D(n342), .Y(n208) );
  OAI22X1 U321 ( .A(\regs_matrix[5][8] ), .B(n346), .C(\regs_matrix[7][8] ), 
        .D(n348), .Y(n207) );
  MUX2X1 U322 ( .B(n209), .A(n210), .S(N13), .Y(n74) );
  NAND2X1 U323 ( .A(n211), .B(n212), .Y(n210) );
  NOR2X1 U324 ( .A(n214), .B(n213), .Y(n212) );
  OAI22X1 U325 ( .A(\regs_matrix[8][9] ), .B(n4), .C(\regs_matrix[10][9] ), 
        .D(n331), .Y(n214) );
  OAI22X1 U326 ( .A(\regs_matrix[12][9] ), .B(n334), .C(\regs_matrix[14][9] ), 
        .D(n336), .Y(n213) );
  NOR2X1 U327 ( .A(n215), .B(n216), .Y(n211) );
  OAI22X1 U328 ( .A(\regs_matrix[11][9] ), .B(n340), .C(\regs_matrix[9][9] ), 
        .D(n342), .Y(n216) );
  OAI22X1 U329 ( .A(\regs_matrix[13][9] ), .B(n345), .C(\regs_matrix[15][9] ), 
        .D(n348), .Y(n215) );
  NAND2X1 U330 ( .A(n217), .B(n218), .Y(n209) );
  NOR2X1 U331 ( .A(n219), .B(n220), .Y(n218) );
  OAI22X1 U332 ( .A(outreg_data[9]), .B(n25), .C(\regs_matrix[2][9] ), .D(n331), .Y(n220) );
  OAI22X1 U333 ( .A(\regs_matrix[4][9] ), .B(n334), .C(\regs_matrix[6][9] ), 
        .D(n336), .Y(n219) );
  NOR2X1 U334 ( .A(n221), .B(n222), .Y(n217) );
  OAI22X1 U335 ( .A(\regs_matrix[3][9] ), .B(n340), .C(\regs_matrix[1][9] ), 
        .D(n342), .Y(n222) );
  OAI22X1 U336 ( .A(\regs_matrix[5][9] ), .B(n347), .C(\regs_matrix[7][9] ), 
        .D(n348), .Y(n221) );
  MUX2X1 U337 ( .B(n223), .A(n224), .S(N13), .Y(r1_data[10]) );
  NAND2X1 U338 ( .A(n225), .B(n226), .Y(n224) );
  NOR2X1 U339 ( .A(n227), .B(n228), .Y(n226) );
  OAI22X1 U340 ( .A(\regs_matrix[8][10] ), .B(n28), .C(\regs_matrix[10][10] ), 
        .D(n332), .Y(n228) );
  OAI22X1 U341 ( .A(\regs_matrix[12][10] ), .B(n57), .C(\regs_matrix[14][10] ), 
        .D(n336), .Y(n227) );
  NOR2X1 U342 ( .A(n230), .B(n229), .Y(n225) );
  OAI22X1 U343 ( .A(\regs_matrix[11][10] ), .B(n340), .C(\regs_matrix[9][10] ), 
        .D(n342), .Y(n230) );
  OAI22X1 U344 ( .A(\regs_matrix[13][10] ), .B(n346), .C(\regs_matrix[15][10] ), .D(n348), .Y(n229) );
  NAND2X1 U345 ( .A(n231), .B(n232), .Y(n223) );
  NOR2X1 U346 ( .A(n233), .B(n234), .Y(n232) );
  OAI22X1 U347 ( .A(outreg_data[10]), .B(n20), .C(\regs_matrix[2][10] ), .D(
        n332), .Y(n234) );
  OAI22X1 U348 ( .A(\regs_matrix[4][10] ), .B(n58), .C(\regs_matrix[6][10] ), 
        .D(n336), .Y(n233) );
  NOR2X1 U349 ( .A(n235), .B(n236), .Y(n231) );
  OAI22X1 U350 ( .A(\regs_matrix[3][10] ), .B(n340), .C(\regs_matrix[1][10] ), 
        .D(n342), .Y(n236) );
  OAI22X1 U351 ( .A(\regs_matrix[5][10] ), .B(n347), .C(\regs_matrix[7][10] ), 
        .D(n348), .Y(n235) );
  NAND2X1 U352 ( .A(n239), .B(n240), .Y(n238) );
  NOR2X1 U353 ( .A(n241), .B(n242), .Y(n240) );
  OAI22X1 U354 ( .A(\regs_matrix[8][11] ), .B(n21), .C(\regs_matrix[10][11] ), 
        .D(n332), .Y(n242) );
  OAI22X1 U355 ( .A(\regs_matrix[12][11] ), .B(n57), .C(\regs_matrix[14][11] ), 
        .D(n336), .Y(n241) );
  NOR2X1 U356 ( .A(n243), .B(n244), .Y(n239) );
  OAI22X1 U357 ( .A(\regs_matrix[11][11] ), .B(n340), .C(\regs_matrix[9][11] ), 
        .D(n342), .Y(n244) );
  OAI22X1 U358 ( .A(\regs_matrix[13][11] ), .B(n347), .C(\regs_matrix[15][11] ), .D(n348), .Y(n243) );
  NAND2X1 U359 ( .A(n245), .B(n246), .Y(n237) );
  NOR2X1 U360 ( .A(n247), .B(n248), .Y(n246) );
  OAI22X1 U361 ( .A(outreg_data[11]), .B(n20), .C(\regs_matrix[2][11] ), .D(
        n331), .Y(n248) );
  OAI22X1 U362 ( .A(\regs_matrix[4][11] ), .B(n57), .C(\regs_matrix[6][11] ), 
        .D(n336), .Y(n247) );
  NOR2X1 U363 ( .A(n249), .B(n250), .Y(n245) );
  OAI22X1 U364 ( .A(\regs_matrix[3][11] ), .B(n340), .C(\regs_matrix[1][11] ), 
        .D(n342), .Y(n250) );
  OAI22X1 U365 ( .A(\regs_matrix[5][11] ), .B(n61), .C(\regs_matrix[7][11] ), 
        .D(n348), .Y(n249) );
  MUX2X1 U366 ( .B(n251), .A(n252), .S(N13), .Y(r1_data[12]) );
  NAND2X1 U367 ( .A(n253), .B(n254), .Y(n252) );
  NOR2X1 U368 ( .A(n255), .B(n256), .Y(n254) );
  OAI22X1 U369 ( .A(\regs_matrix[8][12] ), .B(n3), .C(\regs_matrix[10][12] ), 
        .D(n332), .Y(n256) );
  OAI22X1 U370 ( .A(\regs_matrix[12][12] ), .B(n58), .C(\regs_matrix[14][12] ), 
        .D(n336), .Y(n255) );
  NOR2X1 U371 ( .A(n257), .B(n258), .Y(n253) );
  OAI22X1 U372 ( .A(\regs_matrix[11][12] ), .B(n340), .C(\regs_matrix[9][12] ), 
        .D(n342), .Y(n258) );
  OAI22X1 U373 ( .A(\regs_matrix[13][12] ), .B(n61), .C(\regs_matrix[15][12] ), 
        .D(n348), .Y(n257) );
  NAND2X1 U374 ( .A(n260), .B(n259), .Y(n251) );
  NOR2X1 U375 ( .A(n261), .B(n262), .Y(n260) );
  OAI22X1 U376 ( .A(outreg_data[12]), .B(n22), .C(\regs_matrix[2][12] ), .D(
        n332), .Y(n262) );
  OAI22X1 U377 ( .A(\regs_matrix[4][12] ), .B(n58), .C(\regs_matrix[6][12] ), 
        .D(n336), .Y(n261) );
  NOR2X1 U378 ( .A(n263), .B(n264), .Y(n259) );
  OAI22X1 U379 ( .A(\regs_matrix[3][12] ), .B(n340), .C(\regs_matrix[1][12] ), 
        .D(n342), .Y(n264) );
  OAI22X1 U380 ( .A(\regs_matrix[5][12] ), .B(n346), .C(\regs_matrix[7][12] ), 
        .D(n348), .Y(n263) );
  MUX2X1 U381 ( .B(n265), .A(n266), .S(N13), .Y(r1_data[13]) );
  NAND2X1 U382 ( .A(n267), .B(n268), .Y(n266) );
  NOR2X1 U383 ( .A(n269), .B(n270), .Y(n268) );
  OAI22X1 U384 ( .A(\regs_matrix[8][13] ), .B(n2), .C(\regs_matrix[10][13] ), 
        .D(n332), .Y(n270) );
  OAI22X1 U385 ( .A(\regs_matrix[12][13] ), .B(n334), .C(\regs_matrix[14][13] ), .D(n336), .Y(n269) );
  NOR2X1 U386 ( .A(n271), .B(n272), .Y(n267) );
  OAI22X1 U387 ( .A(\regs_matrix[11][13] ), .B(n340), .C(\regs_matrix[9][13] ), 
        .D(n342), .Y(n272) );
  OAI22X1 U388 ( .A(\regs_matrix[13][13] ), .B(n61), .C(\regs_matrix[15][13] ), 
        .D(n348), .Y(n271) );
  NAND2X1 U389 ( .A(n274), .B(n273), .Y(n265) );
  NOR2X1 U390 ( .A(n275), .B(n276), .Y(n274) );
  OAI22X1 U391 ( .A(outreg_data[13]), .B(n26), .C(\regs_matrix[2][13] ), .D(
        n332), .Y(n276) );
  OAI22X1 U392 ( .A(\regs_matrix[4][13] ), .B(n57), .C(\regs_matrix[6][13] ), 
        .D(n336), .Y(n275) );
  NOR2X1 U393 ( .A(n277), .B(n278), .Y(n273) );
  OAI22X1 U394 ( .A(\regs_matrix[3][13] ), .B(n340), .C(\regs_matrix[1][13] ), 
        .D(n342), .Y(n278) );
  OAI22X1 U395 ( .A(\regs_matrix[5][13] ), .B(n347), .C(\regs_matrix[7][13] ), 
        .D(n348), .Y(n277) );
  MUX2X1 U396 ( .B(n279), .A(n280), .S(N13), .Y(n75) );
  NAND2X1 U397 ( .A(n282), .B(n281), .Y(n280) );
  NOR2X1 U398 ( .A(n283), .B(n284), .Y(n282) );
  OAI22X1 U399 ( .A(\regs_matrix[8][14] ), .B(n23), .C(\regs_matrix[10][14] ), 
        .D(n332), .Y(n284) );
  OAI22X1 U400 ( .A(\regs_matrix[12][14] ), .B(n57), .C(\regs_matrix[14][14] ), 
        .D(n336), .Y(n283) );
  NOR2X1 U401 ( .A(n285), .B(n286), .Y(n281) );
  OAI22X1 U402 ( .A(\regs_matrix[11][14] ), .B(n340), .C(\regs_matrix[9][14] ), 
        .D(n342), .Y(n286) );
  OAI22X1 U403 ( .A(\regs_matrix[13][14] ), .B(n347), .C(\regs_matrix[15][14] ), .D(n348), .Y(n285) );
  NAND2X1 U404 ( .A(n287), .B(n288), .Y(n279) );
  NOR2X1 U405 ( .A(n289), .B(n290), .Y(n288) );
  OAI22X1 U406 ( .A(outreg_data[14]), .B(n19), .C(\regs_matrix[2][14] ), .D(
        n332), .Y(n290) );
  OAI22X1 U407 ( .A(\regs_matrix[4][14] ), .B(n58), .C(\regs_matrix[6][14] ), 
        .D(n336), .Y(n289) );
  NOR2X1 U408 ( .A(n291), .B(n292), .Y(n287) );
  OAI22X1 U409 ( .A(\regs_matrix[3][14] ), .B(n340), .C(\regs_matrix[1][14] ), 
        .D(n342), .Y(n292) );
  OAI22X1 U410 ( .A(\regs_matrix[5][14] ), .B(n347), .C(\regs_matrix[7][14] ), 
        .D(n348), .Y(n291) );
  MUX2X1 U411 ( .B(n293), .A(n294), .S(N13), .Y(r1_data[15]) );
  NAND2X1 U412 ( .A(n296), .B(n295), .Y(n294) );
  NOR2X1 U413 ( .A(n297), .B(n298), .Y(n296) );
  OAI22X1 U414 ( .A(\regs_matrix[8][15] ), .B(n14), .C(\regs_matrix[10][15] ), 
        .D(n332), .Y(n298) );
  OAI22X1 U415 ( .A(\regs_matrix[12][15] ), .B(n57), .C(\regs_matrix[14][15] ), 
        .D(n336), .Y(n297) );
  NOR2X1 U416 ( .A(n299), .B(n300), .Y(n295) );
  OAI22X1 U417 ( .A(\regs_matrix[11][15] ), .B(n340), .C(\regs_matrix[9][15] ), 
        .D(n343), .Y(n300) );
  OAI22X1 U418 ( .A(\regs_matrix[13][15] ), .B(n346), .C(\regs_matrix[15][15] ), .D(n348), .Y(n299) );
  NAND2X1 U419 ( .A(n301), .B(n302), .Y(n293) );
  NOR2X1 U420 ( .A(n303), .B(n304), .Y(n302) );
  OAI22X1 U421 ( .A(outreg_data[15]), .B(n4), .C(\regs_matrix[2][15] ), .D(
        n332), .Y(n304) );
  OAI22X1 U422 ( .A(\regs_matrix[4][15] ), .B(n58), .C(\regs_matrix[6][15] ), 
        .D(n336), .Y(n303) );
  NOR2X1 U423 ( .A(n305), .B(n306), .Y(n301) );
  OAI22X1 U424 ( .A(\regs_matrix[3][15] ), .B(n340), .C(\regs_matrix[1][15] ), 
        .D(n342), .Y(n306) );
  OAI22X1 U425 ( .A(\regs_matrix[5][15] ), .B(n61), .C(\regs_matrix[7][15] ), 
        .D(n348), .Y(n305) );
  NOR2X1 U426 ( .A(n307), .B(n308), .Y(n64) );
  OAI21X1 U427 ( .A(\regs_matrix[6][16] ), .B(n336), .C(n309), .Y(n308) );
  AOI22X1 U428 ( .A(n329), .B(n310), .C(n325), .D(n311), .Y(n309) );
  INVX2 U429 ( .A(outreg_data[16]), .Y(n311) );
  INVX2 U430 ( .A(\regs_matrix[2][16] ), .Y(n310) );
  OAI21X1 U431 ( .A(\regs_matrix[4][16] ), .B(n57), .C(n349), .Y(n307) );
  NOR2X1 U432 ( .A(n312), .B(n313), .Y(n65) );
  OAI22X1 U433 ( .A(\regs_matrix[3][16] ), .B(n340), .C(\regs_matrix[1][16] ), 
        .D(n343), .Y(n313) );
  OAI22X1 U434 ( .A(\regs_matrix[5][16] ), .B(n346), .C(\regs_matrix[7][16] ), 
        .D(n348), .Y(n312) );
  NOR2X1 U435 ( .A(n314), .B(n315), .Y(n66) );
  OAI21X1 U436 ( .A(\regs_matrix[12][16] ), .B(n334), .C(n316), .Y(n315) );
  AOI22X1 U437 ( .A(n329), .B(n317), .C(n324), .D(n602), .Y(n316) );
  NAND3X1 U438 ( .A(n318), .B(n319), .C(n354), .Y(n82) );
  INVX2 U439 ( .A(\regs_matrix[10][16] ), .Y(n317) );
  NAND3X1 U440 ( .A(n353), .B(n318), .C(n319), .Y(n84) );
  OAI22X1 U441 ( .A(\regs_matrix[9][16] ), .B(n342), .C(\regs_matrix[14][16] ), 
        .D(n337), .Y(n314) );
  NAND3X1 U442 ( .A(n353), .B(n1), .C(n319), .Y(n85) );
  NAND3X1 U443 ( .A(N10), .B(n354), .C(n318), .Y(n89) );
  NOR2X1 U444 ( .A(n320), .B(n321), .Y(n67) );
  OAI21X1 U445 ( .A(\regs_matrix[11][16] ), .B(n340), .C(N13), .Y(n321) );
  NAND2X1 U446 ( .A(n63), .B(n354), .Y(n88) );
  OAI22X1 U447 ( .A(\regs_matrix[15][16] ), .B(n348), .C(\regs_matrix[13][16] ), .D(n347), .Y(n320) );
  NAND3X1 U448 ( .A(n353), .B(N10), .C(n318), .Y(n90) );
  BUFX4 U449 ( .A(n326), .Y(n329) );
  INVX8 U450 ( .A(n329), .Y(n330) );
  INVX8 U451 ( .A(n327), .Y(n332) );
  INVX8 U452 ( .A(n338), .Y(n340) );
  INVX2 U453 ( .A(n83), .Y(n326) );
  BUFX4 U454 ( .A(n70), .Y(r1_data[3]) );
  BUFX4 U455 ( .A(n69), .Y(r1_data[1]) );
  INVX8 U456 ( .A(n352), .Y(r1_data[4]) );
  INVX4 U457 ( .A(n354), .Y(n353) );
  INVX1 U458 ( .A(N13), .Y(n349) );
  AOI22X1 U459 ( .A(n360), .B(n359), .C(n358), .D(n357), .Y(n361) );
  INVX2 U460 ( .A(n361), .Y(r2_data[16]) );
  MUX2X1 U461 ( .B(n362), .A(n363), .S(n640), .Y(r2_data[0]) );
  NAND2X1 U462 ( .A(n364), .B(n365), .Y(n363) );
  NOR2X1 U463 ( .A(n366), .B(n367), .Y(n365) );
  OAI22X1 U464 ( .A(\regs_matrix[8][0] ), .B(n613), .C(\regs_matrix[10][0] ), 
        .D(n618), .Y(n367) );
  OAI22X1 U465 ( .A(\regs_matrix[12][0] ), .B(n621), .C(\regs_matrix[14][0] ), 
        .D(n625), .Y(n366) );
  NOR2X1 U466 ( .A(n372), .B(n373), .Y(n364) );
  OAI22X1 U467 ( .A(\regs_matrix[11][0] ), .B(n629), .C(\regs_matrix[9][0] ), 
        .D(n632), .Y(n373) );
  OAI22X1 U468 ( .A(\regs_matrix[13][0] ), .B(n635), .C(\regs_matrix[15][0] ), 
        .D(n639), .Y(n372) );
  NAND2X1 U469 ( .A(n378), .B(n379), .Y(n362) );
  NOR2X1 U470 ( .A(n380), .B(n381), .Y(n379) );
  OAI22X1 U471 ( .A(outreg_data[0]), .B(n612), .C(\regs_matrix[2][0] ), .D(
        n618), .Y(n381) );
  OAI22X1 U472 ( .A(\regs_matrix[4][0] ), .B(n621), .C(\regs_matrix[6][0] ), 
        .D(n625), .Y(n380) );
  NOR2X1 U473 ( .A(n382), .B(n383), .Y(n378) );
  OAI22X1 U474 ( .A(\regs_matrix[3][0] ), .B(n628), .C(\regs_matrix[1][0] ), 
        .D(n632), .Y(n383) );
  OAI22X1 U475 ( .A(\regs_matrix[5][0] ), .B(n635), .C(\regs_matrix[7][0] ), 
        .D(n639), .Y(n382) );
  MUX2X1 U476 ( .B(n384), .A(n385), .S(n641), .Y(r2_data[1]) );
  NAND2X1 U477 ( .A(n386), .B(n387), .Y(n385) );
  NOR2X1 U478 ( .A(n388), .B(n389), .Y(n387) );
  OAI22X1 U479 ( .A(\regs_matrix[8][1] ), .B(n612), .C(\regs_matrix[10][1] ), 
        .D(n30), .Y(n389) );
  OAI22X1 U480 ( .A(\regs_matrix[12][1] ), .B(n621), .C(\regs_matrix[14][1] ), 
        .D(n624), .Y(n388) );
  NOR2X1 U481 ( .A(n390), .B(n391), .Y(n386) );
  OAI22X1 U482 ( .A(\regs_matrix[11][1] ), .B(n628), .C(\regs_matrix[9][1] ), 
        .D(n632), .Y(n391) );
  OAI22X1 U483 ( .A(\regs_matrix[13][1] ), .B(n634), .C(\regs_matrix[15][1] ), 
        .D(n639), .Y(n390) );
  NAND2X1 U484 ( .A(n392), .B(n393), .Y(n384) );
  NOR2X1 U485 ( .A(n394), .B(n395), .Y(n393) );
  OAI22X1 U486 ( .A(outreg_data[1]), .B(n612), .C(\regs_matrix[2][1] ), .D(
        n618), .Y(n395) );
  OAI22X1 U487 ( .A(\regs_matrix[4][1] ), .B(n621), .C(\regs_matrix[6][1] ), 
        .D(n626), .Y(n394) );
  NOR2X1 U488 ( .A(n396), .B(n397), .Y(n392) );
  OAI22X1 U489 ( .A(\regs_matrix[3][1] ), .B(n628), .C(\regs_matrix[1][1] ), 
        .D(n631), .Y(n397) );
  OAI22X1 U490 ( .A(\regs_matrix[5][1] ), .B(n635), .C(\regs_matrix[7][1] ), 
        .D(n639), .Y(n396) );
  MUX2X1 U491 ( .B(n398), .A(n399), .S(n640), .Y(r2_data[2]) );
  NAND2X1 U492 ( .A(n400), .B(n401), .Y(n399) );
  NOR2X1 U493 ( .A(n403), .B(n402), .Y(n401) );
  OAI22X1 U494 ( .A(\regs_matrix[8][2] ), .B(n612), .C(\regs_matrix[10][2] ), 
        .D(n618), .Y(n403) );
  OAI22X1 U495 ( .A(\regs_matrix[12][2] ), .B(n621), .C(\regs_matrix[14][2] ), 
        .D(n624), .Y(n402) );
  NOR2X1 U496 ( .A(n404), .B(n405), .Y(n400) );
  OAI22X1 U497 ( .A(\regs_matrix[11][2] ), .B(n629), .C(\regs_matrix[9][2] ), 
        .D(n632), .Y(n405) );
  OAI22X1 U498 ( .A(\regs_matrix[13][2] ), .B(n635), .C(\regs_matrix[15][2] ), 
        .D(n639), .Y(n404) );
  NAND2X1 U499 ( .A(n406), .B(n407), .Y(n398) );
  NOR2X1 U500 ( .A(n408), .B(n409), .Y(n407) );
  OAI22X1 U501 ( .A(outreg_data[2]), .B(n612), .C(\regs_matrix[2][2] ), .D(
        n618), .Y(n409) );
  OAI22X1 U502 ( .A(\regs_matrix[4][2] ), .B(n621), .C(\regs_matrix[6][2] ), 
        .D(n625), .Y(n408) );
  NOR2X1 U503 ( .A(n410), .B(n411), .Y(n406) );
  OAI22X1 U504 ( .A(\regs_matrix[3][2] ), .B(n628), .C(\regs_matrix[1][2] ), 
        .D(n632), .Y(n411) );
  OAI22X1 U505 ( .A(\regs_matrix[5][2] ), .B(n635), .C(\regs_matrix[7][2] ), 
        .D(n639), .Y(n410) );
  MUX2X1 U506 ( .B(n412), .A(n413), .S(n641), .Y(r2_data[3]) );
  NAND2X1 U507 ( .A(n414), .B(n415), .Y(n413) );
  NOR2X1 U508 ( .A(n416), .B(n417), .Y(n415) );
  OAI22X1 U509 ( .A(\regs_matrix[8][3] ), .B(n612), .C(\regs_matrix[10][3] ), 
        .D(n618), .Y(n417) );
  OAI22X1 U510 ( .A(\regs_matrix[12][3] ), .B(n621), .C(\regs_matrix[14][3] ), 
        .D(n624), .Y(n416) );
  NOR2X1 U511 ( .A(n418), .B(n419), .Y(n414) );
  OAI22X1 U512 ( .A(\regs_matrix[11][3] ), .B(n629), .C(\regs_matrix[9][3] ), 
        .D(n632), .Y(n419) );
  OAI22X1 U513 ( .A(\regs_matrix[13][3] ), .B(n636), .C(\regs_matrix[15][3] ), 
        .D(n639), .Y(n418) );
  NAND2X1 U514 ( .A(n420), .B(n421), .Y(n412) );
  NOR2X1 U515 ( .A(n422), .B(n423), .Y(n421) );
  OAI22X1 U516 ( .A(outreg_data[3]), .B(n612), .C(\regs_matrix[2][3] ), .D(
        n618), .Y(n423) );
  OAI22X1 U517 ( .A(\regs_matrix[4][3] ), .B(n621), .C(\regs_matrix[6][3] ), 
        .D(n626), .Y(n422) );
  NOR2X1 U518 ( .A(n424), .B(n425), .Y(n420) );
  OAI22X1 U519 ( .A(\regs_matrix[3][3] ), .B(n628), .C(\regs_matrix[1][3] ), 
        .D(n632), .Y(n425) );
  OAI22X1 U520 ( .A(\regs_matrix[5][3] ), .B(n636), .C(\regs_matrix[7][3] ), 
        .D(n639), .Y(n424) );
  MUX2X1 U521 ( .B(n426), .A(n427), .S(n640), .Y(r2_data[4]) );
  NAND2X1 U522 ( .A(n428), .B(n429), .Y(n427) );
  NOR2X1 U523 ( .A(n430), .B(n431), .Y(n429) );
  OAI22X1 U524 ( .A(\regs_matrix[8][4] ), .B(n613), .C(\regs_matrix[10][4] ), 
        .D(n619), .Y(n431) );
  OAI22X1 U525 ( .A(\regs_matrix[12][4] ), .B(n621), .C(\regs_matrix[14][4] ), 
        .D(n624), .Y(n430) );
  NOR2X1 U526 ( .A(n432), .B(n433), .Y(n428) );
  OAI22X1 U527 ( .A(\regs_matrix[11][4] ), .B(n628), .C(\regs_matrix[9][4] ), 
        .D(n632), .Y(n433) );
  OAI22X1 U528 ( .A(\regs_matrix[13][4] ), .B(n635), .C(\regs_matrix[15][4] ), 
        .D(n639), .Y(n432) );
  NAND2X1 U529 ( .A(n434), .B(n435), .Y(n426) );
  NOR2X1 U530 ( .A(n436), .B(n437), .Y(n435) );
  OAI22X1 U531 ( .A(outreg_data[4]), .B(n613), .C(\regs_matrix[2][4] ), .D(
        n619), .Y(n437) );
  OAI22X1 U532 ( .A(\regs_matrix[4][4] ), .B(n622), .C(\regs_matrix[6][4] ), 
        .D(n626), .Y(n436) );
  NOR2X1 U533 ( .A(n438), .B(n439), .Y(n434) );
  OAI22X1 U534 ( .A(\regs_matrix[3][4] ), .B(n628), .C(\regs_matrix[1][4] ), 
        .D(n631), .Y(n439) );
  OAI22X1 U535 ( .A(\regs_matrix[5][4] ), .B(n635), .C(\regs_matrix[7][4] ), 
        .D(n639), .Y(n438) );
  MUX2X1 U536 ( .B(n440), .A(n441), .S(n641), .Y(r2_data[5]) );
  NAND2X1 U537 ( .A(n442), .B(n443), .Y(n441) );
  NOR2X1 U538 ( .A(n444), .B(n445), .Y(n443) );
  OAI22X1 U539 ( .A(\regs_matrix[8][5] ), .B(n613), .C(\regs_matrix[10][5] ), 
        .D(n619), .Y(n445) );
  OAI22X1 U540 ( .A(\regs_matrix[12][5] ), .B(n621), .C(\regs_matrix[14][5] ), 
        .D(n624), .Y(n444) );
  NOR2X1 U541 ( .A(n446), .B(n447), .Y(n442) );
  OAI22X1 U542 ( .A(\regs_matrix[11][5] ), .B(n628), .C(\regs_matrix[9][5] ), 
        .D(n632), .Y(n447) );
  OAI22X1 U543 ( .A(\regs_matrix[13][5] ), .B(n635), .C(\regs_matrix[15][5] ), 
        .D(n639), .Y(n446) );
  NAND2X1 U544 ( .A(n449), .B(n448), .Y(n440) );
  NOR2X1 U545 ( .A(n450), .B(n451), .Y(n449) );
  OAI22X1 U546 ( .A(outreg_data[5]), .B(n613), .C(\regs_matrix[2][5] ), .D(
        n619), .Y(n451) );
  OAI22X1 U547 ( .A(\regs_matrix[4][5] ), .B(n622), .C(\regs_matrix[6][5] ), 
        .D(n626), .Y(n450) );
  NOR2X1 U548 ( .A(n452), .B(n453), .Y(n448) );
  OAI22X1 U549 ( .A(\regs_matrix[3][5] ), .B(n628), .C(\regs_matrix[1][5] ), 
        .D(n632), .Y(n453) );
  OAI22X1 U550 ( .A(\regs_matrix[5][5] ), .B(n634), .C(\regs_matrix[7][5] ), 
        .D(n639), .Y(n452) );
  MUX2X1 U551 ( .B(n454), .A(n455), .S(n640), .Y(r2_data[6]) );
  NAND2X1 U552 ( .A(n457), .B(n456), .Y(n455) );
  NOR2X1 U553 ( .A(n458), .B(n459), .Y(n457) );
  OAI22X1 U554 ( .A(\regs_matrix[8][6] ), .B(n613), .C(\regs_matrix[10][6] ), 
        .D(n619), .Y(n459) );
  OAI22X1 U555 ( .A(\regs_matrix[12][6] ), .B(n621), .C(\regs_matrix[14][6] ), 
        .D(n626), .Y(n458) );
  NOR2X1 U556 ( .A(n460), .B(n461), .Y(n456) );
  OAI22X1 U557 ( .A(\regs_matrix[11][6] ), .B(n628), .C(\regs_matrix[9][6] ), 
        .D(n632), .Y(n461) );
  OAI22X1 U558 ( .A(\regs_matrix[13][6] ), .B(n634), .C(\regs_matrix[15][6] ), 
        .D(n638), .Y(n460) );
  NAND2X1 U559 ( .A(n462), .B(n463), .Y(n454) );
  NOR2X1 U560 ( .A(n464), .B(n465), .Y(n463) );
  OAI22X1 U561 ( .A(outreg_data[6]), .B(n613), .C(\regs_matrix[2][6] ), .D(
        n643), .Y(n465) );
  OAI22X1 U562 ( .A(\regs_matrix[4][6] ), .B(n621), .C(\regs_matrix[6][6] ), 
        .D(n624), .Y(n464) );
  NOR2X1 U563 ( .A(n467), .B(n466), .Y(n462) );
  OAI22X1 U564 ( .A(\regs_matrix[3][6] ), .B(n628), .C(\regs_matrix[1][6] ), 
        .D(n632), .Y(n467) );
  OAI22X1 U565 ( .A(\regs_matrix[5][6] ), .B(n636), .C(\regs_matrix[7][6] ), 
        .D(n638), .Y(n466) );
  MUX2X1 U566 ( .B(n468), .A(n469), .S(n641), .Y(r2_data[7]) );
  NAND2X1 U567 ( .A(n470), .B(n471), .Y(n469) );
  NOR2X1 U568 ( .A(n472), .B(n473), .Y(n471) );
  OAI22X1 U569 ( .A(\regs_matrix[8][7] ), .B(n613), .C(\regs_matrix[10][7] ), 
        .D(n619), .Y(n473) );
  OAI22X1 U570 ( .A(\regs_matrix[12][7] ), .B(n622), .C(\regs_matrix[14][7] ), 
        .D(n626), .Y(n472) );
  NOR2X1 U571 ( .A(n474), .B(n475), .Y(n470) );
  OAI22X1 U572 ( .A(\regs_matrix[11][7] ), .B(n628), .C(\regs_matrix[9][7] ), 
        .D(n631), .Y(n475) );
  OAI22X1 U573 ( .A(\regs_matrix[13][7] ), .B(n635), .C(\regs_matrix[15][7] ), 
        .D(n638), .Y(n474) );
  NAND2X1 U574 ( .A(n476), .B(n477), .Y(n468) );
  NOR2X1 U575 ( .A(n478), .B(n479), .Y(n477) );
  OAI22X1 U576 ( .A(outreg_data[7]), .B(n612), .C(\regs_matrix[2][7] ), .D(
        n619), .Y(n479) );
  OAI22X1 U577 ( .A(\regs_matrix[4][7] ), .B(n622), .C(\regs_matrix[6][7] ), 
        .D(n625), .Y(n478) );
  NOR2X1 U578 ( .A(n481), .B(n480), .Y(n476) );
  OAI22X1 U579 ( .A(\regs_matrix[3][7] ), .B(n628), .C(\regs_matrix[1][7] ), 
        .D(n631), .Y(n481) );
  OAI22X1 U580 ( .A(\regs_matrix[5][7] ), .B(n635), .C(\regs_matrix[7][7] ), 
        .D(n638), .Y(n480) );
  MUX2X1 U581 ( .B(n482), .A(n483), .S(n640), .Y(r2_data[8]) );
  NAND2X1 U582 ( .A(n485), .B(n484), .Y(n483) );
  NOR2X1 U583 ( .A(n486), .B(n487), .Y(n485) );
  OAI22X1 U584 ( .A(\regs_matrix[8][8] ), .B(n613), .C(\regs_matrix[10][8] ), 
        .D(n619), .Y(n487) );
  OAI22X1 U585 ( .A(\regs_matrix[12][8] ), .B(n622), .C(\regs_matrix[14][8] ), 
        .D(n626), .Y(n486) );
  NOR2X1 U586 ( .A(n488), .B(n489), .Y(n484) );
  OAI22X1 U587 ( .A(\regs_matrix[11][8] ), .B(n628), .C(\regs_matrix[9][8] ), 
        .D(n632), .Y(n489) );
  OAI22X1 U588 ( .A(\regs_matrix[13][8] ), .B(n634), .C(\regs_matrix[15][8] ), 
        .D(n638), .Y(n488) );
  NAND2X1 U589 ( .A(n490), .B(n491), .Y(n482) );
  NOR2X1 U590 ( .A(n492), .B(n493), .Y(n491) );
  OAI22X1 U591 ( .A(outreg_data[8]), .B(n613), .C(\regs_matrix[2][8] ), .D(
        n619), .Y(n493) );
  OAI22X1 U592 ( .A(\regs_matrix[4][8] ), .B(n621), .C(\regs_matrix[6][8] ), 
        .D(n626), .Y(n492) );
  NOR2X1 U593 ( .A(n495), .B(n494), .Y(n490) );
  OAI22X1 U594 ( .A(\regs_matrix[3][8] ), .B(n628), .C(\regs_matrix[1][8] ), 
        .D(n631), .Y(n495) );
  OAI22X1 U595 ( .A(\regs_matrix[5][8] ), .B(n636), .C(\regs_matrix[7][8] ), 
        .D(n638), .Y(n494) );
  MUX2X1 U596 ( .B(n496), .A(n497), .S(n641), .Y(r2_data[9]) );
  NAND2X1 U597 ( .A(n498), .B(n499), .Y(n497) );
  NOR2X1 U598 ( .A(n500), .B(n501), .Y(n499) );
  OAI22X1 U599 ( .A(\regs_matrix[8][9] ), .B(n613), .C(\regs_matrix[10][9] ), 
        .D(n619), .Y(n501) );
  OAI22X1 U600 ( .A(\regs_matrix[12][9] ), .B(n622), .C(\regs_matrix[14][9] ), 
        .D(n624), .Y(n500) );
  NOR2X1 U601 ( .A(n502), .B(n503), .Y(n498) );
  OAI22X1 U602 ( .A(\regs_matrix[11][9] ), .B(n628), .C(\regs_matrix[9][9] ), 
        .D(n631), .Y(n503) );
  OAI22X1 U603 ( .A(\regs_matrix[13][9] ), .B(n635), .C(\regs_matrix[15][9] ), 
        .D(n638), .Y(n502) );
  NAND2X1 U604 ( .A(n504), .B(n505), .Y(n496) );
  NOR2X1 U605 ( .A(n506), .B(n507), .Y(n505) );
  OAI22X1 U606 ( .A(outreg_data[9]), .B(n613), .C(\regs_matrix[2][9] ), .D(
        n619), .Y(n507) );
  OAI22X1 U607 ( .A(\regs_matrix[4][9] ), .B(n621), .C(\regs_matrix[6][9] ), 
        .D(n625), .Y(n506) );
  NOR2X1 U608 ( .A(n509), .B(n508), .Y(n504) );
  OAI22X1 U609 ( .A(\regs_matrix[3][9] ), .B(n628), .C(\regs_matrix[1][9] ), 
        .D(n631), .Y(n509) );
  OAI22X1 U610 ( .A(\regs_matrix[5][9] ), .B(n636), .C(\regs_matrix[7][9] ), 
        .D(n638), .Y(n508) );
  NAND2X1 U611 ( .A(n512), .B(n513), .Y(n511) );
  NOR2X1 U612 ( .A(n514), .B(n515), .Y(n513) );
  OAI22X1 U613 ( .A(\regs_matrix[8][10] ), .B(n614), .C(\regs_matrix[10][10] ), 
        .D(n30), .Y(n515) );
  OAI22X1 U614 ( .A(\regs_matrix[12][10] ), .B(n622), .C(\regs_matrix[14][10] ), .D(n624), .Y(n514) );
  NOR2X1 U615 ( .A(n516), .B(n517), .Y(n512) );
  OAI22X1 U616 ( .A(\regs_matrix[11][10] ), .B(n628), .C(\regs_matrix[9][10] ), 
        .D(n632), .Y(n517) );
  OAI22X1 U617 ( .A(\regs_matrix[13][10] ), .B(n636), .C(\regs_matrix[15][10] ), .D(n638), .Y(n516) );
  NAND2X1 U618 ( .A(n518), .B(n519), .Y(n510) );
  NOR2X1 U619 ( .A(n520), .B(n521), .Y(n519) );
  OAI22X1 U620 ( .A(outreg_data[10]), .B(n614), .C(\regs_matrix[2][10] ), .D(
        n30), .Y(n521) );
  OAI22X1 U621 ( .A(\regs_matrix[4][10] ), .B(n621), .C(\regs_matrix[6][10] ), 
        .D(n624), .Y(n520) );
  NOR2X1 U622 ( .A(n522), .B(n523), .Y(n518) );
  OAI22X1 U623 ( .A(\regs_matrix[3][10] ), .B(n629), .C(\regs_matrix[1][10] ), 
        .D(n632), .Y(n523) );
  OAI22X1 U624 ( .A(\regs_matrix[5][10] ), .B(n634), .C(\regs_matrix[7][10] ), 
        .D(n638), .Y(n522) );
  NAND2X1 U625 ( .A(n526), .B(n527), .Y(n525) );
  NOR2X1 U626 ( .A(n528), .B(n529), .Y(n527) );
  OAI22X1 U627 ( .A(\regs_matrix[8][11] ), .B(n614), .C(\regs_matrix[10][11] ), 
        .D(n619), .Y(n529) );
  OAI22X1 U628 ( .A(\regs_matrix[12][11] ), .B(n622), .C(\regs_matrix[14][11] ), .D(n625), .Y(n528) );
  NOR2X1 U629 ( .A(n530), .B(n531), .Y(n526) );
  OAI22X1 U630 ( .A(\regs_matrix[11][11] ), .B(n629), .C(\regs_matrix[9][11] ), 
        .D(n631), .Y(n531) );
  OAI22X1 U631 ( .A(\regs_matrix[13][11] ), .B(n635), .C(\regs_matrix[15][11] ), .D(n638), .Y(n530) );
  NAND2X1 U632 ( .A(n533), .B(n532), .Y(n524) );
  NOR2X1 U633 ( .A(n534), .B(n535), .Y(n533) );
  OAI22X1 U634 ( .A(outreg_data[11]), .B(n614), .C(\regs_matrix[2][11] ), .D(
        n619), .Y(n535) );
  OAI22X1 U635 ( .A(\regs_matrix[4][11] ), .B(n622), .C(\regs_matrix[6][11] ), 
        .D(n625), .Y(n534) );
  NOR2X1 U636 ( .A(n536), .B(n537), .Y(n532) );
  OAI22X1 U637 ( .A(\regs_matrix[3][11] ), .B(n629), .C(\regs_matrix[1][11] ), 
        .D(n632), .Y(n537) );
  OAI22X1 U638 ( .A(\regs_matrix[5][11] ), .B(n636), .C(\regs_matrix[7][11] ), 
        .D(n638), .Y(n536) );
  MUX2X1 U639 ( .B(n538), .A(n539), .S(n640), .Y(r2_data[12]) );
  NAND2X1 U640 ( .A(n540), .B(n541), .Y(n539) );
  NOR2X1 U641 ( .A(n542), .B(n543), .Y(n541) );
  OAI22X1 U642 ( .A(\regs_matrix[8][12] ), .B(n614), .C(\regs_matrix[10][12] ), 
        .D(n618), .Y(n543) );
  OAI22X1 U643 ( .A(\regs_matrix[12][12] ), .B(n621), .C(\regs_matrix[14][12] ), .D(n626), .Y(n542) );
  NOR2X1 U644 ( .A(n544), .B(n545), .Y(n540) );
  OAI22X1 U645 ( .A(\regs_matrix[11][12] ), .B(n629), .C(\regs_matrix[9][12] ), 
        .D(n632), .Y(n545) );
  OAI22X1 U646 ( .A(\regs_matrix[13][12] ), .B(n634), .C(\regs_matrix[15][12] ), .D(n638), .Y(n544) );
  NAND2X1 U647 ( .A(n546), .B(n547), .Y(n538) );
  NOR2X1 U648 ( .A(n548), .B(n549), .Y(n547) );
  OAI22X1 U649 ( .A(outreg_data[12]), .B(n614), .C(\regs_matrix[2][12] ), .D(
        n619), .Y(n549) );
  OAI22X1 U650 ( .A(\regs_matrix[4][12] ), .B(n621), .C(\regs_matrix[6][12] ), 
        .D(n626), .Y(n548) );
  NOR2X1 U651 ( .A(n551), .B(n550), .Y(n546) );
  OAI22X1 U652 ( .A(\regs_matrix[3][12] ), .B(n629), .C(\regs_matrix[1][12] ), 
        .D(n631), .Y(n551) );
  OAI22X1 U653 ( .A(\regs_matrix[5][12] ), .B(n636), .C(\regs_matrix[7][12] ), 
        .D(n639), .Y(n550) );
  MUX2X1 U654 ( .B(n552), .A(n553), .S(n641), .Y(r2_data[13]) );
  NAND2X1 U655 ( .A(n555), .B(n554), .Y(n553) );
  NOR2X1 U656 ( .A(n556), .B(n557), .Y(n555) );
  OAI22X1 U657 ( .A(\regs_matrix[8][13] ), .B(n614), .C(\regs_matrix[10][13] ), 
        .D(n643), .Y(n557) );
  OAI22X1 U658 ( .A(\regs_matrix[12][13] ), .B(n622), .C(\regs_matrix[14][13] ), .D(n625), .Y(n556) );
  NOR2X1 U659 ( .A(n559), .B(n558), .Y(n554) );
  OAI22X1 U660 ( .A(\regs_matrix[11][13] ), .B(n629), .C(\regs_matrix[9][13] ), 
        .D(n632), .Y(n559) );
  OAI22X1 U661 ( .A(\regs_matrix[13][13] ), .B(n634), .C(\regs_matrix[15][13] ), .D(n638), .Y(n558) );
  NAND2X1 U662 ( .A(n560), .B(n561), .Y(n552) );
  NOR2X1 U663 ( .A(n562), .B(n563), .Y(n561) );
  OAI22X1 U664 ( .A(outreg_data[13]), .B(n614), .C(\regs_matrix[2][13] ), .D(
        n30), .Y(n563) );
  OAI22X1 U665 ( .A(\regs_matrix[4][13] ), .B(n622), .C(\regs_matrix[6][13] ), 
        .D(n625), .Y(n562) );
  NOR2X1 U666 ( .A(n565), .B(n564), .Y(n560) );
  OAI22X1 U667 ( .A(\regs_matrix[3][13] ), .B(n629), .C(\regs_matrix[1][13] ), 
        .D(n631), .Y(n565) );
  OAI22X1 U668 ( .A(\regs_matrix[5][13] ), .B(n634), .C(\regs_matrix[7][13] ), 
        .D(n639), .Y(n564) );
  MUX2X1 U669 ( .B(n566), .A(n567), .S(n640), .Y(r2_data[14]) );
  NAND2X1 U670 ( .A(n569), .B(n568), .Y(n567) );
  NOR2X1 U671 ( .A(n570), .B(n571), .Y(n569) );
  OAI22X1 U672 ( .A(\regs_matrix[8][14] ), .B(n614), .C(\regs_matrix[10][14] ), 
        .D(n619), .Y(n571) );
  OAI22X1 U673 ( .A(\regs_matrix[12][14] ), .B(n622), .C(\regs_matrix[14][14] ), .D(n624), .Y(n570) );
  NOR2X1 U674 ( .A(n572), .B(n573), .Y(n568) );
  OAI22X1 U675 ( .A(\regs_matrix[11][14] ), .B(n629), .C(\regs_matrix[9][14] ), 
        .D(n632), .Y(n573) );
  OAI22X1 U676 ( .A(\regs_matrix[13][14] ), .B(n635), .C(\regs_matrix[15][14] ), .D(n638), .Y(n572) );
  NAND2X1 U677 ( .A(n575), .B(n574), .Y(n566) );
  NOR2X1 U678 ( .A(n576), .B(n577), .Y(n575) );
  OAI22X1 U679 ( .A(outreg_data[14]), .B(n614), .C(\regs_matrix[2][14] ), .D(
        n618), .Y(n577) );
  OAI22X1 U680 ( .A(\regs_matrix[4][14] ), .B(n622), .C(\regs_matrix[6][14] ), 
        .D(n626), .Y(n576) );
  NOR2X1 U681 ( .A(n578), .B(n579), .Y(n574) );
  OAI22X1 U682 ( .A(\regs_matrix[3][14] ), .B(n629), .C(\regs_matrix[1][14] ), 
        .D(n632), .Y(n579) );
  OAI22X1 U683 ( .A(\regs_matrix[5][14] ), .B(n635), .C(\regs_matrix[7][14] ), 
        .D(n639), .Y(n578) );
  MUX2X1 U684 ( .B(n580), .A(n581), .S(n641), .Y(r2_data[15]) );
  NAND2X1 U685 ( .A(n582), .B(n583), .Y(n581) );
  NOR2X1 U686 ( .A(n584), .B(n585), .Y(n583) );
  OAI22X1 U687 ( .A(\regs_matrix[8][15] ), .B(n614), .C(\regs_matrix[10][15] ), 
        .D(n30), .Y(n585) );
  OAI22X1 U688 ( .A(\regs_matrix[12][15] ), .B(n621), .C(\regs_matrix[14][15] ), .D(n624), .Y(n584) );
  NOR2X1 U689 ( .A(n586), .B(n587), .Y(n582) );
  OAI22X1 U690 ( .A(\regs_matrix[11][15] ), .B(n629), .C(\regs_matrix[9][15] ), 
        .D(n631), .Y(n587) );
  OAI22X1 U691 ( .A(\regs_matrix[13][15] ), .B(n635), .C(\regs_matrix[15][15] ), .D(n638), .Y(n586) );
  NAND2X1 U692 ( .A(n588), .B(n589), .Y(n580) );
  NOR2X1 U693 ( .A(n590), .B(n591), .Y(n589) );
  OAI22X1 U694 ( .A(outreg_data[15]), .B(n614), .C(\regs_matrix[2][15] ), .D(
        n618), .Y(n591) );
  OAI22X1 U695 ( .A(\regs_matrix[4][15] ), .B(n622), .C(\regs_matrix[6][15] ), 
        .D(n625), .Y(n590) );
  NOR2X1 U696 ( .A(n592), .B(n593), .Y(n588) );
  OAI22X1 U697 ( .A(\regs_matrix[3][15] ), .B(n629), .C(\regs_matrix[1][15] ), 
        .D(n631), .Y(n593) );
  OAI22X1 U698 ( .A(\regs_matrix[5][15] ), .B(n635), .C(\regs_matrix[7][15] ), 
        .D(n639), .Y(n592) );
  NOR2X1 U699 ( .A(n594), .B(n595), .Y(n357) );
  OAI21X1 U700 ( .A(\regs_matrix[6][16] ), .B(n624), .C(n596), .Y(n595) );
  AOI22X1 U701 ( .A(n617), .B(n310), .C(n611), .D(n311), .Y(n596) );
  OAI21X1 U702 ( .A(\regs_matrix[4][16] ), .B(n37), .C(n642), .Y(n594) );
  NOR2X1 U703 ( .A(n597), .B(n598), .Y(n358) );
  OAI22X1 U704 ( .A(\regs_matrix[3][16] ), .B(n629), .C(\regs_matrix[1][16] ), 
        .D(n632), .Y(n598) );
  OAI22X1 U705 ( .A(\regs_matrix[5][16] ), .B(n634), .C(\regs_matrix[7][16] ), 
        .D(n638), .Y(n597) );
  NOR2X1 U706 ( .A(n599), .B(n600), .Y(n359) );
  OAI21X1 U707 ( .A(\regs_matrix[12][16] ), .B(n37), .C(n601), .Y(n600) );
  AOI22X1 U708 ( .A(n617), .B(n317), .C(n609), .D(n602), .Y(n601) );
  INVX2 U709 ( .A(\regs_matrix[8][16] ), .Y(n602) );
  NAND3X1 U710 ( .A(n605), .B(n604), .C(n603), .Y(n368) );
  NAND3X1 U711 ( .A(n604), .B(n38), .C(n605), .Y(n369) );
  NAND3X1 U712 ( .A(n603), .B(n605), .C(n33), .Y(n370) );
  OAI22X1 U713 ( .A(\regs_matrix[9][16] ), .B(n632), .C(\regs_matrix[14][16] ), 
        .D(n626), .Y(n599) );
  NAND3X1 U714 ( .A(N16), .B(n605), .C(n38), .Y(n371) );
  NAND3X1 U715 ( .A(n32), .B(n604), .C(n603), .Y(n375) );
  NOR2X1 U716 ( .A(n606), .B(n607), .Y(n360) );
  OAI21X1 U717 ( .A(\regs_matrix[11][16] ), .B(n629), .C(n640), .Y(n607) );
  NAND2X1 U718 ( .A(n604), .B(n29), .Y(n374) );
  OAI22X1 U719 ( .A(\regs_matrix[15][16] ), .B(n639), .C(\regs_matrix[13][16] ), .D(n636), .Y(n606) );
  NAND3X1 U720 ( .A(n32), .B(n33), .C(n603), .Y(n376) );
  INVX2 U721 ( .A(N15), .Y(n603) );
  NAND2X1 U722 ( .A(n33), .B(n29), .Y(n377) );
  BUFX4 U723 ( .A(n615), .Y(n617) );
  INVX8 U724 ( .A(n616), .Y(n619) );
  INVX8 U725 ( .A(n620), .Y(n621) );
  INVX8 U726 ( .A(n627), .Y(n628) );
  INVX8 U727 ( .A(n627), .Y(n629) );
  INVX8 U728 ( .A(n633), .Y(n635) );
  INVX8 U729 ( .A(n637), .Y(n638) );
  INVX8 U730 ( .A(n637), .Y(n639) );
  INVX2 U731 ( .A(n369), .Y(n615) );
  INVX2 U732 ( .A(n368), .Y(n608) );
  INVX4 U733 ( .A(n370), .Y(n620) );
  INVX4 U734 ( .A(n630), .Y(n631) );
  INVX4 U735 ( .A(n374), .Y(n627) );
  INVX4 U736 ( .A(n376), .Y(n633) );
  INVX4 U737 ( .A(n633), .Y(n634) );
  INVX4 U738 ( .A(n377), .Y(n637) );
  INVX1 U739 ( .A(n616), .Y(n643) );
  INVX4 U740 ( .A(n633), .Y(n636) );
  INVX4 U741 ( .A(n623), .Y(n624) );
  INVX8 U742 ( .A(n620), .Y(n622) );
  INVX4 U743 ( .A(n623), .Y(n625) );
  INVX4 U744 ( .A(n623), .Y(n626) );
  INVX2 U745 ( .A(w_en), .Y(n694) );
  INVX2 U746 ( .A(w_sel[3]), .Y(n695) );
  INVX2 U747 ( .A(w_sel[1]), .Y(n696) );
  INVX2 U748 ( .A(w_sel[2]), .Y(n697) );
endmodule


module datapath ( clk, n_reset, op, src1, src2, dest, ext_data1, ext_data2, 
        outreg_data, overflow );
  input [2:0] op;
  input [3:0] src1;
  input [3:0] src2;
  input [3:0] dest;
  input [15:0] ext_data1;
  input [15:0] ext_data2;
  output [16:0] outreg_data;
  input clk, n_reset;
  output overflow;
  wire   w_en, n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14,
         n15, n16, n17, n18, n19, n20, n21, n22, n23, n24, n25, n26, n27, n28,
         n29, n30, n31, n32, n33, n34, n35, n36, n37, n38, n39;
  wire   [1:0] w_data_sel;
  wire   [1:0] alu_op;
  wire   [16:0] src1_data;
  wire   [16:0] src2_data;
  wire   [16:0] alu_result;
  wire   [16:0] dest_data;

  datapath_decode DEC ( .op(op), .w_en(w_en), .w_data_sel(w_data_sel), 
        .alu_op(alu_op) );
  alu CORE ( .src1_data({src1_data[16:6], n1, src1_data[4:0]}), .src2_data({
        src2_data[16:8], n5, src2_data[6:0]}), .alu_op(alu_op), .result(
        alu_result), .overflow(overflow) );
  register_file RF ( .clk(clk), .n_reset(n_reset), .w_en(w_en), .r1_sel(src1), 
        .r2_sel(src2), .w_sel(dest), .w_data(dest_data), .r1_data(src1_data), 
        .r2_data(src2_data), .outreg_data(outreg_data) );
  BUFX4 U2 ( .A(src1_data[5]), .Y(n1) );
  INVX2 U3 ( .A(w_data_sel[1]), .Y(n39) );
  AND2X2 U4 ( .A(n39), .B(n6), .Y(n2) );
  AND2X2 U5 ( .A(w_data_sel[0]), .B(n39), .Y(n3) );
  INVX2 U6 ( .A(src2_data[7]), .Y(n4) );
  INVX4 U7 ( .A(n4), .Y(n5) );
  AND2X2 U8 ( .A(alu_result[16]), .B(w_data_sel[1]), .Y(dest_data[16]) );
  INVX2 U9 ( .A(alu_result[15]), .Y(n8) );
  INVX2 U10 ( .A(w_data_sel[0]), .Y(n6) );
  AOI22X1 U11 ( .A(ext_data2[15]), .B(n3), .C(ext_data1[15]), .D(n2), .Y(n7)
         );
  OAI21X1 U12 ( .A(n39), .B(n8), .C(n7), .Y(dest_data[15]) );
  INVX2 U13 ( .A(alu_result[14]), .Y(n10) );
  AOI22X1 U14 ( .A(ext_data2[14]), .B(n3), .C(ext_data1[14]), .D(n2), .Y(n9)
         );
  OAI21X1 U15 ( .A(n39), .B(n10), .C(n9), .Y(dest_data[14]) );
  INVX2 U16 ( .A(alu_result[13]), .Y(n12) );
  AOI22X1 U17 ( .A(ext_data2[13]), .B(n3), .C(ext_data1[13]), .D(n2), .Y(n11)
         );
  OAI21X1 U18 ( .A(n39), .B(n12), .C(n11), .Y(dest_data[13]) );
  INVX2 U19 ( .A(alu_result[12]), .Y(n14) );
  AOI22X1 U20 ( .A(ext_data2[12]), .B(n3), .C(ext_data1[12]), .D(n2), .Y(n13)
         );
  OAI21X1 U21 ( .A(n39), .B(n14), .C(n13), .Y(dest_data[12]) );
  INVX2 U22 ( .A(alu_result[11]), .Y(n16) );
  AOI22X1 U23 ( .A(ext_data2[11]), .B(n3), .C(ext_data1[11]), .D(n2), .Y(n15)
         );
  OAI21X1 U24 ( .A(n39), .B(n16), .C(n15), .Y(dest_data[11]) );
  INVX2 U25 ( .A(alu_result[10]), .Y(n18) );
  AOI22X1 U26 ( .A(ext_data2[10]), .B(n3), .C(ext_data1[10]), .D(n2), .Y(n17)
         );
  OAI21X1 U27 ( .A(n39), .B(n18), .C(n17), .Y(dest_data[10]) );
  INVX2 U28 ( .A(alu_result[9]), .Y(n20) );
  AOI22X1 U29 ( .A(ext_data2[9]), .B(n3), .C(ext_data1[9]), .D(n2), .Y(n19) );
  OAI21X1 U30 ( .A(n39), .B(n20), .C(n19), .Y(dest_data[9]) );
  INVX2 U31 ( .A(alu_result[8]), .Y(n22) );
  AOI22X1 U32 ( .A(ext_data2[8]), .B(n3), .C(ext_data1[8]), .D(n2), .Y(n21) );
  OAI21X1 U33 ( .A(n39), .B(n22), .C(n21), .Y(dest_data[8]) );
  INVX2 U34 ( .A(alu_result[7]), .Y(n24) );
  AOI22X1 U35 ( .A(ext_data2[7]), .B(n3), .C(ext_data1[7]), .D(n2), .Y(n23) );
  OAI21X1 U36 ( .A(n39), .B(n24), .C(n23), .Y(dest_data[7]) );
  INVX2 U37 ( .A(alu_result[6]), .Y(n26) );
  AOI22X1 U38 ( .A(ext_data2[6]), .B(n3), .C(ext_data1[6]), .D(n2), .Y(n25) );
  OAI21X1 U39 ( .A(n39), .B(n26), .C(n25), .Y(dest_data[6]) );
  INVX2 U40 ( .A(alu_result[5]), .Y(n28) );
  AOI22X1 U41 ( .A(ext_data2[5]), .B(n3), .C(ext_data1[5]), .D(n2), .Y(n27) );
  OAI21X1 U42 ( .A(n39), .B(n28), .C(n27), .Y(dest_data[5]) );
  INVX2 U43 ( .A(alu_result[4]), .Y(n30) );
  AOI22X1 U44 ( .A(ext_data2[4]), .B(n3), .C(ext_data1[4]), .D(n2), .Y(n29) );
  OAI21X1 U45 ( .A(n39), .B(n30), .C(n29), .Y(dest_data[4]) );
  INVX2 U46 ( .A(alu_result[3]), .Y(n32) );
  AOI22X1 U47 ( .A(ext_data2[3]), .B(n3), .C(ext_data1[3]), .D(n2), .Y(n31) );
  OAI21X1 U48 ( .A(n39), .B(n32), .C(n31), .Y(dest_data[3]) );
  INVX2 U49 ( .A(alu_result[2]), .Y(n34) );
  AOI22X1 U50 ( .A(ext_data2[2]), .B(n3), .C(ext_data1[2]), .D(n2), .Y(n33) );
  OAI21X1 U51 ( .A(n39), .B(n34), .C(n33), .Y(dest_data[2]) );
  INVX2 U52 ( .A(alu_result[1]), .Y(n36) );
  AOI22X1 U53 ( .A(ext_data2[1]), .B(n3), .C(ext_data1[1]), .D(n2), .Y(n35) );
  OAI21X1 U54 ( .A(n39), .B(n36), .C(n35), .Y(dest_data[1]) );
  INVX2 U55 ( .A(alu_result[0]), .Y(n38) );
  AOI22X1 U56 ( .A(ext_data2[0]), .B(n3), .C(ext_data1[0]), .D(n2), .Y(n37) );
  OAI21X1 U57 ( .A(n39), .B(n38), .C(n37), .Y(dest_data[0]) );
endmodule


module magnitude ( in, out );
  input [16:0] in;
  output [15:0] out;
  wire   n22, n23, n24, n25, n26, n27, n28, n29, n30, n31, n32, n33, n34, n35,
         n36, n37, \sub_add_21_b0/carry[15] , \sub_add_21_b0/carry[14] ,
         \sub_add_21_b0/carry[13] , \sub_add_21_b0/carry[12] ,
         \sub_add_21_b0/carry[11] , \sub_add_21_b0/carry[10] ,
         \sub_add_21_b0/carry[9] , \sub_add_21_b0/carry[8] ,
         \sub_add_21_b0/carry[7] , \sub_add_21_b0/carry[6] ,
         \sub_add_21_b0/carry[5] , \sub_add_21_b0/carry[4] ,
         \sub_add_21_b0/carry[3] , \sub_add_21_b0/carry[2] , n1, n2, n3, n4,
         n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16, n17, n18;
  wire   [15:0] comp;
  assign comp[0] = in[0];

  AOI22X1 U22 ( .A(n2), .B(comp[9]), .C(in[9]), .D(n1), .Y(n22) );
  AOI22X1 U23 ( .A(comp[8]), .B(in[16]), .C(in[8]), .D(n1), .Y(n23) );
  AOI22X1 U24 ( .A(comp[7]), .B(in[16]), .C(in[7]), .D(n1), .Y(n24) );
  AOI22X1 U25 ( .A(comp[6]), .B(in[16]), .C(in[6]), .D(n1), .Y(n25) );
  AOI22X1 U26 ( .A(comp[5]), .B(in[16]), .C(in[5]), .D(n1), .Y(n26) );
  AOI22X1 U27 ( .A(comp[4]), .B(n2), .C(in[4]), .D(n1), .Y(n27) );
  AOI22X1 U28 ( .A(comp[3]), .B(in[16]), .C(in[3]), .D(n1), .Y(n28) );
  AOI22X1 U29 ( .A(comp[2]), .B(n2), .C(in[2]), .D(n1), .Y(n29) );
  AOI22X1 U30 ( .A(comp[1]), .B(n2), .C(in[1]), .D(n1), .Y(n30) );
  AOI22X1 U31 ( .A(comp[15]), .B(n2), .C(in[15]), .D(n1), .Y(n31) );
  AOI22X1 U32 ( .A(comp[14]), .B(n2), .C(in[14]), .D(n1), .Y(n32) );
  AOI22X1 U33 ( .A(comp[13]), .B(n2), .C(in[13]), .D(n1), .Y(n33) );
  AOI22X1 U34 ( .A(comp[12]), .B(n2), .C(in[12]), .D(n1), .Y(n34) );
  AOI22X1 U35 ( .A(comp[11]), .B(n2), .C(in[11]), .D(n1), .Y(n35) );
  AOI22X1 U36 ( .A(comp[10]), .B(n2), .C(in[10]), .D(n1), .Y(n36) );
  AOI22X1 U37 ( .A(comp[0]), .B(n2), .C(comp[0]), .D(n1), .Y(n37) );
  INVX2 U2 ( .A(n1), .Y(n2) );
  INVX2 U3 ( .A(in[16]), .Y(n1) );
  XOR2X1 U4 ( .A(n18), .B(\sub_add_21_b0/carry[15] ), .Y(comp[15]) );
  AND2X1 U5 ( .A(n17), .B(\sub_add_21_b0/carry[14] ), .Y(
        \sub_add_21_b0/carry[15] ) );
  XOR2X1 U6 ( .A(\sub_add_21_b0/carry[14] ), .B(n17), .Y(comp[14]) );
  AND2X1 U7 ( .A(n16), .B(\sub_add_21_b0/carry[13] ), .Y(
        \sub_add_21_b0/carry[14] ) );
  XOR2X1 U8 ( .A(\sub_add_21_b0/carry[13] ), .B(n16), .Y(comp[13]) );
  AND2X1 U9 ( .A(n15), .B(\sub_add_21_b0/carry[12] ), .Y(
        \sub_add_21_b0/carry[13] ) );
  XOR2X1 U10 ( .A(\sub_add_21_b0/carry[12] ), .B(n15), .Y(comp[12]) );
  AND2X1 U11 ( .A(n14), .B(\sub_add_21_b0/carry[11] ), .Y(
        \sub_add_21_b0/carry[12] ) );
  XOR2X1 U12 ( .A(\sub_add_21_b0/carry[11] ), .B(n14), .Y(comp[11]) );
  AND2X1 U13 ( .A(n13), .B(\sub_add_21_b0/carry[10] ), .Y(
        \sub_add_21_b0/carry[11] ) );
  XOR2X1 U14 ( .A(\sub_add_21_b0/carry[10] ), .B(n13), .Y(comp[10]) );
  AND2X1 U15 ( .A(n12), .B(\sub_add_21_b0/carry[9] ), .Y(
        \sub_add_21_b0/carry[10] ) );
  XOR2X1 U16 ( .A(\sub_add_21_b0/carry[9] ), .B(n12), .Y(comp[9]) );
  AND2X1 U17 ( .A(n11), .B(\sub_add_21_b0/carry[8] ), .Y(
        \sub_add_21_b0/carry[9] ) );
  XOR2X1 U18 ( .A(\sub_add_21_b0/carry[8] ), .B(n11), .Y(comp[8]) );
  AND2X1 U19 ( .A(n10), .B(\sub_add_21_b0/carry[7] ), .Y(
        \sub_add_21_b0/carry[8] ) );
  XOR2X1 U20 ( .A(\sub_add_21_b0/carry[7] ), .B(n10), .Y(comp[7]) );
  AND2X1 U21 ( .A(n9), .B(\sub_add_21_b0/carry[6] ), .Y(
        \sub_add_21_b0/carry[7] ) );
  XOR2X1 U38 ( .A(\sub_add_21_b0/carry[6] ), .B(n9), .Y(comp[6]) );
  AND2X1 U39 ( .A(n8), .B(\sub_add_21_b0/carry[5] ), .Y(
        \sub_add_21_b0/carry[6] ) );
  XOR2X1 U40 ( .A(\sub_add_21_b0/carry[5] ), .B(n8), .Y(comp[5]) );
  AND2X1 U41 ( .A(n7), .B(\sub_add_21_b0/carry[4] ), .Y(
        \sub_add_21_b0/carry[5] ) );
  XOR2X1 U42 ( .A(\sub_add_21_b0/carry[4] ), .B(n7), .Y(comp[4]) );
  AND2X1 U43 ( .A(n6), .B(\sub_add_21_b0/carry[3] ), .Y(
        \sub_add_21_b0/carry[4] ) );
  XOR2X1 U44 ( .A(\sub_add_21_b0/carry[3] ), .B(n6), .Y(comp[3]) );
  AND2X1 U45 ( .A(n5), .B(\sub_add_21_b0/carry[2] ), .Y(
        \sub_add_21_b0/carry[3] ) );
  XOR2X1 U46 ( .A(\sub_add_21_b0/carry[2] ), .B(n5), .Y(comp[2]) );
  AND2X1 U47 ( .A(n4), .B(n3), .Y(\sub_add_21_b0/carry[2] ) );
  XOR2X1 U48 ( .A(n3), .B(n4), .Y(comp[1]) );
  INVX2 U49 ( .A(comp[0]), .Y(n3) );
  INVX2 U50 ( .A(in[1]), .Y(n4) );
  INVX2 U51 ( .A(in[2]), .Y(n5) );
  INVX2 U52 ( .A(in[3]), .Y(n6) );
  INVX2 U53 ( .A(in[4]), .Y(n7) );
  INVX2 U54 ( .A(in[5]), .Y(n8) );
  INVX2 U55 ( .A(in[6]), .Y(n9) );
  INVX2 U56 ( .A(in[7]), .Y(n10) );
  INVX2 U57 ( .A(in[8]), .Y(n11) );
  INVX2 U58 ( .A(in[9]), .Y(n12) );
  INVX2 U59 ( .A(in[10]), .Y(n13) );
  INVX2 U60 ( .A(in[11]), .Y(n14) );
  INVX2 U61 ( .A(in[12]), .Y(n15) );
  INVX2 U62 ( .A(in[13]), .Y(n16) );
  INVX2 U63 ( .A(in[14]), .Y(n17) );
  INVX2 U64 ( .A(in[15]), .Y(n18) );
  INVX2 U65 ( .A(n31), .Y(out[15]) );
  INVX2 U66 ( .A(n32), .Y(out[14]) );
  INVX2 U67 ( .A(n33), .Y(out[13]) );
  INVX2 U68 ( .A(n34), .Y(out[12]) );
  INVX2 U69 ( .A(n35), .Y(out[11]) );
  INVX2 U70 ( .A(n36), .Y(out[10]) );
  INVX2 U71 ( .A(n22), .Y(out[9]) );
  INVX2 U72 ( .A(n23), .Y(out[8]) );
  INVX2 U73 ( .A(n24), .Y(out[7]) );
  INVX2 U74 ( .A(n25), .Y(out[6]) );
  INVX2 U75 ( .A(n26), .Y(out[5]) );
  INVX2 U76 ( .A(n27), .Y(out[4]) );
  INVX2 U77 ( .A(n28), .Y(out[3]) );
  INVX2 U78 ( .A(n29), .Y(out[2]) );
  INVX2 U79 ( .A(n30), .Y(out[1]) );
  INVX2 U80 ( .A(n37), .Y(out[0]) );
endmodule


module fir_filter ( clk, n_reset, load_coeff, data_ready, sample_data, 
        fir_coefficient, one_k_samples, modwait, err, fir_out );
  input [15:0] sample_data;
  input [15:0] fir_coefficient;
  output [15:0] fir_out;
  input clk, n_reset, load_coeff, data_ready;
  output one_k_samples, modwait, err;
  wire   lc, dr, overflow, cnt_up, clear;
  wire   [2:0] op;
  wire   [3:0] src1;
  wire   [3:0] src2;
  wire   [3:0] dest;
  wire   [16:0] out_data;

  sync_low_1 load_sync ( .clk(clk), .n_rst(n_reset), .async_in(load_coeff), 
        .sync_out(lc) );
  sync_low_0 ready_sync ( .clk(clk), .n_rst(n_reset), .async_in(data_ready), 
        .sync_out(dr) );
  controller control_unit ( .clk(clk), .n_rst(n_reset), .dr(dr), .lc(lc), 
        .overflow(overflow), .cnt_up(cnt_up), .clear(clear), .modwait(modwait), 
        .err(err), .op(op), .src1(src1), .src2(src2), .dest(dest) );
  counter countup ( .clk(clk), .n_rst(n_reset), .cnt_up(cnt_up), .clear(clear), 
        .one_k_samples(one_k_samples) );
  datapath dataset ( .clk(clk), .n_reset(n_reset), .op(op), .src1(src1), 
        .src2(src2), .dest(dest), .ext_data1(sample_data), .ext_data2(
        fir_coefficient), .outreg_data(out_data), .overflow(overflow) );
  magnitude final_out ( .in(out_data), .out(fir_out) );
endmodule

