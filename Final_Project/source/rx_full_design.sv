module rx_full_design (input logic clk, n_rst, d_plus, d_minus,
output logic rx_data_ready, rx_transfer_active, rx_error, clr, store_rx_data, output logic [2:0] rx_packet, output logic [7:0] rx_data
);
    logic d_plus_out;
    logic d_minus_out;
    logic d_edge;
    logic eop;
    logic d_orig;
    logic shift_en;
    logic byte_detect;
    logic [7:0] s_val;
    logic [7:0] rx_packet_data;
    //logic rx_data_ready;
    //logic rx_transfer_active;
    //logic rx_error;
    //logic clr;
    //logic store_rx_data;
    //logic [2:0] rx_packet;
    //logic [7:0] rx_data;
    //logic [7:0] rx_packet_data;


    rx_sync_low sync_dplus (.clk(clk), .n_rst(n_rst), .async_in(d_plus), .sync_out(d_plus_out));

    rx_sync_low sync_dminus (.clk(clk), .n_rst(n_rst), .async_in(d_minus), .sync_out(d_minus_out));

    rx_edge_detector edging (.clk(clk), .n_rst(n_rst), .d_plus(d_plus_out), .edge_detect(d_edge));

    rx_eop_detect eop_func(.d_plus(d_plus_out), .d_minus(d_minus_out), .eop(eop));

    rx_decode decoder(.clk(clk), .n_rst(n_rst), .d_plus(d_plus_out), .shift_en(shift_en), .decoded(d_orig));

    rx_timer timer_rx(.clk(clk), .n_rst(n_rst), .enable_timer(rx_transfer_active), .shift_enable(shift_en), .packet_done(byte_detect));

    rx_sr_9bit shift(.clk(clk), .n_rst(n_rst), .shift_strobe(shift_en), .serial_in(d_orig), .packet_data(s_val));

    rx_rcu controller(.clk(clk), .n_rst(n_rst), .d_edge(d_edge), .shift_en(shift_en), .byte_detect(byte_detect), .eop(eop), .s_val(s_val),
    .rx_data_ready(rx_data_ready), .rx_transfer_active(rx_transfer_active), .rx_error(rx_error), .clr(clr), .store_rx_data(store_rx_data), .rx_packet(rx_packet), .rx_data(rx_data));

    rx_fifo buffer(.clk(clk), .n_rst(n_rst), .load_buffer(byte_detect), .packet_data(rx_data), .rx_packet_data(rx_packet_data));


endmodule