// $Id: $
// File name:   apb_uart_rx.sv
// Created:     3/22/2021
// Author:      Jhen-Ruei Chen
// Lab Section: 337-08
// Version:     1.0  Initial Design Entry
// Description: apb_uart_rx.sv

module apb_uart_rx (input logic clk, n_rst, serial_in, psel, penable, pwrite, input logic [2:0] paddr, input logic [7:0] pwdata,
output logic [7:0]prdata, output logic pslverr);

logic [3:0] data_size;
logic data_read;
logic [13:0] bit_period;
logic [7:0] rx_data;
logic overrun_error;
logic framing_error;
logic data_ready;

rcv_block rcv(.clk(clk), .n_rst(n_rst),.serial_in(serial_in), .data_read(data_read), .data_size(data_size), .bit_period(bit_period),
.data_ready(data_ready), .rx_data(rx_data), .overrun_error(overrun_error), .framing_error(framing_error));

apb_slave slave(.clk(clk), .n_rst(n_rst), .rx_data(rx_data), .data_ready(data_ready), .overrun_error(overrun_error), .framing_error(framing_error), .data_read(data_read),
.psel(psel), .paddr(paddr), .penable(penable), .pwrite(pwrite), .pwdata(pwdata), .prdata(prdata), .pslverr(pslverr), .data_size(data_size), .bit_period(bit_period));

endmodule
