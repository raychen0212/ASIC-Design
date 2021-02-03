/////////////////////////////////////////////////////////////
// Created by: Synopsys DC Expert(TM) in wire load mode
// Version   : K-2015.06-SP1
// Date      : Sat Jan 30 15:28:23 2021
/////////////////////////////////////////////////////////////


module adder_4bit ( a, b, carry_in, sum, overflow );
  input [3:0] a;
  input [3:0] b;
  output [3:0] sum;
  input carry_in;
  output overflow;

  tri   [3:0] a;
  tri   [3:0] b;
  tri   carry_in;
  tri   [3:0] sum;
  tri   overflow;
  tri   [2:0] carrys;

  adder_1bit ADD0 ( .a(a[0]), .b(b[0]), .carry_in(carry_in), .sum(sum[0]), 
        .carry_out(carrys[0]) );
  adder_1bit ADD1 ( .a(a[1]), .b(b[1]), .carry_in(carrys[0]), .sum(sum[1]), 
        .carry_out(carrys[1]) );
  adder_1bit ADD2 ( .a(a[2]), .b(b[2]), .carry_in(carrys[1]), .sum(sum[2]), 
        .carry_out(carrys[2]) );
  adder_1bit ADD3 ( .a(a[3]), .b(b[3]), .carry_in(carrys[2]), .sum(sum[3]), 
        .carry_out(overflow) );
endmodule

