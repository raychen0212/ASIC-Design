// $Id: $
// File name:   adder_4bit.sv
// Created:     1/30/2021
// Author:      Jhen-Ruei Chen
// Lab Section: 337-08
// Version:     1.0  Initial Design Entry
// Description: 4-bit Full Adder Design
// Required Module Name: adder_4bit
// Required Filename: adder_4bit.sv
// Required Ports:
// Input: a[3:0], b[3:0], carry_in
// Output: sum[3:0], overflow      
module adder_4bit(input wire [3:0] a, input wire [3:0] b, input wire carry_in, output wire [3:0] sum, output wire overflow);

wire [2:0]carrys;
adder_1bit ADD0 (.a(a[0]), .b(b[0]), .carry_in(carry_in), .sum(sum[0]), .carry_out(carrys[0]));
adder_1bit ADD1 (.a(a[1]), .b(b[1]), .carry_in(carrys[0]), .sum(sum[1]), .carry_out(carrys[1]));
adder_1bit ADD2 (.a(a[2]), .b(b[2]), .carry_in(carrys[1]), .sum(sum[2]), .carry_out(carrys[2]));
adder_1bit ADD3 (.a(a[3]), .b(b[3]), .carry_in(carrys[2]), .sum(sum[3]), .carry_out(overflow));

/*wire [4:0]carrys;
genvar i;
assign carrys [0] = carry_in;
generate
    for (i = 0; i<=3; i = i+1)
        begin
            adder_1bit IX (.a(a[i]), .b(b[i]), .carry_in(carrys[i]), .sum(sum[i]), .carry_out(carrys[i+1]));
        end
endgenerate
assign overflow = carrys[4];
*/
endmodule
