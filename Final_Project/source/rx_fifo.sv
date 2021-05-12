module rx_fifo
(
  input  wire clk,
  input  wire n_rst,
  input  wire load_buffer,
  input  wire [7:0] packet_data,
  output reg  [7:0] rx_packet_data
);

  reg [7:0] nxt_rx_data;
  
  always @ (negedge n_rst, posedge clk)
  begin : REG_LOGIC
    if(1'b0 == n_rst)
    begin
      rx_packet_data       <= '0;  // Initialize the rx_data buffer to have all bits be the idle line value
    end
    else
    begin
        rx_packet_data       <= nxt_rx_data;
    end
  end
  
  always @ (rx_packet_data, packet_data, load_buffer)
  begin : NXT_LOGIC
    // Assign default values
    nxt_rx_data        <= rx_packet_data;
    
    // Define override condition(s)
    // RX data logic
    if(1'b1 == load_buffer)
    begin
      nxt_rx_data <= packet_data;
    end
  end  
endmodule