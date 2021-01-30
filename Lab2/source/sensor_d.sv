// $Id: $
// File name:   sensor_d.sv
// Created:     1/29/2021
// Author:      Jhen-Ruei Chen
// Lab Section: 337-08
// Version:     1.0  Initial Design Entry
// Description: Dataflow Style Sensor Error Detector Specifications
// Required Module:senrsor_d
// Required Filename: sensor_d.sv
// Required Ports:
// Input: senrsors[3:0]
// Output: error
module sensor_d(input wire [3:0]sensors, output wire error);
wire output1;
wire output2;

assign output1 = sensors[2] && sensors [1];
assign output2 = sensors[3] && sensors [1];
assign error = output1 || output2 || sensors[0];
endmodule;