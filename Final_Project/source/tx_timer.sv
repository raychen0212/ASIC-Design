// $Id: $
// File name:   timer.sv
// Created:     3/4/2021
// Author:      Devansh Rathi
// Lab Section: 337-06
// Version:     1.0  Initial Design Entry
// Description: timer

`timescale 1ns / 10ps

module tx_timer (
    input wire clk, 
    input wire n_rst, 
    input wire enable_timer, 
    output reg shift_enable,
    output reg byte_sent
);

    localparam BIT_PERIOD = 8;
    localparam BIT_PERIOD_BITS = 4;

    localparam DATA_LEN = 8;
    localparam DATA_LEN_BITS = 4;

    wire [BIT_PERIOD_BITS - 1:0] clk_div;
    wire [DATA_LEN_BITS - 1:0] data_len;

    assign clk_div = BIT_PERIOD;
    assign data_len = DATA_LEN;

    flex_counter #(.NUM_CNT_BITS(BIT_PERIOD_BITS)) CLK_DIV (.clk(clk), .n_rst(n_rst), .clear(~enable_timer), 
    .count_enable(enable_timer), .rollover_val(clk_div), .count_out(), .rollover_flag(shift_enable));

    flex_counter #(.NUM_CNT_BITS(DATA_LEN_BITS)) PACKET (.clk(clk), .n_rst(n_rst), .clear(~enable_timer), 
    .count_enable(shift_enable), .rollover_val(data_len), .count_out(), .rollover_flag(byte_sent));

endmodule