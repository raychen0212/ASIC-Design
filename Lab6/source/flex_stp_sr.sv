// $Id: $
// File name:   flex_stp_sr
// Created:     2/22/2021
// Author:      Jhen-Ruei Chen
// Lab Section: 337-08
// Version:     1.0  Initial Design Entry
// Description: Flexible and Scalable Serial-to-Parallel Register Design
// Required Module Name: flex_stp_sr
// Required Filename: flex_stp_sr.sv
// Required Ports:
// Inputs: clk, n_rst, shift_enable, serial_in
// Output: parallel_out[#:0]
module flex_stp_sr #(parameter NUM_BITS = 4, parameter SHIFT_MSB = 1)(input wire clk, input wire n_rst, input wire shift_enable, input serial_in, output reg [NUM_BITS - 1:0]parallel_out);
reg [NUM_BITS-1:0]nxt_state;

always_ff @( posedge clk, negedge n_rst ) begin : INPUT_LOGIC
        if (n_rst == 1'b0)
        begin
            parallel_out <= '1;
        end
        else begin
            parallel_out<= nxt_state;
        end
end
always_comb begin: NEXTSTATE_LOGIC
    nxt_state = parallel_out;
    if (shift_enable == 1) begin
        if (SHIFT_MSB == 1) begin
            nxt_state = {parallel_out[NUM_BITS-2:0], serial_in};
        end
        else begin
            nxt_state = {serial_in, parallel_out[NUM_BITS-1:1]};
        end
    end
    else begin
        nxt_state = parallel_out;
    end
end
endmodule   

