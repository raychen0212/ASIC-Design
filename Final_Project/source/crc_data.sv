module crc_data (
    input logic clk,
    input logic n_rst,
    input logic enable,
    input logic shift_enable,
    input logic data_stream,
    // input logic reset,
    output logic [15:0] crc
);
    always_ff @( posedge clk, negedge n_rst ) begin : blockName
        if(n_rst == 1'b0) begin
            crc = '1;
        end else begin
            crc = 16'b0101010101010101;
        end
    end

endmodule