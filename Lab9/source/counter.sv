// $Id: $
// File name:   counter.sv
// Created:     3/6/2021
// Author:      Jhen-Ruei Chen
// Lab Section: 337-08
// Version:     1.0  Initial Design Entry
// Description: Couter Unit
// Required Module Name: counter
// Required Filename: counter.sv
// Required Ports:
// Input: clk, n_rst, cnt_up, clear
// Output: one_k_samples
module counter (input logic clk, n_rst, cnt_up, clear, output logic one_k_samples);
    logic [9:0]counting;
    flex_counter #(.NUM_CNT_BITS (10))count_one_k(.clk(clk), .n_rst(n_rst), .clear(clear), .count_enable(cnt_up), .rollover_val(10'd1000), 
    .rollover_flag(one_k_samples), .count_out(counting));
    
endmodule