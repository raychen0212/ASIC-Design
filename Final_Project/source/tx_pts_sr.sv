module tx_pts_sr (
    input logic clk,
    input logic n_rst, 
    input logic shift_enable,
    input logic load_enable,
    input logic [7:0] nxt_byte,
    output logic out_bit
);

    flex_pts_sr #(.NUM_BITS(8), .SHIFT_MSB(1)) COUNTER (
        .clk(clk),
        .n_rst(n_rst),
        .shift_enable(shift_enable),
        .load_enable(load_enable),
        .parallel_in(nxt_byte),
        .serial_out(out_bit)
    );
    
endmodule