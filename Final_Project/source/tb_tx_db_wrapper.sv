`timescale 1ns / 10ps

module tb_tx_db_wrapper;
    
    localparam PROPAGATION_DELAY	= 1ns;
	localparam CLK_PERIOD		= 10ns;

    localparam DPLUS_RESET = 1'b1;
    localparam DMINUS_RESET = 1'b0;
    localparam TRANSFER_ACTIVE_RESET = 1'b0;
    localparam ERR_RESET = 1'b0;

    localparam SYNC_BYTE = 8'b10000000;
    localparam ACK_BYTE = 8'b00101101;
    localparam NAK_BYTE = 8'b10100101;
    localparam STALL_BYTE = 8'b11100001;
    localparam DATA0_BYTE = 8'b00110011;
    localparam DATA1_BYTE = 8'b10110100;

    localparam CRC_BYTE = 8'b01010101;

    localparam BIT_PERIOD = 8;

    localparam BUFFER_SIZE = 64;
    localparam RESET_DATA_VALUE = 8'd0;
    localparam RESET_BYTES_VALUE = {BUFFER_SIZE{RESET_DATA_VALUE}};
    localparam BYTE_SIZE = 8;

    logic tb_clk;
    logic tb_n_rst;
    logic [7:0] tb_TX_packet_data;
    logic [2:0] tb_TX_packet;
    logic [6:0] tb_buffer_occupancy;
    logic tb_get_TX_packet_data;
    logic tb_TX_transfer_active;
    logic tb_TX_err;
    logic tb_dplus_out;
    logic tb_dminus_out;

    logic [7:0] tb_TX_data;
    logic tb_store_TX_data;
    logic [7:0] tb_RX_packet_data;
    logic tb_store_RX_packet_data;
    logic tb_clear;
    logic tb_flush;
    logic tb_get_RX_data;
    logic [7:0] tb_RX_data;

    integer tb_test_num;
    string  tb_test_case;
    string  tb_stream_check_tag;
    logic   tb_mismatch;
    logic   tb_check;
    int i;
    int j;

    logic [BUFFER_SIZE - 1:0][BYTE_SIZE - 1:0] testBytes;
    int numTestBytes;

    logic [BYTE_SIZE - 1:0] outByte;
    logic preceedBit;
    logic [BYTE_SIZE - 1:0] outByteDecoded;
    logic outBit;
    logic outBitComp;
    logic [2:0] curr_proc;

    logic [BUFFER_SIZE + 1:0][BYTE_SIZE - 1:0] tb_bytes_expected;
    logic tb_transfer_expected;
    logic tb_err_expected;
    logic [7:0] tb_pid_expected;

    tx_db_wrapper DUT (
        .clk(tb_clk),
        .n_rst(tb_n_rst),
        .TX_packet(tb_TX_packet),
        .TX_data(tb_TX_data),
        .store_TX_data(tb_store_TX_data),
        .RX_packet_data(tb_RX_packet_data),
        .store_RX_packet_data(tb_store_RX_packet_data),
        .clear(tb_clear),
        .flush(tb_flush),
        .get_RX_data(tb_get_RX_data),
        .TX_packet_data(tb_TX_packet_data),
        .RX_data(tb_RX_data),
        .buffer_occupancy(tb_buffer_occupancy),
        .get_TX_packet_data(tb_get_TX_packet_data),
        .TX_transfer_active(tb_TX_transfer_active),
        .TX_err(tb_TX_err),
        .dplus_out(tb_dplus_out),
        .dminus_out(tb_dminus_out)
    );
    

    task load_bytes;
    begin
        @(negedge tb_clk);
        tb_store_TX_data = 1'b1;
        for (i = 0; i < numTestBytes; i=i+1) begin
            tb_TX_data = testBytes[i];
            @(negedge tb_clk);
        end
        tb_store_TX_data = 1'b0;            
    end
    endtask

    task reset_dut;
	begin
		// Activate the design's reset (does not need to be synchronize with clock)
		tb_n_rst = 1'b0;
		
		// Wait for a couple clock cycles
		@(posedge tb_clk);
		@(posedge tb_clk);
		
		// Release the reset
		@(negedge tb_clk);
		tb_n_rst = 1;
		
		// Wait for a while before activating the design
		@(posedge tb_clk);
		@(posedge tb_clk);
	end
	endtask

    task check_reset;
        input string check_tag;
    begin
        if(tb_dplus_out != DPLUS_RESET) begin
            $error("Incorrect dplus_out %s during %s test case", check_tag, tb_test_case);
        end

        if(tb_dminus_out != DMINUS_RESET) begin
            $error("Incorrect dminus_out %s during %s test case", check_tag, tb_test_case);
        end

        if(tb_TX_transfer_active != TRANSFER_ACTIVE_RESET) begin
            $error("Incorrect TX_transfer_active %s during %s test case", check_tag, tb_test_case);
        end

        if(tb_TX_err != tb_err_expected) begin
            $error("Incorrect TX_err %s during %s test case", check_tag, tb_test_case);
        end
    end
    endtask
	
	// Clock gen block
	always
	begin : CLK_GEN
		tb_clk = 1'b0;
		#(CLK_PERIOD / 2.0);
		tb_clk = 1'b1;
		#(CLK_PERIOD / 2.0);
	end

    task check_output;
        input string check_tag;
        int k;
        int c;
    begin
        set_expected_pid();
        @(posedge tb_clk); 
        if(tb_TX_transfer_active != 1'b1) begin
            $error("Incorrect transfer active %s during %s test case", check_tag, tb_test_case);
        end

        read_byte();
        decode_byte();
        if(outByteDecoded != SYNC_BYTE) begin
            $error("Incorrect sync byte %s during %s test case", check_tag, tb_test_case);
            $error("Expected: %d, Got: %d", SYNC_BYTE, outByteDecoded);
        end

        read_byte();
        decode_byte();
        if(outByteDecoded != tb_pid_expected) begin
            $error("Incorrect pid byte %s during %s test case", check_tag, tb_test_case);
            $error("Expected: %d, Got: %d", tb_pid_expected, outByteDecoded);
        end

        if(tb_err_expected == 1'b0) begin
            for (k = 0; k < numTestBytes; k = k + 1) begin
                read_byte();
                decode_byte();
                if(outByteDecoded != tb_bytes_expected[k]) begin
                    $error("Incorrect data byte at index %d while %s during %s test case", k, check_tag, tb_test_case);
                    $error("Expeced: %d Got: %d", tb_bytes_expected[k], outByteDecoded);
                end
            end 

            if(curr_proc == 4 || curr_proc == 5) begin
                for (c = k; c < k + 2; c++) begin
                    read_byte();
                    decode_byte();
                    if(outByteDecoded != tb_bytes_expected[c]) begin
                        $error("Incorrect crc byte %d while %s during %s test case", c - k + 1, check_tag, tb_test_case);
                        $error("Expeced: %d Got: %d", tb_bytes_expected[c], outByteDecoded);
                    end
                end
            end
            

            read_bit();
            if(outBit != 1'b0 || outBitComp != 1'b0) begin
                $error("Incorrect eop byte 1 while %s during %s test case", check_tag, tb_test_case);
            end
            read_bit();
            if(outBit != 1'b0 || outBitComp != 1'b0) begin
                $error("Incorrect eop byte 2 while %s during %s test case", check_tag, tb_test_case);
            end

        end
        else begin
            #(CLK_PERIOD * 20);
            if(tb_TX_err != 1'b1) begin
                $error("Incorrect error while %s during %s test case", check_tag, tb_test_case);
            end
        end

    end
    endtask

    task decode_byte();
        logic prev_bit;
    begin
        prev_bit = preceedBit;
        for (i = BYTE_SIZE - 1; i >= 0; i = i - 1) begin
            outByteDecoded[i] = ~(outByte[i] ^ prev_bit);
            prev_bit = outByte[i];
        end
    end
    endtask

    task read_byte;
    begin
        preceedBit = tb_dplus_out;
        for (i = BYTE_SIZE - 1; i >= 0; i = i - 1) begin
            read_bit();
            outByte[i] = outBit;
        end
    end
    endtask

    task read_bit;
    begin
        for (j = 0; j < BIT_PERIOD; j = j + 1) begin
            @(posedge tb_clk);
        end
        outBit = tb_dplus_out;
        outBitComp = tb_dminus_out;
    end
    endtask

    task set_expected_pid;
    begin
        case (curr_proc)
            3'd1:begin
                tb_pid_expected = ACK_BYTE;
            end 
            3'd2:begin
                tb_pid_expected = NAK_BYTE;
            end 
            3'd3:begin
                tb_pid_expected = STALL_BYTE;
            end 
            3'd4:begin
                tb_pid_expected = DATA0_BYTE;
            end 
            3'd5:begin
                tb_pid_expected = DATA1_BYTE;
            end 
            default: begin
                tb_pid_expected = RESET_DATA_VALUE;
            end
        endcase
    end
    endtask

    initial
	begin
		// Initial values
		tb_test_num = 0;
		tb_n_rst = 1'b1;
        tb_clear = 1'b0;
        tb_flush = 1'b0;
        tb_TX_data = 8'b0;
        tb_store_TX_data = 1'b0;
        tb_RX_packet_data = 8'b0;
        tb_store_RX_packet_data = 1'b0;
        tb_get_RX_data = 1'b0;
        tb_TX_packet = 3'b0;

        testBytes = RESET_BYTES_VALUE;
        numTestBytes = 0;

        tb_bytes_expected = RESET_BYTES_VALUE;
        tb_transfer_expected = TRANSFER_ACTIVE_RESET;
        tb_err_expected = ERR_RESET;
        tb_pid_expected = RESET_DATA_VALUE;

        outByte = RESET_DATA_VALUE;
        outByteDecoded = RESET_DATA_VALUE;
        curr_proc = 3'd0;

        #(1ns);

        // ************************************************************
        // TEST CASE 1: Power on reset
        tb_test_num  = tb_test_num + 1;
        tb_test_case = "Power on Reset";
        #(1ns);
        tb_n_rst = 1'b0;

        #(CLK_PERIOD * 0.5);
        check_reset("after reset applied");

        #(CLK_PERIOD);
        check_reset("1 clk after reset applied");

        @(negedge tb_clk);
        tb_n_rst  = 1'b1;   
        #(PROPAGATION_DELAY);
        check_reset("after reset was released");

        #(0.1ns);

        // ************************************************************
        // TEST CASE 2: ACK
        tb_test_num  = tb_test_num + 1;
        tb_test_case = "ACK";

        testBytes = RESET_BYTES_VALUE;
        numTestBytes = 0;
        
        tb_bytes_expected = RESET_BYTES_VALUE;
        tb_transfer_expected = TRANSFER_ACTIVE_RESET;
        tb_err_expected = ERR_RESET;
        tb_pid_expected = RESET_DATA_VALUE;

        outByte = RESET_DATA_VALUE;
        outByteDecoded = RESET_DATA_VALUE;
        curr_proc = 3'd0;

        reset_dut();

        testBytes[1:0] = {8'b00100000, 8'b00011110};
        numTestBytes = 2;
        tb_bytes_expected[BUFFER_SIZE - 1:0] = testBytes;
        tb_bytes_expected[1] = 8'b00101010;
        load_bytes();
        @(negedge tb_clk);
        tb_TX_packet = 3'b001;
        curr_proc = 3'b001;
        @(posedge tb_clk); // read in TX_packet
        tb_TX_packet = 3'b0;
        check_output("After TX_packet set to 1");
        
        
        #(0.1ns);

        // ************************************************************
        // TEST CASE 3: ACK and then NAK
        tb_test_num  = tb_test_num + 1;
        tb_test_case = "ACK and then NAK";

        testBytes = RESET_BYTES_VALUE;
        numTestBytes = 0;
        
        tb_bytes_expected = RESET_BYTES_VALUE;
        tb_transfer_expected = TRANSFER_ACTIVE_RESET;
        tb_err_expected = ERR_RESET;
        tb_pid_expected = RESET_DATA_VALUE;

        outByte = RESET_DATA_VALUE;
        outByteDecoded = RESET_DATA_VALUE;
        curr_proc = 3'd0;

        reset_dut();

        testBytes[1:0] = {8'b00100000, 8'b00011000};
        numTestBytes = 2;
        tb_bytes_expected[BUFFER_SIZE - 1:0] = testBytes;
        tb_bytes_expected[1] = 8'b00101010;
        load_bytes();
        @(negedge tb_clk);
        tb_TX_packet = 3'b001;
        curr_proc = tb_TX_packet;
        @(posedge tb_clk);
        tb_TX_packet = 3'b0;
        check_output("After TX_packet set to 1");

        tb_clear = 1'b1;
        #(5 * CLK_PERIOD);
        outByte = RESET_DATA_VALUE;
        outByteDecoded = RESET_DATA_VALUE;
        tb_clear = 1'b0;


        testBytes[1:0] = {8'b01100000, 8'b10011000};
        numTestBytes = 2;
        tb_bytes_expected[BUFFER_SIZE - 1:0] = testBytes;
        tb_bytes_expected[1] = 8'b01101010;
        load_bytes();
        @(negedge tb_clk);
        tb_TX_packet = 3'b010;
        curr_proc = tb_TX_packet;
        @(posedge tb_clk);
        tb_TX_packet = 3'b0;
        check_output("After TX_packet set to 2");

        #(0.1ns);

        // ************************************************************
        // TEST CASE: STALL
        tb_test_num  = tb_test_num + 1;
        tb_test_case = "STALL";

        testBytes = RESET_BYTES_VALUE;
        numTestBytes = 0;
        
        tb_bytes_expected = RESET_BYTES_VALUE;
        tb_transfer_expected = TRANSFER_ACTIVE_RESET;
        tb_err_expected = ERR_RESET;
        tb_pid_expected = RESET_DATA_VALUE;

        outByte = RESET_DATA_VALUE;
        outByteDecoded = RESET_DATA_VALUE;
        curr_proc = 3'd0;

        reset_dut();

        testBytes[1:0] = {8'b00100000, 8'b00011110};
        numTestBytes = 2;
        tb_bytes_expected[BUFFER_SIZE - 1:0] = testBytes;
        tb_bytes_expected[1] = 8'b00101010;
        load_bytes();
        @(negedge tb_clk);
        tb_TX_packet = 3'b011;
        curr_proc = 3'b011;
        @(posedge tb_clk); // read in TX_packet
        tb_TX_packet = 3'b0;
        check_output("After TX_packet set to 3");
        
        
        #(0.1ns);

        // ************************************************************
        // TEST CASE 3: Send data of 5 bytes
        tb_test_num  = tb_test_num + 1;
        tb_test_case = "send data of 5 bytes from data0";

        testBytes = RESET_BYTES_VALUE;
        numTestBytes = 0;
        
        tb_bytes_expected = RESET_BYTES_VALUE;
        tb_transfer_expected = TRANSFER_ACTIVE_RESET;
        tb_err_expected = ERR_RESET;
        tb_pid_expected = RESET_DATA_VALUE;

        outByte = RESET_DATA_VALUE;
        outByteDecoded = RESET_DATA_VALUE;
        curr_proc = 3'd0;

        reset_dut();

        testBytes[4:0] = {8'd5, 8'd4, 8'd3, 8'd2, 8'd1};
        numTestBytes = 5;
        tb_bytes_expected[BUFFER_SIZE - 1:0] = testBytes;
        tb_bytes_expected[numTestBytes] = CRC_BYTE;
        tb_bytes_expected[numTestBytes + 1] = CRC_BYTE;

        load_bytes();
        @(negedge tb_clk);
        tb_TX_packet = 3'd4;
        curr_proc = tb_TX_packet;
        @(posedge tb_clk);
        tb_TX_packet = 3'b0;
        check_output("After TX_packet set to 4");

        #(0.1ns);

        // ************************************************************
        // TEST CASE: Send data of 5 bytes
        tb_test_num  = tb_test_num + 1;
        tb_test_case = "send data of 5 bytes from data1";

        testBytes = RESET_BYTES_VALUE;
        numTestBytes = 0;
        
        tb_bytes_expected = RESET_BYTES_VALUE;
        tb_transfer_expected = TRANSFER_ACTIVE_RESET;
        tb_err_expected = ERR_RESET;
        tb_pid_expected = RESET_DATA_VALUE;

        outByte = RESET_DATA_VALUE;
        outByteDecoded = RESET_DATA_VALUE;
        curr_proc = 3'd0;

        reset_dut();

        testBytes[4:0] = {8'd5, 8'd4, 8'd3, 8'd2, 8'd1};
        numTestBytes = 5;
        tb_bytes_expected[BUFFER_SIZE - 1:0] = testBytes;
        tb_bytes_expected[numTestBytes] = CRC_BYTE;
        tb_bytes_expected[numTestBytes + 1] = CRC_BYTE;

        load_bytes();
        @(negedge tb_clk);
        tb_TX_packet = 3'd5;
        curr_proc = tb_TX_packet;
        @(posedge tb_clk);
        tb_TX_packet = 3'b0;
        check_output("After TX_packet set to 5");

        #(0.1ns);

        // ************************************************************
        // TEST CASE: Send data of 5 bytes
        tb_test_num  = tb_test_num + 1;
        tb_test_case = "send data of 5 bytes from alternating 1 and 0";

        testBytes = RESET_BYTES_VALUE;
        numTestBytes = 0;
        
        tb_bytes_expected = RESET_BYTES_VALUE;
        tb_transfer_expected = TRANSFER_ACTIVE_RESET;
        tb_err_expected = ERR_RESET;
        tb_pid_expected = RESET_DATA_VALUE;

        outByte = RESET_DATA_VALUE;
        outByteDecoded = RESET_DATA_VALUE;
        curr_proc = 3'd0;

        reset_dut();

        testBytes[4:0] = {8'b10101010, 8'b10101010, 8'b10101010, 8'b10101010, 8'b10101010};
        numTestBytes = 5;
        tb_bytes_expected[BUFFER_SIZE - 1:0] = testBytes;
        tb_bytes_expected[numTestBytes] = CRC_BYTE;
        tb_bytes_expected[numTestBytes + 1] = CRC_BYTE;

        load_bytes();
        @(negedge tb_clk);
        tb_TX_packet = 3'd4;
        curr_proc = tb_TX_packet;
        @(posedge tb_clk);
        tb_TX_packet = 3'b0;
        check_output("After TX_packet set to 4");

        #(0.1ns);

        // ************************************************************
        // TEST CASE: Send data of 5 bytes
        tb_test_num  = tb_test_num + 1;
        tb_test_case = "send data of 5 bytes from steady 1";

        testBytes = RESET_BYTES_VALUE;
        numTestBytes = 0;
        
        tb_bytes_expected = RESET_BYTES_VALUE;
        tb_transfer_expected = TRANSFER_ACTIVE_RESET;
        tb_err_expected = ERR_RESET;
        tb_pid_expected = RESET_DATA_VALUE;

        outByte = RESET_DATA_VALUE;
        outByteDecoded = RESET_DATA_VALUE;
        curr_proc = 3'd0;

        reset_dut();

        testBytes[4:0] = {8'b11111111, 8'b11111111, 8'b11111111, 8'b11111111, 8'b11111111};
        numTestBytes = 5;
        tb_bytes_expected[BUFFER_SIZE - 1:0] = testBytes;
        tb_bytes_expected[numTestBytes] = CRC_BYTE;
        tb_bytes_expected[numTestBytes + 1] = CRC_BYTE;

        load_bytes();
        @(negedge tb_clk);
        tb_TX_packet = 3'd4;
        curr_proc = tb_TX_packet;
        @(posedge tb_clk);
        tb_TX_packet = 3'b0;
        check_output("After TX_packet set to 4");

        #(0.1ns);

         // ************************************************************
        // TEST CASE: Send data of 5 bytes
        tb_test_num  = tb_test_num + 1;
        tb_test_case = "send data of 5 bytes from steady 0";

        testBytes = RESET_BYTES_VALUE;
        numTestBytes = 0;
        
        tb_bytes_expected = RESET_BYTES_VALUE;
        tb_transfer_expected = TRANSFER_ACTIVE_RESET;
        tb_err_expected = ERR_RESET;
        tb_pid_expected = RESET_DATA_VALUE;

        outByte = RESET_DATA_VALUE;
        outByteDecoded = RESET_DATA_VALUE;
        curr_proc = 3'd0;

        reset_dut();

        testBytes[4:0] = {8'b00000000, 8'b00000000, 8'b00000000, 8'b00000000, 8'b00000000};
        numTestBytes = 5;
        tb_bytes_expected[BUFFER_SIZE - 1:0] = testBytes;
        tb_bytes_expected[numTestBytes] = CRC_BYTE;
        tb_bytes_expected[numTestBytes + 1] = CRC_BYTE;

        load_bytes();
        @(negedge tb_clk);
        tb_TX_packet = 3'd4;
        curr_proc = tb_TX_packet;
        @(posedge tb_clk);
        tb_TX_packet = 3'b0;
        check_output("After TX_packet set to 4");

        #(0.1ns);

         // ************************************************************
        // TEST CASE: Send data of 5 bytes
        tb_test_num  = tb_test_num + 1;
        tb_test_case = "send data of 40 bytes";

        testBytes = RESET_BYTES_VALUE;
        numTestBytes = 0;
        
        tb_bytes_expected = RESET_BYTES_VALUE;
        tb_transfer_expected = TRANSFER_ACTIVE_RESET;
        tb_err_expected = ERR_RESET;
        tb_pid_expected = RESET_DATA_VALUE;

        outByte = RESET_DATA_VALUE;
        outByteDecoded = RESET_DATA_VALUE;
        curr_proc = 3'd0;

        reset_dut();

        numTestBytes = 40;
        for (i = 0; i < numTestBytes; i = i + 1) begin
            testBytes[i] = i + 1;
        end
        tb_bytes_expected[BUFFER_SIZE - 1:0] = testBytes;
        tb_bytes_expected[numTestBytes] = CRC_BYTE;
        tb_bytes_expected[numTestBytes + 1] = CRC_BYTE;

        load_bytes();
        @(negedge tb_clk);
        tb_TX_packet = 3'd4;
        curr_proc = tb_TX_packet;
        @(posedge tb_clk);
        tb_TX_packet = 3'b0;
        check_output("After TX_packet set to 4");

        #(0.1ns);

        // ************************************************************
        // TEST CASE: Send data of 5 bytes
        tb_test_num  = tb_test_num + 1;
        tb_test_case = "send data of 64 bytes";

        testBytes = RESET_BYTES_VALUE;
        numTestBytes = 0;
        
        tb_bytes_expected = RESET_BYTES_VALUE;
        tb_transfer_expected = TRANSFER_ACTIVE_RESET;
        tb_err_expected = ERR_RESET;
        tb_pid_expected = RESET_DATA_VALUE;

        outByte = RESET_DATA_VALUE;
        outByteDecoded = RESET_DATA_VALUE;
        curr_proc = 3'd0;

        reset_dut();

        numTestBytes = 64;
        for (i = 0; i < numTestBytes; i = i + 1) begin
            testBytes[i] = i + 1;
        end
        tb_bytes_expected[BUFFER_SIZE - 1:0] = testBytes;
        tb_bytes_expected[numTestBytes] = CRC_BYTE;
        tb_bytes_expected[numTestBytes + 1] = CRC_BYTE;

        load_bytes();
        @(negedge tb_clk);
        tb_TX_packet = 3'd4;
        curr_proc = tb_TX_packet;
        @(posedge tb_clk);
        tb_TX_packet = 3'b0;
        check_output("After TX_packet set to 4");

        #(0.1ns);

        // ************************************************************
        // TEST CASE 3: sending when buffer is empty
        tb_test_num  = tb_test_num + 1;
        tb_test_case = "sending when buffer is empty";

        testBytes = RESET_BYTES_VALUE;
        numTestBytes = 0;
        
        tb_bytes_expected = RESET_BYTES_VALUE;
        tb_transfer_expected = TRANSFER_ACTIVE_RESET;
        tb_err_expected = ERR_RESET;
        tb_pid_expected = RESET_DATA_VALUE;

        outByte = RESET_DATA_VALUE;
        outByteDecoded = RESET_DATA_VALUE;
        curr_proc = 3'd0;

        reset_dut();

        @(negedge tb_clk);
        tb_err_expected = 1'b1;
        tb_TX_packet = 3'd4;
        curr_proc = tb_TX_packet;
        @(posedge tb_clk);
        tb_TX_packet = 3'b0;
        check_output("sending without filling");

        #(0.1ns);

        // ************************************************************
        // TEST CASE 
        tb_test_num  = tb_test_num + 1;
        tb_test_case = "None";

    end

endmodule