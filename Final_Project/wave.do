onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /tb_rx_full_design/tb_clk
add wave -noupdate /tb_rx_full_design/tb_n_rst
add wave -noupdate /tb_rx_full_design/DUT/controller/s_val
add wave -noupdate /tb_rx_full_design/DUT/decoder/decoded
add wave -noupdate /tb_rx_full_design/DUT/shift/sr9/serial_in
add wave -noupdate /tb_rx_full_design/DUT/shift/sr9/shift_enable
add wave -noupdate /tb_rx_full_design/DUT/shift/sr9/parallel_out
add wave -noupdate /tb_rx_full_design/DUT/shift/sr9/nxt_state
add wave -noupdate /tb_rx_full_design/DUT/edging/edge_detect
add wave -noupdate /tb_rx_full_design/DUT/controller/byte_detect
add wave -noupdate -expand -group Signal /tb_rx_full_design/tb_input_byte
add wave -noupdate -expand -group Signal /tb_rx_full_design/tb_d_encode
add wave -noupdate -expand -group Signal /tb_rx_full_design/tb_d_plus
add wave -noupdate -expand -group Signal /tb_rx_full_design/tb_d_minus
add wave -noupdate -group rx_data_ready /tb_rx_full_design/tb_rx_data_ready
add wave -noupdate -group rx_data_ready /tb_rx_full_design/check_output/expected_rx_data_ready
add wave -noupdate -group rx_transfer_active /tb_rx_full_design/tb_rx_transfer_active
add wave -noupdate -group rx_transfer_active /tb_rx_full_design/check_output/expected_rx_transfer_active
add wave -noupdate -group rx_error /tb_rx_full_design/tb_rx_error
add wave -noupdate -group rx_error /tb_rx_full_design/check_output/expected_rx_error
add wave -noupdate -expand -group clr/flush /tb_rx_full_design/tb_clr
add wave -noupdate -expand -group clr/flush /tb_rx_full_design/check_output/expected_clr
add wave -noupdate -group store_rx_data /tb_rx_full_design/tb_store_rx_data
add wave -noupdate -group store_rx_data /tb_rx_full_design/check_output/expected_store_rx_data
add wave -noupdate -group rx_packet /tb_rx_full_design/tb_rx_packet
add wave -noupdate -group rx_packet /tb_rx_full_design/check_output/expected_rx_packet
add wave -noupdate -group rx_data_output /tb_rx_full_design/tb_rx_data
add wave -noupdate -group rx_data_output /tb_rx_full_design/check_output/expected_rx_data
add wave -noupdate /tb_rx_full_design/tb_test_num
add wave -noupdate /tb_rx_full_design/tb_test_case
add wave -noupdate /tb_rx_full_design/DUT/controller/state
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {162806 ps} 0}
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
WaveRestoreZoom {0 ps} {2399250 ps}