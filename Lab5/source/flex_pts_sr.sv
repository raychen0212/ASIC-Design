// $Id: $
// File name:   flex_pts_sr.sv
// Created:     2/22/2021
// Author:      Jhen-Ruei Chen
// Lab Section: 337-08
// Version:     1.0  Initial Design Entry
// Description: Flexible and Scalable Parallel-to-Serial Shift Register Design
// Required Module Name: flex_pts_sr
// Required Filename: flex_pts_sr.sv
// Required Ports:
// Input: clk, n_rst, shift_enable, load_enable, parallel_in[#:0]
// Output: serial_out
module flex_pts_sr #(parameter NUM_BITS = 4, parameter SHIFT_MSB = 1)(input wire clk, input wire n_rst, input wire load_enable,
input wire shift_enable, input wire [NUM_BITS - 1:0]parallel_in, output wire serial_out);
reg [NUM_BITS - 1 : 0]nxt_state;
reg [NUM_BITS - 1 : 0]state;
always_ff @ (posedge clk, negedge n_rst) begin: INPUT_LOGIC
    if(n_rst == 0) begin
        state <= '1;
    end
    else begin
        state <= nxt_state;
    end
end
always_comb begin: NEXTSTATE_LOGIC
    nxt_state = state;
    if (load_enable == 1) begin
        nxt_state = parallel_in;
    end
    else begin
        if ((shift_enable == 1) && (SHIFT_MSB == 1)) begin
            nxt_state = {state[NUM_BITS-2:0], 1'b1};
            end
        else if ((shift_enable == 1) && (SHIFT_MSB == 0)) begin
            nxt_state = {1'b1, state[NUM_BITS-1:1]};
        end
    end
end

assign serial_out = (SHIFT_MSB == 1)? state[NUM_BITS - 1]:state[0];

endmodule