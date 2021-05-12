module db_write_controller (
    input logic clk, 
    input logic n_rst, 
    input logic reset, 
    input logic [7:0] TX_data,
    input logic store_TX_data,
    input logic [7:0] RX_packet_data,
    input logic store_RX_packet_data,
    output logic [5:0] w_sel,
    output logic w_en, 
    output logic [7:0] write_data,
    output logic buffer_increment
);
    logic [6:0] write_ptr;
    logic [6:0] nxt_write_ptr;

    logic nxt_buffer_increment;

    always_ff @( posedge clk, negedge n_rst ) begin : INCREMENT_PTR
        if(n_rst == 1'b0) begin
            write_ptr <= 7'b0;
            buffer_increment <= 1'b0;
        end else begin
            if(reset == 1'b1) begin
                write_ptr <= 7'b0;
                buffer_increment <= 1'b0;
            end else begin
                write_ptr <= nxt_write_ptr;
                buffer_increment <= nxt_buffer_increment;
            end

        end
    end

    always_comb begin : OUTPUT_LOGIC
       if(store_RX_packet_data == 1'b1) begin
           write_data = RX_packet_data;
           w_sel = write_ptr[5:0];
           w_en = 1'b1;
           nxt_write_ptr = write_ptr + 1;
           nxt_buffer_increment = 1'b1;
       end else if(store_TX_data == 1'b1) begin
           write_data = TX_data;
           w_sel = write_ptr[5:0];
           w_en = 1'b1;
           nxt_write_ptr = write_ptr + 1;
           nxt_buffer_increment = 1'b1;
       end else begin
           write_data = 8'b0;
           w_sel = 6'b0;
           w_en = 1'b0;
           nxt_write_ptr = write_ptr;
           nxt_buffer_increment = 1'b0;
       end
    end
    
endmodule