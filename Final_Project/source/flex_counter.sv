// $Id: $
// File name:   flex_counter.sv
// Created:     2/10/2021
// Author:      Jhen-Ruei Chen
// Lab Section: 337-08
// Version:     1.0  Initial Design Entry
// Description: Flexible Counter Design
// Required Module Name: flex_counter
// Required Filename: flex_counter.sv
// Required Ports:
// Input: clk, n_rst, clear, count_enable, rollover_val[#:0]
// Output: count_out[#:0], rollover_flag
module flex_counter #(parameter NUM_CNT_BITS = 4)(input wire clk, input wire n_rst, input wire clear, input wire count_enable, input wire [NUM_CNT_BITS-1:0]rollover_val,
output reg [NUM_CNT_BITS-1:0]count_out, output reg rollover_flag);
    //reg [NUM_CNT_BITS-1:0] Q;
    logic [NUM_CNT_BITS-1:0] nextQ;
    //reg rollover;
    logic nextroll;
    always_ff @( posedge clk, negedge n_rst ) begin : INPUT_LOGIC
        if (n_rst == 1'b0)
        begin
            count_out <= '0;
            rollover_flag <= '0;
        end
        else begin
            count_out<= nextQ;
            rollover_flag <= nextroll;
        end
    end
    always_comb begin : NEXT
        nextroll = rollover_flag;
        nextQ = count_out;
        if(clear == 1) begin
                nextQ = '0;
                nextroll = '0;
            end
        else if (count_enable == 0)begin
            /*
            if(clear == 1)begin
                nextQ = '0;
                nextroll = '0;
            end
            else begin
            */
                nextQ = count_out;
                nextroll = rollover_flag;
            //end
        end
        else if (count_enable == 1)begin
            if (count_out == rollover_val) begin
                nextQ = 4'd1;
                nextroll = '0;
            end
            else if (count_out == rollover_val-1'b1)begin
                nextQ = count_out + 4'd1;
                nextroll = 1;
            end
            else begin
                nextQ = count_out + 4'd1;
            end
            
            
        end
        
    end
endmodule
