// $Id: $
// File name:   rcu.sv
// Created:     2/26/2021
// Author:      Jhen-Ruei Chen
// Lab Section: 337-08
// Version:     1.0  Initial Design Entry
// Description: Receiver Control Unit (RCU)
// Required Module Name: rcu
// Required Filename: rcu.sv3
// Required Ports: 
// Input: clk, n_rst, start_bit_detected, packet_done, framing_error
// Output: sbc_clear, sbc_enable, load_buffer, enable_timer
module rcu(input logic clk, n_rst, start_bit_detected, packet_done, framing_error, output logic sbc_clear, sbc_enable, load_buffer, enable_timer);
typedef enum bit[2:0] {IDLE, START, DATA_COLLECT, STOP, HOLD, LOAD} stateType;
stateType state;
stateType nxt_state;
always_ff@(posedge clk, negedge n_rst) begin: INPUT_LOGIC
    if(n_rst == 0) begin
        state <= IDLE;
    end
    else begin
        state <= nxt_state;
    end
end
always_comb begin: NEXTSTATE_LOGIC
    nxt_state = state;
    case(state)
        IDLE:
            if(start_bit_detected)begin
                nxt_state = START;
            end
            else begin
                nxt_state = IDLE;
            end
        START:
            nxt_state = DATA_COLLECT;
        DATA_COLLECT:
            if(packet_done == 1)begin
                nxt_state = STOP;
            end
            else begin
                nxt_state = DATA_COLLECT;
            end
        STOP:
            nxt_state = HOLD;
        HOLD:
            if(framing_error == 1)begin
                nxt_state = IDLE;
            end
            else begin
                nxt_state = LOAD;
            end
        LOAD:
            nxt_state = IDLE;
        
    endcase
end
assign sbc_clear = (state == START)?1:0;
assign enable_timer = (state == DATA_COLLECT)?1:0;
assign sbc_enable = (state == STOP)?1:0;
assign load_buffer = (state == LOAD)?1:0;
endmodule