onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /tb_rcv_block/tb_clk
add wave -noupdate /tb_rcv_block/DUT/start/start_bit_detected
add wave -noupdate /tb_rcv_block/tb_serial_in
add wave -noupdate /tb_rcv_block/DUT/receiver_control/sbc_clear
add wave -noupdate /tb_rcv_block/DUT/receiver_control/sbc_enable
add wave -noupdate /tb_rcv_block/DUT/receiver_control/load_buffer
add wave -noupdate /tb_rcv_block/DUT/receiver_control/enable_timer
add wave -noupdate /tb_rcv_block/DUT/receiver_control/state
add wave -noupdate /tb_rcv_block/DUT/receiver_control/nxt_state
add wave -noupdate -divider Output
add wave -noupdate -group {Data output} /tb_rcv_block/DUT/s9/par_reg
add wave -noupdate -group {Data output} /tb_rcv_block/tb_rx_data
add wave -noupdate -group {Data output} /tb_rcv_block/tb_expected_rx_data
add wave -noupdate -expand -group {Stop bit} /tb_rcv_block/DUT/s9/stop_bit
add wave -noupdate -expand -group {Stop bit} /tb_rcv_block/tb_test_stop_bit
add wave -noupdate -group Overrun /tb_rcv_block/DUT/overrun_error
add wave -noupdate -group Overrun /tb_rcv_block/tb_overrun_error
add wave -noupdate -group {Framing error} /tb_rcv_block/DUT/stopbit_checker/framing_error
add wave -noupdate -group {Framing error} /tb_rcv_block/tb_framing_error
add wave -noupdate /tb_rcv_block/tb_test_case
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {2022354 ps} 0}
quietly wave cursor active 1
configure wave -namecolwidth 150
configure wave -valuecolwidth 100
configure wave -justifyvalue left
configure wave -signalnamewidth 1
configure wave -snapdistance 10
configure wave -datasetprefix 0
configure wave -rowmargin 4
configure wave -childrowmargin 2
configure wave -gridoffset 0
configure wave -gridperiod 1
configure wave -griddelta 40
configure wave -timeline 0
configure wave -timelineunits ps
update
WaveRestoreZoom {2007014 ps} {2183842 ps}
