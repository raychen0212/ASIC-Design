// $Id: $
// File name:   adder_nbit.sv
// Created:     1/31/2021
// Author:      Jhen-Ruei Chen
// Lab Section: 337-08
// Version:     1.0  Initial Design Entry
// Description: Scalable Ripple Carry Adder Design with Parameters
// Required Module Name: adder_nbit
// Required Filename: adder_nbit.sv
// Required Ports: 
// Input: a[#:0], b[#:0], carry_in
// Output: sum[#:0], overflow
`timescale 1ns / 100ps
module adder_nbit #(parameter BIT_WIDTH = 4)(input wire [(BIT_WIDTH-1):0] a, input wire [(BIT_WIDTH-1):0] b, input wire carry_in, output wire [(BIT_WIDTH-1):0] sum, output wire overflow);
 
wire [BIT_WIDTH:0]carrys;
genvar i;
assign carrys [0] = carry_in;
generate
    for (i = 0; i<BIT_WIDTH; i = i+1)
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
        always @(carrys[i])
        begin
            assert ((carrys[i]==1'b1) || (carrys[i]==1'b0))
            else $error("Input 'carrys' of component is not a digital logic value"); 
        end
        
    ///////////////////////////////////////////////////////////////////////////////
            adder_1bit IX (.a(a[i]), .b(b[i]), .carry_in(carrys[i]), .sum(sum[i]), .carry_out(carrys[i+1]));
        end
endgenerate
always@(a,b,carry_in)
begin
    #(2) assert((a+b+carry_in)=={overflow,sum})
    else $error ("Output 'sum' of first 16 bit adder is not correct.");
end	
assign overflow = carrys[BIT_WIDTH];
endmodule