module db_read_controller (
    input logic clk, 
    input logic n_rst, 
    input logic reset, 
    input logic get_TX_packet_data,
    input logic get_RX_data,
    output logic [5:0] r_sel,
    output logic RX_data_en, 
    output logic TX_packet_data_en, 
    output logic buffer_decrement
);

    logic [6:0] read_ptr;
    logic [6:0] nxt_read_ptr;

    logic nxt_buffer_decrement;

    always_ff @( posedge clk, negedge n_rst ) begin : INCREMENT_PTR
        if(n_rst == 1'b0) begin
            read_ptr <= 7'b0;
            buffer_decrement <= 1'b0;
        end else begin
            if(reset == 1'b1) begin
                read_ptr <= 7'b0;
                buffer_decrement <= 1'b0;
            end else begin
                read_ptr <= nxt_read_ptr;
                buffer_decrement <= nxt_buffer_decrement;
            end
        end
    end

    always_comb begin : OUTPUT_LOGIC
       if(get_TX_packet_data == 1'b1) begin
           r_sel = read_ptr[5:0];
           TX_packet_data_en = 1'b1;
           RX_data_en = 1'b0;
           nxt_read_ptr = read_ptr + 1;
           nxt_buffer_decrement = 1'b1;
       end else if(get_RX_data == 1'b1) begin
           r_sel = read_ptr[5:0];
           TX_packet_data_en = 1'b0;
           RX_data_en = 1'b1;
           nxt_read_ptr = read_ptr + 1;
           nxt_buffer_decrement = 1'b1;
       end else begin
           r_sel = 6'b0;
           TX_packet_data_en = 1'b0;
           RX_data_en = 1'b0;
           nxt_read_ptr = read_ptr;
           nxt_buffer_decrement = 1'b0;
       end
    end

endmodule