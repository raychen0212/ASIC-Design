module tx_db_wrapper (
    input logic clk, 
    input logic n_rst,
    input logic [2:0] TX_packet,
    input logic [7:0] TX_data,
    input logic store_TX_data,
    input logic [7:0] RX_packet_data,
    input logic store_RX_packet_data,
    input logic clear,
    input logic flush,
    input logic get_RX_data,
    output logic [7:0] TX_packet_data,
    output logic [7:0] RX_data,
    output logic [6:0] buffer_occupancy,
    output logic get_TX_packet_data,
    output logic TX_transfer_active,
    output logic TX_err,
    output logic dplus_out, 
    output logic dminus_out
);

    tx_full_design TX (
        .clk( clk),
        .n_rst( n_rst),
        .TX_packet_data( TX_packet_data),
        .TX_packet( TX_packet),
        .buffer_occupancy( buffer_occupancy),
        .get_TX_packet_data( get_TX_packet_data),
        .TX_transfer_active( TX_transfer_active),
        .TX_err( TX_err),
        .dplus_out( dplus_out),
        .dminus_out( dminus_out)
    );
    
    data_buffer64 DATA_BUFFER (
        .clk( clk),
        .n_rst( n_rst),
        .TX_data( TX_data),
        .store_TX_data( store_TX_data),
        .RX_packet_data( RX_packet_data),
        .store_RX_packet_data( store_RX_packet_data),
        .clear( clear),
        .flush( flush),
        .get_TX_packet_data( get_TX_packet_data),
        .get_RX_data( get_RX_data),
        .RX_data( RX_data),
        .TX_packet_data( TX_packet_data),
        .buffer_occupancy( buffer_occupancy)
    );
endmodule