// $Id: $
// File name:   flex_5bitcounter.sv
// Created:     2/14/2021
// Author:      Jhen-Ruei Chen
// Lab Section: 337-08
// Version:     1.0  Initial Design Entry
// Description: 5 bit wrapper counter
module flex_5bitcounter(
    input wire clk,
    input wire n_rst,
    input wire clear,
    input wire count_enable,
    input wire [4:0]rollover_val,
    output reg [4:0]count_out,
    output reg rollover_flag
);

flex_counter#(.NUM_CNT_BITS(5)) flex_5(.clk(clk),.n_rst(n_rst),.clear(clear),.count_enable(count_enable),.rollover_val(rollover_val),.count_out(count_out),.rollover_flag(rollover_flag));
endmodule