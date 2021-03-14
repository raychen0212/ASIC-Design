// $Id: $
// File name:   rcv_block.sv
// Created:     2/26/2021
// Author:      Jhen-Ruei Chen
// Lab Section: 337-08
// Version:     1.0  Initial Design Entry
// Description: Receiver Block
// Required Module Name: rcv_block
// Required Filename: rcv_block.sv
// Required Ports:
// Input: clk, n_rst, serial_in, data_read
// Output: rx_data[7:0], data_ready, overrun_error, framming_error
module rcv_block (input logic clk, n_rst, serial_in, data_read, output logic [7:0]rx_data, output logic data_ready, overrun_error, framing_error);
logic shift_strobe;
logic stop_bit;
logic start_bit_detected;
logic new_bit;
logic sbc_enable;
logic sbc_clear;
logic load_buffer;
logic [7:0]packet_data;
logic enable_timer;
logic packet_done;

sr_9bit s9 (.clk(clk),.n_rst(n_rst),.serial_in(serial_in),.shift_strobe(shift_strobe),.packet_data(packet_data),.stop_bit(stop_bit));

start_bit_det start (.clk(clk),.n_rst(n_rst),.serial_in(serial_in),.start_bit_detected(start_bit_detected),.new_package_detected(new_bit));

stop_bit_chk stopbit_checker(.clk(clk),.n_rst(n_rst),.sbc_clear(sbc_clear),.sbc_enable(sbc_enable),.stop_bit(stop_bit),
.framing_error(framing_error));

rx_data_buff check_buffer(.clk(clk),.n_rst(n_rst),.load_buffer(load_buffer),.packet_data(packet_data),.data_read(data_read),
.rx_data(rx_data),.data_ready(data_ready),.overrun_error(overrun_error));

timer timecode (.clk(clk),.n_rst(n_rst),.enable_timer(enable_timer),.shift_enable(shift_strobe),.packet_done(packet_done));

rcu receiver_control(.clk(clk),.n_rst(n_rst),.start_bit_detected(start_bit_detected),.packet_done(packet_done),
.framing_error(framing_error),.sbc_clear(sbc_clear),.sbc_enable(sbc_enable),.load_buffer(load_buffer),.enable_timer(enable_timer));
endmodule