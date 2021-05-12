/*
module rx_edge_detector (input logic clk, n_rst, d_plus, output logic edge_detect);
    //logic value;
    //logic nxt_value;
    logic endpoint;
    logic nxt_end;
    
    always_ff @( posedge clk, negedge n_rst ) begin 
        if(n_rst == 0)begin
            endpoint <= 0;
        end
        else begin
            endpoint <= nxt_end; 
        end
    end
    always_comb begin : NXT_STATE_LOGIC
        //value = d_plus;
        nxt_end = d_plus;
        //edge_detect = value ^ endpoint;
    end
    assign edge_detect = d_plus ^ endpoint;
endmodule
*/
/*
module rx_edge_detector
(
  input  wire clk,
  input  wire n_rst,
  input  wire d_plus,
  output wire edge_detect
);

  reg old_sample;
  reg new_sample;
  reg sync_phase;
  
  always @ (negedge n_rst, posedge clk)
  begin : REG_LOGIC
    if(1'b0 == n_rst)
    begin
      old_sample  <= 1'b0; // Reset value to idle line value
      new_sample  <= 1'b0; // Reset value to idle line value
      sync_phase  <= 1'b0; // Reset value to idle line value
    end
    else
    begin
      old_sample  <= new_sample;
      new_sample  <= sync_phase;
      sync_phase  <= d_plus;
    end
  end
  // Output logic
 
  assign edge_detect = old_sample & (~new_sample); // Detect a falling edge -> new sample must be '0' and old sample must be '1'
  
  endmodule
  */
  module rx_edge_detector(input logic clk, n_rst, d_plus, output logic edge_detect);
    logic first;
    logic nxt;
    always_ff @( negedge n_rst, posedge clk ) begin
        if (!n_rst)
          first <= 1'b1;
        else first <= nxt;
    end
    always_comb begin : OUTPUT_LOGIC
      nxt = d_plus;
      edge_detect = (d_plus != first) ? 1 : 0;
    end
    endmodule
      
    