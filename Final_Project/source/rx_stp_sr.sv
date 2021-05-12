// $Id: $
// File name:   sr_9bit.sv
// Created:     2/26/2021
// Author:      Jhen-Ruei Chen
// Lab Section: 337-08
// Version:     1.0  Initial Design Entry
// Description: 9-bit Shift Register
// Required Module Name: sr_9bit
// Required Filenmae: sr_9bit.sv
// Required Ports:
// Input: clk, n_rst, shift_strobe, serial_in
// Output: packet_data[7:0], stop_bit
module rx_stp_sr (input logic clk, n_rst, shift_strobe, serial_in, output logic [7:0]packet_data);

flex_stp_sr #(.NUM_BITS(8),.SHIFT_MSB(1)) sr8 (.clk(clk),.n_rst(n_rst), .shift_enable(shift_strobe),.serial_in(serial_in),
.parallel_out(packet_data));

endmodule