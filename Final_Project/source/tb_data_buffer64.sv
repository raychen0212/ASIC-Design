`timescale 1ns / 10ps

module tb_data_buffer64;
    
    localparam PROPAGATION_DELAY	= 1ns;
	localparam CLK_PERIOD		= 10ns;

    localparam BUFFER_SIZE = 64;
    localparam RESET_DATA_VALUE = 8'd0;
    localparam RESET_BYTES_VALUE = {BUFFER_SIZE{RESET_DATA_VALUE}};
    localparam RESET_BUFFER_OCCUPANCY_VALUE = 7'd0;
    localparam BYTE_SIZE = 8;
    localparam BUFFER_OCCUPANCY_SIZE = 7;

    integer tb_test_num;
    string  tb_test_case;
    string  tb_stream_check_tag;
    logic   tb_mismatch;
    logic   tb_check;
    int i;

    logic tb_clk;
    logic tb_n_rst;
    logic [7:0] tb_TX_data;
    logic tb_store_TX_data;
    logic [7:0] tb_RX_packet_data;
    logic tb_store_RX_packet_data;
    logic tb_clear;
    logic tb_flush;
    logic tb_get_TX_packet_data;
    logic tb_get_RX_data;
    logic [7:0] tb_RX_data;
    logic [7:0] tb_TX_packet_data;
    logic [6:0] tb_buffer_occupancy;

    logic [BUFFER_SIZE - 1:0][BYTE_SIZE - 1:0] testBytes;
    int numTestBytes;

    logic [BUFFER_SIZE - 1:0][BYTE_SIZE - 1:0] outBytes;
    logic [BUFFER_SIZE - 1:0][BYTE_SIZE - 1:0] tb_expected_data;
    logic [BUFFER_OCCUPANCY_SIZE - 1:0] tb_expected_buffer_occupancy;

    data_buffer64 DUT (
        .clk(tb_clk),
        .n_rst(tb_n_rst),
        .TX_data(tb_TX_data),
        .store_TX_data(tb_store_TX_data),
        .RX_packet_data(tb_RX_packet_data),
        .store_RX_packet_data(tb_store_RX_packet_data),
        .clear(tb_clear),
        .flush(tb_flush),
        .get_TX_packet_data(tb_get_TX_packet_data),
        .get_RX_data(tb_get_RX_data),
        .RX_data(tb_RX_data),
        .TX_packet_data(tb_TX_packet_data),
        .buffer_occupancy(tb_buffer_occupancy)
    );

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
	
	// Clock gen block
	always
	begin : CLK_GEN
		tb_clk = 1'b0;
		#(CLK_PERIOD / 2.0);
		tb_clk = 1'b1;
		#(CLK_PERIOD / 2.0);
	end

    task check_buffer_occupancy;
        input string check_tag;
    begin
        tb_mismatch = 1'b0;
        tb_check    = 1'b1;
        if(tb_expected_buffer_occupancy == tb_buffer_occupancy) begin // Check passed
            // $info("Correct buffer occupancy %s during %s test case", check_tag, tb_test_case);
        end
        else begin // Check failed
            tb_mismatch = 1'b1;
            $error("Incorrect buffer occupancy %s during %s test case", check_tag, tb_test_case);
        end
        
        #(0.1);
        tb_check =1'b0;
    end
    endtask

    task check_output_data;
        input logic toAHB;
        input integer index;
        input string check_tag;
    begin
        tb_mismatch = 1'b0;
        tb_check    = 1'b1;
        
        if(toAHB == 1'b1) begin
            if(tb_expected_data[index] == tb_RX_data) begin // Check passed
                // $info("Correct output %s to AHB at index %d during %s test case", check_tag, index, tb_test_case);
            end
            else begin // Check failed
                tb_mismatch = 1'b1;   
                $error("Incorrect output %s to AHB at index %d during %s test case. Read: %d", check_tag, index, tb_test_case, tb_RX_data);
            end
        end
        else begin
            if(tb_expected_data[index] == tb_TX_packet_data) begin // Check passed
                // $info("Correct output %s to TX at index %d during %s test case", check_tag, index, tb_test_case);
            end
            else begin // Check failed
                tb_mismatch = 1'b1;   
                $error("Incorrect output %s to TX at index %d during %s test case", check_tag, index, tb_test_case);
            end
        end
        
        
        #(0.1);
        tb_check =1'b0;
    end
    endtask

    task read_bytes;
        input logic toAHB;
        input string check_tag;
    begin
        @(negedge tb_clk);
        if(toAHB == 1'b1) begin
            tb_get_RX_data = 1'b1;
            @(posedge tb_clk);
            for (i = 0; i < numTestBytes; i=i+1) begin
                if(i == numTestBytes - 1) begin
                    tb_get_RX_data = 1'b0;              
                end
                @(posedge tb_clk);
                outBytes[i] = tb_TX_data;
                check_output_data(toAHB, i, check_tag);
            end
        end else begin
            tb_get_TX_packet_data = 1'b1;
            @(posedge tb_clk);
            for (i = 0; i < numTestBytes; i=i+1) begin
                if(i == numTestBytes - 1) begin
                    tb_get_TX_packet_data = 1'b0;              
                end

                @(posedge tb_clk);
                outBytes[i] = tb_TX_packet_data;
                check_output_data(toAHB, i, check_tag);
            end
        end
    end
    endtask

    task load_bytes;
        input logic fromAHB;
    begin
        @(negedge tb_clk);
        if(fromAHB == 1'b1) begin
            tb_store_TX_data = 1'b1;
            for (i = 0; i < numTestBytes; i=i+1) begin
                tb_TX_data = testBytes[i];
                @(negedge tb_clk);
            end
            tb_store_TX_data = 1'b0;            
        end else begin
            tb_store_RX_packet_data = 1'b1;
            for (i = 0; i < numTestBytes; i=i+1) begin
                tb_RX_packet_data = testBytes[i];
                @(negedge tb_clk);
            end
            tb_store_RX_packet_data = 1'b0;  
        end
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
        tb_get_TX_packet_data = 1'b0;

        tb_mismatch = 1'b0;
        tb_check = 1'b0;

        testBytes = RESET_BYTES_VALUE;
        outBytes = RESET_BYTES_VALUE;
        tb_expected_data = RESET_BYTES_VALUE;
        tb_expected_buffer_occupancy = RESET_BUFFER_OCCUPANCY_VALUE;
        numTestBytes = 0;

        #(1ns);

        // TEST CASE 1: power-on reset
        tb_test_num  = tb_test_num + 1;
        tb_test_case = "Power on Reset";
        #(1ns);
        tb_n_rst = 1'b0;

        #(CLK_PERIOD * 0.5);
        tb_expected_data = RESET_BYTES_VALUE;
        tb_expected_buffer_occupancy = RESET_BUFFER_OCCUPANCY_VALUE;
        check_output_data(1'b0, 0, "after reset applied");
        check_output_data(1'b1, 0, "after reset applied");
        check_buffer_occupancy("after reset applied");

        #(CLK_PERIOD);
        check_output_data(1'b0, 0, "1 clk after reset applied");
        check_output_data(1'b1, 0, "1 clk after reset applied");
        check_buffer_occupancy("1 clk after reset applied");

        @(negedge tb_clk);
        tb_n_rst  = 1'b1;   
        #(PROPAGATION_DELAY);
        check_output_data(1'b0, 0, "after reset was released");
        check_output_data(1'b1, 0, "after reset was released");
        check_buffer_occupancy("after reset was released");
        #(1ns);
        // ************************************************************
        // TEST CASE 2: Load 3 bytes from AHB to TX
        tb_test_num  = tb_test_num + 1;
        tb_test_case = "Load and read 3 bytes from AHB to TX";

        testBytes = RESET_BYTES_VALUE;
        outBytes = RESET_BYTES_VALUE;
        tb_expected_data = RESET_BYTES_VALUE;
        tb_expected_buffer_occupancy = RESET_BUFFER_OCCUPANCY_VALUE;
        numTestBytes = 0;
        reset_dut();

        testBytes[2:0] = {8'd3, 8'd2, 8'd1};
        numTestBytes = 3;
        load_bytes(1'b1);

        tb_expected_data = testBytes;
        read_bytes(1'b0, "after loading in 3 bytes");
        
        #(1ns);
        // ************************************************************
        // TEST CASE 3: Load and read 40 bytes from AHB to TX
        tb_test_num  = tb_test_num + 1;
        tb_test_case = "Load and read 40 bytes from AHB to TX";

        testBytes = RESET_BYTES_VALUE;
        outBytes = RESET_BYTES_VALUE;
        tb_expected_data = RESET_BYTES_VALUE;
        tb_expected_buffer_occupancy = RESET_BUFFER_OCCUPANCY_VALUE;
        numTestBytes = 0;
        reset_dut();

        numTestBytes = 40;
        for (i = 0; i < 40; i = i + 1) begin
            testBytes[i] = i + 1;
        end

        load_bytes(1'b1);
        @(posedge tb_clk);
        tb_expected_data = testBytes;
        read_bytes(1'b0, "after loading in 40 bytes");
        
        #(1ns);
        // ************************************************************
        // TEST CASE 4: fill up and read buffer from AHB to TX
        tb_test_num  = tb_test_num + 1;
        tb_test_case = "fill and read up buffer from AHB to TX";

        testBytes = RESET_BYTES_VALUE;
        outBytes = RESET_BYTES_VALUE;
        tb_expected_data = RESET_BYTES_VALUE;
        tb_expected_buffer_occupancy = RESET_BUFFER_OCCUPANCY_VALUE;
        numTestBytes = 0;
        reset_dut();

        numTestBytes = 64;
        for (i = 0; i < numTestBytes; i = i + 1) begin
            testBytes[i] = (i + 1) * 2;
        end

        load_bytes(1'b0);

        @(posedge tb_clk);
        #(PROPAGATION_DELAY);
        tb_expected_buffer_occupancy = numTestBytes;
        check_buffer_occupancy("after filling up buffer");

        tb_expected_data = testBytes;
        read_bytes(1'b1, "after filling up buffer");

        @(posedge tb_clk);
        #(PROPAGATION_DELAY);
        tb_expected_buffer_occupancy = 0;
        check_buffer_occupancy("after reading from buffer");
        
        #(1ns);

        // ************************************************************
        // TEST CASE 5: Load 3 bytes from RX to AHB
        tb_test_num  = tb_test_num + 1;
        tb_test_case = "Load and read 3 bytes from RX to AHB";

        testBytes = RESET_BYTES_VALUE;
        outBytes = RESET_BYTES_VALUE;
        tb_expected_data = RESET_BYTES_VALUE;
        tb_expected_buffer_occupancy = RESET_BUFFER_OCCUPANCY_VALUE;
        numTestBytes = 0;
        reset_dut();

        testBytes[2:0] = {8'd3, 8'd2, 8'd1};
        numTestBytes = 3;
        load_bytes(1'b0);

        tb_expected_data = testBytes;
        read_bytes(1'b1, "after loading in 3 bytes");
        
        #(1ns);
        // ************************************************************
        // TEST CASE 6: Load and read 40 bytes from RX to AHB
        tb_test_num  = tb_test_num + 1;
        tb_test_case = "Load and read 40 bytes from RX to AHB";

        testBytes = RESET_BYTES_VALUE;
        outBytes = RESET_BYTES_VALUE;
        tb_expected_data = RESET_BYTES_VALUE;
        tb_expected_buffer_occupancy = RESET_BUFFER_OCCUPANCY_VALUE;
        numTestBytes = 0;
        reset_dut();

        numTestBytes = 40;
        for (i = 0; i < 40; i = i + 1) begin
            testBytes[i] = i + 1;
        end

        load_bytes(1'b0);
        @(posedge tb_clk);
        tb_expected_data = testBytes;
        read_bytes(1'b1, "after loading in 40 bytes");
        
        #(1ns);
        // ************************************************************
        // TEST CASE 7: fill up andrad buffer from RX to AHB
        tb_test_num  = tb_test_num + 1;
        tb_test_case = "fill up buffer from RX to AHB";

        testBytes = RESET_BYTES_VALUE;
        outBytes = RESET_BYTES_VALUE;
        tb_expected_data = RESET_BYTES_VALUE;
        tb_expected_buffer_occupancy = RESET_BUFFER_OCCUPANCY_VALUE;
        numTestBytes = 0;
        reset_dut();

        numTestBytes = 64;
        for (i = 0; i < numTestBytes; i = i + 1) begin
            testBytes[i] = (i + 1) * 2;
        end

        load_bytes(1'b1);

        @(posedge tb_clk);
        #(PROPAGATION_DELAY);
        tb_expected_buffer_occupancy = numTestBytes;
        check_buffer_occupancy("after filling up buffer");

        tb_expected_data = testBytes;
        read_bytes(1'b0, "after filling up buffer");

        @(posedge tb_clk);
        #(PROPAGATION_DELAY);
        tb_expected_buffer_occupancy = 0;
        check_buffer_occupancy("after reading from buffer");
        
        #(1ns);

        // ************************************************************
        // TEST CASE 8 check clear
        tb_test_num  = tb_test_num + 1;
        tb_test_case = "check clear";

        testBytes = RESET_BYTES_VALUE;
        outBytes = RESET_BYTES_VALUE;
        tb_expected_data = RESET_BYTES_VALUE;
        tb_expected_buffer_occupancy = RESET_BUFFER_OCCUPANCY_VALUE;
        numTestBytes = 0;
        reset_dut();

        numTestBytes = 10;
        for (i = 0; i < numTestBytes; i = i + 1) begin
            testBytes[i] = 11 + i;
        end

        load_bytes(1'b1);

        @(posedge tb_clk);
        tb_expected_buffer_occupancy = numTestBytes;
        #(PROPAGATION_DELAY);
        check_buffer_occupancy("after putting 10 bytes");

        tb_expected_data = testBytes;
        read_bytes(1'b1, "after putting 10 bytes");

        @(posedge tb_clk);
        #(PROPAGATION_DELAY);
        tb_expected_buffer_occupancy = 0;
        check_buffer_occupancy("after reading 10 bytes");

        @(negedge tb_clk);
        tb_clear = 1'b1;
        @(posedge tb_clk);
        tb_clear = 1'b0;
        #(PROPAGATION_DELAY);

        @(posedge tb_clk);
        #(PROPAGATION_DELAY);
        tb_expected_buffer_occupancy = 0;
        check_buffer_occupancy("after clearing up buffer");

        numTestBytes = 15;
        for (i = 0; i < numTestBytes; i = i + 1) begin
            testBytes[i] = i + 1;
        end        

        load_bytes(1'b1);

        @(posedge tb_clk);
        #(PROPAGATION_DELAY);
        tb_expected_buffer_occupancy = numTestBytes;
        check_buffer_occupancy("putting 15 bytes after clearing");

        tb_expected_data = testBytes;
        read_bytes(1'b1, "putting 15 bytes after clearing");

        @(posedge tb_clk);
        #(PROPAGATION_DELAY);
        tb_expected_buffer_occupancy = 0;
        check_buffer_occupancy("reading 15 bytes after clearing");

        #(1ns);

        // ************************************************************
        // TEST CASE 9: fill buffer with wait in the middle
        tb_test_num  = tb_test_num + 1;
        tb_test_case = "fill up buffer with wait in the middle";

        testBytes = RESET_BYTES_VALUE;
        outBytes = RESET_BYTES_VALUE;
        tb_expected_data = RESET_BYTES_VALUE;
        tb_expected_buffer_occupancy = RESET_BUFFER_OCCUPANCY_VALUE;
        numTestBytes = 0;
        reset_dut();

        numTestBytes = 10;
        for (i = 0; i < numTestBytes; i = i + 1) begin
            testBytes[i] = i + 1;
        end

        load_bytes(1'b1);
        tb_expected_data = testBytes;

        #(CLK_PERIOD * 10.0);

        numTestBytes = 10;
        for (i = 0; i < numTestBytes; i = i + 1) begin
            testBytes[i] = i + 11;
        end

        load_bytes(1'b1);
        tb_expected_data[19:10] = testBytes[9:0];

        numTestBytes = 20;
        
        @(posedge tb_clk);
        #(PROPAGATION_DELAY);
        tb_expected_buffer_occupancy = numTestBytes;
        check_buffer_occupancy("after second fill done");

        read_bytes(1'b1, "after second fill done");

        #(1ns);




        // ************************************************************
        // TEST CASE 
        tb_test_num  = tb_test_num + 1;
        tb_test_case = "None";
    end

endmodule