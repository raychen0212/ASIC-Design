// $Id: $
// File name:   moore.sv
// Created:     2/22/2021
// Author:      Jhen-Ruei Chen
// Lab Section: 337-08
// Version:     1.0  Initial Design Entry
// Description: Moore Machine "1101" Detector Design
// Required Module Name: moore
// Required Filename: moore.sv
// Required Ports:
// Input: clk, n_rst, i
// Output: o
module moore (input wire clk, input wire n_rst, input wire i, output reg o);
typedef enum bit[2:0] {WAIT, STATE_1, STATE_11, STATE110, STATE1101 } stateType;
stateType state;
stateType nxt_state;
always_ff@(posedge clk, negedge n_rst) begin: INPUT_LOGIC
    if (n_rst == 0)begin
        state <= WAIT;
    end
    else begin
        state<=nxt_state;
    end
end
always_comb begin:NEXTSTATE_LOGIC
    nxt_state = state;
    case(state)
        WAIT:
            if (i == 1)begin
                nxt_state = STATE_1;
            end
            else begin
                nxt_state = WAIT;
            end
        STATE_1:
            if(i==1) begin
                nxt_state = STATE_11;
            end
            else begin
                nxt_state = WAIT;
            end
        STATE_11:
            if(i == 1) begin
                nxt_state = STATE_11;
            end
            else begin
                nxt_state = STATE110;
            end
        STATE110: 
            if(i == 1) begin
                nxt_state = STATE1101;
            end
            else begin
                nxt_state = WAIT;
            end
        STATE1101:
            if(i == 1) begin
                nxt_state = STATE_11;
            end
            else begin
                nxt_state = WAIT;
            end
    endcase
end
always_comb begin: OUTPUT_LOGIC
    if (state == STATE1101) begin
        o = 1;
    end
    else begin
        o = 0;
    end
end
endmodule