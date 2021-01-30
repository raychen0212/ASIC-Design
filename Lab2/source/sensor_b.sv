// $Id: $
// File name:   sensor_b.sv
// Created:     1/29/2021
// Author:      Jhen-Ruei Chen
// Lab Section: 337-08
// Version:     1.0  Initial Design Entry
// Description: Behavioral Style Sensor Error Detector Design
// Required Module Name: sensor_b
// Required Filename: sensor_b.sv
// Required Poarts:
// Input: sensors[3:0]
// Output: error
module sensor_b(input wire [3:0] sensors, output wire error);
reg output1;
reg output2;
reg tmp_err;
assign error = tmp_err;
always_comb 
begin
    tmp_err = 1'b0;
    if (sensors[0] == 1'b1)
        tmp_err = 1'b1;
    else if(sensors[1] && (sensors[2]||sensors[3]))
        tmp_err = 1'b1;
end

endmodule