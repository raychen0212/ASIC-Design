// $Id: $
// File name:   flex_pts_sr.sv
// Created:     2/25/2021
// Author:      Devansh Rathi
// Lab Section: 337-06
// Version:     1.0  Initial Design Entry
// Description: flexible parallel to serial register

module flex_pts_sr #(
    parameter NUM_BITS = 4,
    parameter SHIFT_MSB = 1'b0
) (
    input wire clk,
    input wire n_rst,
    input wire shift_enable,
    input wire load_enable,
    input wire [NUM_BITS - 1: 0] parallel_in,
    output reg serial_out
);
    reg [NUM_BITS - 1: 0] register;
    reg [NUM_BITS - 1: 0] next_register;
    reg next_serial_out;

    assign serial_out = SHIFT_MSB ? register[NUM_BITS - 1] : register[0];

    always_ff @( posedge clk, negedge n_rst ) begin : UPDATE
        if(n_rst == 1'b0) begin
            register <= {NUM_BITS{1'b1}}; 
        end else begin
            register <= next_register;
        end
    end
    
    always_comb begin : NEXT_STATE
        if(SHIFT_MSB == 1'b1) begin
            if(load_enable == 1'b1) begin
                next_register = parallel_in;
            end else begin
                if(shift_enable == 1'b1) begin
                    next_register = register << 1;
                    next_register[0] = 1'b1;
                end else begin
                    next_register = register;
                end
            end
            
        end
        else begin
            if(load_enable == 1'b1) begin
                next_register = parallel_in;
            end else begin
                if(shift_enable == 1'b1) begin
                    next_register = register >> 1;
                    next_register[NUM_BITS - 1] = 1'b1;
                end else begin
                    next_register = register;
                end 
            end
        
        end
    end
        
endmodule