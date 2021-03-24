// $Id: $
// File name:   apb_slave.sv
// Created:     3/14/2021
// Author:      Jhen-Ruei Chen
// Lab Section: 337-08
// Version:     1.0  Initial Design Entry
// Description: APB-Slave Interface
// Required Module Name: apb_slave
// Required Filename: apb_slave.sv
// Required Ports:
// Input: clk, n_rst, rx_data[7:0], data_ready, overrun_error, framing_error, psel, paddr[2:0], penable, pwrite, pwdata[7:0]
// Output: data_read, prdata[7:0], pslverr, data_size[3:0], bit_period[13:0]

module apb_slave (input logic clk, n_rst, data_ready, overrun_error, framing_error, psel, penable, pwrite, input logic [2:0] paddr, input logic [7:0] rx_data, input logic [7:0]pwdata,
output logic data_read, pslverr, output logic [3:0] data_size, output logic [7:0] prdata, output logic [13:0] bit_period);

logic [6:0][7:0]reg_map;
logic [6:0][7:0]nxt_reg_map;
logic write_sel;
logic read_sel;
always_ff @( posedge clk, negedge n_rst) begin : INPUT_LOGIC
    if (n_rst == 0) begin
        reg_map[0] <= '0;
        reg_map[1] <= '0;
        reg_map[2] <= '0;
        reg_map[3] <= '0;
        reg_map[4] <= '0;
        reg_map[5] <= '0;
        reg_map[6] <= '0;
    end
    else begin
        reg_map <= nxt_reg_map;
    end
end
always_comb begin: NEXTSTATE_LOGIC
    
    pslverr = 0;
    read_sel = 0;
    write_sel = 0;
    if (psel && pwrite) begin
        if (paddr == 3'd2 || paddr == 3'd3 || paddr == 3'd4)begin
            write_sel = 1;
        end
        else begin
            if (penable == 1) begin
                write_sel = 0;
                pslverr = 1;
            end
        end
    end
    else if (psel && !pwrite)begin
        if (paddr == 3'd0 || paddr == 3'd1 || paddr == 3'd2 || paddr == 3'd3 || paddr == 3'd4 || paddr == 3'd6)begin
            read_sel = 1;
        end
        else begin
            if (penable == 1) begin
                read_sel = 0;
                pslverr = 1;
            end
        end
    end
end

always_comb begin : ERROR
    nxt_reg_map = reg_map;
    data_read = 1'b0;
    prdata = '0;
    if (write_sel == 1)
        nxt_reg_map[paddr] = pwdata;
    else if (read_sel == 1) begin
        prdata = reg_map[paddr];
        if (paddr == 3'd6)begin
            data_read = 1;
        end
        else begin
            data_read = 0;
        end
        
    end
    nxt_reg_map[1] = {6'b0, overrun_error, framing_error};
    if(data_ready == 1)
        nxt_reg_map[0] = data_ready;
    else 
        nxt_reg_map[0] = '0;
    bit_period = {reg_map[3][5:0], reg_map[2]};
    data_size = reg_map[4][3:0];
    
    nxt_reg_map[6] = rx_data;
end

endmodule