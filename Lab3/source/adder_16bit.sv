// $Id: $
// File name:   adder_16bit
// Created:     2/4/2021
// Author:      Jhen-Ruei Chen
// Lab Section: 337-08
// Version:     1.0  Initial Design Entry
// Description: Efficient Non-Exhaustive Design Verification
// Required Module Name: adder_16bit
// Required Filename: adder_16bit.sv
// Required Ports: 
// Inputs: a[15:0], b[15:0], carry_in
// Outputs: sum[15:0], overflow
`timescale 1ns / 100ps
module adder_16bit
(
	input wire [15:0] a,
	input wire [15:0] b,
	input wire carry_in,
	output wire [15:0] sum,
	output wire overflow
);
	// STUDENT: Fill in the correct port map with parameter override syntax for using your n-bit ripple carry adder design to be an 8-bit ripple carry adder design
genvar i;
generate
    for (i = 0; i<15; i = i+1)
        begin //for loop begin

    //Testing /////////////////////////////////////////////////////////
        always @(a[i])
        begin
            assert ((a[i]==1'b1) || (a[i] ==1'b0))
            else $error("Input 'a' of component is not a digital logic value"); 
        end
        always @(b[i])
        begin
            assert ((b[i]==1'b1) || (b[i] ==1'b0))
            else $error("Input 'b' of component is not a digital logic value"); 
        end
        always @(carry_in)
    	begin
        	assert ((carry_in==1'b1) || (carry_in ==1'b0))
        	else $error("Input 'carry_in' of component is not a digital logic value"); 
    	end
		
	end
endgenerate
always@(a,b,carry_in)
begin
    #(2) assert((a+b+carry_in)=={overflow,sum})
    else $error ("Output 'sum' of first 16 bit adder is not correct.");
end	

adder_nbit#(.BIT_WIDTH(16)) ADDALL (.a(a[15:0]), .b(b[15:0]), .carry_in(carry_in), .sum(sum[15:0]), .overflow(overflow));
endmodule
