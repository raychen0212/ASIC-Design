// $Id: $
// File name:   rx_rcu.sv
// Created:     4/22/2021
// Author:      Jhen-Ruei Chen
// Lab Section: 337-08
// Version:     1.0  Initial Design Entry
// Description: Controller for this project (RX)

module rx_rcu(input logic clk, n_rst, d_edge, shift_en, byte_detect, eop, input logic [7:0] s_val, 
output logic rx_data_ready, rx_transfer_active, rx_error, clr, store_rx_data, output logic [2:0] rx_packet, output logic [7:0] rx_data);

typedef enum bit[4:0] {IDLE, SYNC, PID, IN1, IN2, OUT1, OUT2, DATA0, DATA0_WAIT1, DATA0_WAIT2, DATA1, DATA1_WAIT1, DATA1_WAIT2, ACK, NAK, STALL, EOP} stateType;
stateType state;
stateType nxt_state;
//logic nxt_err;
localparam PID_OUT = 8'b00011110;
localparam PID_IN = 8'b10010110;
localparam PID_DATA0 = 8'b00111100;
localparam PID_DATA1 = 8'b10110100;
localparam PID_ACK = 8'b00101101;
localparam PID_NAK = 8'b10100101;
localparam PID_STALL = 8'b11100001;

always_ff@(posedge clk, negedge n_rst)begin
    if(!n_rst) begin
        state <= IDLE;
        //rx_error <= 1'b0;
    end
    else begin
        state <= nxt_state;
        //rx_error <= nxt_err;
    end
end

always_comb begin : NXT_STATE_LOGIC
    nxt_state = state;
    //nxt_err = 1'b0;
    rx_error = '0;
    clr = 1'b0;
    rx_transfer_active = 1'b1;
    case (state)
        IDLE: begin
            rx_transfer_active = 1'b0;
            if(d_edge == 1)begin
                nxt_state = SYNC;
            end
            else begin
                nxt_state = IDLE;
            end
        end
        SYNC: begin
            nxt_state = SYNC;
            if (byte_detect == 1) begin
                if(s_val == 8'b10000000) begin
                    nxt_state = PID;
                    clr = 1'b1;
                end
                else begin
                    nxt_state = IDLE;
                end
            end
        end
        
        PID: begin
            nxt_state = PID;
            if (byte_detect) begin
                if (s_val == PID_OUT)begin
                    nxt_state = OUT1;
                    clr = 1'b1;
                end
                else if (s_val == PID_IN) begin
                    nxt_state = IN1;
                    clr = 1'b1;
                end
                else if (s_val == PID_DATA0) begin
                    nxt_state = DATA0;
                end
                else if (s_val == PID_DATA1) nxt_state = DATA1;
                else if (s_val == PID_ACK) nxt_state = ACK;
                else if (s_val == PID_NAK) nxt_state = NAK;
                else begin
                    nxt_state = STALL;
                end
            end
        end
        OUT1: begin
            nxt_state = OUT1;
            if (byte_detect) begin
                nxt_state = OUT2;
                //rx_transfer_active = 1'b1;
            end
        end
        OUT2: begin
            nxt_state = OUT2;
            if (byte_detect) begin
                nxt_state = EOP;
                //rx_transfer_active = 1'b1;
            end
        end
        IN1: begin
            nxt_state = IN1;
            if (byte_detect) begin
                nxt_state = IN2;
                //rx_transfer_active = 1'b1;
                end
        end
        IN2: begin
            nxt_state = IN2;
            if (byte_detect) begin
                nxt_state = EOP;
                //rx_transfer_active = 1'b1;
            end           
        end
        DATA0: begin
            rx_transfer_active = 1'b1;
            if(byte_detect) begin
                nxt_state = DATA0_WAIT1;
            end
            else nxt_state = STALL;
        end
        DATA0_WAIT1:begin
            rx_transfer_active = 1'b1;
            if(byte_detect) begin
                nxt_state = DATA0_WAIT2;
            end
            else begin
                nxt_state = STALL;
            end
        end
        DATA0_WAIT2:begin
            rx_transfer_active = 1'b1;
            if (eop) begin
                nxt_state = EOP;
            end
            else nxt_state = DATA0_WAIT2;
        end
        DATA1: begin
            rx_transfer_active = 1'b1;
            if(byte_detect) begin
                nxt_state = DATA1_WAIT1;
            end
            else nxt_state = STALL;
        end
        DATA1_WAIT1:begin
            rx_transfer_active = 1'b1;
            if(byte_detect) begin
                nxt_state = DATA1_WAIT2;
            end
            else begin
                nxt_state = STALL;
            end
        end
        DATA1_WAIT2:begin
            rx_transfer_active = 1'b1;
            if (eop) begin
                nxt_state = EOP;
            end
            else nxt_state = DATA1_WAIT2;
        end
        ACK: begin
            //rx_transfer_active = 1'b1;
            if(byte_detect) begin
                nxt_state = EOP;
            end
            else begin
                nxt_state = ACK;
            end
        end
        NAK: begin
            //rx_transfer_active = 1'b0;
            nxt_state = NAK;
            if(byte_detect) begin
                nxt_state = EOP;
            end
        end
        STALL: begin
            nxt_state = IDLE;
            rx_transfer_active = 1'b0;
            rx_error = 1'b1;
        end
        EOP: begin
            rx_transfer_active = 1'b0;
            nxt_state = IDLE;
            
        end
    endcase
end
always_comb begin : OUTPUT_LOGIC
    //rx_data_ready, store_rx_data, rx_data, rx_packet
    rx_data_ready = 1'b0;
    store_rx_data = 1'b0;
    rx_packet = '0;
    rx_data = '0;
    case(state)
        IN1:begin
            rx_packet = 3'b110;
        end
        IN2: begin
            rx_packet = 3'b110;
        end
        OUT1: begin
            rx_packet = 3'b111;
        end
        OUT2: begin
            rx_packet = 3'b111;
        end
        DATA0:begin
            store_rx_data = 1'b1;
            rx_data = s_val;
            rx_packet = 3'b100;
        end
        DATA0_WAIT1: begin
            store_rx_data = 1'b1;
            rx_data = s_val;
            rx_packet = 3'b100;
            
        end
        DATA0_WAIT2:begin
            store_rx_data = 1'b1;
            rx_data = s_val;
            rx_packet = 3'b100;   
        end
        DATA1:begin
            store_rx_data = 1'b1;
            rx_data = s_val;
            rx_packet = 3'b101;
        end
        DATA1_WAIT1: begin
            store_rx_data = 1'b1;
            rx_data = s_val;
            rx_packet = 3'b101;
        end
        DATA1_WAIT2:begin
            store_rx_data = 1'b1;
            rx_data = s_val;
            rx_packet = 3'b101;
        end
        ACK: begin
            rx_packet = 3'b001;
            rx_data_ready = 1'b1;
        end
        NAK: begin
            rx_packet = 3'b010;
            rx_data_ready = 1'b0;
        end
        STALL: begin
            rx_packet = 3'b011;
        end
        EOP: begin
            rx_data_ready = 1'b1;
        end
    endcase

end
endmodule