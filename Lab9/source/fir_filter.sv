// $Id: $
// File name:   fir_filter.sv
// Created:     3/27/2021
// Author:      Jhen-Ruei Chen
// Lab Section: 337-08
// Version:     1.0  Initial Design Entry
// Description: FIR Filter Module
// Required Module Name: fir_filter
// Required Filename: fir_filter.sv
// Required Ports:
// Input: clk, n_reset, sample_data[15:0], data_ready, fir_coefficient[15:0], load_coeff
// Output: one_k_samples, modwait, fir_out[15:0], err
module fir_filter (input logic clk, n_reset, data_ready, load_coeff, input logic [15:0]sample_data, input logic[15:0]fir_coefficient,
output logic one_k_samples, modwait, err, output logic [15:0]fir_out);
    
logic overflow;
logic cnt_up;
logic clear;
logic [2:0]op;
logic [3:0]src1;
logic [3:0]src2;
logic [3:0]dest;
logic [16:0]out_data;

controller control_unit (.clk(clk), .n_rst(n_reset), .dr(data_ready), .lc(load_coeff), .overflow(overflow),
.cnt_up(cnt_up), .clear(clear), .modwait(modwait), .err(err), .op(op), .src1(src1), .src2(src2), .dest(dest));

counter countup (.clk(clk), .n_rst(n_reset), .cnt_up(cnt_up), .clear(clear), .one_k_samples(one_k_samples));

datapath dataset(.clk(clk), .n_reset(n_reset), .op(op), .src1(src1), .src2(src2), .dest(dest), .ext_data1(sample_data), .ext_data2(fir_coefficient),
.outreg_data(out_data), .overflow(overflow));

magnitude final_out(.in(out_data), .out(fir_out));



endmodule    



endmodule