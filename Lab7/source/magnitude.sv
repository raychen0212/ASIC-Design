// $Id: $
// File name:   magnitude.sv
// Created:     3/6/2021
// Author:      Jhen-Ruei Chen
// Lab Section: 337-08
// Version:     1.0  Initial Design Entry
// Description: Magnitude
// Required Module Name: magnitude
// Required Filename: magnitude.sv
// Required Ports:
// Input: in[16:0]
// Output: out[15:0]
//
module magnitude (input wire [16:0]in, output wire [15:0]out);
    logic negative;
    logic [15:0]value;
    logic [15:0]comp;
    
    assign negative = in[16];
    assign value = in[15:0];
    assign comp = (~value) + 1;
    assign out = (in[16]==0)?in[15:0]:comp;
endmodule