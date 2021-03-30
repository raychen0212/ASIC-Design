// $Id: $
// File name:   coefficient_loader.sv
// Created:     3/27/2021
// Author:      Jhen-Ruei Chen
// Lab Section: 337-08
// Version:     1.0  Initial Design Entry
// Description: Coefficient Loader Module
// Required Module Name: coefficient_loader
// Required Filename: coefficient_loader.sv
// Required Ports:
// Input: clk, n_reset, new_coefficient_set, modwait
// Output: load_coeff, coefficient_num[1:0]
module coefficient_loader (input logic clk, n_reset, new_coefficient_set, modwait, output logic load_coeff, output logic [1:0]coefficient_num);
    typedef enum bit[2:0] {IDLE, LOAD1, WAITLD1, LOAD2, WAITLD2, LOAD3, WAITLD3, LOAD4} stateType;
    stateType state;
    stateType nxt_state;

    always_ff@(posedge clk, negedge n_reset)begin
        if (n_reset == 0) begin
            state <= IDLE;
        end
        else begin
            state <= nxt_state;
        end
    end
    always_comb begin : NXT_STATE_LOGIC
        nxt_state = state;

        case(state)
            IDLE:
                begin  
                    if (modwait == 0 && new_coefficient_set == 1)
                        nxt_state = LOAD1;
                    else 
                        nxt_state = IDLE;
                end
            LOAD1:
                nxt_state = WAITLD1;
            WAITLD1:
            begin
                if(modwait == 1)
                    nxt_state = WAITLD1;
                else
                    nxt_state = LOAD2;
            end
            LOAD2:
                nxt_state = WAITLD2;
            WAITLD2:
            begin
                if(modwait == 1)
                    nxt_state = WAITLD2;
                else
                    nxt_state = LOAD3;
            end
            LOAD3:
                nxt_state = WAITLD3;
            WAITLD3:
            begin
                if(modwait == 1)
                    nxt_state = WAITLD3;
                else
                    nxt_state = LOAD4;
            end
            LOAD4:
                nxt_state = IDLE;
            endcase
            
    end
    always_comb begin: OUTPUT_LOGIC
        load_coeff = '0;
        coefficient_num = '0;
        if (state == LOAD1)
        begin
            load_coeff = 1'b1;
            coefficient_num = 2'd0;
        end
        else if (state == WAITLD1)
        begin
            load_coeff = 0;
            coefficient_num = 2'd0;
        end
        else if (state == LOAD2)
        begin
            load_coeff = 1'b1;
            coefficient_num = 2'b01;
        end
        else if (state == WAITLD2)
        begin
            load_coeff = 1'b0;
            coefficient_num = 2'b01;
        end
        else if (state == LOAD3)
        begin
            load_coeff = 1'b1;
            coefficient_num = 2'b10;
        end
        else if (state == WAITLD3)
        begin
            load_coeff = 0;
            coefficient_num = 2'b10;
        end
        else if (state == LOAD4)
        begin
            load_coeff = 1;
            coefficient_num = 2'b11;
        end
    end
endmodule