// $Id: $
// File name:   ahb_lite_fir_filter.sv
// Created:     3/27/2021
// Author:      Jhen-Ruei Chen
// Lab Section: 337-08
// Version:     1.0  Initial Design Entry
// Description: AHB-Lite FIR Filter Accelerator
// Required Module Name: ahb_lite_fir_filter
// Required Filename: ahb_lite_fir_filter.sv
// Required Ports:
// Input: clk, n_rst, hsel, haddr[3:0], hsize,  htrans[1:0], hwrite, hwdata[15:0]
// Output: hrdata[15:0], hresp
module ahb_lite_fir_filter (input logic clk, n_rst, hsel, hsize, hwrite, input logic [3:0]haddr, input logic [1:0]htrans, input logic hwdata[15:0]
output logic hresp, output logic [15:0]hrdata);

logic [1:0]coefficient_num;
logic new_coefficient_set;
logic [15:0]fir_coefficient;
logic modwait;
logic err;
logic [15:0]fir_out;
logic [15:0]sample_data;
logic data_ready;
logic load_coeff;
logic one_k_samples;


ahb_lite_slave control (.clk(clk), .n_rst(n_rst), .modwait(modwait), .err(err), .hsel(hsel), .hwrite(hwrite), .coefficient_num(coefficient_num), .fir_out(fir_out), 
.haddr(haddr), .htrans(htrans), .hwdata(hwdata), .sample_data(sample_data), .data_ready(data_ready), .new_coefficient_set(new_coefficient_set), .hresp(hresp),
.fir_coefficient(fir_coefficient), .hrdata(hrdata));

coefficient_loader loading (.clk(clk), .n_reset(n_rst), .new_coefficient_set(new_coefficient_set), .modwait(modwait),.load_coeff(load_coeff), .coefficient_num(coefficient_num));

fir_filter filter (.clk(clk), .n_reset(n_reset), .data_ready(data_ready), .load_coeff(load_coeff), .sample_data(sample_data), .fir_coefficient(fir_coefficient),
.one_k_samples(one_k_samples), .modwait(modwait), .err(err), .fir_out(fir_out));


endmodule