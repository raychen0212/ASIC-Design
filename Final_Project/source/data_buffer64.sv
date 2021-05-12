module data_buffer64 (
    input logic clk, 
    input logic n_rst,
    input logic [7:0] TX_data,
    input logic store_TX_data,
    input logic [7:0] RX_packet_data,
    input logic store_RX_packet_data,
    input logic clear,
    input logic flush,
    input logic get_TX_packet_data,
    input logic get_RX_data,
    output logic [7:0] RX_data,
    output logic [7:0] TX_packet_data,
    output logic [6:0] buffer_occupancy
);
    genvar i;

    logic reset;
    logic [63:0][7:0] dataRegs;
    
    logic [5:0] w_sel;
    logic [5:0] r_sel;

    logic write_enable;
    logic [63:0] w_en;
    logic [7:0] write_data;

    logic RX_data_en;
    logic TX_packet_data_en;
    logic [7:0] read_data;

    logic buffer_increment;
    logic buffer_decrement;

    assign reset = clear | flush;

    db_occupancy OCCUPANCY (
        .clk(clk),
        .n_rst(n_rst),
        .buffer_increment(buffer_increment),
        .buffer_decrement(buffer_decrement),
        .reset(reset),
        .buffer_occupancy(buffer_occupancy)
    );

    db_write_controller WRITE_CONTROLLER (
        .clk(clk),
        .n_rst(n_rst),
        .reset(reset),
        .TX_data(TX_data),
        .store_TX_data(store_TX_data),
        .RX_packet_data(RX_packet_data),
        .store_RX_packet_data(store_RX_packet_data),
        .w_sel(w_sel),
        .w_en(write_enable),
        .write_data(write_data),
        .buffer_increment(buffer_increment)
    );

    always_comb begin : DECODER6TO64
        if(write_enable == 1'b0) begin
            w_en = 64'b0;
        end else begin
            w_en = 64'b1 << w_sel;
        end
    end

    generate
        for (i = 0; i < 64; i = i + 1) begin
            always_ff @( posedge clk, negedge n_rst ) begin
                if(n_rst == 1'b0) begin
                    dataRegs[i] <= 8'b0;
                end
                else begin
                    if(w_en[i] == 1'b1) begin
                        dataRegs[i] <= write_data;
                    end else begin
                        dataRegs[i] <= dataRegs[i];
                    end
                end
            end
        end
    endgenerate

    db_read_controller READ_CONTROLLER (
        .clk(clk),
        .n_rst(n_rst),
        .reset(reset),
        .get_TX_packet_data(get_TX_packet_data),
        .get_RX_data(get_RX_data),
        .r_sel(r_sel),
        .RX_data_en(RX_data_en),
        .TX_packet_data_en(TX_packet_data_en),
        .buffer_decrement(buffer_decrement)
    );

    always_comb begin
        read_data = dataRegs[r_sel];
    end

    logic [7:0] nxt_RX_data;
    logic [7:0] nxt_TX_packet_data;

    always_comb begin : NXT_OUTPUT
        nxt_RX_data = RX_data;
        nxt_TX_packet_data = TX_packet_data;
        if(RX_data_en == 1'b1) begin
            nxt_RX_data = read_data;
        end
        if(TX_packet_data_en == 1'b1) begin
            nxt_TX_packet_data = read_data;
        end
    end

    always_ff @( posedge clk, negedge n_rst ) begin : OUTPUT
        if(n_rst == 1'b0) begin
            RX_data <= 8'b0;
            TX_packet_data <= 8'b0;
        end else begin
            RX_data <= nxt_RX_data;
            TX_packet_data <= nxt_TX_packet_data;
        end
    end

endmodule