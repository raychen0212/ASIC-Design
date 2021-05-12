`timescale 1ns / 10ps

module tx_rcu (
    input logic clk,
    input logic n_rst, 
    input logic [2:0] TX_packet,
    input logic [6:0] buffer_occupancy,
    input logic shift_enable, 
    input logic byte_sent, 
    input logic [2:0] curr_proc,
    output logic load_sync, 
    output logic load_pid, 
    output logic TX_transfer_active, 
    output logic get_TX_packet_data,
    output logic TX_err,
    output logic load_enable,
    output logic send_eop,
    output logic save_next_proc,
    output logic [2:0] next_proc,
    output logic enable_crc_data, 
    output logic enable_crc_token,
    output logic [1:0] load_crc
);

    typedef enum bit [4:0] {
        IDLE,
        EIDLE,
        SEND_SYNC_BYTE, 
        WAIT_SYNC, 
        SEND_PID_BYTE, 
        WAIT_PID, 
        END_DATA1, 
        END_DATA2, 
        CHECK_PROC,
        FETCH_DATA, 
        LOAD_DATA, 
        WAIT_SEND_DATA,
        CHECK_BUFFER_DATA,
        LOAD_CRC1,
        WAIT_SEND_CRC1,
        LOAD_CRC2,
        WAIT_SEND_CRC2,
        FETCH_ADDR1,
        LOAD_ADDR1,
        WAIT_SEND_ADDR1,
        CHECK_BUFFER_ADDR,
        FETCH_ADDR2,
        APPEND_CRC,
        LOAD_ADDR2,
        WAIT_SEND_ADDR2
    } stateType;
    
    stateType state;
    stateType nxt_state;

    // logic [2:0] temp;
    // assign temp = 3'd1;

    // logic [2:0] next_proc;
    // logic [2:0] nxt_proc;

    always_ff @( posedge clk, negedge n_rst ) begin : UPDATE_STATE
        if(n_rst == 1'b0) begin
            state <= IDLE;
        end else begin
            state <= nxt_state;
        end
    end

    always_comb begin : NXT_STATE_LOGIC
        case (state)
            IDLE: begin
                if(TX_packet <= 3'd5 && TX_packet >= 3'd1) begin
                    nxt_state = SEND_SYNC_BYTE;    
                end else begin
                    nxt_state = IDLE;
                end
            end 
            EIDLE: begin
                if(TX_packet <= 3'd5 && TX_packet >= 3'd1) begin
                    nxt_state = SEND_SYNC_BYTE;    
                end else begin
                    nxt_state = EIDLE;
                end
            end 
            SEND_SYNC_BYTE: begin
                nxt_state = WAIT_SYNC;
            end 
            WAIT_SYNC: begin
                if(byte_sent == 1'b1) begin
                    nxt_state = SEND_PID_BYTE;
                end else begin
                    nxt_state = WAIT_SYNC;
                end
            end 
            SEND_PID_BYTE: begin
                nxt_state = WAIT_PID;
            end
            WAIT_PID: begin
                if(byte_sent == 1'b1) begin
                    nxt_state = CHECK_PROC;
                end else begin
                    nxt_state = WAIT_PID;
                end
            end 
            CHECK_PROC: begin
                if(buffer_occupancy == 7'd0) begin
                    nxt_state = EIDLE;
                end else begin
                    if(curr_proc == 3'd4 || curr_proc == 3'd5) begin
                        nxt_state = FETCH_DATA;
                    end else begin
                        nxt_state = FETCH_ADDR1;
                    end
                end
            end
            FETCH_DATA: begin
                nxt_state = LOAD_DATA;
            end 
            LOAD_DATA: begin
                nxt_state = WAIT_SEND_DATA;
            end
            WAIT_SEND_DATA: begin
                if(byte_sent == 1'b1) begin
                    nxt_state = CHECK_BUFFER_DATA;
                end else begin
                    nxt_state = WAIT_SEND_DATA;
                end
            end 
            CHECK_BUFFER_DATA: begin
                if(buffer_occupancy == 7'd0) begin
                    nxt_state = LOAD_CRC1;
                end else begin
                    nxt_state = FETCH_DATA;
                end
            end 
            LOAD_CRC1: begin
                nxt_state = WAIT_SEND_CRC1;
            end
            WAIT_SEND_CRC1: begin
                if(byte_sent == 1'b1) begin
                    nxt_state = LOAD_CRC2;
                end else begin
                    nxt_state = WAIT_SEND_CRC1;
                end
            end
            LOAD_CRC2: begin
                nxt_state = WAIT_SEND_CRC2;
            end
            WAIT_SEND_CRC2: begin
                if(byte_sent == 1'b1) begin
                    nxt_state = END_DATA1;
                end else begin
                    nxt_state = WAIT_SEND_CRC2;
                end
            end
            FETCH_ADDR1: begin
                nxt_state = LOAD_ADDR1;
            end
            LOAD_ADDR1: begin
                nxt_state = WAIT_SEND_ADDR1;
            end
            WAIT_SEND_ADDR1: begin
                if(byte_sent == 1'b1) begin
                    nxt_state = CHECK_BUFFER_ADDR;
                end else begin
                    nxt_state = WAIT_SEND_ADDR1;
                end
            end
            CHECK_BUFFER_ADDR: begin
                if(buffer_occupancy == 7'd0) begin
                    nxt_state = EIDLE;
                end else begin
                    nxt_state = FETCH_ADDR2;
                end
            end 
            FETCH_ADDR2: begin
                nxt_state = LOAD_ADDR2;
            end
            // APPEND_CRC: begin
            //     nxt_state = LOAD_ADDR2;
            // end
            LOAD_ADDR2: begin
                nxt_state = WAIT_SEND_ADDR2;
            end
            WAIT_SEND_ADDR2: begin
                if(byte_sent == 1'b1) begin
                    nxt_state = END_DATA1;
                end else begin
                    nxt_state = WAIT_SEND_ADDR2;
                end
            end
            END_DATA1: begin
                if(shift_enable == 1'b1) begin
                    nxt_state = END_DATA2;
                end else begin
                    nxt_state = END_DATA1;
                end
            end 
            END_DATA2: begin
                if(shift_enable == 1'b1) begin
                    nxt_state = IDLE;
                end else begin
                    nxt_state = END_DATA2;
                end 
            end
            default: begin
                nxt_state = IDLE;
            end
        endcase
    end

    always_comb begin : OUTPUT_LOGIC
        case (state)
            IDLE: begin
                load_sync = 1'b0;
                load_pid = 1'b0;
                TX_transfer_active = 1'b0; 
                get_TX_packet_data = 1'b0;
                TX_err = 1'b0;
                load_enable = 1'b0;
                send_eop = 1'b0;
                next_proc = TX_packet;
                save_next_proc = 1'b1;
                enable_crc_data = 1'b0;
                enable_crc_token = 1'b0;
                load_crc = 2'b00;
            end 
            EIDLE: begin
                load_sync = 1'b0;
                load_pid = 1'b0;
                TX_transfer_active = 1'b0; 
                get_TX_packet_data = 1'b0;
                TX_err = 1'b1;
                load_enable = 1'b0;
                send_eop = 1'b0;
                next_proc = TX_packet;
                save_next_proc = 1'b1;
                enable_crc_data = 1'b0;
                enable_crc_token = 1'b0;
                load_crc = 2'b00;
            end 
            SEND_SYNC_BYTE: begin
                load_sync = 1'b1;
                load_enable = 1'b1;

                load_pid = 1'b0;
                get_TX_packet_data = 1'b0;
                send_eop = 1'b0;
                enable_crc_data = 1'b0;
                enable_crc_token = 1'b0;
                load_crc = 2'b00;

                TX_err = 1'b0;
                next_proc = 3'd0;
                save_next_proc = 1'b0;
                TX_transfer_active = 1'b1;
            end 
            WAIT_SYNC: begin
                load_sync = 1'b0;
                load_enable = 1'b0;

                load_pid = 1'b0;
                get_TX_packet_data = 1'b0;
                send_eop = 1'b0;
                enable_crc_data = 1'b0;
                enable_crc_token = 1'b0;
                load_crc = 2'b00;

                TX_err = 1'b0;
                next_proc = 3'd0;
                save_next_proc = 1'b0;
                TX_transfer_active = 1'b1; 
            end 
            SEND_PID_BYTE: begin
                load_enable = 1'b1;
                load_pid = 1'b1;

                load_sync = 1'b0;
                get_TX_packet_data = 1'b0;
                send_eop = 1'b0;
                enable_crc_data = 1'b0;
                enable_crc_token = 1'b0;
                load_crc = 2'b00;

                TX_err = 1'b0;
                next_proc = 3'd0;
                save_next_proc = 1'b0;
                TX_transfer_active = 1'b1; 
            end
            WAIT_PID: begin
                load_enable = 1'b0;
                load_pid = 1'b0;
                
                load_sync = 1'b0;
                get_TX_packet_data = 1'b0;
                send_eop = 1'b0;
                enable_crc_data = 1'b0;
                enable_crc_token = 1'b0;
                load_crc = 2'b00;

                TX_err = 1'b0;
                next_proc = 3'd0;
                save_next_proc = 1'b0;
                TX_transfer_active = 1'b1; 
            end 
            CHECK_PROC: begin
                load_enable = 1'b0;
                load_pid = 1'b0;
                load_sync = 1'b0;
                get_TX_packet_data = 1'b0;
                send_eop = 1'b0;
                enable_crc_data = 1'b0;
                enable_crc_token = 1'b0;
                load_crc = 2'b00;

                TX_err = 1'b0;
                next_proc = 3'd0;
                save_next_proc = 1'b0;
                TX_transfer_active = 1'b1; 
            end
            FETCH_DATA: begin
                get_TX_packet_data = 1'b1;
                enable_crc_data = 1'b1;

                enable_crc_token = 1'b0;
                load_crc = 2'b00;

                load_enable = 1'b0;
                load_pid = 1'b0;
                load_sync = 1'b0;
                send_eop = 1'b0;
                

                TX_err = 1'b0;
                next_proc = 3'd0;
                save_next_proc = 1'b0;
                TX_transfer_active = 1'b1; 
            end 
            LOAD_DATA: begin
                get_TX_packet_data = 1'b0;
                load_enable = 1'b1;

                enable_crc_data = 1'b1;
                enable_crc_token = 1'b0;
                load_crc = 2'b00;

                load_pid = 1'b0;
                load_sync = 1'b0;
                send_eop = 1'b0;

                TX_err = 1'b0;
                next_proc = 3'd0;
                save_next_proc = 1'b0;
                TX_transfer_active = 1'b1; 
            end
            WAIT_SEND_DATA: begin
                load_enable = 1'b0;

                enable_crc_data = 1'b1;
                enable_crc_token = 1'b0;
                load_crc = 2'b00;

                get_TX_packet_data = 1'b0;
                load_pid = 1'b0;
                load_sync = 1'b0;
                send_eop = 1'b0;

                TX_err = 1'b0;
                next_proc = 3'd0;
                save_next_proc = 1'b0;
                TX_transfer_active = 1'b1; 
            end 
            CHECK_BUFFER_DATA: begin
                enable_crc_data = 1'b1;
                enable_crc_token = 1'b0;
                load_crc = 2'b00;

                load_enable = 1'b0;
                load_pid = 1'b0;
                load_sync = 1'b0;
                get_TX_packet_data = 1'b0;
                send_eop = 1'b0;

                TX_err = 1'b0;
                next_proc = 3'd0;
                save_next_proc = 1'b0;
                TX_transfer_active = 1'b1; 
            end 
            LOAD_CRC1: begin
                load_crc = 2'b10;
                load_enable = 1'b1;

                enable_crc_data = 1'b0;
                enable_crc_token = 1'b0;
                
                load_pid = 1'b0;
                load_sync = 1'b0;
                get_TX_packet_data = 1'b0;
                send_eop = 1'b0;

                TX_err = 1'b0;
                next_proc = 3'd0;
                save_next_proc = 1'b0;
                TX_transfer_active = 1'b1; 
            end
            WAIT_SEND_CRC1: begin
                load_crc = 2'b00;
                load_enable = 1'b0;

                enable_crc_data = 1'b0;
                enable_crc_token = 1'b0;
                
                
                load_pid = 1'b0;
                load_sync = 1'b0;
                get_TX_packet_data = 1'b0;
                send_eop = 1'b0;

                TX_err = 1'b0;
                next_proc = 3'd0;
                save_next_proc = 1'b0;
                TX_transfer_active = 1'b1; 
            end
            LOAD_CRC2: begin
                load_crc = 2'b01;
                load_enable = 1'b1;

                enable_crc_data = 1'b0;
                enable_crc_token = 1'b0;
                
                load_pid = 1'b0;
                load_sync = 1'b0;
                get_TX_packet_data = 1'b0;
                send_eop = 1'b0;

                TX_err = 1'b0;
                next_proc = 3'd0;
                save_next_proc = 1'b0;
                TX_transfer_active = 1'b1; 
            end
            WAIT_SEND_CRC2: begin
                load_crc = 2'b00;
                load_enable = 1'b0;

                enable_crc_data = 1'b0;
                enable_crc_token = 1'b0;
                
                
                load_pid = 1'b0;
                load_sync = 1'b0;
                get_TX_packet_data = 1'b0;
                send_eop = 1'b0;

                TX_err = 1'b0;
                next_proc = 3'd0;
                save_next_proc = 1'b0;
                TX_transfer_active = 1'b1; 
            end
            FETCH_ADDR1: begin
                get_TX_packet_data = 1'b1;

                enable_crc_data = 1'b0;
                enable_crc_token = 1'b1;
                load_crc = 2'b00;

                load_enable = 1'b0;
                load_pid = 1'b0;
                load_sync = 1'b0;
                send_eop = 1'b0;

                TX_err = 1'b0;
                next_proc = 3'd0;
                save_next_proc = 1'b0;
                TX_transfer_active = 1'b1; 
            end
            LOAD_ADDR1: begin
                get_TX_packet_data = 1'b0;
                load_enable = 1'b1;

                enable_crc_data = 1'b0;
                enable_crc_token = 1'b1;
                load_crc = 2'b00;

                load_pid = 1'b0;
                load_sync = 1'b0;
                send_eop = 1'b0;

                TX_err = 1'b0;
                next_proc = 3'd0;
                save_next_proc = 1'b0;
                TX_transfer_active = 1'b1; 
            end
            WAIT_SEND_ADDR1: begin
                load_enable = 1'b0;

                enable_crc_data = 1'b0;
                enable_crc_token = 1'b1;
                load_crc = 2'b00;

                load_pid = 1'b0;
                load_sync = 1'b0;
                send_eop = 1'b0;
                get_TX_packet_data = 1'b0;

                TX_err = 1'b0;
                next_proc = 3'd0;
                save_next_proc = 1'b0;
                TX_transfer_active = 1'b1; 
            end
            CHECK_BUFFER_ADDR: begin
                enable_crc_data = 1'b0;
                enable_crc_token = 1'b1;
                load_crc = 2'b00;

                load_pid = 1'b0;
                load_sync = 1'b0;
                send_eop = 1'b0;
                get_TX_packet_data = 1'b0;
                load_enable = 1'b0;


                TX_err = 1'b0;
                next_proc = 3'd0;
                save_next_proc = 1'b0;
                TX_transfer_active = 1'b1; 
            end
            FETCH_ADDR2: begin
                get_TX_packet_data = 1'b1;

                enable_crc_data = 1'b0;
                enable_crc_token = 1'b1;
                load_crc = 2'b00;

                load_enable = 1'b0;
                load_pid = 1'b0;
                load_sync = 1'b0;
                send_eop = 1'b0;

                TX_err = 1'b0;
                next_proc = 3'd0;
                save_next_proc = 1'b0;
                TX_transfer_active = 1'b1; 
            end
            // APPEND_CRC: begin
            //     get_TX_packet_data = 1'b0;

            //     enable_crc_data = 1'b0;
            //     enable_crc_token = 1'b0;
            //     load_crc = 2'b11;

            //     load_enable = 1'b0;
            //     load_pid = 1'b0;
            //     load_sync = 1'b0;
            //     send_eop = 1'b0;

            //     TX_err = 1'b0;
            //     next_proc = 3'd0;
            //     save_next_proc = 1'b0;
            //     TX_transfer_active = 1'b1; 
            // end
            LOAD_ADDR2: begin
                load_enable = 1'b1;
                load_crc = 2'b11;

                enable_crc_data = 1'b0;
                enable_crc_token = 1'b0;

                load_pid = 1'b0;
                load_sync = 1'b0;
                send_eop = 1'b0;
                get_TX_packet_data = 1'b0;

                TX_err = 1'b0;
                next_proc = 3'd0;
                save_next_proc = 1'b0;
                TX_transfer_active = 1'b1; 
            end
            WAIT_SEND_ADDR2: begin
                load_enable = 1'b0;
                load_crc = 2'b00;

                enable_crc_data = 1'b0;
                enable_crc_token = 1'b0;

                load_pid = 1'b0;
                load_sync = 1'b0;
                send_eop = 1'b0;
                get_TX_packet_data = 1'b0;

                TX_err = 1'b0;
                next_proc = 3'd0;
                save_next_proc = 1'b0;
                TX_transfer_active = 1'b1; 
            end
            END_DATA1: begin
                send_eop = 1'b1;

                load_enable = 1'b0;
                load_pid = 1'b0;
                load_sync = 1'b0;
                get_TX_packet_data = 1'b0;

                enable_crc_data = 1'b0;
                enable_crc_token = 1'b0;
                load_crc = 2'b00;

                TX_err = 1'b0;
                next_proc = 3'd0;
                save_next_proc = 1'b0;
                TX_transfer_active = 1'b1; 
            end 
            END_DATA2: begin
                send_eop = 1'b1;

                load_enable = 1'b0;
                load_pid = 1'b0;
                load_sync = 1'b0;
                get_TX_packet_data = 1'b0;

                enable_crc_data = 1'b0;
                enable_crc_token = 1'b0;
                load_crc = 2'b00;

                TX_err = 1'b0;
                next_proc = 3'd0;
                save_next_proc = 1'b0;
                TX_transfer_active = 1'b1; 
            end
            default: begin
                load_sync = 1'b0;
                load_pid = 1'b0;
                TX_transfer_active = 1'b0; 
                get_TX_packet_data = 1'b0;
                TX_err = 1'b0;
                load_enable = 1'b0;
                send_eop = 1'b0;
                next_proc = 3'd0;
                save_next_proc = 1'b0;
            end
        endcase
    end

endmodule