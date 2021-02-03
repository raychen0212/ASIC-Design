// $Id: $
// File name:   adder_1bit.sv
// Created:     1/29/2021
// Author:      Jhen-Ruei Chen
// Lab Section: 337-08
// Version:     1.0  Initial Design Entry
// Description: 1-bit Full Adder Design
// Required Module Name: adder_1bit
// Required Filename: adder_1bit.sv
// Required Ports:
// input: a, b, carry_in
// output: sum, carry_out
module adder_1bit(input wire a, input wire b, input wire carry_in, output wire sum, output wire carry_out);
assign sum = carry_in ^ (a ^ b);
assign carry_out = ((!carry_in) && b && a) || (carry_in && (b || a));
endmodule