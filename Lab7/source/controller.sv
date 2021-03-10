// $Id: $
// File name:   controller.sv
// Created:     3/6/2021
// Author:      Jhen-Ruei Chen
// Lab Section: 337-08
// Version:     1.0  Initial Design Entry
// Description: Controller
// Required Module Name: controller
// Required Filename: controller.sv
// Required Ports:
// Input clk, n_rst, dr, lc, overflow
// Output: cnt_up, clear, modwait, op[2:0], src1[3:0], src2[3:0], dest[3:0], err
module controller (input logic clk, n_rst, dr, lc, overflow, 
output logic cnt_up, clear, modwait, err, output logic [2:0]op, output logic [3:0]src1, output logic [3:0] src2, output logic [3:0] dest);
typedef enum bit[4:0] {IDLE, LOAD1, WAITLD1, LOAD2, WAITLD2, LOAD3, WAITLD3, LOAD4, STORE, ZERO, SORT1, SORT2, SORT3, SORT4, 
MUL1, MUL2, MUL3, MUL4, ADD2, ADD4, SUB1, SUB3, EIDLE} stateType;
stateType state;
stateType nxt_state;
//logic mod;
logic nxt_mod;
always_ff@(posedge clk, negedge n_rst) begin: INPUT_LOGIC
    if(n_rst == 0) begin
        state <= IDLE;
        modwait <= 0;
    end
    else begin
        state <= nxt_state;
        modwait <= nxt_mod;
    end
end
always_comb begin: NEXTSTATE_LOGIC
    nxt_state = state;
    nxt_mod = modwait;
    case(state)
        IDLE:
            begin
                if(dr) begin
                    nxt_state = STORE;
                    nxt_mod = 1;
                end
                else if(lc) begin
                    nxt_state = LOAD1;
                    nxt_mod = 1;
                end
                else begin
                    nxt_state = IDLE;
                    nxt_mod = 0;
                end
            end
        LOAD1:
        begin
            nxt_state = WAITLD1;
            nxt_mod = 0;
        end
        WAITLD1:
            begin
                if(lc) begin
                    nxt_state = LOAD2;
                    nxt_mod = 1;
                end
                else begin    
                    nxt_state = WAITLD1;
                    nxt_mod = 0;
                end
            end
        LOAD2:
        begin
            nxt_state = WAITLD2;
            nxt_mod = 0;
        end
        WAITLD2:
            begin
                if(lc) begin
                    nxt_state = LOAD3;
                    nxt_mod = 1;
                end
                else begin    
                    nxt_state = WAITLD2;
                    nxt_mod = 0;
                end
            end
        LOAD3:
        begin
            nxt_state = WAITLD3;
            nxt_mod = 0;
        end
        WAITLD3:
            begin
                if(lc) begin
                    nxt_state = LOAD4;
                    nxt_mod = 1;
                end
                else begin    
                    nxt_state = WAITLD3;
                    nxt_mod = 0;
                end
            end
        LOAD4:
        begin
            nxt_state = IDLE;
            nxt_mod = 0;
        end
        STORE:
            begin
                if(dr == 0) begin
                    nxt_state = EIDLE;
                    nxt_mod = 0;
                end
                else begin
                    nxt_state = ZERO;
                    nxt_mod = 1;
                end
            end
        ZERO:
        begin
            nxt_state = SORT1;
            nxt_mod = 1;
        end
        SORT1: begin
            nxt_state = SORT2;
            nxt_mod = 1;
        end
        SORT2: begin
            nxt_state = SORT3;
            nxt_mod = 1;
        end
        SORT3:
        begin
            nxt_state = SORT4;
            nxt_mod = 1;
        end
        SORT4: 
        begin
            nxt_state = MUL1;
            nxt_mod = 1;
        end
        MUL1: 
        begin
            nxt_state = MUL2;
            nxt_mod = 1;
        end
        MUL2:
        begin
            nxt_state = MUL3;
            nxt_mod = 1;
        end
        MUL3:
        begin
            nxt_state = MUL4;
            nxt_mod = 1;
        end
        MUL4: 
        begin
            nxt_state = ADD2;
            nxt_mod = 1;
        end
        ADD2:
            begin
                if(overflow == 0) begin
                    nxt_state = ADD4;
                    nxt_mod = 1;
                end
                else if (overflow == 1) begin
                    nxt_state = EIDLE;
                    nxt_mod = 0;
                end
            end
        ADD4:
            begin
                if(overflow == 0) begin
                    nxt_state = SUB1;
                    nxt_mod = 1;
                end
                else if (overflow == 1) begin
                    nxt_state = EIDLE;
                    nxt_mod = 0;
                end
            end
        SUB1:
            begin
                if(overflow == 0)begin
                    nxt_state = SUB3;
                    nxt_mod = 1;
                end
                else if (overflow == 1) begin
                    nxt_state = EIDLE;
                    nxt_mod = 0;
                end
            end
        SUB3:
            begin
                if(overflow == 0) begin
                    nxt_state = IDLE;
                    nxt_mod = 0;
                end
                else if (overflow == 1) begin
                    nxt_state = EIDLE;
                    nxt_mod = 0;
                end
            end
        
        EIDLE:
            begin
                if(dr)
                begin
                    nxt_state = STORE;
                    nxt_mod = 1;
                end
                else begin
                    nxt_state = EIDLE;
                    nxt_mod = 0;
                end
            end
    endcase
end
always_comb begin: OUTPUT_LOGIC
    op = '0;
    src1 = '0;
    src2 = '0;
    dest = '0;
    case (state)
        IDLE:
        begin
            op = '0;
            dest = 4'd0;
        end
        STORE:
            begin
                dest = 4'd5;
                op = 3'b010;
            end
        LOAD1:
            begin
                op = 3'b011;
                dest = 4'd9;
            end
        WAITLD1:
            op = '0;
        LOAD2:
            begin
                op = 3'b011;
                dest = 4'd8;
            end
        WAITLD2:
            op = '0;
        LOAD3:
            begin
                op = 3'b011;
                dest = 4'd7;
            end
        WAITLD3:
            op = '0;
        LOAD4:
            begin
                op = 3'b011;
                dest = 4'd6;
            end
        ZERO:
            begin
                op = 3'b101;
                dest = 4'd0;
            end
        SORT1:
            begin
                op = 3'b001;
                src1 = 4'd2;
                dest = 4'd1;
            end
        SORT2:
            begin
                op = 3'b001;
                src1 = 4'd3;
                dest = 4'd2;
            end
        SORT3:
            begin
                op = 3'b001;
                src1 = 4'd4;
                dest = 4'd3;
            end
        SORT4:
            begin
                op = 3'b001;
                src1 = 4'd5;
                dest = 4'd4;
            end
        MUL1:
            begin
                op = 3'b110;
                src2 = 4'd6;
                src1 = 4'd4;
                dest = 4'd11; // sample1 * F0 and this should be negative
            end
        MUL2:
            begin
                op = 3'b110;
                src2 = 4'd7;
                src1 = 4'd3;
                dest = 4'd12;// sample2 * F1 and this should be positive
            end
        MUL3:
            begin
                op = 3'b110;
                src2 = 4'd8;
                src1 = 4'd2;
                dest = 4'd13;// sample3 * F2 and this should be negative
            end 
        MUL4:
            begin
                op = 3'b110;
                src2 = 4'd9;
                src1 = 4'd1;
                dest = 4'd14;// sample4 * F3 and this should be positive
            end
        ADD2:
            begin
                op = 3'b100;
                src2 = 4'd0;
                src1 = 4'd12;
                dest = 4'd0;
            end
        ADD4:
            begin
                op = 3'b100;
                src2 = 4'd0;
                src1 = 4'd14;
                dest = 4'd0;
            end
        SUB1:
            begin
                op = 3'b101;
                src1 = 4'd0;
                src2 = 4'd11;
                dest = 4'd0;
            end
        SUB3:
            begin
                op = 3'b101;
                src1 = 4'd0;
                src2 = 4'd13;
                dest = 4'd0;
            end

        EIDLE:
            begin
                op = 3'b0;
            end
    endcase
end



assign cnt_up = (state == ZERO)?1:0;
assign clear = (state == LOAD1|| state == LOAD2 || state == LOAD3 || state == LOAD4)?1:0;
assign err = (state == EIDLE);

endmodule