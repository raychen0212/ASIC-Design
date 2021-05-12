module rx_fifo_full 
(
input logic clk, n_rst, d_edge, shift_en, byte_detect, eop, input logic [7:0]s_val,
output logic [7:0] rx_packet_data
);
    logic [7:0]rx_data;
    logic rx_data_ready;
    logic rx_transfer_active;
    logic rx_error;
    logic clr;
    logic store_rx_data;
    logic [2:0]rx_packet;
    rx_rcu controller(.clk(clk), .n_rst(n_rst), .d_edge(d_edge), .shift_en(shift_en), .byte_detect(byte_detect), .eop(eop), .s_val(s_val),
    .rx_data_ready(rx_data_ready), .rx_transfer_active(rx_transfer_active), .rx_error(rx_error), .clr(clr), .store_rx_data(store_rx_data), .rx_packet(rx_packet), .rx_data(rx_data));

    rx_fifo buffer(.clk(clk), .n_rst(n_rst), .load_buffer(byte_detect), .packet_data(rx_data), .rx_packet_data(rx_packet_data));
    endmodule