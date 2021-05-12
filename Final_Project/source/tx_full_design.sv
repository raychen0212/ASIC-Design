module tx_full_design (
    input logic clk,
    input logic n_rst,
    input logic [7:0] TX_packet_data,
    input logic [2:0] TX_packet,
    input logic [6:0] buffer_occupancy,
    output logic get_TX_packet_data,
    output logic TX_transfer_active,
    output logic TX_err,
    output logic dplus_out, 
    output logic dminus_out
);

    logic load_sync;
    logic load_pid;
    logic byte_sent;
    logic shift_enable;
    logic load_enable;
    logic send_eop;
    logic [7:0] nxt_byte;
    logic out_bit;
    logic byte_sent_rising;
    
    logic [2:0] curr_proc;
    logic [2:0] next_proc;
    logic save_next_proc;

    logic [1:0] load_crc;
    logic enable_crc_data;
    logic enable_crc_token;

    logic [4:0] token_crc;
    logic [15:0] data_crc;
     
    tx_rcu TX_RCU (
        .clk(clk),
        .n_rst(n_rst),
        .TX_packet(TX_packet),
        .buffer_occupancy(buffer_occupancy),
        .shift_enable(shift_enable),
        .byte_sent(byte_sent_rising),
        .curr_proc(curr_proc),
        .load_sync(load_sync),
        .load_pid(load_pid),
        .TX_transfer_active(TX_transfer_active),
        .get_TX_packet_data(get_TX_packet_data),
        .TX_err(TX_err),
        .load_enable(load_enable),
        .send_eop(send_eop),
        .save_next_proc(save_next_proc),
        .next_proc(next_proc),
        .enable_crc_data(enable_crc_data),
        .enable_crc_token(enable_crc_token),
        .load_crc(load_crc)
    );

    crc_token CRC_TOKEN(
        .clk(clk),
        .n_rst(n_rst),
        .enable(enable_crc_token),
        .shift_enable(shift_enable),
        .data_stream(out_bit),
        .crc(token_crc)
    );

    crc_data CRC_DATA(
        .clk(clk),
        .n_rst(n_rst),
        .enable(enable_crc_data),
        .shift_enable(shift_enable),
        .data_stream(out_bit),
        .crc(data_crc)
    );

    always_ff @( posedge clk, negedge n_rst ) begin : CURR_PROC_BLOCK
        if(n_rst == 1'b0)begin
            curr_proc <= 0;
        end
        else begin
            if(save_next_proc == 1'b1) begin
                curr_proc <= next_proc;
            end
            else begin
                curr_proc <= curr_proc;
            end
        end
    end

    tx_rising_edge_detect RISING_EDGE_DETECT (
        .clk(clk),
        .n_rst(n_rst),
        .sync_in(byte_sent),
        .rising_edge_detect(byte_sent_rising)
    );

    tx_next_byte_logic TX_NEXT_BYTE_LOGIC (
        .TX_packet_data(TX_packet_data),
        .TX_packet(curr_proc),
        .load_sync(load_sync),
        .load_pid(load_pid),
        .load_crc(load_crc),
        .token_crc(token_crc),
        .data_crc(data_crc),
        .nxt_byte(nxt_byte)
    );

    tx_pts_sr TX_SHIFT_REGISTER (
        .clk(clk),
        .n_rst(n_rst),
        .shift_enable(shift_enable),
        .load_enable(load_enable),
        .nxt_byte(nxt_byte),
        .out_bit(out_bit)
    );

    tx_timer TX_TIMER (
        .clk(clk),
        .n_rst(n_rst),
        .enable_timer(TX_transfer_active),
        .shift_enable(shift_enable),
        .byte_sent(byte_sent)
    );

    tx_encoder TX_ENCODER (
        .clk(clk),
        .n_rst(n_rst),
        .out_bit(out_bit),
        .send_eop(send_eop),
        .shift_enable(shift_enable),
        .dplus_out(dplus_out),
        .dminus_out(dminus_out)
    );

endmodule