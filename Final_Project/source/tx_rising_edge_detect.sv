module tx_rising_edge_detect (
    input logic clk,
    input logic n_rst, 
    input logic sync_in,
    output logic rising_edge_detect
);

    logic prev;

    always_ff @(posedge clk, negedge n_rst ) begin : blockName
        if(n_rst == 1'b0) begin
            prev <= 1'b0;
            rising_edge_detect <= 1'b0;
        end else begin
            prev <= sync_in;
            rising_edge_detect <= (~prev & sync_in);
        end
    end
    
endmodule