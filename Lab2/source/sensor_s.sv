// $Id: $
// File name:   sensor_s.sv
// Created:     1/28/2021
// Author:      Jhen-Ruei Chen
// Lab Section: 337-08
// Version:     1.0  Initial Design Entry
// Description: Structural Style Sensor Error Detector Design
// input: inputs from sensors
// output: detector result.
module sensor_s(input wire [3:0] sensors, output wire error);

wire output1;
wire output2;
wire combineoutput1;

AND2X1 A1(sensors[3],sensors[1], output1);
AND2X1 A2(sensors[2], sensors[1], output2);
OR2X1 O1(output1, output2, combineoutput1);
OR2X1 O2(combineoutput1, sensors[0], error);
endmodule