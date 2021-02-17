// $Id: $
// File name:   tb_flex_5bitcounter
// Created:     2/14/2021
// Author:      Jhen-Ruei Chen
// Lab Section: 337-08
// Version:     1.0  Initial Design Entry
// Description: test bench for 5 bit counter

`timescale 1ns / 10ps

module tb_flex_5bitcounter();

  // Define local parameters used by the test bench
  localparam  CLK_PERIOD    = 2.5;
  localparam  FF_SETUP_TIME = 0.190;
  localparam  FF_HOLD_TIME  = 0.100;
  localparam  CHECK_DELAY   = (CLK_PERIOD - FF_SETUP_TIME); // Check right before the setup time starts
  
  localparam  INACTIVE_VALUE     = '0;
  localparam  RESET_OUTPUT_VALUE = INACTIVE_VALUE;
  localparam  NUM_CNT_BITS = 5; 

  // Declare DUT portmap signals
  reg tb_clk;
  reg tb_n_rst;
  reg tb_clear;
  reg tb_count_enable;
  reg [NUM_CNT_BITS-1:0]tb_rollover_val;
  reg [NUM_CNT_BITS-1:0]tb_count_out;
  reg tb_rollover_flag;
  reg tb_expected_rollover;

  // Declare test bench signals
  integer tb_test_num;
  string tb_test_case;
  integer tb_stream_test_num;
  string tb_stream_check_tag;

  // Task for standard DUT reset procedure
  task reset_dut;
  begin
    // Activate the reset
    tb_n_rst = 1'b0;

    // Maintain the reset for more than one cycle
    @(posedge tb_clk);
    @(posedge tb_clk);

    // Wait until safely away from rising edge of the clock before releasing
    @(negedge tb_clk);
    tb_n_rst = 1'b1;

    // Leave out of reset for a couple cycles before allowing other stimulus
    // Wait for negative clock edges, 
    // since inputs to DUT should normally be applied away from rising clock edges
    @(negedge tb_clk);
    @(negedge tb_clk);
  end
  endtask
  task check_clear;
  begin
    @(negedge tb_clk)
    tb_clear = 1'b1;    
    @(negedge tb_clk);
    tb_clear = 1'b0;
  end
  endtask
  // Task to cleanly and consistently check DUT output values
  task check_output;
    input logic [NUM_CNT_BITS-1:0] expected_value;
    input logic expected_roll;
    input string check_tag;
  begin
    if(expected_value == tb_count_out) begin // Check passed
      $info("Correct count_out output %s during %s test case", check_tag, tb_test_case);
    end
    else begin // Check failed
      $error("Incorrect count_out %s during %s test case", check_tag, tb_test_case);
    end
    if(expected_roll == tb_rollover_flag) begin // Check passed
      $info("Correct rollover output %s during %s test case", check_tag, tb_test_case);
    end
    else begin // Check failed
      $error("Incorrect rollover output %s during %s test case", check_tag, tb_test_case);
    end
  end
  endtask

// Clock generation block
  always
  begin
    // Start with clock low to avoid false rising edge events at t=0
    tb_clk = 1'b0;
    // Wait half of the clock period before toggling clock value (maintain 50% duty cycle)
    #(CLK_PERIOD/2.0);
    tb_clk = 1'b1;
    // Wait half of the clock period before toggling clock value via rerunning the block (maintain 50% duty cycle)
    #(CLK_PERIOD/2.0);
  end
//DUT PORTS
  flex_5bitcounter DUT (.clk(tb_clk), .n_rst(tb_n_rst), .clear(tb_clear), .count_enable(tb_count_enable), .rollover_val(tb_rollover_val), .count_out(tb_count_out), .rollover_flag(tb_rollover_flag));
  
  // Test bench main process
  initial
  begin
    // Initialize all of the test inputs
    tb_n_rst  = 1'b1;              // Initialize to be inactive
    tb_clear  = INACTIVE_VALUE; // Initialize input to inactive  value
    tb_rollover_val = INACTIVE_VALUE;
    tb_count_enable = INACTIVE_VALUE;
    tb_test_num = 0;               // Initialize test case counter
    tb_test_case = "Test bench initializaton";
    tb_stream_test_num = 0;
    tb_stream_check_tag = "N/A";
    tb_expected_rollover = 0;
    // ************************************************************************
    // Test Case 1: Power-on Reset of the DUT
    // ************************************************************************
    tb_test_num = tb_test_num + 1;
    tb_test_case = "Power on Reset";
    // Note: Do not use reset task during reset test case since we need to specifically check behavior during reset
    // Wait some time before applying test case stimulus
    #(0.1);
    // Apply test case initial stimulus
    tb_clear  = INACTIVE_VALUE; 
    tb_rollover_val = INACTIVE_VALUE;
    tb_count_enable = INACTIVE_VALUE; // Set to be the the non-reset value
    tb_n_rst  = 1'b0;    // Activate reset
    
    // Wait for a bit before checking for correct functionality
    #(CLK_PERIOD * 0.5);

    // Check that internal state was correctly reset
    check_output( RESET_OUTPUT_VALUE, 0,
                  "after reset applied");
    
    // Check that the reset value is maintained during a clock cycle
    #(CLK_PERIOD);
    check_output( RESET_OUTPUT_VALUE, 0,
                  "after clock cycle while in reset");
    
    // Release the reset away from a clock edge
    @(posedge tb_clk);
    #(2 * FF_HOLD_TIME);
    tb_n_rst  = 1'b1;   // Deactivate the chip reset
    #0.1;
    // Check that internal state was correctly keep after reset release
    check_output( RESET_OUTPUT_VALUE, 0,
                  "after reset was released");
    // ************************************************************************
    // Test Case 2: Rollover for a rollover value that is not a power of two
    // ************************************************************************ 
    @(negedge tb_clk); 
    tb_test_num = tb_test_num + 1;
    tb_test_case = "Rollover checking";
    // Start out with inactive value and reset the DUT to isolate from prior tests
    tb_clear  = INACTIVE_VALUE; // Initialize input to inactive  value
    tb_rollover_val = INACTIVE_VALUE;
    tb_count_enable = INACTIVE_VALUE;
    reset_dut();

    // Assign test case stimulus
    tb_clear = 1'b0;
    tb_rollover_val = 4'd3;
    tb_count_enable = 1'b1;

    // Wait for DUT to process stimulus before checking results
    @(posedge tb_clk); 
    #(CLK_PERIOD*2);
    //@(posedge tb_clk);
    // Move away from risign edge and allow for propagation delays before checking
    #(CHECK_DELAY);
    // Check results
    tb_expected_rollover = 1'b1;
    check_output( 4'd3, 1'b1,
                  "after 3 processing delay"); 
    @(posedge tb_clk);
    #(CHECK_DELAY)
    check_output( 4'd1, 1'b0,
                  "after 4 processing delay");
    // ************************************************************************
    // Test Case 3: Continuous counting
    // ************************************************************************ 
    @(negedge tb_clk); 
    tb_test_num = tb_test_num + 1;
    tb_test_case = "Continuous Counting";
    // Start out with inactive value and reset the DUT to isolate from prior tests
    tb_clear  = INACTIVE_VALUE; // Initialize input to inactive  value
    tb_rollover_val = INACTIVE_VALUE;
    tb_count_enable = INACTIVE_VALUE;
    reset_dut();

    tb_clear = 1'b0;
    tb_rollover_val = 4'b1111;
    tb_count_enable = 1'b1;
    @(posedge tb_clk); 
    #(CLK_PERIOD * 4)
    #(CHECK_DELAY);
    check_output( 4'd5, 1'b0,
                  "after 5 processing delay"); 
    @(posedge tb_clk)
    #(CLK_PERIOD*2)
    #(CHECK_DELAY);
    check_output( 4'd8, 1'b0,
                  "after 8 processing delay"); 
    @(posedge tb_clk)
    #(CLK_PERIOD*3)
    #(CHECK_DELAY);
    check_output( 4'd12, 1'b0,
                  "after 13 processing delay");

    // ************************************************************************
    // Test Case 4: Discountinuos counting
    // ************************************************************************ 
    @(negedge tb_clk); 
    tb_test_num = tb_test_num + 1;
    tb_test_case = "Discontinuous Counting";
    // Start out with inactive value and reset the DUT to isolate from prior tests
    tb_clear  = INACTIVE_VALUE; // Initialize input to inactive  value
    tb_rollover_val = INACTIVE_VALUE;
    tb_count_enable = INACTIVE_VALUE;
    reset_dut();
    tb_clear = 1'b0;
    tb_rollover_val = 5'b01111;
    tb_count_enable = 1'b1;
    @(negedge tb_clk); 
    #(CLK_PERIOD * 3)
    #(CHECK_DELAY);
    check_output( 5'd5, 1'b0,
                  "after 8 processing delay before clearing"); 
    tb_count_enable = 1'b0;
    #(CHECK_DELAY);
    check_output( 5'd5, 1'b0,
                  "after 8 processing delay"); 
    @(posedge tb_clk)
    #(CLK_PERIOD*5)
    #(CHECK_DELAY);
    check_output( 5'd5, 1'b0,
                  "after 14 processing delay"); 
    @(posedge tb_clk)
    #(CLK_PERIOD*2)
    #(CHECK_DELAY);
    check_output( 5'd5, 1'b0,
                  "after 17 processing delay");
    // ************************************************************************
    // Test Case 5: Clearing while counting to check clear vs. count enable priority
    // ************************************************************************ 
    
    @(negedge tb_clk); 
    tb_test_num = tb_test_num + 1;
    tb_test_case = "Clearing while counting to check clear vs. count enable priority";
    // Start out with inactive value and reset the DUT to isolate from prior tests
    tb_clear  = INACTIVE_VALUE; // Initialize input to inactive  value
    tb_rollover_val = INACTIVE_VALUE;
    tb_count_enable = INACTIVE_VALUE;
    reset_dut();

    tb_clear = 1'b0;
    tb_rollover_val = 4'd8;
    tb_count_enable = 1'b1;
    check_clear();
    //#(CHECK_DELAY);
    check_output( 4'd0, 1'b0,
                  "Initial Clear check");
    @(posedge tb_clk);
    #(CLK_PERIOD * 3);
    check_clear();
    //#(CHECK_DELAY);
    check_output( 4'd0, 1'b0,
                  "clear after 4 processing delay"); 
    @(posedge tb_clk);
    #(CLK_PERIOD*7);
    #(CHECK_DELAY);
    check_output( 4'd8, 1'b1,
                  "after 8 processing delay"); 
    @(posedge tb_clk);
    #(CHECK_DELAY);
    check_output( 4'd1, 1'b0,
                  "after rollover value reach and wait for 1 processing delay"); 
    check_clear();
    //#(CHECK_DELAY);
    check_output( 4'd0, 1'b0,
                  "clear it 1st");
    @(posedge tb_clk);
    @(CLK_PERIOD*3);
    //#(CHECK_DELAY);
    check_output( 4'd4, 1'b1,
                  "after the 2nd clear and after 4 processing delay");
    check_clear();
    //#(CHECK_DELAY);
    check_output( 4'd0, 1'b0,
                  "clear it 2nd");

    
  end
  endmodule