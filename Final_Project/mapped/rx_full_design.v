/////////////////////////////////////////////////////////////
// Created by: Synopsys DC Expert(TM) in wire load mode
// Version   : K-2015.06-SP1
// Date      : Fri Apr 30 10:58:46 2021
/////////////////////////////////////////////////////////////


module rx_sync_low_1 ( clk, n_rst, async_in, sync_out );
  input clk, n_rst, async_in;
  output sync_out;
  wire   data;

  DFFSR data_reg ( .D(async_in), .CLK(clk), .R(n_rst), .S(1'b1), .Q(data) );
  DFFSR sync_out_reg ( .D(data), .CLK(clk), .R(n_rst), .S(1'b1), .Q(sync_out)
         );
endmodule


module rx_sync_low_0 ( clk, n_rst, async_in, sync_out );
  input clk, n_rst, async_in;
  output sync_out;
  wire   data;

  DFFSR data_reg ( .D(async_in), .CLK(clk), .R(n_rst), .S(1'b1), .Q(data) );
  DFFSR sync_out_reg ( .D(data), .CLK(clk), .R(n_rst), .S(1'b1), .Q(sync_out)
         );
endmodule


module rx_edge_detector ( clk, n_rst, d_plus, edge_detect );
  input clk, n_rst, d_plus;
  output edge_detect;
  wire   first, N1;
  assign edge_detect = N1;

  DFFSR first_reg ( .D(d_plus), .CLK(clk), .R(1'b1), .S(n_rst), .Q(first) );
  XOR2X1 U4 ( .A(first), .B(d_plus), .Y(N1) );
endmodule


module rx_eop_detect ( d_plus, d_minus, eop );
  input d_plus, d_minus;
  output eop;
  wire   N0;
  assign eop = N0;

  NOR2X1 U1 ( .A(d_plus), .B(d_minus), .Y(N0) );
endmodule


module rx_decode ( clk, n_rst, d_plus, shift_en, decoded );
  input clk, n_rst, d_plus, shift_en;
  output decoded;
  wire   val, prev_val, n8, n1, n2, n3;

  DFFSR val_reg ( .D(n8), .CLK(clk), .R(1'b1), .S(n_rst), .Q(val) );
  DFFSR prev_val_reg ( .D(n3), .CLK(clk), .R(1'b1), .S(n_rst), .Q(prev_val) );
  INVX1 U2 ( .A(n1), .Y(n3) );
  MUX2X1 U3 ( .B(prev_val), .A(val), .S(shift_en), .Y(n1) );
  INVX1 U4 ( .A(n2), .Y(n8) );
  MUX2X1 U5 ( .B(val), .A(d_plus), .S(shift_en), .Y(n2) );
  XNOR2X1 U6 ( .A(prev_val), .B(val), .Y(decoded) );
endmodule


module flex_counter_1 ( clk, n_rst, clear, count_enable, rollover_val, 
        count_out, rollover_flag );
  input [3:0] rollover_val;
  output [3:0] count_out;
  input clk, n_rst, clear, count_enable;
  output rollover_flag;
  wire   n44, n51, n52, n53, n54, n55, n2, n3, n4, n5, n6, n12, n13, n14, n15,
         n16, n17, n18, n19, n20, n21, n22, n23, n24, n25, n26, n27, n28, n29,
         n30, n31, n32, n33, n34, n35, n36, n37, n38, n39, n40, n41, n42, n43;

  DFFSR \count_out_reg[0]  ( .D(n55), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        count_out[0]) );
  DFFSR \count_out_reg[1]  ( .D(n54), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        count_out[1]) );
  DFFSR \count_out_reg[2]  ( .D(n53), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        count_out[2]) );
  DFFSR \count_out_reg[3]  ( .D(n52), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        count_out[3]) );
  DFFSR rollover_flag_reg ( .D(n51), .CLK(clk), .R(n_rst), .S(1'b1), .Q(n44)
         );
  BUFX2 U8 ( .A(n44), .Y(rollover_flag) );
  MUX2X1 U9 ( .B(n2), .A(n3), .S(n4), .Y(n55) );
  OAI21X1 U10 ( .A(n5), .B(n3), .C(n6), .Y(n2) );
  MUX2X1 U11 ( .B(n12), .A(n13), .S(count_out[1]), .Y(n54) );
  NAND2X1 U12 ( .A(n14), .B(count_out[0]), .Y(n12) );
  INVX1 U13 ( .A(n15), .Y(n53) );
  MUX2X1 U14 ( .B(n16), .A(n17), .S(count_out[2]), .Y(n15) );
  MUX2X1 U15 ( .B(n18), .A(n19), .S(count_out[3]), .Y(n52) );
  AOI21X1 U16 ( .A(n14), .B(n20), .C(n17), .Y(n19) );
  OAI21X1 U17 ( .A(count_out[1]), .B(n21), .C(n13), .Y(n17) );
  AOI21X1 U18 ( .A(n3), .B(n14), .C(n4), .Y(n13) );
  INVX1 U19 ( .A(count_out[2]), .Y(n20) );
  NAND2X1 U20 ( .A(n16), .B(count_out[2]), .Y(n18) );
  INVX1 U21 ( .A(n22), .Y(n16) );
  NAND3X1 U22 ( .A(count_out[1]), .B(count_out[0]), .C(n14), .Y(n22) );
  INVX1 U23 ( .A(n21), .Y(n14) );
  NAND3X1 U24 ( .A(n23), .B(n6), .C(n24), .Y(n21) );
  OAI21X1 U25 ( .A(n25), .B(n26), .C(n27), .Y(n51) );
  OAI21X1 U26 ( .A(n28), .B(n4), .C(rollover_flag), .Y(n27) );
  NOR2X1 U27 ( .A(clear), .B(n5), .Y(n28) );
  INVX1 U28 ( .A(n24), .Y(n5) );
  NAND3X1 U29 ( .A(n29), .B(n30), .C(n31), .Y(n24) );
  NOR2X1 U30 ( .A(n32), .B(n33), .Y(n31) );
  XOR2X1 U31 ( .A(rollover_val[2]), .B(count_out[2]), .Y(n33) );
  XOR2X1 U32 ( .A(rollover_val[1]), .B(count_out[1]), .Y(n32) );
  XOR2X1 U33 ( .A(rollover_val[0]), .B(n3), .Y(n29) );
  NAND2X1 U34 ( .A(n34), .B(n35), .Y(n26) );
  XOR2X1 U35 ( .A(rollover_val[0]), .B(count_out[0]), .Y(n35) );
  MUX2X1 U36 ( .B(n36), .A(n37), .S(n30), .Y(n34) );
  XNOR2X1 U37 ( .A(count_out[3]), .B(rollover_val[3]), .Y(n30) );
  MUX2X1 U38 ( .B(n38), .A(n39), .S(rollover_val[2]), .Y(n37) );
  XOR2X1 U39 ( .A(count_out[2]), .B(n40), .Y(n39) );
  NOR2X1 U40 ( .A(count_out[2]), .B(n40), .Y(n38) );
  NAND3X1 U41 ( .A(count_out[2]), .B(n41), .C(n40), .Y(n36) );
  INVX1 U42 ( .A(rollover_val[2]), .Y(n41) );
  NAND3X1 U43 ( .A(n23), .B(n6), .C(n42), .Y(n25) );
  XOR2X1 U44 ( .A(count_out[1]), .B(n43), .Y(n42) );
  AOI21X1 U45 ( .A(n3), .B(rollover_val[1]), .C(n40), .Y(n43) );
  NOR2X1 U46 ( .A(rollover_val[0]), .B(rollover_val[1]), .Y(n40) );
  INVX1 U47 ( .A(count_out[0]), .Y(n3) );
  INVX1 U48 ( .A(clear), .Y(n6) );
  INVX1 U49 ( .A(n4), .Y(n23) );
  NOR2X1 U50 ( .A(count_enable), .B(clear), .Y(n4) );
endmodule


module flex_counter_0 ( clk, n_rst, clear, count_enable, rollover_val, 
        count_out, rollover_flag );
  input [3:0] rollover_val;
  output [3:0] count_out;
  input clk, n_rst, clear, count_enable;
  output rollover_flag;
  wire   n54, n2, n3, n4, n5, n6, n12, n13, n14, n15, n16, n17, n18, n19, n20,
         n21, n22, n23, n24, n25, n26, n27, n28, n29, n30, n31, n32, n33, n34,
         n35, n36, n37, n38, n39, n40, n41, n42, n43, n44, n45, n46, n47, n48;

  DFFSR \count_out_reg[0]  ( .D(n44), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        count_out[0]) );
  DFFSR \count_out_reg[1]  ( .D(n45), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        count_out[1]) );
  DFFSR \count_out_reg[2]  ( .D(n46), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        count_out[2]) );
  DFFSR \count_out_reg[3]  ( .D(n47), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        count_out[3]) );
  DFFSR rollover_flag_reg ( .D(n48), .CLK(clk), .R(n_rst), .S(1'b1), .Q(n54)
         );
  BUFX2 U8 ( .A(n54), .Y(rollover_flag) );
  MUX2X1 U9 ( .B(n2), .A(n3), .S(n4), .Y(n44) );
  OAI21X1 U10 ( .A(n5), .B(n3), .C(n6), .Y(n2) );
  MUX2X1 U11 ( .B(n12), .A(n13), .S(count_out[1]), .Y(n45) );
  NAND2X1 U12 ( .A(n14), .B(count_out[0]), .Y(n12) );
  INVX1 U13 ( .A(n15), .Y(n46) );
  MUX2X1 U14 ( .B(n16), .A(n17), .S(count_out[2]), .Y(n15) );
  MUX2X1 U15 ( .B(n18), .A(n19), .S(count_out[3]), .Y(n47) );
  AOI21X1 U16 ( .A(n14), .B(n20), .C(n17), .Y(n19) );
  OAI21X1 U17 ( .A(count_out[1]), .B(n21), .C(n13), .Y(n17) );
  AOI21X1 U18 ( .A(n3), .B(n14), .C(n4), .Y(n13) );
  INVX1 U19 ( .A(count_out[2]), .Y(n20) );
  NAND2X1 U20 ( .A(n16), .B(count_out[2]), .Y(n18) );
  INVX1 U21 ( .A(n22), .Y(n16) );
  NAND3X1 U22 ( .A(count_out[1]), .B(count_out[0]), .C(n14), .Y(n22) );
  INVX1 U23 ( .A(n21), .Y(n14) );
  NAND3X1 U24 ( .A(n23), .B(n6), .C(n24), .Y(n21) );
  OAI21X1 U25 ( .A(n25), .B(n26), .C(n27), .Y(n48) );
  OAI21X1 U26 ( .A(n28), .B(n4), .C(rollover_flag), .Y(n27) );
  NOR2X1 U27 ( .A(clear), .B(n5), .Y(n28) );
  INVX1 U28 ( .A(n24), .Y(n5) );
  NAND3X1 U29 ( .A(n29), .B(n30), .C(n31), .Y(n24) );
  NOR2X1 U30 ( .A(n32), .B(n33), .Y(n31) );
  XOR2X1 U31 ( .A(rollover_val[2]), .B(count_out[2]), .Y(n33) );
  XOR2X1 U32 ( .A(rollover_val[1]), .B(count_out[1]), .Y(n32) );
  XOR2X1 U33 ( .A(rollover_val[0]), .B(n3), .Y(n29) );
  NAND2X1 U34 ( .A(n34), .B(n35), .Y(n26) );
  XOR2X1 U35 ( .A(rollover_val[0]), .B(count_out[0]), .Y(n35) );
  MUX2X1 U36 ( .B(n36), .A(n37), .S(n30), .Y(n34) );
  XNOR2X1 U37 ( .A(count_out[3]), .B(rollover_val[3]), .Y(n30) );
  MUX2X1 U38 ( .B(n38), .A(n39), .S(rollover_val[2]), .Y(n37) );
  XOR2X1 U39 ( .A(count_out[2]), .B(n40), .Y(n39) );
  NOR2X1 U40 ( .A(count_out[2]), .B(n40), .Y(n38) );
  NAND3X1 U41 ( .A(count_out[2]), .B(n41), .C(n40), .Y(n36) );
  INVX1 U42 ( .A(rollover_val[2]), .Y(n41) );
  NAND3X1 U43 ( .A(n23), .B(n6), .C(n42), .Y(n25) );
  XOR2X1 U44 ( .A(count_out[1]), .B(n43), .Y(n42) );
  AOI21X1 U45 ( .A(n3), .B(rollover_val[1]), .C(n40), .Y(n43) );
  NOR2X1 U46 ( .A(rollover_val[0]), .B(rollover_val[1]), .Y(n40) );
  INVX1 U47 ( .A(count_out[0]), .Y(n3) );
  INVX1 U48 ( .A(clear), .Y(n6) );
  INVX1 U49 ( .A(n4), .Y(n23) );
  NOR2X1 U50 ( .A(count_enable), .B(clear), .Y(n4) );
endmodule


module rx_timer ( clk, n_rst, enable_timer, shift_enable, packet_done );
  input clk, n_rst, enable_timer;
  output shift_enable, packet_done;


  flex_counter_1 clk_divider ( .clk(clk), .n_rst(n_rst), .clear(packet_done), 
        .count_enable(enable_timer), .rollover_val({1'b1, 1'b0, 1'b0, 1'b0}), 
        .rollover_flag(shift_enable) );
  flex_counter_0 bit_counter ( .clk(clk), .n_rst(n_rst), .clear(packet_done), 
        .count_enable(shift_enable), .rollover_val({1'b1, 1'b0, 1'b0, 1'b0}), 
        .rollover_flag(packet_done) );
endmodule


module flex_stp_sr_NUM_BITS9_SHIFT_MSB1 ( clk, n_rst, shift_enable, serial_in, 
        parallel_out );
  output [8:0] parallel_out;
  input clk, n_rst, shift_enable, serial_in;
  wire   n13, n15, n17, n19, n21, n23, n25, n27, n29, n1, n2, n3, n4, n5, n6,
         n7, n8, n9;

  DFFSR \parallel_out_reg[0]  ( .D(n29), .CLK(clk), .R(1'b1), .S(n_rst), .Q(
        parallel_out[0]) );
  DFFSR \parallel_out_reg[1]  ( .D(n27), .CLK(clk), .R(1'b1), .S(n_rst), .Q(
        parallel_out[1]) );
  DFFSR \parallel_out_reg[2]  ( .D(n25), .CLK(clk), .R(1'b1), .S(n_rst), .Q(
        parallel_out[2]) );
  DFFSR \parallel_out_reg[3]  ( .D(n23), .CLK(clk), .R(1'b1), .S(n_rst), .Q(
        parallel_out[3]) );
  DFFSR \parallel_out_reg[4]  ( .D(n21), .CLK(clk), .R(1'b1), .S(n_rst), .Q(
        parallel_out[4]) );
  DFFSR \parallel_out_reg[5]  ( .D(n19), .CLK(clk), .R(1'b1), .S(n_rst), .Q(
        parallel_out[5]) );
  DFFSR \parallel_out_reg[6]  ( .D(n17), .CLK(clk), .R(1'b1), .S(n_rst), .Q(
        parallel_out[6]) );
  DFFSR \parallel_out_reg[7]  ( .D(n15), .CLK(clk), .R(1'b1), .S(n_rst), .Q(
        parallel_out[7]) );
  DFFSR \parallel_out_reg[8]  ( .D(n13), .CLK(clk), .R(1'b1), .S(n_rst), .Q(
        parallel_out[8]) );
  INVX1 U2 ( .A(n1), .Y(n29) );
  MUX2X1 U3 ( .B(parallel_out[0]), .A(serial_in), .S(shift_enable), .Y(n1) );
  INVX1 U4 ( .A(n2), .Y(n27) );
  MUX2X1 U5 ( .B(parallel_out[1]), .A(parallel_out[0]), .S(shift_enable), .Y(
        n2) );
  INVX1 U6 ( .A(n3), .Y(n25) );
  MUX2X1 U7 ( .B(parallel_out[2]), .A(parallel_out[1]), .S(shift_enable), .Y(
        n3) );
  INVX1 U8 ( .A(n4), .Y(n23) );
  MUX2X1 U9 ( .B(parallel_out[3]), .A(parallel_out[2]), .S(shift_enable), .Y(
        n4) );
  INVX1 U10 ( .A(n5), .Y(n21) );
  MUX2X1 U11 ( .B(parallel_out[4]), .A(parallel_out[3]), .S(shift_enable), .Y(
        n5) );
  INVX1 U12 ( .A(n6), .Y(n19) );
  MUX2X1 U13 ( .B(parallel_out[5]), .A(parallel_out[4]), .S(shift_enable), .Y(
        n6) );
  INVX1 U14 ( .A(n7), .Y(n17) );
  MUX2X1 U15 ( .B(parallel_out[6]), .A(parallel_out[5]), .S(shift_enable), .Y(
        n7) );
  INVX1 U16 ( .A(n8), .Y(n15) );
  MUX2X1 U17 ( .B(parallel_out[7]), .A(parallel_out[6]), .S(shift_enable), .Y(
        n8) );
  INVX1 U18 ( .A(n9), .Y(n13) );
  MUX2X1 U19 ( .B(parallel_out[8]), .A(parallel_out[7]), .S(shift_enable), .Y(
        n9) );
endmodule


module rx_sr_9bit ( clk, n_rst, shift_strobe, serial_in, packet_data, stop_bit
 );
  output [7:0] packet_data;
  input clk, n_rst, shift_strobe, serial_in;
  output stop_bit;


  flex_stp_sr_NUM_BITS9_SHIFT_MSB1 sr9 ( .clk(clk), .n_rst(n_rst), 
        .shift_enable(shift_strobe), .serial_in(serial_in), .parallel_out({
        stop_bit, packet_data}) );
endmodule


module rx_rcu ( clk, n_rst, d_edge, shift_en, byte_detect, eop, s_val, 
        rx_data_ready, rx_transfer_active, rx_error, clr, store_rx_data, 
        rx_packet, rx_data );
  input [7:0] s_val;
  output [2:0] rx_packet;
  output [7:0] rx_data;
  input clk, n_rst, d_edge, shift_en, byte_detect, eop;
  output rx_data_ready, rx_transfer_active, rx_error, clr, store_rx_data;
  wire   N129, N142, N143, N144, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15,
         n16, n17, n18, n19, n20, n21, n22, n23, n24, n25, n26, n27, n28, n29,
         n30, n31, n32, n33, n34, n35, n36, n37, n38, n39, n40, n41, n42, n43,
         n44, n45, n46, n47, n48, n49, n50, n51, n52, n53, n54, n55, n56, n57,
         n58, n59, n60, n61, n62, n63, n64, n65, n66, n67, n68, n69, n70, n71,
         n72, n73, n74, n75, n76, n77, n78, n79, n80, n81, n82, n83, n84, n85,
         n86, n87, n88, n89, n90, n91, n92, n93, n94, n95, n96, n97, n98, n99,
         n100, n101, n102, n103, n104, n105, n106, n107, n108, n109, n110,
         n111, n112, n113, n114, n115, n116, n117, n118, n119, n120, n121,
         n122, n123, n124, n125, n126, n127, n128, n129, n130, n131, n132,
         n133, n134, n135, n136, n137, n138, n139, n140, n141, n142, n144,
         n145, n146, n147;
  wire   [4:0] state;
  wire   [4:0] nxt_state;

  DFFSR \state_reg[4]  ( .D(nxt_state[4]), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        state[4]) );
  DFFSR \state_reg[3]  ( .D(nxt_state[3]), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        state[3]) );
  DFFSR \state_reg[2]  ( .D(nxt_state[2]), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        state[2]) );
  DFFSR \state_reg[1]  ( .D(nxt_state[1]), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        state[1]) );
  DFFSR \state_reg[0]  ( .D(nxt_state[0]), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        state[0]) );
  INVX2 U4 ( .A(state[0]), .Y(n147) );
  INVX2 U9 ( .A(state[3]), .Y(n144) );
  INVX2 U10 ( .A(state[2]), .Y(n145) );
  INVX2 U11 ( .A(state[1]), .Y(n146) );
  AOI22X1 U12 ( .A(d_edge), .B(n146), .C(N142), .D(n70), .Y(n6) );
  NAND2X1 U13 ( .A(n6), .B(n144), .Y(n12) );
  NAND3X1 U14 ( .A(n98), .B(n145), .C(n147), .Y(n7) );
  NOR2X1 U15 ( .A(n141), .B(state[4]), .Y(n26) );
  AOI21X1 U16 ( .A(n67), .B(n146), .C(n144), .Y(n10) );
  NAND3X1 U17 ( .A(n98), .B(n146), .C(eop), .Y(n8) );
  OAI21X1 U18 ( .A(n60), .B(n146), .C(n8), .Y(n27) );
  NAND3X1 U19 ( .A(n61), .B(n145), .C(n62), .Y(n9) );
  OAI21X1 U20 ( .A(n26), .B(n10), .C(n9), .Y(n11) );
  AOI22X1 U21 ( .A(n12), .B(n59), .C(n11), .D(n71), .Y(n14) );
  NAND2X1 U22 ( .A(n69), .B(n71), .Y(n38) );
  NOR2X1 U23 ( .A(n98), .B(n38), .Y(n13) );
  NAND3X1 U24 ( .A(n62), .B(n63), .C(n13), .Y(n25) );
  NAND2X1 U25 ( .A(n14), .B(n25), .Y(nxt_state[0]) );
  NAND3X1 U26 ( .A(n62), .B(n141), .C(n59), .Y(n37) );
  NOR2X1 U27 ( .A(n62), .B(n147), .Y(n23) );
  NOR2X1 U28 ( .A(n67), .B(state[4]), .Y(n15) );
  AOI22X1 U29 ( .A(n15), .B(N129), .C(n66), .D(n26), .Y(n17) );
  NAND3X1 U30 ( .A(n68), .B(n66), .C(n60), .Y(n16) );
  OAI21X1 U31 ( .A(n69), .B(n17), .C(n16), .Y(n22) );
  XNOR2X1 U32 ( .A(n73), .B(n65), .Y(n47) );
  NAND2X1 U33 ( .A(n98), .B(n144), .Y(n19) );
  NOR2X1 U34 ( .A(n64), .B(n72), .Y(n18) );
  OAI21X1 U35 ( .A(N143), .B(n19), .C(n18), .Y(n20) );
  OAI21X1 U36 ( .A(n47), .B(n26), .C(n20), .Y(n21) );
  AOI22X1 U37 ( .A(n23), .B(n22), .C(n21), .D(n70), .Y(n24) );
  NAND3X1 U38 ( .A(n37), .B(n25), .C(n24), .Y(nxt_state[1]) );
  NOR2X1 U39 ( .A(n145), .B(n144), .Y(n30) );
  NAND3X1 U40 ( .A(n26), .B(n146), .C(n73), .Y(n29) );
  AOI22X1 U41 ( .A(n57), .B(n98), .C(n27), .D(n147), .Y(n28) );
  NAND3X1 U42 ( .A(n30), .B(n29), .C(n28), .Y(n45) );
  NOR2X1 U43 ( .A(n64), .B(n38), .Y(n35) );
  OAI22X1 U44 ( .A(state[4]), .B(n144), .C(n62), .D(n60), .Y(n34) );
  AOI21X1 U45 ( .A(n72), .B(n146), .C(n60), .Y(n32) );
  NAND3X1 U46 ( .A(n59), .B(n68), .C(N144), .Y(n31) );
  OAI21X1 U47 ( .A(n145), .B(n32), .C(n31), .Y(n33) );
  AOI22X1 U48 ( .A(n35), .B(n34), .C(n33), .D(n144), .Y(n36) );
  NAND3X1 U49 ( .A(n37), .B(n45), .C(n36), .Y(nxt_state[2]) );
  NAND3X1 U50 ( .A(n59), .B(n68), .C(n142), .Y(n46) );
  NOR2X1 U51 ( .A(n145), .B(n38), .Y(n43) );
  NOR2X1 U52 ( .A(n62), .B(state[4]), .Y(n42) );
  NOR2X1 U53 ( .A(n63), .B(n144), .Y(n41) );
  AND2X1 U54 ( .A(n146), .B(eop), .Y(n39) );
  NAND3X1 U55 ( .A(n71), .B(n98), .C(n39), .Y(n40) );
  AOI22X1 U56 ( .A(n43), .B(n42), .C(n41), .D(n40), .Y(n44) );
  NAND3X1 U57 ( .A(n46), .B(n45), .C(n44), .Y(nxt_state[3]) );
  NOR2X1 U58 ( .A(n69), .B(n144), .Y(n50) );
  NOR2X1 U59 ( .A(n58), .B(n47), .Y(n52) );
  NAND2X1 U60 ( .A(n66), .B(n147), .Y(n49) );
  NAND3X1 U61 ( .A(n47), .B(n50), .C(n73), .Y(n48) );
  OAI21X1 U62 ( .A(n50), .B(n49), .C(n48), .Y(n51) );
  AOI22X1 U63 ( .A(n52), .B(eop), .C(byte_detect), .D(n51), .Y(n56) );
  NAND2X1 U64 ( .A(n147), .B(n144), .Y(n54) );
  NAND2X1 U65 ( .A(n145), .B(n146), .Y(n53) );
  OAI21X1 U66 ( .A(n54), .B(n53), .C(state[4]), .Y(n55) );
  NAND2X1 U67 ( .A(n56), .B(n55), .Y(nxt_state[4]) );
  INVX2 U68 ( .A(n38), .Y(n57) );
  INVX2 U69 ( .A(n50), .Y(n58) );
  INVX2 U70 ( .A(n7), .Y(n59) );
  INVX2 U71 ( .A(n26), .Y(n60) );
  INVX2 U72 ( .A(n27), .Y(n61) );
  INVX2 U73 ( .A(n144), .Y(n62) );
  INVX2 U74 ( .A(n145), .Y(n63) );
  INVX2 U75 ( .A(n145), .Y(n64) );
  INVX2 U76 ( .A(n145), .Y(n65) );
  INVX2 U77 ( .A(n145), .Y(n66) );
  INVX2 U78 ( .A(n145), .Y(n67) );
  INVX2 U79 ( .A(n146), .Y(n68) );
  INVX2 U80 ( .A(n146), .Y(n69) );
  INVX2 U81 ( .A(n146), .Y(n70) );
  INVX2 U82 ( .A(n147), .Y(n71) );
  INVX2 U83 ( .A(n147), .Y(n72) );
  INVX2 U84 ( .A(n147), .Y(n73) );
  AOI21X1 U85 ( .A(n74), .B(n75), .C(n76), .Y(rx_transfer_active) );
  NAND2X1 U86 ( .A(n77), .B(n78), .Y(n76) );
  INVX1 U87 ( .A(rx_error), .Y(n78) );
  NOR2X1 U88 ( .A(state[2]), .B(state[1]), .Y(n75) );
  NOR2X1 U89 ( .A(state[0]), .B(n79), .Y(n74) );
  NAND2X1 U90 ( .A(n80), .B(n81), .Y(rx_packet[2]) );
  OAI21X1 U91 ( .A(n82), .B(n83), .C(n80), .Y(rx_packet[1]) );
  INVX1 U92 ( .A(n84), .Y(n80) );
  OAI21X1 U93 ( .A(n85), .B(n79), .C(n86), .Y(n84) );
  NAND3X1 U94 ( .A(n146), .B(n144), .C(n87), .Y(n86) );
  INVX1 U95 ( .A(n88), .Y(n79) );
  AOI21X1 U96 ( .A(n89), .B(state[0]), .C(n90), .Y(n85) );
  NOR2X1 U97 ( .A(state[2]), .B(n146), .Y(n89) );
  NAND2X1 U98 ( .A(state[1]), .B(state[2]), .Y(n83) );
  NAND3X1 U99 ( .A(n91), .B(n92), .C(n93), .Y(rx_packet[0]) );
  MUX2X1 U100 ( .B(n94), .A(n87), .S(n146), .Y(n93) );
  AND2X1 U101 ( .A(n88), .B(n90), .Y(n94) );
  INVX1 U102 ( .A(n95), .Y(n92) );
  OAI21X1 U103 ( .A(state[1]), .B(n91), .C(n77), .Y(rx_data_ready) );
  NAND3X1 U104 ( .A(n96), .B(n146), .C(n97), .Y(n77) );
  NOR2X1 U105 ( .A(state[0]), .B(n98), .Y(n97) );
  NOR2X1 U106 ( .A(state[3]), .B(state[2]), .Y(n96) );
  NOR2X1 U107 ( .A(n81), .B(n99), .Y(rx_data[7]) );
  NOR2X1 U108 ( .A(n81), .B(n100), .Y(rx_data[6]) );
  NOR2X1 U109 ( .A(n81), .B(n101), .Y(rx_data[5]) );
  NOR2X1 U110 ( .A(n81), .B(n102), .Y(rx_data[4]) );
  NOR2X1 U111 ( .A(n81), .B(n103), .Y(rx_data[3]) );
  NOR2X1 U112 ( .A(n81), .B(n104), .Y(rx_data[2]) );
  NOR2X1 U113 ( .A(n81), .B(n105), .Y(rx_data[1]) );
  INVX1 U114 ( .A(store_rx_data), .Y(n81) );
  AND2X1 U115 ( .A(store_rx_data), .B(s_val[0]), .Y(rx_data[0]) );
  OAI21X1 U116 ( .A(state[2]), .B(n82), .C(n106), .Y(store_rx_data) );
  AOI21X1 U117 ( .A(n107), .B(n87), .C(n95), .Y(n106) );
  NOR2X1 U118 ( .A(n108), .B(n82), .Y(n95) );
  MUX2X1 U119 ( .B(n90), .A(n145), .S(state[1]), .Y(n108) );
  NOR2X1 U120 ( .A(n145), .B(state[0]), .Y(n90) );
  NOR2X1 U121 ( .A(state[3]), .B(n146), .Y(n107) );
  NAND2X1 U122 ( .A(state[3]), .B(n98), .Y(n82) );
  AOI21X1 U123 ( .A(n109), .B(n110), .C(n141), .Y(n142) );
  NOR2X1 U124 ( .A(n91), .B(n146), .Y(rx_error) );
  NAND2X1 U125 ( .A(n87), .B(state[3]), .Y(n91) );
  INVX1 U126 ( .A(n111), .Y(n87) );
  NAND3X1 U127 ( .A(state[2]), .B(n98), .C(state[0]), .Y(n111) );
  INVX1 U128 ( .A(state[4]), .Y(n98) );
  INVX1 U129 ( .A(n112), .Y(clr) );
  NAND3X1 U130 ( .A(n88), .B(n145), .C(n113), .Y(n112) );
  MUX2X1 U131 ( .B(n114), .A(n115), .S(n146), .Y(n113) );
  NAND2X1 U132 ( .A(N129), .B(state[0]), .Y(n115) );
  NAND3X1 U133 ( .A(byte_detect), .B(n147), .C(n116), .Y(n114) );
  NOR2X1 U134 ( .A(state[3]), .B(state[4]), .Y(n88) );
  AOI21X1 U135 ( .A(n117), .B(n118), .C(n141), .Y(N144) );
  NAND3X1 U136 ( .A(n119), .B(byte_detect), .C(n120), .Y(N143) );
  AND2X1 U137 ( .A(n121), .B(n109), .Y(n120) );
  NAND3X1 U138 ( .A(n110), .B(n119), .C(n122), .Y(n109) );
  INVX1 U139 ( .A(n116), .Y(n122) );
  OAI21X1 U140 ( .A(n123), .B(n124), .C(n121), .Y(n116) );
  NAND2X1 U141 ( .A(s_val[3]), .B(n99), .Y(n124) );
  NAND3X1 U142 ( .A(s_val[3]), .B(n99), .C(n125), .Y(n110) );
  NAND3X1 U143 ( .A(n126), .B(s_val[5]), .C(n127), .Y(n119) );
  NOR2X1 U144 ( .A(n103), .B(n128), .Y(n127) );
  INVX1 U145 ( .A(s_val[3]), .Y(n103) );
  NOR2X1 U146 ( .A(s_val[7]), .B(s_val[1]), .Y(n126) );
  AOI21X1 U147 ( .A(n117), .B(n121), .C(n141), .Y(N142) );
  INVX1 U148 ( .A(byte_detect), .Y(n141) );
  NAND3X1 U149 ( .A(n118), .B(n129), .C(n121), .Y(n117) );
  OR2X1 U150 ( .A(n130), .B(n123), .Y(n121) );
  NAND3X1 U151 ( .A(s_val[1]), .B(n101), .C(n131), .Y(n123) );
  INVX1 U152 ( .A(n128), .Y(n131) );
  INVX1 U153 ( .A(s_val[5]), .Y(n101) );
  NAND3X1 U154 ( .A(s_val[5]), .B(n105), .C(n132), .Y(n129) );
  NOR2X1 U155 ( .A(n128), .B(n130), .Y(n132) );
  INVX1 U156 ( .A(n133), .Y(n130) );
  NAND3X1 U157 ( .A(s_val[2]), .B(s_val[4]), .C(n134), .Y(n128) );
  NOR2X1 U158 ( .A(s_val[6]), .B(s_val[0]), .Y(n134) );
  NAND2X1 U159 ( .A(n133), .B(n125), .Y(n118) );
  NOR2X1 U160 ( .A(n135), .B(n136), .Y(n125) );
  NAND3X1 U161 ( .A(s_val[2]), .B(s_val[5]), .C(s_val[0]), .Y(n136) );
  NAND3X1 U162 ( .A(n102), .B(n100), .C(n105), .Y(n135) );
  INVX1 U163 ( .A(s_val[1]), .Y(n105) );
  INVX1 U164 ( .A(s_val[6]), .Y(n100) );
  NOR2X1 U165 ( .A(n137), .B(n138), .Y(N129) );
  NAND3X1 U166 ( .A(n133), .B(byte_detect), .C(n139), .Y(n138) );
  NOR2X1 U167 ( .A(s_val[1]), .B(s_val[0]), .Y(n139) );
  NOR2X1 U168 ( .A(n99), .B(s_val[3]), .Y(n133) );
  INVX1 U169 ( .A(s_val[7]), .Y(n99) );
  NAND3X1 U170 ( .A(n104), .B(n102), .C(n140), .Y(n137) );
  NOR2X1 U171 ( .A(s_val[6]), .B(s_val[5]), .Y(n140) );
  INVX1 U172 ( .A(s_val[4]), .Y(n102) );
  INVX1 U173 ( .A(s_val[2]), .Y(n104) );
endmodule


module rx_fifo ( clk, n_rst, load_buffer, packet_data, rx_packet_data );
  input [7:0] packet_data;
  output [7:0] rx_packet_data;
  input clk, n_rst, load_buffer;
  wire   n1, n2, n3, n4, n5, n6, n7, n8, n9, n11, n13, n15, n17, n19, n21, n23
;

  DFFSR \rx_packet_data_reg[7]  ( .D(n23), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        rx_packet_data[7]) );
  DFFSR \rx_packet_data_reg[6]  ( .D(n21), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        rx_packet_data[6]) );
  DFFSR \rx_packet_data_reg[5]  ( .D(n19), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        rx_packet_data[5]) );
  DFFSR \rx_packet_data_reg[4]  ( .D(n17), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        rx_packet_data[4]) );
  DFFSR \rx_packet_data_reg[3]  ( .D(n15), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        rx_packet_data[3]) );
  DFFSR \rx_packet_data_reg[2]  ( .D(n13), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        rx_packet_data[2]) );
  DFFSR \rx_packet_data_reg[1]  ( .D(n11), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        rx_packet_data[1]) );
  DFFSR \rx_packet_data_reg[0]  ( .D(n9), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        rx_packet_data[0]) );
  INVX1 U2 ( .A(n1), .Y(n9) );
  MUX2X1 U3 ( .B(rx_packet_data[0]), .A(packet_data[0]), .S(load_buffer), .Y(
        n1) );
  INVX1 U4 ( .A(n2), .Y(n11) );
  MUX2X1 U5 ( .B(rx_packet_data[1]), .A(packet_data[1]), .S(load_buffer), .Y(
        n2) );
  INVX1 U6 ( .A(n3), .Y(n13) );
  MUX2X1 U7 ( .B(rx_packet_data[2]), .A(packet_data[2]), .S(load_buffer), .Y(
        n3) );
  INVX1 U8 ( .A(n4), .Y(n15) );
  MUX2X1 U9 ( .B(rx_packet_data[3]), .A(packet_data[3]), .S(load_buffer), .Y(
        n4) );
  INVX1 U10 ( .A(n5), .Y(n17) );
  MUX2X1 U11 ( .B(rx_packet_data[4]), .A(packet_data[4]), .S(load_buffer), .Y(
        n5) );
  INVX1 U12 ( .A(n6), .Y(n19) );
  MUX2X1 U13 ( .B(rx_packet_data[5]), .A(packet_data[5]), .S(load_buffer), .Y(
        n6) );
  INVX1 U14 ( .A(n7), .Y(n21) );
  MUX2X1 U15 ( .B(rx_packet_data[6]), .A(packet_data[6]), .S(load_buffer), .Y(
        n7) );
  INVX1 U16 ( .A(n8), .Y(n23) );
  MUX2X1 U17 ( .B(rx_packet_data[7]), .A(packet_data[7]), .S(load_buffer), .Y(
        n8) );
endmodule


module rx_full_design ( clk, n_rst, d_plus, d_minus, rx_data_ready, 
        rx_transfer_active, rx_error, clr, store_rx_data, rx_packet, rx_data
 );
  output [2:0] rx_packet;
  output [7:0] rx_data;
  input clk, n_rst, d_plus, d_minus;
  output rx_data_ready, rx_transfer_active, rx_error, clr, store_rx_data;
  wire   d_plus_out, d_minus_out, d_edge, eop, shift_en, d_orig, byte_detect;
  wire   [7:0] s_val;

  rx_sync_low_1 sync_dplus ( .clk(clk), .n_rst(n_rst), .async_in(d_plus), 
        .sync_out(d_plus_out) );
  rx_sync_low_0 sync_dminus ( .clk(clk), .n_rst(n_rst), .async_in(d_minus), 
        .sync_out(d_minus_out) );
  rx_edge_detector edging ( .clk(clk), .n_rst(n_rst), .d_plus(d_plus_out), 
        .edge_detect(d_edge) );
  rx_eop_detect eop_func ( .d_plus(d_plus_out), .d_minus(d_minus_out), .eop(
        eop) );
  rx_decode decoder ( .clk(clk), .n_rst(n_rst), .d_plus(d_plus_out), 
        .shift_en(shift_en), .decoded(d_orig) );
  rx_timer timer_rx ( .clk(clk), .n_rst(n_rst), .enable_timer(
        rx_transfer_active), .shift_enable(shift_en), .packet_done(byte_detect) );
  rx_sr_9bit shift ( .clk(clk), .n_rst(n_rst), .shift_strobe(shift_en), 
        .serial_in(d_orig), .packet_data(s_val) );
  rx_rcu controller ( .clk(clk), .n_rst(n_rst), .d_edge(d_edge), .shift_en(
        shift_en), .byte_detect(byte_detect), .eop(eop), .s_val(s_val), 
        .rx_data_ready(rx_data_ready), .rx_transfer_active(rx_transfer_active), 
        .rx_error(rx_error), .clr(clr), .store_rx_data(store_rx_data), 
        .rx_packet(rx_packet), .rx_data(rx_data) );
  rx_fifo buffer ( .clk(clk), .n_rst(n_rst), .load_buffer(byte_detect), 
        .packet_data(rx_data) );
endmodule

