module tx_encoder (
    input logic clk,
    input logic n_rst,
    input logic out_bit, 
    input logic send_eop,
    input logic shift_enable,
    output logic dplus_out, 
    output logic dminus_out
);

    logic prev_bit;

    always_ff @( posedge clk, negedge n_rst ) begin : PREV_BIT
        if(n_rst == 1'b0) begin
            prev_bit <= 1'b1;
        end 
        else if(shift_enable == 1'b1) begin
            prev_bit <= dplus_out;
        end 
        else begin
            prev_bit <= prev_bit;    
        end
    end

    always_comb begin : NRZI
        if(send_eop == 1'b1) begin
            dplus_out = 1'b0;
            dminus_out = 1'b0;
        end else begin
            if(out_bit == 1'b0) begin
                dplus_out = ~prev_bit;
                dminus_out = prev_bit;
            end else begin
                dplus_out = prev_bit;
                dminus_out = ~prev_bit;
            end
        end 
    end
endmodule