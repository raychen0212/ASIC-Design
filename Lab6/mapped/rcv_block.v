/////////////////////////////////////////////////////////////
// Created by: Synopsys DC Expert(TM) in wire load mode
// Version   : K-2015.06-SP1
// Date      : Mon Mar  1 20:15:28 2021
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
  wire   n15, n17, n19, n21, n23, n25, n27, n29, n30, n31, n1, n2, n3, n4, n5,
         n6, n7, n8, n9, n10, n11;

  DFFSR \rx_data_reg[7]  ( .D(n29), .CLK(clk), .R(1'b1), .S(n_rst), .Q(
        rx_data[7]) );
  DFFSR \rx_data_reg[6]  ( .D(n27), .CLK(clk), .R(1'b1), .S(n_rst), .Q(
        rx_data[6]) );
  DFFSR \rx_data_reg[5]  ( .D(n25), .CLK(clk), .R(1'b1), .S(n_rst), .Q(
        rx_data[5]) );
  DFFSR \rx_data_reg[4]  ( .D(n23), .CLK(clk), .R(1'b1), .S(n_rst), .Q(
        rx_data[4]) );
  DFFSR \rx_data_reg[3]  ( .D(n21), .CLK(clk), .R(1'b1), .S(n_rst), .Q(
        rx_data[3]) );
  DFFSR \rx_data_reg[2]  ( .D(n19), .CLK(clk), .R(1'b1), .S(n_rst), .Q(
        rx_data[2]) );
  DFFSR \rx_data_reg[1]  ( .D(n17), .CLK(clk), .R(1'b1), .S(n_rst), .Q(
        rx_data[1]) );
  DFFSR \rx_data_reg[0]  ( .D(n15), .CLK(clk), .R(1'b1), .S(n_rst), .Q(
        rx_data[0]) );
  DFFSR data_ready_reg ( .D(n31), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        data_ready) );
  DFFSR overrun_error_reg ( .D(n30), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        overrun_error) );
  OAI21X1 U3 ( .A(data_read), .B(n1), .C(n2), .Y(n31) );
  INVX1 U4 ( .A(load_buffer), .Y(n2) );
  INVX1 U5 ( .A(data_ready), .Y(n1) );
  NOR2X1 U6 ( .A(data_read), .B(n3), .Y(n30) );
  AOI21X1 U7 ( .A(load_buffer), .B(data_ready), .C(overrun_error), .Y(n3) );
  INVX1 U8 ( .A(n4), .Y(n29) );
  MUX2X1 U9 ( .B(rx_data[7]), .A(packet_data[7]), .S(load_buffer), .Y(n4) );
  INVX1 U10 ( .A(n5), .Y(n27) );
  MUX2X1 U11 ( .B(rx_data[6]), .A(packet_data[6]), .S(load_buffer), .Y(n5) );
  INVX1 U12 ( .A(n6), .Y(n25) );
  MUX2X1 U13 ( .B(rx_data[5]), .A(packet_data[5]), .S(load_buffer), .Y(n6) );
  INVX1 U14 ( .A(n7), .Y(n23) );
  MUX2X1 U15 ( .B(rx_data[4]), .A(packet_data[4]), .S(load_buffer), .Y(n7) );
  INVX1 U16 ( .A(n8), .Y(n21) );
  MUX2X1 U17 ( .B(rx_data[3]), .A(packet_data[3]), .S(load_buffer), .Y(n8) );
  INVX1 U18 ( .A(n9), .Y(n19) );
  MUX2X1 U19 ( .B(rx_data[2]), .A(packet_data[2]), .S(load_buffer), .Y(n9) );
  INVX1 U20 ( .A(n10), .Y(n17) );
  MUX2X1 U21 ( .B(rx_data[1]), .A(packet_data[1]), .S(load_buffer), .Y(n10) );
  INVX1 U22 ( .A(n11), .Y(n15) );
  MUX2X1 U23 ( .B(rx_data[0]), .A(packet_data[0]), .S(load_buffer), .Y(n11) );
endmodule


module flex_counter_1 ( clk, n_rst, clear, count_enable, rollover_val, 
        count_out, rollover_flag );
  input [3:0] rollover_val;
  output [3:0] count_out;
  input clk, n_rst, clear, count_enable;
  output rollover_flag;
  wire   n42, n52, n53, n54, n55, n56, n2, n3, n4, n5, n6, n12, n13, n14, n15,
         n16, n17, n18, n19, n20, n21, n22, n23, n24, n25, n26, n27, n28, n29,
         n30, n31, n32, n33, n34, n35, n36, n37, n38, n39, n40, n41;

  DFFSR \count_out_reg[0]  ( .D(n56), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        count_out[0]) );
  DFFSR \count_out_reg[1]  ( .D(n55), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        count_out[1]) );
  DFFSR \count_out_reg[2]  ( .D(n54), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        count_out[2]) );
  DFFSR \count_out_reg[3]  ( .D(n53), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        count_out[3]) );
  DFFSR rollover_flag_reg ( .D(n52), .CLK(clk), .R(n_rst), .S(1'b1), .Q(n42)
         );
  BUFX2 U8 ( .A(n42), .Y(rollover_flag) );
  INVX1 U9 ( .A(n2), .Y(n56) );
  AOI22X1 U10 ( .A(count_out[0]), .B(n3), .C(count_enable), .D(n4), .Y(n2) );
  AOI21X1 U11 ( .A(n5), .B(count_out[0]), .C(clear), .Y(n4) );
  MUX2X1 U12 ( .B(n6), .A(n12), .S(count_out[1]), .Y(n55) );
  NAND2X1 U13 ( .A(n13), .B(count_out[0]), .Y(n6) );
  INVX1 U14 ( .A(n14), .Y(n54) );
  MUX2X1 U15 ( .B(n15), .A(n16), .S(n17), .Y(n14) );
  MUX2X1 U16 ( .B(n18), .A(n19), .S(count_out[3]), .Y(n53) );
  AOI21X1 U17 ( .A(n13), .B(n17), .C(n15), .Y(n19) );
  OAI21X1 U18 ( .A(count_out[1]), .B(n20), .C(n12), .Y(n15) );
  AOI21X1 U19 ( .A(n21), .B(n13), .C(n3), .Y(n12) );
  NAND2X1 U20 ( .A(n16), .B(count_out[2]), .Y(n18) );
  INVX1 U21 ( .A(n22), .Y(n16) );
  NAND3X1 U22 ( .A(count_out[1]), .B(count_out[0]), .C(n13), .Y(n22) );
  OAI21X1 U23 ( .A(n23), .B(n24), .C(n25), .Y(n52) );
  OAI21X1 U24 ( .A(n13), .B(n3), .C(rollover_flag), .Y(n25) );
  NOR2X1 U25 ( .A(clear), .B(count_enable), .Y(n3) );
  INVX1 U26 ( .A(n20), .Y(n13) );
  NAND3X1 U27 ( .A(n5), .B(n26), .C(count_enable), .Y(n20) );
  NAND3X1 U28 ( .A(n27), .B(n28), .C(n29), .Y(n5) );
  NOR2X1 U29 ( .A(n30), .B(n31), .Y(n29) );
  XNOR2X1 U30 ( .A(n32), .B(count_out[2]), .Y(n31) );
  XOR2X1 U31 ( .A(rollover_val[1]), .B(count_out[1]), .Y(n30) );
  XNOR2X1 U32 ( .A(rollover_val[0]), .B(count_out[0]), .Y(n27) );
  NAND2X1 U33 ( .A(n33), .B(count_enable), .Y(n24) );
  MUX2X1 U34 ( .B(n34), .A(n35), .S(n28), .Y(n33) );
  XNOR2X1 U35 ( .A(count_out[3]), .B(rollover_val[3]), .Y(n28) );
  MUX2X1 U36 ( .B(n36), .A(n37), .S(n32), .Y(n35) );
  NOR2X1 U37 ( .A(count_out[2]), .B(n38), .Y(n37) );
  XNOR2X1 U38 ( .A(n17), .B(n38), .Y(n36) );
  INVX1 U39 ( .A(count_out[2]), .Y(n17) );
  NAND3X1 U40 ( .A(count_out[2]), .B(n32), .C(n38), .Y(n34) );
  INVX1 U41 ( .A(rollover_val[2]), .Y(n32) );
  NAND3X1 U42 ( .A(n39), .B(n26), .C(n40), .Y(n23) );
  XNOR2X1 U43 ( .A(rollover_val[0]), .B(n21), .Y(n40) );
  INVX1 U44 ( .A(clear), .Y(n26) );
  XOR2X1 U45 ( .A(count_out[1]), .B(n41), .Y(n39) );
  AOI21X1 U46 ( .A(n21), .B(rollover_val[1]), .C(n38), .Y(n41) );
  NOR2X1 U47 ( .A(rollover_val[0]), .B(rollover_val[1]), .Y(n38) );
  INVX1 U48 ( .A(count_out[0]), .Y(n21) );
endmodule


module flex_counter_0 ( clk, n_rst, clear, count_enable, rollover_val, 
        count_out, rollover_flag );
  input [3:0] rollover_val;
  output [3:0] count_out;
  input clk, n_rst, clear, count_enable;
  output rollover_flag;
  wire   n1, n2, n3, n4, n5, n6, n12, n13, n14, n15, n16, n17, n18, n19, n20,
         n21, n22, n23, n24, n25, n26, n27, n28, n29, n30, n31, n32, n33, n34,
         n35, n36, n37, n38, n39, n40, n41, n42, n43, n44, n45;

  DFFSR \count_out_reg[0]  ( .D(n41), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        count_out[0]) );
  DFFSR \count_out_reg[1]  ( .D(n42), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        count_out[1]) );
  DFFSR \count_out_reg[2]  ( .D(n43), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        count_out[2]) );
  DFFSR \count_out_reg[3]  ( .D(n44), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        count_out[3]) );
  DFFSR rollover_flag_reg ( .D(n45), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        rollover_flag) );
  INVX1 U8 ( .A(n1), .Y(n41) );
  AOI22X1 U9 ( .A(count_out[0]), .B(n2), .C(count_enable), .D(n3), .Y(n1) );
  AOI21X1 U10 ( .A(n4), .B(count_out[0]), .C(clear), .Y(n3) );
  MUX2X1 U11 ( .B(n5), .A(n6), .S(count_out[1]), .Y(n42) );
  NAND2X1 U12 ( .A(n12), .B(count_out[0]), .Y(n5) );
  INVX1 U13 ( .A(n13), .Y(n43) );
  MUX2X1 U14 ( .B(n14), .A(n15), .S(n16), .Y(n13) );
  MUX2X1 U15 ( .B(n17), .A(n18), .S(count_out[3]), .Y(n44) );
  AOI21X1 U16 ( .A(n12), .B(n16), .C(n14), .Y(n18) );
  OAI21X1 U17 ( .A(count_out[1]), .B(n19), .C(n6), .Y(n14) );
  AOI21X1 U18 ( .A(n20), .B(n12), .C(n2), .Y(n6) );
  NAND2X1 U19 ( .A(n15), .B(count_out[2]), .Y(n17) );
  INVX1 U20 ( .A(n21), .Y(n15) );
  NAND3X1 U21 ( .A(count_out[1]), .B(count_out[0]), .C(n12), .Y(n21) );
  OAI21X1 U22 ( .A(n22), .B(n23), .C(n24), .Y(n45) );
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


module timer ( clk, n_rst, enable_timer, shift_enable, packet_done );
  input clk, n_rst, enable_timer;
  output shift_enable, packet_done;


  flex_counter_1 clk_divider ( .clk(clk), .n_rst(n_rst), .clear(packet_done), 
        .count_enable(enable_timer), .rollover_val({1'b1, 1'b0, 1'b1, 1'b0}), 
        .rollover_flag(shift_enable) );
  flex_counter_0 bit_counter ( .clk(clk), .n_rst(n_rst), .clear(packet_done), 
        .count_enable(shift_enable), .rollover_val({1'b1, 1'b0, 1'b0, 1'b1}), 
        .rollover_flag(packet_done) );
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
  INVX1 U6 ( .A(n4), .Y(sbc_enable) );
  INVX1 U7 ( .A(n5), .Y(sbc_clear) );
  NAND3X1 U8 ( .A(n6), .B(n7), .C(n4), .Y(nxt_state[2]) );
  NAND3X1 U9 ( .A(n8), .B(n5), .C(n7), .Y(nxt_state[1]) );
  NAND3X1 U10 ( .A(n9), .B(n10), .C(state[0]), .Y(n5) );
  NAND3X1 U11 ( .A(n11), .B(n6), .C(n12), .Y(nxt_state[0]) );
  AOI22X1 U12 ( .A(n13), .B(state[0]), .C(packet_done), .D(enable_timer), .Y(
        n12) );
  INVX1 U13 ( .A(n7), .Y(n13) );
  NAND3X1 U14 ( .A(n4), .B(n14), .C(state[1]), .Y(n7) );
  NAND3X1 U15 ( .A(state[0]), .B(n10), .C(state[1]), .Y(n4) );
  NAND3X1 U16 ( .A(n15), .B(n9), .C(n16), .Y(n6) );
  NOR2X1 U17 ( .A(framing_error), .B(n10), .Y(n16) );
  NAND3X1 U18 ( .A(n17), .B(n9), .C(start_bit_detected), .Y(n11) );
  NOR2X1 U19 ( .A(n10), .B(n18), .Y(load_buffer) );
  NAND2X1 U20 ( .A(state[0]), .B(n9), .Y(n18) );
  INVX1 U21 ( .A(state[1]), .Y(n9) );
  INVX1 U22 ( .A(n8), .Y(enable_timer) );
  NAND2X1 U23 ( .A(n17), .B(state[1]), .Y(n8) );
  INVX1 U24 ( .A(n14), .Y(n17) );
  NAND2X1 U25 ( .A(n15), .B(n10), .Y(n14) );
  INVX1 U26 ( .A(state[2]), .Y(n10) );
  INVX1 U27 ( .A(state[0]), .Y(n15) );
endmodule


module rcv_block ( clk, n_rst, serial_in, data_read, rx_data, data_ready, 
        overrun_error, framing_error );
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
        .shift_enable(shift_strobe), .packet_done(packet_done) );
  rcu receiver_control ( .clk(clk), .n_rst(n_rst), .start_bit_detected(
        start_bit_detected), .packet_done(packet_done), .framing_error(
        framing_error), .sbc_clear(sbc_clear), .sbc_enable(sbc_enable), 
        .load_buffer(load_buffer), .enable_timer(enable_timer) );
endmodule

