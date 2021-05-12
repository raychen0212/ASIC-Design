module tx_next_byte_logic (
    input logic [7:0] TX_packet_data,
    input logic [2:0] TX_packet,
    input logic load_sync, 
    input logic load_pid, 
    input logic [1:0] load_crc,
    input logic [4:0] token_crc,
    input logic [15:0] data_crc,
    output logic [7:0] nxt_byte
);
    localparam SYNC_BYTE = 8'b10000000;
    localparam ACK_BYTE = 8'b00101101;
    localparam NAK_BYTE = 8'b10100101;
    localparam STALL_BYTE = 8'b11100001;
    localparam DATA0_BYTE = 8'b00110011;
    localparam DATA1_BYTE = 8'b10110100;

    always_comb begin : COMB
        if(load_sync == 1'b1) begin
            nxt_byte = SYNC_BYTE;
        end 
        else if(load_pid == 1'b1) begin
            case (TX_packet)
                3'd1: begin
                    nxt_byte = ACK_BYTE;
                end 
                3'd2: begin
                    nxt_byte = NAK_BYTE;
                end 
                3'd3: begin
                    nxt_byte = STALL_BYTE;
                end 
                3'd4: begin
                    nxt_byte = DATA0_BYTE;
                end 
                3'd5: begin
                    nxt_byte = DATA1_BYTE;
                end 
                default: begin
                    nxt_byte = 8'd0;
                end
            endcase
        end 
        else if(load_crc != 2'b00)begin
            case (load_crc)
                2'b01: begin
                    nxt_byte = data_crc[7:0];
                end
                2'b10: begin
                    nxt_byte = data_crc[15:8];
                end
                2'b11: begin
                    nxt_byte = {TX_packet_data[7:5], token_crc};
                end
                default: begin
                    nxt_byte = TX_packet_data;
                end
            endcase
        end
        else begin
            nxt_byte = TX_packet_data;
        end
    end

endmodule