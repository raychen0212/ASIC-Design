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
module sr_9bit (input logic clk, n_rst, shift_strobe, serial_in, input logic [3:0] data_size, output logic [7:0]packet_data, output logic stop_bit);
logic [8:0] par_reg;
flex_stp_sr #(.NUM_BITS(9),.SHIFT_MSB(0))sr9(.clk(clk),.n_rst(n_rst), .shift_enable(shift_strobe),.serial_in(serial_in),
.parallel_out(par_reg));

always_comb begin: OUTPUT
    packet_data = '0;
    if (data_size == 4'd5) begin
        packet_data = {1'b0,1'b0,1'b0,par_reg[7:3]};
    end
    else if (data_size == 4'd7) begin
        packet_data = {1'b0, par_reg[7:1]};
    end
    else if (data_size == 4'd8) begin
        packet_data = par_reg;
    end
end
assign stop_bit = par_reg[8];
endmodule