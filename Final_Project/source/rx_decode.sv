module rx_decode (input logic clk, n_rst, d_plus, shift_en, output logic decoded);
    
    logic val;
    logic prev_val;

    always_ff @( posedge clk, negedge n_rst ) begin : outval
        if(n_rst == 1'b0) begin
            val <= 1'b1;
            prev_val <= 1'b1;
        end else begin
            if(shift_en == 1'b1) begin
                val <= d_plus;
                prev_val <= val;
            end else begin
                val <= val;
                prev_val <= prev_val;
            end
        end
    end

    assign decoded = ~(val ^ prev_val);
endmodule