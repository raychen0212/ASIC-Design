/////////////////////////////////////////////////////////////
// Created by: Synopsys DC Expert(TM) in wire load mode
// Version   : K-2015.06-SP1
// Date      : Mon Mar 22 12:42:08 2021
/////////////////////////////////////////////////////////////


module flex_stp_sr_NUM_BITS9_SHIFT_MSB0 ( clk, n_rst, shift_enable, serial_in, 
        parallel_out );
  output [8:0] parallel_out;
  input clk, n_rst, shift_enable, serial_in;
  wire   n13, n15, n17, n19, n21, n23, n25, n27, n29, n1, n2, n3, n4, n5, n6,
         n7, n8, n9;

  DFFSR \parallel_out_reg[8]  ( .D(n29), .CLK(clk), .R(1'b1), .S(n_rst), .Q(
        parallel_out[8]) );
  DFFSR \parallel_out_reg[7]  ( .D(n27), .CLK(clk), .R(1'b1), .S(n_rst), .Q(
        parallel_out[7]) );
  DFFSR \parallel_out_reg[6]  ( .D(n25), .CLK(clk), .R(1'b1), .S(n_rst), .Q(
        parallel_out[6]) );
  DFFSR \parallel_out_reg[5]  ( .D(n23), .CLK(clk), .R(1'b1), .S(n_rst), .Q(
        parallel_out[5]) );
  DFFSR \parallel_out_reg[4]  ( .D(n21), .CLK(clk), .R(1'b1), .S(n_rst), .Q(
        parallel_out[4]) );
  DFFSR \parallel_out_reg[3]  ( .D(n19), .CLK(clk), .R(1'b1), .S(n_rst), .Q(
        parallel_out[3]) );
  DFFSR \parallel_out_reg[2]  ( .D(n17), .CLK(clk), .R(1'b1), .S(n_rst), .Q(
        parallel_out[2]) );
  DFFSR \parallel_out_reg[1]  ( .D(n15), .CLK(clk), .R(1'b1), .S(n_rst), .Q(
        parallel_out[1]) );
  DFFSR \parallel_out_reg[0]  ( .D(n13), .CLK(clk), .R(1'b1), .S(n_rst), .Q(
        parallel_out[0]) );
  INVX1 U2 ( .A(n1), .Y(n29) );
  MUX2X1 U3 ( .B(parallel_out[8]), .A(serial_in), .S(shift_enable), .Y(n1) );
  INVX1 U4 ( .A(n2), .Y(n27) );
  MUX2X1 U5 ( .B(parallel_out[7]), .A(parallel_out[8]), .S(shift_enable), .Y(
        n2) );
  INVX1 U6 ( .A(n3), .Y(n25) );
  MUX2X1 U7 ( .B(parallel_out[6]), .A(parallel_out[7]), .S(shift_enable), .Y(
        n3) );
  INVX1 U8 ( .A(n4), .Y(n23) );
  MUX2X1 U9 ( .B(parallel_out[5]), .A(parallel_out[6]), .S(shift_enable), .Y(
        n4) );
  INVX1 U10 ( .A(n5), .Y(n21) );
  MUX2X1 U11 ( .B(parallel_out[4]), .A(parallel_out[5]), .S(shift_enable), .Y(
        n5) );
  INVX1 U12 ( .A(n6), .Y(n19) );
  MUX2X1 U13 ( .B(parallel_out[3]), .A(parallel_out[4]), .S(shift_enable), .Y(
        n6) );
  INVX1 U14 ( .A(n7), .Y(n17) );
  MUX2X1 U15 ( .B(parallel_out[2]), .A(parallel_out[3]), .S(shift_enable), .Y(
        n7) );
  INVX1 U16 ( .A(n8), .Y(n15) );
  MUX2X1 U17 ( .B(parallel_out[1]), .A(parallel_out[2]), .S(shift_enable), .Y(
        n8) );
  INVX1 U18 ( .A(n9), .Y(n13) );
  MUX2X1 U19 ( .B(parallel_out[0]), .A(parallel_out[1]), .S(shift_enable), .Y(
        n9) );
endmodule


module sr_9bit ( clk, n_rst, shift_strobe, serial_in, packet_data, stop_bit );
  output [7:0] packet_data;
  input clk, n_rst, shift_strobe, serial_in;
  output stop_bit;


  flex_stp_sr_NUM_BITS9_SHIFT_MSB0 sr9 ( .clk(clk), .n_rst(n_rst), 
        .shift_enable(shift_strobe), .serial_in(serial_in), .parallel_out({
        stop_bit, packet_data}) );
endmodule


module start_bit_det ( clk, n_rst, serial_in, start_bit_detected, 
        new_package_detected );
  input clk, n_rst, serial_in;
  output start_bit_detected, new_package_detected;
  wire   start_bit_detected, old_sample, new_sample, sync_phase, n4;
  assign new_package_detected = start_bit_detected;

  DFFSR sync_phase_reg ( .D(serial_in), .CLK(clk), .R(1'b1), .S(n_rst), .Q(
        sync_phase) );
  DFFSR new_sample_reg ( .D(sync_phase), .CLK(clk), .R(1'b1), .S(n_rst), .Q(
        new_sample) );
  DFFSR old_sample_reg ( .D(new_sample), .CLK(clk), .R(1'b1), .S(n_rst), .Q(
        old_sample) );
  NOR2X1 U6 ( .A(new_sample), .B(n4), .Y(start_bit_detected) );
  INVX1 U7 ( .A(old_sample), .Y(n4) );
endmodule


module stop_bit_chk ( clk, n_rst, sbc_clear, sbc_enable, stop_bit, 
        framing_error );
  input clk, n_rst, sbc_clear, sbc_enable, stop_bit;
  output framing_error;
  wire   n5, n2, n3;

  DFFSR framing_error_reg ( .D(n5), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        framing_error) );
  NOR2X1 U3 ( .A(sbc_clear), .B(n2), .Y(n5) );
  MUX2X1 U4 ( .B(framing_error), .A(n3), .S(sbc_enable), .Y(n2) );
  INVX1 U5 ( .A(stop_bit), .Y(n3) );
endmodule


module rx_data_buff ( clk, n_rst, load_buffer, packet_data, data_read, rx_data, 
        data_ready, overrun_error );
  input [7:0] packet_data;
  output [7:0] rx_data;
  input clk, n_rst, load_buffer, data_read;
  output data_ready, overrun_error;
  wire   n30, n31, n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n15, n17, n19,
         n21, n23, n25, n27, n29;

  DFFSR \rx_data_reg[7]  ( .D(n15), .CLK(clk), .R(1'b1), .S(n_rst), .Q(
        rx_data[7]) );
  DFFSR \rx_data_reg[6]  ( .D(n17), .CLK(clk), .R(1'b1), .S(n_rst), .Q(
        rx_data[6]) );
  DFFSR \rx_data_reg[5]  ( .D(n19), .CLK(clk), .R(1'b1), .S(n_rst), .Q(
        rx_data[5]) );
  DFFSR \rx_data_reg[4]  ( .D(n21), .CLK(clk), .R(1'b1), .S(n_rst), .Q(
        rx_data[4]) );
  DFFSR \rx_data_reg[3]  ( .D(n23), .CLK(clk), .R(1'b1), .S(n_rst), .Q(
        rx_data[3]) );
  DFFSR \rx_data_reg[2]  ( .D(n25), .CLK(clk), .R(1'b1), .S(n_rst), .Q(
        rx_data[2]) );
  DFFSR \rx_data_reg[1]  ( .D(n27), .CLK(clk), .R(1'b1), .S(n_rst), .Q(
        rx_data[1]) );
  DFFSR \rx_data_reg[0]  ( .D(n29), .CLK(clk), .R(1'b1), .S(n_rst), .Q(
        rx_data[0]) );
  DFFSR data_ready_reg ( .D(n31), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        data_ready) );
  DFFSR overrun_error_reg ( .D(n30), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        overrun_error) );
  INVX1 U3 ( .A(n1), .Y(n15) );
  MUX2X1 U4 ( .B(rx_data[7]), .A(packet_data[7]), .S(load_buffer), .Y(n1) );
  INVX1 U5 ( .A(n2), .Y(n17) );
  MUX2X1 U6 ( .B(rx_data[6]), .A(packet_data[6]), .S(load_buffer), .Y(n2) );
  INVX1 U7 ( .A(n3), .Y(n19) );
  MUX2X1 U8 ( .B(rx_data[5]), .A(packet_data[5]), .S(load_buffer), .Y(n3) );
  INVX1 U9 ( .A(n4), .Y(n21) );
  MUX2X1 U10 ( .B(rx_data[4]), .A(packet_data[4]), .S(load_buffer), .Y(n4) );
  INVX1 U11 ( .A(n5), .Y(n23) );
  MUX2X1 U12 ( .B(rx_data[3]), .A(packet_data[3]), .S(load_buffer), .Y(n5) );
  INVX1 U13 ( .A(n6), .Y(n25) );
  MUX2X1 U14 ( .B(rx_data[2]), .A(packet_data[2]), .S(load_buffer), .Y(n6) );
  INVX1 U15 ( .A(n7), .Y(n27) );
  MUX2X1 U16 ( .B(rx_data[1]), .A(packet_data[1]), .S(load_buffer), .Y(n7) );
  INVX1 U17 ( .A(n8), .Y(n29) );
  MUX2X1 U18 ( .B(rx_data[0]), .A(packet_data[0]), .S(load_buffer), .Y(n8) );
  OAI21X1 U19 ( .A(data_read), .B(n9), .C(n10), .Y(n31) );
  INVX1 U20 ( .A(load_buffer), .Y(n10) );
  INVX1 U21 ( .A(data_ready), .Y(n9) );
  NOR2X1 U22 ( .A(data_read), .B(n11), .Y(n30) );
  AOI21X1 U23 ( .A(data_ready), .B(load_buffer), .C(overrun_error), .Y(n11) );
endmodule


module flex_counter_NUM_CNT_BITS14_DW01_inc_0 ( A, SUM );
  input [13:0] A;
  output [13:0] SUM;

  wire   [13:2] carry;

  HAX1 U1_1_12 ( .A(A[12]), .B(carry[12]), .YC(carry[13]), .YS(SUM[12]) );
  HAX1 U1_1_11 ( .A(A[11]), .B(carry[11]), .YC(carry[12]), .YS(SUM[11]) );
  HAX1 U1_1_10 ( .A(A[10]), .B(carry[10]), .YC(carry[11]), .YS(SUM[10]) );
  HAX1 U1_1_9 ( .A(A[9]), .B(carry[9]), .YC(carry[10]), .YS(SUM[9]) );
  HAX1 U1_1_8 ( .A(A[8]), .B(carry[8]), .YC(carry[9]), .YS(SUM[8]) );
  HAX1 U1_1_7 ( .A(A[7]), .B(carry[7]), .YC(carry[8]), .YS(SUM[7]) );
  HAX1 U1_1_6 ( .A(A[6]), .B(carry[6]), .YC(carry[7]), .YS(SUM[6]) );
  HAX1 U1_1_5 ( .A(A[5]), .B(carry[5]), .YC(carry[6]), .YS(SUM[5]) );
  HAX1 U1_1_4 ( .A(A[4]), .B(carry[4]), .YC(carry[5]), .YS(SUM[4]) );
  HAX1 U1_1_3 ( .A(A[3]), .B(carry[3]), .YC(carry[4]), .YS(SUM[3]) );
  HAX1 U1_1_2 ( .A(A[2]), .B(carry[2]), .YC(carry[3]), .YS(SUM[2]) );
  HAX1 U1_1_1 ( .A(A[1]), .B(A[0]), .YC(carry[2]), .YS(SUM[1]) );
  INVX2 U1 ( .A(A[0]), .Y(SUM[0]) );
  XOR2X1 U2 ( .A(carry[13]), .B(A[13]), .Y(SUM[13]) );
endmodule


module flex_counter_NUM_CNT_BITS14_DW01_dec_0 ( A, SUM );
  input [13:0] A;
  output [13:0] SUM;
  wire   n2, n3, n5, n7, n9, n11, n14, n15, n16, n17, n18, n19, n20, n21, n22,
         n23, n24, n25, n26, n27, n28, n29, n30, n31;

  INVX2 U1 ( .A(n30), .Y(SUM[11]) );
  INVX2 U2 ( .A(n29), .Y(n2) );
  INVX2 U3 ( .A(A[10]), .Y(n3) );
  INVX2 U4 ( .A(n14), .Y(SUM[9]) );
  INVX2 U5 ( .A(A[8]), .Y(n5) );
  INVX2 U6 ( .A(n18), .Y(SUM[7]) );
  INVX2 U7 ( .A(A[6]), .Y(n7) );
  INVX2 U8 ( .A(n21), .Y(SUM[5]) );
  INVX2 U9 ( .A(A[4]), .Y(n9) );
  INVX2 U10 ( .A(n24), .Y(SUM[3]) );
  INVX2 U11 ( .A(A[2]), .Y(n11) );
  INVX2 U12 ( .A(n27), .Y(SUM[1]) );
  INVX2 U13 ( .A(A[0]), .Y(SUM[0]) );
  AOI21X1 U14 ( .A(n15), .B(A[9]), .C(n16), .Y(n14) );
  OAI21X1 U15 ( .A(n17), .B(n5), .C(n15), .Y(SUM[8]) );
  AOI21X1 U16 ( .A(n19), .B(A[7]), .C(n17), .Y(n18) );
  OAI21X1 U17 ( .A(n20), .B(n7), .C(n19), .Y(SUM[6]) );
  AOI21X1 U18 ( .A(n22), .B(A[5]), .C(n20), .Y(n21) );
  OAI21X1 U19 ( .A(n23), .B(n9), .C(n22), .Y(SUM[4]) );
  AOI21X1 U20 ( .A(n25), .B(A[3]), .C(n23), .Y(n24) );
  OAI21X1 U21 ( .A(n26), .B(n11), .C(n25), .Y(SUM[2]) );
  AOI21X1 U22 ( .A(A[0]), .B(A[1]), .C(n26), .Y(n27) );
  XOR2X1 U23 ( .A(A[13]), .B(n28), .Y(SUM[13]) );
  NOR2X1 U24 ( .A(A[12]), .B(n2), .Y(n28) );
  XNOR2X1 U25 ( .A(A[12]), .B(n2), .Y(SUM[12]) );
  AOI21X1 U26 ( .A(n31), .B(A[11]), .C(n29), .Y(n30) );
  NOR2X1 U27 ( .A(n31), .B(A[11]), .Y(n29) );
  OAI21X1 U28 ( .A(n16), .B(n3), .C(n31), .Y(SUM[10]) );
  NAND2X1 U29 ( .A(n16), .B(n3), .Y(n31) );
  NOR2X1 U30 ( .A(n15), .B(A[9]), .Y(n16) );
  NAND2X1 U31 ( .A(n17), .B(n5), .Y(n15) );
  NOR2X1 U32 ( .A(n19), .B(A[7]), .Y(n17) );
  NAND2X1 U33 ( .A(n20), .B(n7), .Y(n19) );
  NOR2X1 U34 ( .A(n22), .B(A[5]), .Y(n20) );
  NAND2X1 U35 ( .A(n23), .B(n9), .Y(n22) );
  NOR2X1 U36 ( .A(n25), .B(A[3]), .Y(n23) );
  NAND2X1 U37 ( .A(n26), .B(n11), .Y(n25) );
  NOR2X1 U38 ( .A(A[1]), .B(A[0]), .Y(n26) );
endmodule


module flex_counter_NUM_CNT_BITS14 ( clk, n_rst, clear, count_enable, 
        rollover_val, count_out, rollover_flag );
  input [13:0] rollover_val;
  output [13:0] count_out;
  input clk, n_rst, clear, count_enable;
  output rollover_flag;
  wire   n115, N8, N9, N10, N11, N12, N13, N14, N15, N16, N17, N18, N19, N20,
         N21, N26, N27, N28, N29, N30, N31, N32, N33, N34, N35, N36, N37, N38,
         N39, n59, n60, n1, n3, n4, n5, n6, n22, n23, n24, n25, n26, n27, n28,
         n29, n30, n31, n32, n33, n34, n35, n36, n37, n38, n39, n40, n41, n42,
         n43, n44, n45, n46, n47, n48, n49, n50, n51, n52, n53, n54, n55, n56,
         n57, n58, n61, n62, n63, n64, n65, n66, n67, n68, n69, n70, n71, n72,
         n73, n74, n75, n76, n77, n78, n79, n80, n81, n82, n83, n84, n85, n86,
         n87, n88, n89, n90, n91, n92, n93, n94, n95, n96, n97, n98, n99, n100,
         n101, n102, n103, n104, n105, n106, n107, n108, n109, n110, n111,
         n112, n113, n114;

  DFFSR \count_out_reg[0]  ( .D(n60), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        count_out[0]) );
  DFFSR \count_out_reg[13]  ( .D(n114), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        count_out[13]) );
  DFFSR \count_out_reg[12]  ( .D(n113), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        count_out[12]) );
  DFFSR \count_out_reg[11]  ( .D(n112), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        count_out[11]) );
  DFFSR \count_out_reg[10]  ( .D(n111), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        count_out[10]) );
  DFFSR \count_out_reg[9]  ( .D(n110), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        count_out[9]) );
  DFFSR \count_out_reg[8]  ( .D(n109), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        count_out[8]) );
  DFFSR \count_out_reg[7]  ( .D(n108), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        count_out[7]) );
  DFFSR \count_out_reg[6]  ( .D(n107), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        count_out[6]) );
  DFFSR \count_out_reg[5]  ( .D(n106), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        count_out[5]) );
  DFFSR \count_out_reg[4]  ( .D(n105), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        count_out[4]) );
  DFFSR \count_out_reg[3]  ( .D(n104), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        count_out[3]) );
  DFFSR \count_out_reg[2]  ( .D(n103), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        count_out[2]) );
  DFFSR \count_out_reg[1]  ( .D(n102), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        count_out[1]) );
  DFFSR rollover_flag_reg ( .D(n59), .CLK(clk), .R(n_rst), .S(1'b1), .Q(n115)
         );
  flex_counter_NUM_CNT_BITS14_DW01_inc_0 r315 ( .A(count_out), .SUM({N39, N38, 
        N37, N36, N35, N34, N33, N32, N31, N30, N29, N28, N27, N26}) );
  flex_counter_NUM_CNT_BITS14_DW01_dec_0 sub_62 ( .A(rollover_val), .SUM({N21, 
        N20, N19, N18, N17, N16, N15, N14, N13, N12, N11, N10, N9, N8}) );
  INVX2 U5 ( .A(n55), .Y(n1) );
  BUFX2 U6 ( .A(n115), .Y(rollover_flag) );
  OAI21X1 U20 ( .A(n3), .B(n4), .C(n5), .Y(n102) );
  NAND2X1 U21 ( .A(N27), .B(n6), .Y(n5) );
  OAI21X1 U22 ( .A(n3), .B(n22), .C(n23), .Y(n103) );
  NAND2X1 U23 ( .A(N28), .B(n6), .Y(n23) );
  OAI21X1 U24 ( .A(n3), .B(n24), .C(n25), .Y(n104) );
  NAND2X1 U25 ( .A(N29), .B(n6), .Y(n25) );
  OAI21X1 U26 ( .A(n3), .B(n26), .C(n27), .Y(n105) );
  NAND2X1 U27 ( .A(N30), .B(n6), .Y(n27) );
  OAI21X1 U28 ( .A(n3), .B(n28), .C(n29), .Y(n106) );
  NAND2X1 U29 ( .A(N31), .B(n6), .Y(n29) );
  OAI21X1 U30 ( .A(n3), .B(n30), .C(n31), .Y(n107) );
  NAND2X1 U31 ( .A(N32), .B(n6), .Y(n31) );
  INVX1 U32 ( .A(count_out[6]), .Y(n30) );
  OAI21X1 U33 ( .A(n3), .B(n32), .C(n33), .Y(n108) );
  NAND2X1 U34 ( .A(N33), .B(n6), .Y(n33) );
  OAI21X1 U35 ( .A(n3), .B(n34), .C(n35), .Y(n109) );
  NAND2X1 U36 ( .A(N34), .B(n6), .Y(n35) );
  OAI21X1 U37 ( .A(n3), .B(n36), .C(n37), .Y(n110) );
  NAND2X1 U38 ( .A(N35), .B(n6), .Y(n37) );
  OAI21X1 U39 ( .A(n3), .B(n38), .C(n39), .Y(n111) );
  NAND2X1 U40 ( .A(N36), .B(n6), .Y(n39) );
  OAI21X1 U41 ( .A(n3), .B(n40), .C(n41), .Y(n112) );
  NAND2X1 U42 ( .A(N37), .B(n6), .Y(n41) );
  OAI21X1 U43 ( .A(n3), .B(n42), .C(n43), .Y(n113) );
  NAND2X1 U44 ( .A(N38), .B(n6), .Y(n43) );
  OAI21X1 U45 ( .A(n3), .B(n44), .C(n45), .Y(n114) );
  NAND2X1 U46 ( .A(N39), .B(n6), .Y(n45) );
  INVX1 U47 ( .A(count_out[13]), .Y(n44) );
  OAI22X1 U48 ( .A(n1), .B(n46), .C(n47), .D(n48), .Y(n60) );
  OAI21X1 U49 ( .A(n49), .B(N26), .C(n50), .Y(n48) );
  INVX1 U50 ( .A(n51), .Y(n49) );
  OAI21X1 U51 ( .A(n52), .B(n53), .C(n54), .Y(n59) );
  OAI21X1 U52 ( .A(n55), .B(n6), .C(rollover_flag), .Y(n54) );
  INVX1 U53 ( .A(n56), .Y(n6) );
  INVX1 U54 ( .A(n3), .Y(n55) );
  NAND2X1 U55 ( .A(n50), .B(n47), .Y(n3) );
  INVX1 U56 ( .A(count_enable), .Y(n47) );
  OR2X1 U57 ( .A(n57), .B(n58), .Y(n53) );
  NAND3X1 U58 ( .A(n61), .B(n62), .C(n63), .Y(n58) );
  XOR2X1 U59 ( .A(n26), .B(N12), .Y(n63) );
  XOR2X1 U60 ( .A(n28), .B(N13), .Y(n62) );
  XOR2X1 U61 ( .A(n24), .B(N11), .Y(n61) );
  NAND3X1 U62 ( .A(n64), .B(n65), .C(n66), .Y(n57) );
  NOR2X1 U63 ( .A(n67), .B(n68), .Y(n66) );
  XOR2X1 U64 ( .A(count_out[13]), .B(N21), .Y(n68) );
  XOR2X1 U65 ( .A(count_out[2]), .B(N10), .Y(n67) );
  XOR2X1 U66 ( .A(n46), .B(N8), .Y(n65) );
  INVX1 U67 ( .A(count_out[0]), .Y(n46) );
  XOR2X1 U68 ( .A(n4), .B(N9), .Y(n64) );
  OR2X1 U69 ( .A(n69), .B(n70), .Y(n52) );
  NAND3X1 U70 ( .A(n71), .B(n72), .C(n73), .Y(n70) );
  NOR2X1 U71 ( .A(n74), .B(n75), .Y(n73) );
  XOR2X1 U72 ( .A(count_out[10]), .B(N18), .Y(n75) );
  XOR2X1 U73 ( .A(count_out[9]), .B(N17), .Y(n74) );
  XOR2X1 U74 ( .A(n40), .B(N19), .Y(n72) );
  XOR2X1 U75 ( .A(n42), .B(N20), .Y(n71) );
  NAND3X1 U76 ( .A(n76), .B(n77), .C(n78), .Y(n69) );
  NOR2X1 U77 ( .A(n56), .B(n79), .Y(n78) );
  XOR2X1 U78 ( .A(count_out[6]), .B(N14), .Y(n79) );
  NAND3X1 U79 ( .A(n51), .B(n50), .C(count_enable), .Y(n56) );
  INVX1 U80 ( .A(clear), .Y(n50) );
  NAND2X1 U81 ( .A(n80), .B(n81), .Y(n51) );
  NOR2X1 U82 ( .A(n82), .B(n83), .Y(n81) );
  NAND3X1 U83 ( .A(n84), .B(n85), .C(n86), .Y(n83) );
  XOR2X1 U84 ( .A(n40), .B(rollover_val[11]), .Y(n86) );
  INVX1 U85 ( .A(count_out[11]), .Y(n40) );
  XOR2X1 U86 ( .A(n42), .B(rollover_val[12]), .Y(n85) );
  INVX1 U87 ( .A(count_out[12]), .Y(n42) );
  XOR2X1 U88 ( .A(n38), .B(rollover_val[10]), .Y(n84) );
  INVX1 U89 ( .A(count_out[10]), .Y(n38) );
  NAND3X1 U90 ( .A(n87), .B(n88), .C(n89), .Y(n82) );
  NOR2X1 U91 ( .A(n90), .B(n91), .Y(n89) );
  XOR2X1 U92 ( .A(rollover_val[7]), .B(count_out[7]), .Y(n91) );
  XOR2X1 U93 ( .A(rollover_val[6]), .B(count_out[6]), .Y(n90) );
  XOR2X1 U94 ( .A(n34), .B(rollover_val[8]), .Y(n88) );
  XOR2X1 U95 ( .A(n36), .B(rollover_val[9]), .Y(n87) );
  INVX1 U96 ( .A(count_out[9]), .Y(n36) );
  NOR2X1 U97 ( .A(n92), .B(n93), .Y(n80) );
  NAND3X1 U98 ( .A(n94), .B(n95), .C(n96), .Y(n93) );
  XOR2X1 U99 ( .A(n26), .B(rollover_val[4]), .Y(n96) );
  INVX1 U100 ( .A(count_out[4]), .Y(n26) );
  XOR2X1 U101 ( .A(n28), .B(rollover_val[5]), .Y(n95) );
  INVX1 U102 ( .A(count_out[5]), .Y(n28) );
  XOR2X1 U103 ( .A(n24), .B(rollover_val[3]), .Y(n94) );
  INVX1 U104 ( .A(count_out[3]), .Y(n24) );
  NAND3X1 U105 ( .A(n97), .B(n98), .C(n99), .Y(n92) );
  NOR2X1 U106 ( .A(n100), .B(n101), .Y(n99) );
  XOR2X1 U107 ( .A(rollover_val[13]), .B(count_out[13]), .Y(n101) );
  XOR2X1 U108 ( .A(rollover_val[0]), .B(count_out[0]), .Y(n100) );
  XOR2X1 U109 ( .A(n4), .B(rollover_val[1]), .Y(n98) );
  INVX1 U110 ( .A(count_out[1]), .Y(n4) );
  XOR2X1 U111 ( .A(n22), .B(rollover_val[2]), .Y(n97) );
  INVX1 U112 ( .A(count_out[2]), .Y(n22) );
  XOR2X1 U113 ( .A(n32), .B(N15), .Y(n77) );
  INVX1 U114 ( .A(count_out[7]), .Y(n32) );
  XOR2X1 U115 ( .A(n34), .B(N16), .Y(n76) );
  INVX1 U116 ( .A(count_out[8]), .Y(n34) );
endmodule


module flex_counter_NUM_CNT_BITS4 ( clk, n_rst, clear, count_enable, 
        rollover_val, count_out, rollover_flag );
  input [3:0] rollover_val;
  output [3:0] count_out;
  input clk, n_rst, clear, count_enable;
  output rollover_flag;
  wire   n52, n53, n54, n55, n56, n1, n2, n3, n4, n5, n6, n12, n13, n14, n15,
         n16, n17, n18, n19, n20, n21, n22, n23, n24, n25, n26, n27, n28, n29,
         n30, n31, n32, n33, n34, n35, n36, n37, n38, n39, n40;

  DFFSR \count_out_reg[0]  ( .D(n56), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        count_out[0]) );
  DFFSR \count_out_reg[1]  ( .D(n55), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        count_out[1]) );
  DFFSR \count_out_reg[2]  ( .D(n54), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        count_out[2]) );
  DFFSR \count_out_reg[3]  ( .D(n53), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        count_out[3]) );
  DFFSR rollover_flag_reg ( .D(n52), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        rollover_flag) );
  INVX1 U8 ( .A(n1), .Y(n56) );
  AOI22X1 U9 ( .A(count_out[0]), .B(n2), .C(count_enable), .D(n3), .Y(n1) );
  AOI21X1 U10 ( .A(n4), .B(count_out[0]), .C(clear), .Y(n3) );
  MUX2X1 U11 ( .B(n5), .A(n6), .S(count_out[1]), .Y(n55) );
  NAND2X1 U12 ( .A(n12), .B(count_out[0]), .Y(n5) );
  INVX1 U13 ( .A(n13), .Y(n54) );
  MUX2X1 U14 ( .B(n14), .A(n15), .S(n16), .Y(n13) );
  MUX2X1 U15 ( .B(n17), .A(n18), .S(count_out[3]), .Y(n53) );
  AOI21X1 U16 ( .A(n12), .B(n16), .C(n14), .Y(n18) );
  OAI21X1 U17 ( .A(count_out[1]), .B(n19), .C(n6), .Y(n14) );
  AOI21X1 U18 ( .A(n20), .B(n12), .C(n2), .Y(n6) );
  NAND2X1 U19 ( .A(n15), .B(count_out[2]), .Y(n17) );
  INVX1 U20 ( .A(n21), .Y(n15) );
  NAND3X1 U21 ( .A(count_out[1]), .B(count_out[0]), .C(n12), .Y(n21) );
  OAI21X1 U22 ( .A(n22), .B(n23), .C(n24), .Y(n52) );
  OAI21X1 U23 ( .A(n12), .B(n2), .C(rollover_flag), .Y(n24) );
  NOR2X1 U24 ( .A(clear), .B(count_enable), .Y(n2) );
  INVX1 U25 ( .A(n19), .Y(n12) );
  NAND3X1 U26 ( .A(n4), .B(n25), .C(count_enable), .Y(n19) );
  NAND3X1 U27 ( .A(n26), .B(n27), .C(n28), .Y(n4) );
  NOR2X1 U28 ( .A(n29), .B(n30), .Y(n28) );
  XNOR2X1 U29 ( .A(n31), .B(count_out[2]), .Y(n30) );
  XOR2X1 U30 ( .A(rollover_val[1]), .B(count_out[1]), .Y(n29) );
  XNOR2X1 U31 ( .A(rollover_val[0]), .B(count_out[0]), .Y(n26) );
  NAND2X1 U32 ( .A(n32), .B(count_enable), .Y(n23) );
  MUX2X1 U33 ( .B(n33), .A(n34), .S(n27), .Y(n32) );
  XNOR2X1 U34 ( .A(count_out[3]), .B(rollover_val[3]), .Y(n27) );
  MUX2X1 U35 ( .B(n35), .A(n36), .S(n31), .Y(n34) );
  NOR2X1 U36 ( .A(count_out[2]), .B(n37), .Y(n36) );
  XNOR2X1 U37 ( .A(n16), .B(n37), .Y(n35) );
  INVX1 U38 ( .A(count_out[2]), .Y(n16) );
  NAND3X1 U39 ( .A(count_out[2]), .B(n31), .C(n37), .Y(n33) );
  INVX1 U40 ( .A(rollover_val[2]), .Y(n31) );
  NAND3X1 U41 ( .A(n38), .B(n25), .C(n39), .Y(n22) );
  XNOR2X1 U42 ( .A(rollover_val[0]), .B(n20), .Y(n39) );
  INVX1 U43 ( .A(clear), .Y(n25) );
  XOR2X1 U44 ( .A(count_out[1]), .B(n40), .Y(n38) );
  AOI21X1 U45 ( .A(n20), .B(rollover_val[1]), .C(n37), .Y(n40) );
  NOR2X1 U46 ( .A(rollover_val[0]), .B(rollover_val[1]), .Y(n37) );
  INVX1 U47 ( .A(count_out[0]), .Y(n20) );
endmodule


module timer ( clk, n_rst, enable_timer, data_size, bit_period, shift_enable, 
        packet_done );
  input [3:0] data_size;
  input [13:0] bit_period;
  input clk, n_rst, enable_timer;
  output shift_enable, packet_done;
  wire   \_0_net_[3] , \_0_net_[2] , \_0_net_[1] , n1, n2, n3, n4;

  flex_counter_NUM_CNT_BITS14 clk_divider ( .clk(clk), .n_rst(n_rst), .clear(
        packet_done), .count_enable(enable_timer), .rollover_val(bit_period), 
        .rollover_flag(shift_enable) );
  flex_counter_NUM_CNT_BITS4 bit_counter ( .clk(clk), .n_rst(n_rst), .clear(
        packet_done), .count_enable(shift_enable), .rollover_val({\_0_net_[3] , 
        \_0_net_[2] , \_0_net_[1] , n4}), .rollover_flag(packet_done) );
  INVX1 U2 ( .A(data_size[0]), .Y(n4) );
  XOR2X1 U3 ( .A(data_size[3]), .B(n1), .Y(\_0_net_[3] ) );
  NOR2X1 U4 ( .A(n2), .B(n3), .Y(n1) );
  XOR2X1 U5 ( .A(n3), .B(n2), .Y(\_0_net_[2] ) );
  NAND2X1 U6 ( .A(data_size[1]), .B(data_size[0]), .Y(n2) );
  INVX1 U7 ( .A(data_size[2]), .Y(n3) );
  XOR2X1 U8 ( .A(data_size[1]), .B(data_size[0]), .Y(\_0_net_[1] ) );
endmodule


module rcu ( clk, n_rst, start_bit_detected, packet_done, framing_error, 
        sbc_clear, sbc_enable, load_buffer, enable_timer );
  input clk, n_rst, start_bit_detected, packet_done, framing_error;
  output sbc_clear, sbc_enable, load_buffer, enable_timer;
  wire   n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16, n17, n18;
  wire   [2:0] state;
  wire   [2:0] nxt_state;

  DFFSR \state_reg[0]  ( .D(nxt_state[0]), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        state[0]) );
  DFFSR \state_reg[1]  ( .D(nxt_state[1]), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        state[1]) );
  DFFSR \state_reg[2]  ( .D(nxt_state[2]), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        state[2]) );
  NAND3X1 U6 ( .A(n4), .B(n5), .C(n6), .Y(nxt_state[2]) );
  NAND3X1 U7 ( .A(n7), .B(n8), .C(n5), .Y(nxt_state[1]) );
  NAND3X1 U8 ( .A(n9), .B(n4), .C(n10), .Y(nxt_state[0]) );
  AOI22X1 U9 ( .A(n11), .B(state[0]), .C(packet_done), .D(enable_timer), .Y(
        n10) );
  INVX1 U10 ( .A(n5), .Y(n11) );
  NAND3X1 U11 ( .A(n6), .B(n12), .C(state[1]), .Y(n5) );
  NAND3X1 U12 ( .A(n13), .B(n14), .C(n15), .Y(n4) );
  NOR2X1 U13 ( .A(framing_error), .B(n16), .Y(n15) );
  NAND3X1 U14 ( .A(n17), .B(n14), .C(start_bit_detected), .Y(n9) );
  NOR2X1 U15 ( .A(n16), .B(n18), .Y(load_buffer) );
  NAND2X1 U16 ( .A(state[0]), .B(n14), .Y(n18) );
  INVX1 U17 ( .A(n6), .Y(sbc_enable) );
  NAND3X1 U18 ( .A(state[0]), .B(n16), .C(state[1]), .Y(n6) );
  INVX1 U19 ( .A(n8), .Y(sbc_clear) );
  NAND3X1 U20 ( .A(n14), .B(n16), .C(state[0]), .Y(n8) );
  INVX1 U21 ( .A(state[1]), .Y(n14) );
  INVX1 U22 ( .A(n7), .Y(enable_timer) );
  NAND2X1 U23 ( .A(n17), .B(state[1]), .Y(n7) );
  INVX1 U24 ( .A(n12), .Y(n17) );
  NAND2X1 U25 ( .A(n13), .B(n16), .Y(n12) );
  INVX1 U26 ( .A(state[2]), .Y(n16) );
  INVX1 U27 ( .A(state[0]), .Y(n13) );
endmodule


module rcv_block ( clk, n_rst, serial_in, data_read, data_size, bit_period, 
        data_ready, overrun_error, framing_error, rx_data );
  input [3:0] data_size;
  input [13:0] bit_period;
  output [7:0] rx_data;
  input clk, n_rst, serial_in, data_read;
  output data_ready, overrun_error, framing_error;
  wire   shift_strobe, stop_bit, start_bit_detected, sbc_clear, sbc_enable,
         load_buffer, enable_timer, packet_done;
  wire   [7:0] packet_data;

  sr_9bit s9 ( .clk(clk), .n_rst(n_rst), .shift_strobe(shift_strobe), 
        .serial_in(serial_in), .packet_data(packet_data), .stop_bit(stop_bit)
         );
  start_bit_det start ( .clk(clk), .n_rst(n_rst), .serial_in(serial_in), 
        .start_bit_detected(start_bit_detected) );
  stop_bit_chk stopbit_checker ( .clk(clk), .n_rst(n_rst), .sbc_clear(
        sbc_clear), .sbc_enable(sbc_enable), .stop_bit(stop_bit), 
        .framing_error(framing_error) );
  rx_data_buff check_buffer ( .clk(clk), .n_rst(n_rst), .load_buffer(
        load_buffer), .packet_data(packet_data), .data_read(data_read), 
        .rx_data(rx_data), .data_ready(data_ready), .overrun_error(
        overrun_error) );
  timer timecode ( .clk(clk), .n_rst(n_rst), .enable_timer(enable_timer), 
        .data_size(data_size), .bit_period(bit_period), .shift_enable(
        shift_strobe), .packet_done(packet_done) );
  rcu receiver_control ( .clk(clk), .n_rst(n_rst), .start_bit_detected(
        start_bit_detected), .packet_done(packet_done), .framing_error(
        framing_error), .sbc_clear(sbc_clear), .sbc_enable(sbc_enable), 
        .load_buffer(load_buffer), .enable_timer(enable_timer) );
endmodule


module apb_slave ( clk, n_rst, data_ready, overrun_error, framing_error, psel, 
        penable, pwrite, paddr, rx_data, pwdata, data_read, pslverr, data_size, 
        prdata, bit_period );
  input [2:0] paddr;
  input [7:0] rx_data;
  input [7:0] pwdata;
  output [3:0] data_size;
  output [7:0] prdata;
  output [13:0] bit_period;
  input clk, n_rst, data_ready, overrun_error, framing_error, psel, penable,
         pwrite;
  output data_read, pslverr;
  wire   \reg_map[6][7] , \reg_map[6][6] , \reg_map[6][5] , \reg_map[6][4] ,
         \reg_map[6][3] , \reg_map[6][2] , \reg_map[6][1] , \reg_map[6][0] ,
         \reg_map[4][7] , \reg_map[4][6] , \reg_map[4][5] , \reg_map[4][4] ,
         \reg_map[3][7] , \reg_map[3][6] , \reg_map[1][1] , \reg_map[1][0] ,
         \reg_map[0][0] , \nxt_reg_map[4][7] , \nxt_reg_map[4][6] ,
         \nxt_reg_map[4][5] , \nxt_reg_map[4][4] , \nxt_reg_map[4][3] ,
         \nxt_reg_map[4][2] , \nxt_reg_map[4][1] , \nxt_reg_map[4][0] ,
         \nxt_reg_map[3][7] , \nxt_reg_map[3][6] , \nxt_reg_map[3][5] ,
         \nxt_reg_map[3][4] , \nxt_reg_map[3][3] , \nxt_reg_map[3][2] ,
         \nxt_reg_map[3][1] , \nxt_reg_map[3][0] , \nxt_reg_map[2][7] ,
         \nxt_reg_map[2][6] , \nxt_reg_map[2][5] , \nxt_reg_map[2][4] ,
         \nxt_reg_map[2][3] , \nxt_reg_map[2][2] , \nxt_reg_map[2][1] ,
         \nxt_reg_map[2][0] , \nxt_reg_map[0][0] , N90, N91, N92, N93, N94,
         N95, N96, N97, N99, n36, n37, n38, n39, n40, n41, n42, n43, n44, n45,
         n46, n47, n48, n49, n50, n51, n52, n53, n54, n55, n56, n57, n58, n59,
         n60, n61, n62, n63, n64, n65, n66, n67, n68, n69, n70, n71, n72, n73,
         n74, n75, n76, n77, n78, n79, n80, n81, n82, n83, n84, n85, n86, n87,
         n88, n89, n90, n91, n92, n93, n94, n95, n96, n97, n98, n99, n100,
         n101, n102, n103, n104;
  assign \nxt_reg_map[0][0]  = data_ready;

  DFFSR \reg_map_reg[6][7]  ( .D(rx_data[7]), .CLK(clk), .R(n_rst), .S(1'b1), 
        .Q(\reg_map[6][7] ) );
  DFFSR \reg_map_reg[6][6]  ( .D(rx_data[6]), .CLK(clk), .R(n_rst), .S(1'b1), 
        .Q(\reg_map[6][6] ) );
  DFFSR \reg_map_reg[6][5]  ( .D(rx_data[5]), .CLK(clk), .R(n_rst), .S(1'b1), 
        .Q(\reg_map[6][5] ) );
  DFFSR \reg_map_reg[6][4]  ( .D(rx_data[4]), .CLK(clk), .R(n_rst), .S(1'b1), 
        .Q(\reg_map[6][4] ) );
  DFFSR \reg_map_reg[6][3]  ( .D(rx_data[3]), .CLK(clk), .R(n_rst), .S(1'b1), 
        .Q(\reg_map[6][3] ) );
  DFFSR \reg_map_reg[6][2]  ( .D(rx_data[2]), .CLK(clk), .R(n_rst), .S(1'b1), 
        .Q(\reg_map[6][2] ) );
  DFFSR \reg_map_reg[6][1]  ( .D(rx_data[1]), .CLK(clk), .R(n_rst), .S(1'b1), 
        .Q(\reg_map[6][1] ) );
  DFFSR \reg_map_reg[6][0]  ( .D(rx_data[0]), .CLK(clk), .R(n_rst), .S(1'b1), 
        .Q(\reg_map[6][0] ) );
  DFFSR \reg_map_reg[4][7]  ( .D(\nxt_reg_map[4][7] ), .CLK(clk), .R(n_rst), 
        .S(1'b1), .Q(\reg_map[4][7] ) );
  DFFSR \reg_map_reg[4][6]  ( .D(\nxt_reg_map[4][6] ), .CLK(clk), .R(n_rst), 
        .S(1'b1), .Q(\reg_map[4][6] ) );
  DFFSR \reg_map_reg[4][5]  ( .D(\nxt_reg_map[4][5] ), .CLK(clk), .R(n_rst), 
        .S(1'b1), .Q(\reg_map[4][5] ) );
  DFFSR \reg_map_reg[4][4]  ( .D(\nxt_reg_map[4][4] ), .CLK(clk), .R(n_rst), 
        .S(1'b1), .Q(\reg_map[4][4] ) );
  DFFSR \reg_map_reg[4][3]  ( .D(\nxt_reg_map[4][3] ), .CLK(clk), .R(n_rst), 
        .S(1'b1), .Q(data_size[3]) );
  DFFSR \reg_map_reg[4][2]  ( .D(\nxt_reg_map[4][2] ), .CLK(clk), .R(n_rst), 
        .S(1'b1), .Q(data_size[2]) );
  DFFSR \reg_map_reg[4][1]  ( .D(\nxt_reg_map[4][1] ), .CLK(clk), .R(n_rst), 
        .S(1'b1), .Q(data_size[1]) );
  DFFSR \reg_map_reg[4][0]  ( .D(\nxt_reg_map[4][0] ), .CLK(clk), .R(n_rst), 
        .S(1'b1), .Q(data_size[0]) );
  DFFSR \reg_map_reg[3][7]  ( .D(\nxt_reg_map[3][7] ), .CLK(clk), .R(n_rst), 
        .S(1'b1), .Q(\reg_map[3][7] ) );
  DFFSR \reg_map_reg[3][6]  ( .D(\nxt_reg_map[3][6] ), .CLK(clk), .R(n_rst), 
        .S(1'b1), .Q(\reg_map[3][6] ) );
  DFFSR \reg_map_reg[3][5]  ( .D(\nxt_reg_map[3][5] ), .CLK(clk), .R(n_rst), 
        .S(1'b1), .Q(bit_period[13]) );
  DFFSR \reg_map_reg[3][4]  ( .D(\nxt_reg_map[3][4] ), .CLK(clk), .R(n_rst), 
        .S(1'b1), .Q(bit_period[12]) );
  DFFSR \reg_map_reg[3][3]  ( .D(\nxt_reg_map[3][3] ), .CLK(clk), .R(n_rst), 
        .S(1'b1), .Q(bit_period[11]) );
  DFFSR \reg_map_reg[3][2]  ( .D(\nxt_reg_map[3][2] ), .CLK(clk), .R(n_rst), 
        .S(1'b1), .Q(bit_period[10]) );
  DFFSR \reg_map_reg[3][1]  ( .D(\nxt_reg_map[3][1] ), .CLK(clk), .R(n_rst), 
        .S(1'b1), .Q(bit_period[9]) );
  DFFSR \reg_map_reg[3][0]  ( .D(\nxt_reg_map[3][0] ), .CLK(clk), .R(n_rst), 
        .S(1'b1), .Q(bit_period[8]) );
  DFFSR \reg_map_reg[2][7]  ( .D(\nxt_reg_map[2][7] ), .CLK(clk), .R(n_rst), 
        .S(1'b1), .Q(bit_period[7]) );
  DFFSR \reg_map_reg[2][6]  ( .D(\nxt_reg_map[2][6] ), .CLK(clk), .R(n_rst), 
        .S(1'b1), .Q(bit_period[6]) );
  DFFSR \reg_map_reg[2][5]  ( .D(\nxt_reg_map[2][5] ), .CLK(clk), .R(n_rst), 
        .S(1'b1), .Q(bit_period[5]) );
  DFFSR \reg_map_reg[2][4]  ( .D(\nxt_reg_map[2][4] ), .CLK(clk), .R(n_rst), 
        .S(1'b1), .Q(bit_period[4]) );
  DFFSR \reg_map_reg[2][3]  ( .D(\nxt_reg_map[2][3] ), .CLK(clk), .R(n_rst), 
        .S(1'b1), .Q(bit_period[3]) );
  DFFSR \reg_map_reg[2][2]  ( .D(\nxt_reg_map[2][2] ), .CLK(clk), .R(n_rst), 
        .S(1'b1), .Q(bit_period[2]) );
  DFFSR \reg_map_reg[2][1]  ( .D(\nxt_reg_map[2][1] ), .CLK(clk), .R(n_rst), 
        .S(1'b1), .Q(bit_period[1]) );
  DFFSR \reg_map_reg[2][0]  ( .D(\nxt_reg_map[2][0] ), .CLK(clk), .R(n_rst), 
        .S(1'b1), .Q(bit_period[0]) );
  DFFSR \reg_map_reg[1][1]  ( .D(overrun_error), .CLK(clk), .R(n_rst), .S(1'b1), .Q(\reg_map[1][1] ) );
  DFFSR \reg_map_reg[1][0]  ( .D(framing_error), .CLK(clk), .R(n_rst), .S(1'b1), .Q(\reg_map[1][0] ) );
  DFFSR \reg_map_reg[0][0]  ( .D(\nxt_reg_map[0][0] ), .CLK(clk), .R(n_rst), 
        .S(1'b1), .Q(\reg_map[0][0] ) );
  LATCH \prdata_reg[7]  ( .CLK(N99), .D(N90), .Q(prdata[7]) );
  LATCH \prdata_reg[6]  ( .CLK(N99), .D(N91), .Q(prdata[6]) );
  LATCH \prdata_reg[5]  ( .CLK(N99), .D(N92), .Q(prdata[5]) );
  LATCH \prdata_reg[4]  ( .CLK(N99), .D(N93), .Q(prdata[4]) );
  LATCH \prdata_reg[3]  ( .CLK(N99), .D(N94), .Q(prdata[3]) );
  LATCH \prdata_reg[2]  ( .CLK(N99), .D(N95), .Q(prdata[2]) );
  LATCH \prdata_reg[1]  ( .CLK(N99), .D(N96), .Q(prdata[1]) );
  LATCH \prdata_reg[0]  ( .CLK(N99), .D(N97), .Q(prdata[0]) );
  NOR2X1 U4 ( .A(n36), .B(n37), .Y(pslverr) );
  OAI21X1 U5 ( .A(pwrite), .B(n38), .C(n39), .Y(n36) );
  NOR2X1 U6 ( .A(n40), .B(n41), .Y(n39) );
  INVX1 U7 ( .A(n42), .Y(\nxt_reg_map[4][7] ) );
  MUX2X1 U8 ( .B(\reg_map[4][7] ), .A(pwdata[7]), .S(n43), .Y(n42) );
  INVX1 U9 ( .A(n44), .Y(\nxt_reg_map[4][6] ) );
  MUX2X1 U10 ( .B(\reg_map[4][6] ), .A(pwdata[6]), .S(n43), .Y(n44) );
  INVX1 U13 ( .A(n45), .Y(\nxt_reg_map[4][5] ) );
  MUX2X1 U14 ( .B(\reg_map[4][5] ), .A(pwdata[5]), .S(n43), .Y(n45) );
  INVX1 U15 ( .A(n46), .Y(\nxt_reg_map[4][4] ) );
  MUX2X1 U16 ( .B(\reg_map[4][4] ), .A(pwdata[4]), .S(n43), .Y(n46) );
  INVX1 U17 ( .A(n47), .Y(\nxt_reg_map[4][3] ) );
  MUX2X1 U18 ( .B(data_size[3]), .A(pwdata[3]), .S(n43), .Y(n47) );
  INVX1 U43 ( .A(n48), .Y(\nxt_reg_map[4][2] ) );
  MUX2X1 U44 ( .B(data_size[2]), .A(pwdata[2]), .S(n43), .Y(n48) );
  MUX2X1 U45 ( .B(n49), .A(n50), .S(n43), .Y(\nxt_reg_map[4][1] ) );
  INVX1 U46 ( .A(data_size[1]), .Y(n49) );
  MUX2X1 U47 ( .B(n51), .A(n52), .S(n43), .Y(\nxt_reg_map[4][0] ) );
  NOR2X1 U48 ( .A(n53), .B(n54), .Y(n43) );
  INVX1 U49 ( .A(data_size[0]), .Y(n51) );
  INVX1 U50 ( .A(n55), .Y(\nxt_reg_map[3][7] ) );
  MUX2X1 U59 ( .B(\reg_map[3][7] ), .A(pwdata[7]), .S(n56), .Y(n55) );
  INVX1 U60 ( .A(n57), .Y(\nxt_reg_map[3][6] ) );
  MUX2X1 U61 ( .B(\reg_map[3][6] ), .A(pwdata[6]), .S(n56), .Y(n57) );
  INVX1 U62 ( .A(n58), .Y(\nxt_reg_map[3][5] ) );
  MUX2X1 U63 ( .B(bit_period[13]), .A(pwdata[5]), .S(n56), .Y(n58) );
  INVX1 U64 ( .A(n59), .Y(\nxt_reg_map[3][4] ) );
  MUX2X1 U65 ( .B(bit_period[12]), .A(pwdata[4]), .S(n56), .Y(n59) );
  INVX1 U66 ( .A(n60), .Y(\nxt_reg_map[3][3] ) );
  MUX2X1 U67 ( .B(bit_period[11]), .A(pwdata[3]), .S(n56), .Y(n60) );
  INVX1 U68 ( .A(n61), .Y(\nxt_reg_map[3][2] ) );
  MUX2X1 U69 ( .B(bit_period[10]), .A(pwdata[2]), .S(n56), .Y(n61) );
  MUX2X1 U70 ( .B(n62), .A(n50), .S(n56), .Y(\nxt_reg_map[3][1] ) );
  MUX2X1 U71 ( .B(n63), .A(n52), .S(n56), .Y(\nxt_reg_map[3][0] ) );
  NOR2X1 U72 ( .A(n64), .B(n54), .Y(n56) );
  INVX1 U73 ( .A(n65), .Y(\nxt_reg_map[2][7] ) );
  MUX2X1 U74 ( .B(bit_period[7]), .A(pwdata[7]), .S(n66), .Y(n65) );
  INVX1 U75 ( .A(n67), .Y(\nxt_reg_map[2][6] ) );
  MUX2X1 U76 ( .B(bit_period[6]), .A(pwdata[6]), .S(n66), .Y(n67) );
  INVX1 U77 ( .A(n68), .Y(\nxt_reg_map[2][5] ) );
  MUX2X1 U78 ( .B(bit_period[5]), .A(pwdata[5]), .S(n66), .Y(n68) );
  INVX1 U79 ( .A(n69), .Y(\nxt_reg_map[2][4] ) );
  MUX2X1 U80 ( .B(bit_period[4]), .A(pwdata[4]), .S(n66), .Y(n69) );
  INVX1 U81 ( .A(n70), .Y(\nxt_reg_map[2][3] ) );
  MUX2X1 U82 ( .B(bit_period[3]), .A(pwdata[3]), .S(n66), .Y(n70) );
  INVX1 U83 ( .A(n71), .Y(\nxt_reg_map[2][2] ) );
  MUX2X1 U84 ( .B(bit_period[2]), .A(pwdata[2]), .S(n66), .Y(n71) );
  MUX2X1 U85 ( .B(n72), .A(n50), .S(n66), .Y(\nxt_reg_map[2][1] ) );
  INVX1 U86 ( .A(pwdata[1]), .Y(n50) );
  INVX1 U87 ( .A(bit_period[1]), .Y(n72) );
  MUX2X1 U88 ( .B(n73), .A(n52), .S(n66), .Y(\nxt_reg_map[2][0] ) );
  NOR2X1 U89 ( .A(n74), .B(n54), .Y(n66) );
  NAND3X1 U90 ( .A(pwrite), .B(psel), .C(n75), .Y(n54) );
  INVX1 U91 ( .A(n76), .Y(n75) );
  OAI21X1 U92 ( .A(n41), .B(n40), .C(penable), .Y(n76) );
  INVX1 U93 ( .A(pwdata[0]), .Y(n52) );
  INVX1 U94 ( .A(bit_period[0]), .Y(n73) );
  AND2X1 U95 ( .A(n77), .B(N99), .Y(data_read) );
  NOR3X1 U96 ( .A(n38), .B(pwrite), .C(n37), .Y(N99) );
  NAND2X1 U97 ( .A(penable), .B(psel), .Y(n37) );
  NOR2X1 U98 ( .A(n78), .B(n79), .Y(n38) );
  NAND2X1 U99 ( .A(n80), .B(n81), .Y(N97) );
  AOI21X1 U100 ( .A(data_size[0]), .B(n40), .C(n82), .Y(n81) );
  OAI22X1 U101 ( .A(n64), .B(n63), .C(n83), .D(n84), .Y(n82) );
  NAND2X1 U102 ( .A(n85), .B(n79), .Y(n84) );
  MUX2X1 U103 ( .B(\reg_map[0][0] ), .A(\reg_map[1][0] ), .S(paddr[0]), .Y(n83) );
  INVX1 U104 ( .A(bit_period[8]), .Y(n63) );
  AOI22X1 U105 ( .A(bit_period[0]), .B(n86), .C(\reg_map[6][0] ), .D(n77), .Y(
        n80) );
  NAND2X1 U106 ( .A(n87), .B(n88), .Y(N96) );
  AOI21X1 U107 ( .A(data_size[1]), .B(n40), .C(n89), .Y(n88) );
  OAI21X1 U108 ( .A(n64), .B(n62), .C(n90), .Y(n89) );
  NAND3X1 U109 ( .A(\reg_map[1][1] ), .B(paddr[0]), .C(n91), .Y(n90) );
  NOR2X1 U110 ( .A(paddr[2]), .B(paddr[1]), .Y(n91) );
  INVX1 U111 ( .A(bit_period[9]), .Y(n62) );
  AOI22X1 U112 ( .A(bit_period[1]), .B(n86), .C(\reg_map[6][1] ), .D(n77), .Y(
        n87) );
  NAND2X1 U113 ( .A(n92), .B(n93), .Y(N95) );
  AOI22X1 U114 ( .A(bit_period[10]), .B(n94), .C(data_size[2]), .D(n40), .Y(
        n93) );
  AOI22X1 U115 ( .A(bit_period[2]), .B(n86), .C(\reg_map[6][2] ), .D(n77), .Y(
        n92) );
  NAND2X1 U116 ( .A(n95), .B(n96), .Y(N94) );
  AOI22X1 U117 ( .A(bit_period[11]), .B(n94), .C(data_size[3]), .D(n40), .Y(
        n96) );
  AOI22X1 U118 ( .A(bit_period[3]), .B(n86), .C(\reg_map[6][3] ), .D(n77), .Y(
        n95) );
  NAND2X1 U119 ( .A(n97), .B(n98), .Y(N93) );
  AOI22X1 U120 ( .A(bit_period[12]), .B(n94), .C(\reg_map[4][4] ), .D(n40), 
        .Y(n98) );
  AOI22X1 U121 ( .A(bit_period[4]), .B(n86), .C(\reg_map[6][4] ), .D(n77), .Y(
        n97) );
  NAND2X1 U122 ( .A(n99), .B(n100), .Y(N92) );
  AOI22X1 U123 ( .A(bit_period[13]), .B(n94), .C(\reg_map[4][5] ), .D(n40), 
        .Y(n100) );
  AOI22X1 U124 ( .A(bit_period[5]), .B(n86), .C(\reg_map[6][5] ), .D(n77), .Y(
        n99) );
  NAND2X1 U125 ( .A(n101), .B(n102), .Y(N91) );
  AOI22X1 U126 ( .A(\reg_map[3][6] ), .B(n94), .C(\reg_map[4][6] ), .D(n40), 
        .Y(n102) );
  AOI22X1 U127 ( .A(bit_period[6]), .B(n86), .C(\reg_map[6][6] ), .D(n77), .Y(
        n101) );
  NAND2X1 U128 ( .A(n103), .B(n104), .Y(N90) );
  AOI22X1 U129 ( .A(\reg_map[3][7] ), .B(n94), .C(\reg_map[4][7] ), .D(n40), 
        .Y(n104) );
  INVX1 U130 ( .A(n53), .Y(n40) );
  NAND3X1 U131 ( .A(n78), .B(n85), .C(paddr[2]), .Y(n53) );
  INVX1 U132 ( .A(n64), .Y(n94) );
  NAND2X1 U133 ( .A(paddr[0]), .B(paddr[1]), .Y(n64) );
  AOI22X1 U134 ( .A(bit_period[7]), .B(n86), .C(\reg_map[6][7] ), .D(n77), .Y(
        n103) );
  NOR2X1 U135 ( .A(n85), .B(n79), .Y(n77) );
  INVX1 U136 ( .A(paddr[2]), .Y(n79) );
  INVX1 U137 ( .A(n74), .Y(n86) );
  NAND2X1 U138 ( .A(n41), .B(n78), .Y(n74) );
  INVX1 U139 ( .A(paddr[0]), .Y(n78) );
  NOR2X1 U140 ( .A(n85), .B(paddr[2]), .Y(n41) );
  INVX1 U141 ( .A(paddr[1]), .Y(n85) );
endmodule


module apb_uart_rx ( clk, n_rst, serial_in, psel, penable, pwrite, paddr, 
        pwdata, prdata, pslverr );
  input [2:0] paddr;
  input [7:0] pwdata;
  output [7:0] prdata;
  input clk, n_rst, serial_in, psel, penable, pwrite;
  output pslverr;
  wire   data_read, data_ready, overrun_error, framing_error;
  wire   [3:0] data_size;
  wire   [13:0] bit_period;
  wire   [7:0] rx_data;

  rcv_block rcv ( .clk(clk), .n_rst(n_rst), .serial_in(serial_in), .data_read(
        data_read), .data_size(data_size), .bit_period(bit_period), 
        .data_ready(data_ready), .overrun_error(overrun_error), 
        .framing_error(framing_error), .rx_data(rx_data) );
  apb_slave slave ( .clk(clk), .n_rst(n_rst), .data_ready(data_ready), 
        .overrun_error(overrun_error), .framing_error(framing_error), .psel(
        psel), .penable(penable), .pwrite(pwrite), .paddr(paddr), .rx_data(
        rx_data), .pwdata(pwdata), .data_read(data_read), .pslverr(pslverr), 
        .data_size(data_size), .prdata(prdata), .bit_period(bit_period) );
endmodule

