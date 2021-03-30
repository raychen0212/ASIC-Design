// $Id: $
// File name:   ahb_lite_slave.sv
// Created:     3/27/2021
// Author:      Jhen-Ruei Chen
// Lab Section: 337-08
// Version:     1.0  Initial Design Entry
// Description: AHB-Lite-Slave Interface
// Required Module Name: ahb_lite_slave
// Required Filename: ahb_lite_slave.sv
// Required Ports:
// Input: clk, n_rst, coefficient_num[1:0], modwait, fir_out[15:0], err, hsel, haddr[3:0], hsize, htrans[1:0], hwrite, hwdata[15:0]
// Output: sample_data[15:0], data_ready, new_coefficient_set, fir_coefficient[15:0], hrdata[15:0], hresp
module ahb_lite_slave (input wire clk, n_rst, modwait, err, hsel, hsize, hwrite, input logic [1:0]coefficient_num, input logic [15:0]fir_out, input logic [3:0]haddr, 
input logic [1:0]htrans, input logic [15:0]hwdata,
output logic [15:0] sample_data, output logic data_ready, new_coefficient_set, hresp, output logic [15:0]fir_coefficient, output logic [15:0]hrdata);
    
logic [14:0][7:0] reg_map;
logic [14:0][7:0] nxt_reg_map;
logic [3:0] pre_haddr;
logic pre_hsize;
logic nxt_ready;
logic write_sel;
logic read_sel;
logic pre_read_sel;
logic pre_write_sel;

always_ff @ (posedge clk, negedge n_rst) begin
    if(n_rst == 0)begin
        reg_map[0] <= '0;
        reg_map[1] <= '0;
        reg_map[2] <= '0;
        reg_map[3] <= '0;
        reg_map[4] <= '0;
        reg_map[5] <= '0;
        reg_map[6] <= '0;
        reg_map[7] <= '0;
        reg_map[8] <= '0;
        reg_map[9] <= '0;
        reg_map[10] <= '0;
        reg_map[11] <= '0;
        reg_map[12] <= '0;
        reg_map[13] <= '0;
        reg_map[14] <= '0;
        pre_haddr <= '0;
        pre_hsize <= '0;
        data_ready <= '0;
        pre_write_sel <= '0;
        pre_read_sel <= '0;
    end
    else begin
        reg_map <= nxt_reg_map;
        pre_haddr <= haddr;
        data_ready <= nxt_ready;
        pre_hsize <= hsize;
        pre_write_sel<=write_sel;
        pre_read_sel<=read_sel;
    end
end
always_comb begin : NEXT_STATE_LOGIC
    hresp = 1'b0;
    read_sel = 1'b0;
    write_sel = 1'b0;
    if(hsel == 1 && hwrite)begin
        if (haddr == 4'h4 || haddr == 4'h5 || haddr == 4'h6 || haddr == 4'h7 || haddr == 4'h8 || haddr == 4'h9 || haddr == 4'hA || 
        haddr == 4'hB || haddr == 4'hC || haddr == 4'hD || haddr == 4'hE)begin
            write_sel = 1'b1;
        end
        else begin
            if (htrans != 2'b0)begin
                write_sel = 1'b0;
                hresp = 1'b1;
            end
        end
    end
    else if (hsel == 1 && !hwrite)begin
            if (haddr == 4'h0 || haddr == 4'h1 || haddr == 4'h2 || haddr == 4'h3 ||haddr == 4'h4 || haddr == 4'h5 || haddr == 4'h6 ||
            haddr == 4'h7 || haddr == 4'h8 || haddr == 4'h9 || haddr == 4'hA || haddr == 4'hB || haddr == 4'hC || haddr == 4'hD || haddr == 4'hE) begin
                read_sel = 1'b1;
            end
            else begin
                if (htrans != 2'b0) begin
                    read_sel = 1'b0;
                    hresp = 1'b1;
                end
            end
    end
end
always_comb begin : OUTPUT_LOGIC
    nxt_reg_map = reg_map;
    nxt_ready = data_ready;
    fir_coefficient = '0;
    hrdata = '0;
    
    ////////////////////////////////

    //FIR_COEFFICIENT//////////////
    if (reg_map[14] == 1'b1)begin
        if(coefficient_num == 2'b00)begin
            fir_coefficient = {reg_map[7], reg_map[6]};
        end
        else if (coefficient_num == 2'b01)begin
            fir_coefficient = {reg_map[9], reg_map[8]};
        end
        else if (coefficient_num == 2'b10)begin
            fir_coefficient = {reg_map[11], reg_map[10]};
        end
        else if (coefficient_num == 2'b11)begin
            fir_coefficient = {reg_map[13], reg_map[12]};
            if (modwait == 1'b1) begin
                nxt_reg_map[14] = '0;
            end
        end
    end
    ///////////////////////////////

    //////////////////SAMPLE_DATA/
    sample_data = {reg_map[5], reg_map[4]};
    new_coefficient_set = reg_map[14];
    //////////////////////////////

    ///////////fir_out///////////
    nxt_reg_map[2] = fir_out[7:0];
    nxt_reg_map[3] = fir_out[15:8];
    //////////////////////////////

    ////////////error////////////
    nxt_reg_map[0] = {7'b0, modwait};
    nxt_reg_map[1] = {7'b0, err};
    ///////READ AND WRITE LOGIC///
    if (pre_write_sel == 1)begin
        if(pre_hsize == 1'b0)begin
            nxt_reg_map[pre_haddr] = hwdata[7:0];
        end
        else if (pre_hsize == 1'b1) begin
            nxt_reg_map[pre_haddr] = hwdata[7:0];
            nxt_reg_map[pre_haddr + 1'b1] = hwdata[15:8];
        end
        if (modwait == 1'b0)begin
            if(pre_haddr == 4'h4)begin
            nxt_ready = 1'b1;
            end
        end
    end
    else if (pre_read_sel == 1) begin
        hrdata[7:0] = reg_map[pre_haddr];
        hrdata[15:8] = reg_map[pre_haddr + 1'b1];
    end
    


end


endmodule