`timescale 1ns / 10ps

module tb_rx_decode ();
  localparam  CLK_PERIOD    = 1;

  logic tb_clk;
  logic tb_n_rst;
  logic tb_d_plus;
  logic tb_shift_enable;
  logic tb_eop;
  logic tb_d_orig;
  integer tb_test_num;
  string tb_test_case;
  task reset_dut;
  begin
    tb_n_rst = 0;

    @(posedge tb_clk);
    @(posedge tb_clk);

    @(negedge tb_clk);
    
    tb_n_rst = 1;

    @(negedge tb_clk);
    @(negedge tb_clk);
  end
  endtask

  // Clock generation block
  always begin
    // Start with clock low to avoid false rising edge events at t=0
    tb_clk = 1'b0;
    // Wait half of the clock period before toggling clock value (maintain 50% duty cycle)
    #(CLK_PERIOD/2.0);
    tb_clk = 1'b1;
    // Wait half of the clock period before toggling clock value via rerunning the block (maintain 50% duty cycle)
    #(CLK_PERIOD/2.0);
  end

  rx_decode DUT (
    .clk(tb_clk),
    .n_rst(tb_n_rst),
    .d_plus(tb_d_plus),
    .shift_en(tb_shift_enable),
    .eop(tb_eop),
    .decoded(tb_d_orig)
  );
  tx_encoder ENCODE(
      .clk(tb_clk),
      .n_rst(tb_n_rst),
      .out_bit(tb_d_encode),
      .send_eop(1'b0),
      .dplus_out(tb_d_plus),
      .dminus_out(tb_d_minus)
  );
  task send_packet;
    input  [7:0] encode;
    //input [7:0] minus;
    //input  stop_bit;
    input  time data_period;
    
    integer i;
  begin
    // First synchronize to away from clock's rising edge
    
    @(negedge tb_clk)
    tb_d_encode = 0;
    // Send start bit
    
    #data_period;
    
    // Send data bits
    for(i = 0; i < 8; i = i + 1)
    begin
      tb_d_encode = encode[i];
      #data_period;
    end
    
    // Send stop bit
    //tb_serial_in = stop_bit;
    //#data_period;
  end
  endtask
  task enable;
  begin
    @(posedge tb_clk);
    tb_shift_enable = 1;
    @(posedge tb_clk);
    tb_shift_enable = 0;
  end
  endtask

  task check_output;
    input logic d_orig;
  
    if (tb_d_orig == d_orig) begin
      $info("Pass");
    end
    else begin
      $error("Fail");
    end
    endtask

  // begin
  initial begin
    tb_test_num = 0;
    tb_test_case = "Power on Reset";
    tb_n_rst = 1;
    tb_d_plus = 1;
    tb_eop = 0;
    tb_shift_enable = 0;
    reset_dut();
    check_output(1'b1);
    #(CLK_PERIOD * 3);
    
    tb_test_num = tb_test_num + 1;
    tb_test_case = "Test Case 1";
    @(negedge tb_clk);
    reset_dut();
    tb_d_plus = 0;
    tb_shift_enable = 1'b1;
    tb_eop = 0;
    #(CLK_PERIOD * 4);
    check_output(1'b1);

    tb_test_num = tb_test_num + 1;
    tb_test_case = "Test Case 2";
    @(negedge tb_clk);
    reset_dut();
    tb_d_plus = 1;
    tb_shift_enable = 1'b1;
    tb_eop = 1;
    #(CLK_PERIOD * 4);
    check_output(1'b1);

    tb_test_num = tb_test_num + 1;
    tb_test_case = "Test Case 3";
    @(negedge tb_clk);
    reset_dut();
    tb_d_plus = 0;
    tb_shift_enable = 1'b0;
    tb_eop = 0;
    #(CLK_PERIOD * 4);
    check_output(1'b0);
    
    $stop;
  end


endmodule