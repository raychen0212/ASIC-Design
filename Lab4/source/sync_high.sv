// $Id: $
// File name:   sync_high.sv
// Created:     2/8/2021
// Author:      Jhen-Ruei Chen
// Lab Section: 337-08
// Version:     1.0  Initial Design Entry
// Description: Reset to Logic High Synchronizer
// Required Module Name: sync_high
// Required Filename: sync_high.sv
// Required Ports:
// Input: clk, n_rst, async_in
// Output: sync_out
module sync_high (input wire clk, input wire n_rst, input wire async_in, output reg sync_out);
    reg data;
    always_ff @(posedge clk, negedge n_rst)
    begin: REG_LOGIC
        if(1'b0 == n_rst) begin
            data <= 1'b1;
            sync_out <= 1'b1;
        end
        else begin 
            data <= async_in;
            sync_out <= data;
        end
    end
endmodule