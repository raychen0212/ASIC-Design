`timescale 1ns / 10ps

module tb_rx_full_design ();
  localparam  CLK_PERIOD    = 10;
  localparam NORM_DATA_PERIOD  = (8 * CLK_PERIOD);
  ////////////
  logic tb_clk;
  logic tb_n_rst;
  logic tb_d_plus;
  logic tb_d_minus;
  logic tb_bit_num;
  logic eop;
  ////////////
  /*
  logic tb_serial_in;
  logic tb_d_edge;
  logic tb_shift_en;
  logic tb_byte_detect;
  logic tb_eop;
  logic [7:0] tb_s_val;
  */
  logic tb_rx_data_ready;
  logic tb_rx_transfer_active;
  logic tb_rx_error;
  logic tb_clr;
  logic tb_store_rx_data;
  logic [2:0] tb_rx_packet;
  logic [7:0] tb_rx_data;
  integer tb_test_num;
  string tb_test_case;
  logic [7:0] tb_sent_byte_plus;
  logic [7:0] tb_sent_byte_minus;

  logic [7:0] tb_input_byte;
  logic [7:0] tb_e_input_byte;
  logic tb_preceed_bit;
  
  logic tb_d_encode;
  //logic prev_dplus;
  //logic tb_expected_dminus_out;
  //logic tb_expected_dplus_out;

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
  
task send_packet;
    input  [7:0] encode;
    input  time data_period;
    
    integer i;
  begin
    @(negedge tb_clk)
    for(i = 0; i < 8; i = i + 1)
    begin
      if(encode[i] == 1'b0) begin
        tb_d_plus = ~tb_d_plus;
        tb_d_minus = ~tb_d_minus;
      end else begin
        tb_d_plus = tb_d_plus;
        tb_d_minus = tb_d_minus;
      end
      #data_period;
    end
  
  end
  endtask

  //Device Under Test
  rx_full_design DUT (
    .clk(tb_clk),
    .n_rst(tb_n_rst),
    .d_plus(tb_d_plus),
    .d_minus(tb_d_minus),
    .rx_data_ready(tb_rx_data_ready),
    .rx_transfer_active(tb_rx_transfer_active),
    .rx_error(tb_rx_error),
    .clr(tb_clr),
    .store_rx_data(tb_store_rx_data),
    .rx_packet(tb_rx_packet),
    .rx_data(tb_rx_data)
  );

  /*
  task send_eop;
    reg [7:0] d_plus_input;
    reg [7:0] d_minus_input;
    integer i;
    input time data_period;
  begin
    //driven low for 2 bit periods and back to the idle bus value
    d_plus_input = 8'b00111111;
    d_minus_input = 8'b0000000;
    for(i = 0; i < 8; i = i + 1) begin
      tb_d_plus = d_plus_input[i];
      tb_d_minus = d_minus_input[i];
      #data_period;
    end
  end
  endtask
  */
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
      // $info("Pass DATA READY %s", check_out);
    end
    else begin
      $error("Fail DATA READY %s", check_out);
    end
    if (tb_rx_transfer_active == expected_rx_transfer_active) begin
      // $info("Pass TRANSFER ACTIVE %s", check_out);
    end
    else begin
      $error("Fail TRANSFER ACTIVE %s", check_out);
    end
    if (tb_rx_error == expected_rx_error) begin
      // $info("Pass ERROR %s", check_out);
    end
    else begin
      $error("Fail ERROR %s", check_out);
    end
    if (tb_clr == expected_clr) begin
      // $info("Pass CLEAR %s", check_out);
    end
    else begin
      $error("Fail CLEAR %s", check_out);
    end
    if (tb_store_rx_data == expected_store_rx_data) begin
      // $info("Pass STORE RX DATA %s", check_out);
    end
    else begin
      $error("Fail STORE RX DATA %s", check_out);
    end
    if (tb_rx_packet == expected_rx_packet) begin
      // $info("Pass RX PACKET SENT TO AHB %s", check_out);
    end
    else begin
      $error("Fail RX_PACKET SENT TO AHB %s", check_out);
    end
    if (tb_rx_data == expected_rx_data) begin
      // $info("Pass DATA SEND TO FIFO BUFFER %s", check_out);
    end
    else begin
      $error("Fail DATA SEND TO FIFO BUFFER %s", check_out);
    end
    endtask
    
    always
    begin
        tb_clk = 0;
        #(CLK_PERIOD / 2.0);
        tb_clk = 1;
        #(CLK_PERIOD / 2.0);
    end
    /////////////////////////////
  // begin
    task send_eop;
    begin 
      tb_d_plus = 0;
      tb_d_minus = 0;
    end
    endtask
    task encode_byte;
      int i;
    begin
      for (i = 0; i < 8 ; i++) begin
        if(tb_input_byte[i] == 1'b0) begin
          tb_e_input_byte[i] = ~tb_preceed_bit;
        end else begin
          tb_e_input_byte[i] = tb_preceed_bit;
        end
        tb_preceed_bit = tb_e_input_byte[i];
      end
    end
    endtask
  initial begin
    tb_preceed_bit = 1'b1;
    tb_e_input_byte = 8'b0;
    tb_input_byte = 8'b0; 
    tb_n_rst = 1'b1;
    tb_d_plus = 1'b1;
    tb_d_minus = 1'b0;


    tb_test_num = 1;
    tb_test_case = "Reset DUT";
    reset_dut();
    #(0.1);
    @(negedge tb_clk)
    tb_input_byte = 8'b10101010; 
    // encode_byte();
    send_packet(tb_input_byte, NORM_DATA_PERIOD);
    #(NORM_DATA_PERIOD);
    check_output(RESET_OUTPUT_VALUE, RESET_OUTPUT_VALUE,RESET_OUTPUT_VALUE,RESET_OUTPUT_VALUE,
    RESET_OUTPUT_VALUE,RESET_OUTPUT_VALUE,RESET_OUTPUT_VALUE, "RESET");
    #(NORM_DATA_PERIOD);

    tb_test_num = tb_test_num + 1;
    tb_test_case = "Test 2 PID OUT TOKEN";
    $info("Check PID_OUT");
    #(0.1);
    reset_dut();

    //@(posedge tb_clk);
    @(negedge tb_clk);
    tb_input_byte = 8'b10000000; 
    // encode_byte();
    send_packet(tb_input_byte, NORM_DATA_PERIOD);

    @(negedge tb_clk)
    #(CLK_PERIOD*0.5);

    check_output(RESET_OUTPUT_VALUE, '1,RESET_OUTPUT_VALUE,'0,
    RESET_OUTPUT_VALUE,RESET_OUTPUT_VALUE,'1, "SYNC");

    @(negedge tb_clk);
    tb_input_byte = PID_OUT;
    // encode_byte();
    send_packet(tb_input_byte, NORM_DATA_PERIOD);
    @(negedge tb_clk);
    #(CLK_PERIOD * 0.5)

    check_output(RESET_OUTPUT_VALUE, RESET_OUTPUT_VALUE,RESET_OUTPUT_VALUE,1'b1,
    RESET_OUTPUT_VALUE,RESET_OUTPUT_VALUE,'0, "PID");

    @(negedge tb_clk);
    tb_input_byte = PID_OUT;
    // encode_byte();
    send_packet(tb_input_byte, NORM_DATA_PERIOD);
    @(negedge tb_clk);
    #(CLK_PERIOD * 0.5)

    check_output(RESET_OUTPUT_VALUE, RESET_OUTPUT_VALUE,RESET_OUTPUT_VALUE,1'b1,
    RESET_OUTPUT_VALUE,RESET_OUTPUT_VALUE,'0, "PID_IN1");

    @(negedge tb_clk);
    tb_input_byte = PID_OUT;
    // encode_byte();
    send_packet(tb_input_byte, NORM_DATA_PERIOD);
    @(negedge tb_clk);
    #(CLK_PERIOD * 0.5)

    check_output(RESET_OUTPUT_VALUE, RESET_OUTPUT_VALUE,RESET_OUTPUT_VALUE,1'b1,
    RESET_OUTPUT_VALUE,RESET_OUTPUT_VALUE,'0, "PID_OUT2");
    $stop;
    /*
    @(negedge tb_clk);
    tb_input_byte = 8'b10000001;
    send_packet(tb_input_byte, NORM_DATA_PERIOD);
    #(NORM_DATA_PERIOD);
    check_output(RESET_OUTPUT_VALUE, 1'b1,RESET_OUTPUT_VALUE,'0,
    RESET_OUTPUT_VALUE,3'b111,RESET_OUTPUT_VALUE, "In PID_OUT1");
    @(negedge tb_clk);
    tb_input_byte = 8'b10000001;
    send_packet(tb_input_byte, NORM_DATA_PERIOD);
    #(NORM_DATA_PERIOD);
    check_output(RESET_OUTPUT_VALUE, 1'b1,RESET_OUTPUT_VALUE,'0,
    RESET_OUTPUT_VALUE,3'b111,RESET_OUTPUT_VALUE, "In PID_OUT2");
    send_eop();
    #(CLK_PERIOD);
    check_output(1'b1, RESET_OUTPUT_VALUE,RESET_OUTPUT_VALUE,'0,
    RESET_OUTPUT_VALUE,3'b111,RESET_OUTPUT_VALUE, "go back to idle");

    tb_test_num = tb_test_num + 1;
    tb_test_case = "Test 3 PID IN TOKEN";
    $info("Check PID_OUT");
    #(0.1);
    reset_dut();
    //@(posedge tb_clk);
    @(negedge tb_clk);
    tb_input_byte = 8'b10000000; 
    send_packet(tb_input_byte, NORM_DATA_PERIOD);
    #(NORM_DATA_PERIOD);
    check_output(RESET_OUTPUT_VALUE, RESET_OUTPUT_VALUE,RESET_OUTPUT_VALUE,'0,
    RESET_OUTPUT_VALUE,RESET_OUTPUT_VALUE,'1, "SYNC");
    @(negedge tb_clk)
    tb_input_byte = PID_IN;
    send_packet(tb_input_byte, NORM_DATA_PERIOD);
    #(NORM_DATA_PERIOD);
    check_output(RESET_OUTPUT_VALUE, RESET_OUTPUT_VALUE,RESET_OUTPUT_VALUE,1'b1,
    RESET_OUTPUT_VALUE,RESET_OUTPUT_VALUE,'1, "PID");
    @(negedge tb_clk);
    tb_input_byte = 8'b10000001;
    send_packet(tb_input_byte, NORM_DATA_PERIOD);
    #(NORM_DATA_PERIOD);
    check_output(RESET_OUTPUT_VALUE, 1'b1,RESET_OUTPUT_VALUE,'0,
    RESET_OUTPUT_VALUE,3'b110,RESET_OUTPUT_VALUE, "In PID_IN1");
    @(negedge tb_clk);
    tb_input_byte = 8'b10000001;
    send_packet(tb_input_byte, NORM_DATA_PERIOD);
    #(NORM_DATA_PERIOD);
    check_output(RESET_OUTPUT_VALUE, 1'b1,RESET_OUTPUT_VALUE,'0,
    RESET_OUTPUT_VALUE,3'b110,RESET_OUTPUT_VALUE, "In PID_IN2");
    send_eop();
    #(CLK_PERIOD);
    check_output(1'b1, RESET_OUTPUT_VALUE,RESET_OUTPUT_VALUE,'0,
    RESET_OUTPUT_VALUE,3'b110,RESET_OUTPUT_VALUE, "go back to idle");
    $stop;
*/
    /*
    input logic expected_rx_data_ready;
    input logic expected_rx_transfer_active;
    input logic expected_rx_error;
    input logic expected_clr;
    input logic expected_store_rx_data;
    input logic [2:0]expected_rx_packet;
    input logic [7:0]expected_rx_data;
    input string check_out;
    */
  end


endmodule