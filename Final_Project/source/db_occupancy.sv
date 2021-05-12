module db_occupancy (
    input logic clk,
    input logic n_rst,
    input logic buffer_increment, 
    input logic buffer_decrement, 
    input logic reset, 
    output logic [6:0] buffer_occupancy
);
    logic [6:0] nxt_buffer_occupancy;

    always_ff @( posedge clk, negedge n_rst ) begin : UPDATE
        if(n_rst == 1'b0) begin
            buffer_occupancy <= 7'd0;
        end else begin
            if(reset == 1'b1) begin
                buffer_occupancy <= 7'd0;
            end else begin
                buffer_occupancy <= nxt_buffer_occupancy;
            end
        end
    end

    always_comb begin : NXT_BUFF_OCC
        if(buffer_increment == 1'b1) begin
            nxt_buffer_occupancy = buffer_occupancy + 1;
        end 
        else if(buffer_decrement == 1'b1) begin
            nxt_buffer_occupancy = buffer_occupancy - 1;
        end else begin
            nxt_buffer_occupancy = buffer_occupancy;
        end
    end
    
endmodule