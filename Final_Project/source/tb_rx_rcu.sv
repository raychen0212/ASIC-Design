`timescale 1ns / 10ps

module tb_rx_rcu ();
  localparam  CLK_PERIOD    = 10;

  logic tb_clk;
  logic tb_n_rst;
  logic tb_d_edge;
  logic tb_shift_en;
  logic tb_byte_detect;
  logic tb_eop;
  logic [7:0] tb_s_val;
  logic tb_rx_data_ready;
  logic tb_rx_transfer_active;
  logic tb_rx_error;
  logic tb_clr;
  logic tb_store_rx_data;
  logic [2:0] tb_rx_packet;
  logic [7:0] tb_rx_data;
  integer tb_test_num;
  string tb_test_case;


  localparam  INACTIVE_VALUE     = '0;
  localparam  RESET_OUTPUT_VALUE = INACTIVE_VALUE;
  localparam PID_OUT = 8'b00011110;
  localparam PID_IN = 8'b10010110;
  localparam PID_DATA0 = 8'b00111100;
  localparam PID_DATA1 = 8'b10110100;
  localparam PID_ACK = 8'b00101101;
  localparam PID_NAK = 8'b10100101;
  localparam PID_STALL = 8'b11100001;

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
  //Device Under Test
  rx_rcu DUT (
    .clk(tb_clk),
    .n_rst(tb_n_rst),
    .d_edge(tb_d_edge),
    .shift_en(tb_shift_en),
    .byte_detect(tb_byte_detect),
    .eop(tb_eop),
    .s_val(tb_s_val),
    .rx_data_ready(tb_rx_data_ready),
    .rx_transfer_active(tb_rx_transfer_active),
    .rx_error(tb_rx_error),
    .clr(tb_clr),
    .store_rx_data(tb_store_rx_data),
    .rx_packet(tb_rx_packet),
    .rx_data(tb_rx_data)
  );
  ////////////////////////////////
  ////Check Output///////////////
  task check_output;
    input logic expected_rx_data_ready;
    input logic expected_rx_transfer_active;
    input logic expected_rx_error;
    input logic expected_clr;
    input logic expected_store_rx_data;
    input logic [2:0]expected_rx_packet;
    input logic [7:0]expected_rx_data;
    input string check_out;
    $info(check_out);
    if (tb_rx_data_ready == expected_rx_data_ready) begin
      $info("Pass DATA READY %s", check_out);
    end
    else begin
      $error("Fail DATA READY %s", check_out);
    end
    if (tb_rx_transfer_active == expected_rx_transfer_active) begin
      $info("Pass TRANSFER ACTIVE %s", check_out);
    end
    else begin
      $error("Fail TRANSFER ACTIVE %s", check_out);
    end
    if (tb_rx_error == expected_rx_error) begin
      $info("Pass ERROR %s", check_out);
    end
    else begin
      $error("Fail ERROR %s", check_out);
    end
    if (tb_clr == expected_clr) begin
      $info("Pass CLEAR %s", check_out);
    end
    else begin
      $error("Fail CLEAR %s", check_out);
    end
    if (tb_store_rx_data == expected_store_rx_data) begin
      $info("Pass STORE RX DATA %s", check_out);
    end
    else begin
      $error("Fail STORE RX DATA %s", check_out);
    end
    if (tb_rx_packet == expected_rx_packet) begin
      $info("Pass RX PACKET SENT TO AHB %s", check_out);
    end
    else begin
      $error("Fail RX_PACKET SENT TO AHB %s", check_out);
    end
    if (tb_rx_data == expected_rx_data) begin
      $info("Pass DATA SEND TO FIFO BUFFER %s", check_out);
    end
    else begin
      $error("Fail DATA SEND TO FIFO BUFFER %s", check_out);
    end
    endtask
    task byte_received;
        @(posedge tb_clk);
        tb_byte_detect = 1'b1;
        #(CLK_PERIOD);
    endtask

    /////////////////////////////
  // begin
  initial begin
    tb_n_rst = 1'b1;
    tb_test_num = 0;
    tb_test_case = "Test Bench Initialization";
    tb_n_rst = 1;
    tb_d_edge = 1'b0;
    tb_shift_en = 1'b0;
    tb_byte_detect = 1'b0;
    tb_eop = 1'b0;
    tb_s_val = 8'b0;

    tb_test_num = tb_test_num + 1;
    tb_test_case = "Power on Reset";
    #(0.1);

    tb_n_rst = '0;
    tb_d_edge = INACTIVE_VALUE;
    tb_shift_en = INACTIVE_VALUE;
    tb_byte_detect = INACTIVE_VALUE;
    tb_eop = INACTIVE_VALUE;
    tb_s_val = INACTIVE_VALUE;
    #(CLK_PERIOD * 0.5);
    check_output(RESET_OUTPUT_VALUE, RESET_OUTPUT_VALUE,RESET_OUTPUT_VALUE,RESET_OUTPUT_VALUE,
    RESET_OUTPUT_VALUE,RESET_OUTPUT_VALUE,RESET_OUTPUT_VALUE, "Reset1");
    #(CLK_PERIOD);
    check_output(RESET_OUTPUT_VALUE, RESET_OUTPUT_VALUE,RESET_OUTPUT_VALUE,RESET_OUTPUT_VALUE,
    RESET_OUTPUT_VALUE,RESET_OUTPUT_VALUE,RESET_OUTPUT_VALUE, "RESET 2");
    @(posedge tb_clk);
    tb_n_rst = 1'b1;
    #0.1;
    check_output(RESET_OUTPUT_VALUE, RESET_OUTPUT_VALUE,RESET_OUTPUT_VALUE,RESET_OUTPUT_VALUE,
    RESET_OUTPUT_VALUE,RESET_OUTPUT_VALUE,RESET_OUTPUT_VALUE, "Reset 3");

    tb_test_num = tb_test_num + 1;
    tb_test_case = "Test 1";
    $info("Reset Output");
    #(0.1);
    reset_dut();
    tb_d_edge = INACTIVE_VALUE;
    tb_shift_en = INACTIVE_VALUE;
    tb_byte_detect = INACTIVE_VALUE;
    tb_eop = INACTIVE_VALUE;
    tb_s_val = 8'b10101010;
    #(CLK_PERIOD);
    check_output(RESET_OUTPUT_VALUE, RESET_OUTPUT_VALUE,RESET_OUTPUT_VALUE,RESET_OUTPUT_VALUE,
    RESET_OUTPUT_VALUE,RESET_OUTPUT_VALUE,RESET_OUTPUT_VALUE, "DO NOT GO TO ANY STATE STAY IN IDLE");
    
    tb_test_num = tb_test_num + 1;
    tb_test_case = "Test 2 PID OUT TOKEN";
    $info("Check PID_OUT");
    #(0.1);
    reset_dut();
    tb_d_edge = 1'b1;
    tb_shift_en = INACTIVE_VALUE;
    tb_byte_detect = 1;
    tb_eop = INACTIVE_VALUE;
    tb_s_val = 8'b10000000;
    #(CLK_PERIOD*0.5);
    check_output(RESET_OUTPUT_VALUE, '0,RESET_OUTPUT_VALUE,RESET_OUTPUT_VALUE,
    RESET_OUTPUT_VALUE,RESET_OUTPUT_VALUE,RESET_OUTPUT_VALUE, "Going into Sync");
    @(posedge tb_clk);
    tb_byte_detect = 1'b1;
    tb_s_val = PID_OUT;
    check_output(RESET_OUTPUT_VALUE, 1'b1,RESET_OUTPUT_VALUE,1'b1,
    RESET_OUTPUT_VALUE,'0,RESET_OUTPUT_VALUE, "In PID");
    byte_received();
    check_output(RESET_OUTPUT_VALUE, 1'b1,RESET_OUTPUT_VALUE,'0,
    RESET_OUTPUT_VALUE,3'b111,RESET_OUTPUT_VALUE, "In PID_OUT1");
    byte_received();
    check_output(RESET_OUTPUT_VALUE, 1'b1,RESET_OUTPUT_VALUE,'0,
    RESET_OUTPUT_VALUE,3'b111,RESET_OUTPUT_VALUE, "In PID_OUT2");
    #(CLK_PERIOD);
    check_output(1'b1, RESET_OUTPUT_VALUE,RESET_OUTPUT_VALUE,'0,
    RESET_OUTPUT_VALUE,3'b000,RESET_OUTPUT_VALUE, "go back to idle");

    tb_test_num = tb_test_num + 1;
    tb_test_case = "Test 3 PID IN TOKEN";
    $info("Check PID_IN");
    #(0.1);
    reset_dut();
    tb_d_edge = 1'b1;
    tb_shift_en = INACTIVE_VALUE;
    tb_byte_detect = 1;
    tb_eop = INACTIVE_VALUE;
    tb_s_val = 8'b10000000;
    #(CLK_PERIOD*0.5);
    check_output(RESET_OUTPUT_VALUE, RESET_OUTPUT_VALUE,RESET_OUTPUT_VALUE,RESET_OUTPUT_VALUE,
    RESET_OUTPUT_VALUE,RESET_OUTPUT_VALUE,RESET_OUTPUT_VALUE, "In Sync");
    @(posedge tb_clk);
    tb_byte_detect = 1'b1;
    tb_s_val = PID_IN;
    check_output(RESET_OUTPUT_VALUE, 1'b1,RESET_OUTPUT_VALUE,1'b1,
    RESET_OUTPUT_VALUE,'0,RESET_OUTPUT_VALUE, "In PID");
    byte_received();
    check_output(RESET_OUTPUT_VALUE, 1'b1,RESET_OUTPUT_VALUE,'0,
    RESET_OUTPUT_VALUE,3'b110,RESET_OUTPUT_VALUE, "In PID_IN1");
    byte_received();
    check_output(RESET_OUTPUT_VALUE, 1'b1,RESET_OUTPUT_VALUE,'0,
    RESET_OUTPUT_VALUE,3'b110,RESET_OUTPUT_VALUE,"In PID_IN2");
    #(CLK_PERIOD);
    check_output(1'b1, RESET_OUTPUT_VALUE,RESET_OUTPUT_VALUE,'0,
    RESET_OUTPUT_VALUE,3'b000,RESET_OUTPUT_VALUE, "go back to idle");

    tb_test_num = tb_test_num + 1;
    tb_test_case = "Test 4 PID_DATA0";
    $info("Check PID_DATA");
    #(0.1);
    reset_dut();
    tb_d_edge = 1'b1;
    tb_shift_en = INACTIVE_VALUE;
    tb_byte_detect = 1;
    tb_eop = INACTIVE_VALUE;
    tb_s_val = 8'b10000000;
    #(CLK_PERIOD*0.5);
    check_output(RESET_OUTPUT_VALUE, RESET_OUTPUT_VALUE,RESET_OUTPUT_VALUE,RESET_OUTPUT_VALUE,
    RESET_OUTPUT_VALUE,RESET_OUTPUT_VALUE,RESET_OUTPUT_VALUE, "In Sync");
    @(posedge tb_clk);
    tb_byte_detect = 1'b1;
    tb_s_val = PID_DATA0;
    //#(CLK_PERIOD*0.5);
    check_output(RESET_OUTPUT_VALUE, RESET_OUTPUT_VALUE,RESET_OUTPUT_VALUE,1'b1,
    RESET_OUTPUT_VALUE,'0,RESET_OUTPUT_VALUE, "In PID");
    @(posedge tb_clk);
    tb_byte_detect = 1'b1;
    tb_s_val = 8'd12;
    #(CLK_PERIOD*0.5)
    check_output(RESET_OUTPUT_VALUE, 1'b1,RESET_OUTPUT_VALUE,'0,
    1'b1,3'b100,8'd12, "In DATA0");
    @(posedge tb_clk);
    tb_byte_detect = 1'b1;
    tb_s_val = 8'd14;
    #(CLK_PERIOD*0.5)
    check_output(RESET_OUTPUT_VALUE,1'b1,RESET_OUTPUT_VALUE,'0,
    1'b1,3'b100,8'd14, "IN DATA0_WAIT1");
    @(posedge tb_clk);
    tb_byte_detect = 1'b1;
    tb_s_val = 8'd16;
    tb_eop = 1;
    #(CLK_PERIOD*0.5)
    check_output(RESET_OUTPUT_VALUE, 1'b1,RESET_OUTPUT_VALUE,'0,
    1'b1,3'b100,8'd16, "IN DATA0_WAIT2");
    #(CLK_PERIOD);
    check_output(1'b1, RESET_OUTPUT_VALUE,RESET_OUTPUT_VALUE,'0,
    1'b0,3'b000,RESET_OUTPUT_VALUE, "IN EOP");

    tb_test_num = tb_test_num + 1;
    tb_test_case = "Test 5 PID_DATA1";
    $info("Check PID_DATA1");
    #(0.1);
    reset_dut();
    tb_d_edge = 1'b1;
    tb_shift_en = INACTIVE_VALUE;
    tb_byte_detect = 1;
    tb_eop = INACTIVE_VALUE;
    tb_s_val = 8'b10000000;
    #(CLK_PERIOD*0.5);
    check_output(RESET_OUTPUT_VALUE, RESET_OUTPUT_VALUE,RESET_OUTPUT_VALUE,RESET_OUTPUT_VALUE,
    RESET_OUTPUT_VALUE,RESET_OUTPUT_VALUE,RESET_OUTPUT_VALUE, "In Sync");
    @(posedge tb_clk);
    tb_byte_detect = 1'b1;
    tb_s_val = PID_DATA1;
    check_output(RESET_OUTPUT_VALUE, RESET_OUTPUT_VALUE,RESET_OUTPUT_VALUE,1'b1,
    RESET_OUTPUT_VALUE,'0,RESET_OUTPUT_VALUE, "In PID");
    @(posedge tb_clk);
    tb_byte_detect = 1'b1;
    tb_s_val = 8'd12;
    #(CLK_PERIOD*0.5)
    check_output(RESET_OUTPUT_VALUE, 1'b1,RESET_OUTPUT_VALUE,'0,
    1'b1,3'b101,8'd12, "In DATA1");
    @(posedge tb_clk);
    tb_byte_detect = 1'b1;
    tb_s_val = 8'd14;
    #(CLK_PERIOD*0.5)
    check_output(RESET_OUTPUT_VALUE,1'b1,RESET_OUTPUT_VALUE,'0,
    1'b1,3'b101,8'd14, "IN DATA1_WAIT1");
    @(posedge tb_clk);
    tb_byte_detect = 1'b1;
    tb_s_val = 8'd16;
    tb_eop = 1;
    #(CLK_PERIOD*0.5)
    check_output(RESET_OUTPUT_VALUE, 1'b1,RESET_OUTPUT_VALUE,'0,
    1'b1,3'b101,8'd16, "IN DATA1_WAIT2");
    #(CLK_PERIOD);
    
    check_output(1'b1, RESET_OUTPUT_VALUE,RESET_OUTPUT_VALUE,'0,
    1'b0,3'b000,RESET_OUTPUT_VALUE, "IN EOP");

    tb_test_num = tb_test_num + 1;
    tb_test_case = "Test 6 ACK";
    $info("Check ACK");
    #(0.1);
    reset_dut();
    tb_d_edge = 1'b1;
    tb_shift_en = INACTIVE_VALUE;
    tb_byte_detect = 1;
    tb_eop = INACTIVE_VALUE;
    tb_s_val = 8'b10000000;
    #(CLK_PERIOD*0.5);
    check_output(RESET_OUTPUT_VALUE, RESET_OUTPUT_VALUE,RESET_OUTPUT_VALUE,RESET_OUTPUT_VALUE,
    RESET_OUTPUT_VALUE,RESET_OUTPUT_VALUE,RESET_OUTPUT_VALUE, "In Sync");
    @(posedge tb_clk);
    tb_byte_detect = 1'b1;
    tb_s_val = PID_ACK;
    check_output(RESET_OUTPUT_VALUE, 1'b1,RESET_OUTPUT_VALUE,1'b1,
    RESET_OUTPUT_VALUE,'0,RESET_OUTPUT_VALUE, "In PID");
    @(posedge tb_clk);
    tb_byte_detect = 1'b0;
    #(CLK_PERIOD*0.5)
    check_output(1'b1,1'b1,RESET_OUTPUT_VALUE,RESET_OUTPUT_VALUE,
    RESET_OUTPUT_VALUE,3'b001,RESET_OUTPUT_VALUE, "IN ACK 1st cycle");
    @(posedge tb_clk);
    tb_byte_detect = 1'b1;
    #(CLK_PERIOD*0.5)
    check_output(1'b1,1'b1,RESET_OUTPUT_VALUE,RESET_OUTPUT_VALUE,
    RESET_OUTPUT_VALUE,3'b001,RESET_OUTPUT_VALUE, "IN ACK 2nd cycle");
    #(CLK_PERIOD);
    check_output(1'b1, RESET_OUTPUT_VALUE,RESET_OUTPUT_VALUE,'0,
    1'b0,3'b000,RESET_OUTPUT_VALUE, "IN EOP");

    tb_test_num = tb_test_num + 1;
    tb_test_case = "Test 6 NAK";
    $info("Check NAK");
    #(0.1);
    reset_dut();
    tb_d_edge = 1'b1;
    tb_shift_en = INACTIVE_VALUE;
    tb_byte_detect = 1;
    tb_eop = INACTIVE_VALUE;
    tb_s_val = 8'b10000000;
    #(CLK_PERIOD*0.5);
    check_output(RESET_OUTPUT_VALUE, RESET_OUTPUT_VALUE,RESET_OUTPUT_VALUE,RESET_OUTPUT_VALUE,
    RESET_OUTPUT_VALUE,RESET_OUTPUT_VALUE,RESET_OUTPUT_VALUE, "In Sync");
    @(posedge tb_clk);
    tb_byte_detect = 1'b1;
    tb_s_val = PID_NAK;
    check_output(RESET_OUTPUT_VALUE, 1'b1,RESET_OUTPUT_VALUE,1'b1,
    RESET_OUTPUT_VALUE,'0,RESET_OUTPUT_VALUE, "In PID");
    @(posedge tb_clk);
    tb_byte_detect = 1'b0;
    #(CLK_PERIOD*0.5)
    check_output(1'b1,1'b1,RESET_OUTPUT_VALUE,RESET_OUTPUT_VALUE,
    RESET_OUTPUT_VALUE,3'b010,RESET_OUTPUT_VALUE, "IN NAK 1st cycle");
    @(posedge tb_clk);
    tb_byte_detect = 1'b1;
    #(CLK_PERIOD*0.5)
    check_output(1'b1,1'b1,RESET_OUTPUT_VALUE,RESET_OUTPUT_VALUE,
    RESET_OUTPUT_VALUE,3'b010,RESET_OUTPUT_VALUE, "IN NAK 2nd cycle");
    #(CLK_PERIOD);
    check_output(1'b1, RESET_OUTPUT_VALUE,RESET_OUTPUT_VALUE,'0,
    1'b0,3'b000,RESET_OUTPUT_VALUE, "IN EOP");

    tb_test_num = tb_test_num + 1;
    tb_test_case = "Test 7 STALL";
    $info("Check STALL");
    #(0.1);
    reset_dut();
    tb_d_edge = 1'b1;
    tb_shift_en = INACTIVE_VALUE;
    tb_byte_detect = 1;
    tb_eop = INACTIVE_VALUE;
    tb_s_val = 8'b10000000;
    #(CLK_PERIOD*0.5);
    check_output(RESET_OUTPUT_VALUE, RESET_OUTPUT_VALUE,RESET_OUTPUT_VALUE,RESET_OUTPUT_VALUE,
    RESET_OUTPUT_VALUE,RESET_OUTPUT_VALUE,RESET_OUTPUT_VALUE, "In Sync");
    @(posedge tb_clk);
    tb_byte_detect = 1'b1;
    tb_s_val = 8'b11111111;
    check_output(RESET_OUTPUT_VALUE, RESET_OUTPUT_VALUE,1'b0,1'b0,
    RESET_OUTPUT_VALUE,'0,RESET_OUTPUT_VALUE, "In PID");
    @(posedge tb_clk);
    tb_byte_detect = 1'b1;
    tb_s_val = 8'd12;
    #(CLK_PERIOD*0.5)
    @(posedge tb_clk)
    check_output(RESET_OUTPUT_VALUE, 1'b0,1'b1,'0,
    RESET_OUTPUT_VALUE,3'b011,RESET_OUTPUT_VALUE, "In STALL");
    
    $stop;
  end


endmodule