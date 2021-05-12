// $Id: $
// File name:   timer.sv
// Created:     2/26/2021
// Author:      Jhen-Ruei Chen
// Lab Section: 337-08
// Version:     1.0  Initial Design Entry
// Description: Timer Controller
// Required Module Name: timer
// Required Filename: timer.sv
// Required Ports:
// Input: clk, n_rst, enable_timer
// Output: shift_enable, packet_done
module rx_timer (input logic clk, n_rst, enable_timer, output logic shift_enable, packet_done);
logic [3:0]clk_count;
logic [3:0]bit_count;

flex_counter clk_divider(.clk(clk),.n_rst(n_rst), .count_enable(enable_timer), .clear(packet_done),.rollover_val(4'd8),
.count_out(clk_count),.rollover_flag(shift_enable));

flex_counter bit_counter(.clk(clk),.n_rst(n_rst), .count_enable(shift_enable), .clear(packet_done),.rollover_val(4'd8),
.count_out(bit_count),.rollover_flag(packet_done));

endmodule