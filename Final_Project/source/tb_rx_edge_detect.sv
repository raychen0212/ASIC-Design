`timescale 1ns / 10ps

module tb_rx_edge_detect ();
  localparam  CLK_PERIOD    = 1;

  logic tb_clk;
  logic tb_n_rst;
  logic tb_d_plus;
  logic tb_d_edge;
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

  // generate clk
  always
  begin
    tb_clk = 0;
    #(CLK_PERIOD / 2.0);
    tb_clk = 1;
    #(CLK_PERIOD / 2.0);
  end
  
  rx_edge_detector DUT (
    .clk(tb_clk),
    .n_rst(tb_n_rst),
    .d_plus(tb_d_plus),
    .edge_detect(tb_d_edge)
  );
  task check_output;
    input logic detect;
  
    if (tb_d_edge == detect) begin
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
    tb_d_plus = 0;
    reset_dut();
    #(CLK_PERIOD * 3);
    check_output(1'b0);

    tb_test_num = tb_test_num + 1;
    tb_test_case = "Test Case 1";
    reset_dut();
    @(posedge tb_clk)
    tb_d_plus = 1'b0;
    #(CLK_PERIOD);
    check_output(1'b1);
    

    tb_test_num = tb_test_num + 1;
    tb_test_case = "Test Case 2";
    reset_dut();
    tb_d_plus = 0;
    #(CLK_PERIOD * 3);
    check_output(1'b0);
    $stop;
  end


endmodule