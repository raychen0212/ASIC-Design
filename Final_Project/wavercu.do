onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /tb_rx_rcu/DUT/d_edge
add wave -noupdate /tb_rx_rcu/DUT/shift_en
add wave -noupdate /tb_rx_rcu/DUT/byte_detect
add wave -noupdate /tb_rx_rcu/DUT/eop
add wave -noupdate /tb_rx_rcu/DUT/s_val
add wave -noupdate -expand -group rx_data_ready /tb_rx_rcu/DUT/rx_data_ready
add wave -noupdate -expand -group rx_data_ready /tb_rx_rcu/tb_rx_data_ready
add wave -noupdate -expand -group rx_data_ready /tb_rx_rcu/check_output/expected_rx_data_ready
add wave -noupdate -expand -group rx_tranfer_active /tb_rx_rcu/DUT/rx_transfer_active
add wave -noupdate -expand -group rx_tranfer_active /tb_rx_rcu/tb_rx_transfer_active
add wave -noupdate -expand -group rx_tranfer_active /tb_rx_rcu/check_output/expected_rx_transfer_active
add wave -noupdate -expand -group rx_error /tb_rx_rcu/DUT/rx_error
add wave -noupdate -expand -group rx_error /tb_rx_rcu/tb_rx_error
add wave -noupdate -expand -group rx_error /tb_rx_rcu/check_output/expected_rx_error
add wave -noupdate -expand -group clr /tb_rx_rcu/DUT/clr
add wave -noupdate -expand -group clr /tb_rx_rcu/tb_clr
add wave -noupdate -expand -group clr /tb_rx_rcu/check_output/expected_clr
add wave -noupdate -expand -group store_rx_data /tb_rx_rcu/DUT/store_rx_data
add wave -noupdate -expand -group store_rx_data /tb_rx_rcu/tb_store_rx_data
add wave -noupdate -expand -group store_rx_data /tb_rx_rcu/check_output/expected_store_rx_data
add wave -noupdate -expand -group rx_packet /tb_rx_rcu/DUT/rx_packet
add wave -noupdate -expand -group rx_packet /tb_rx_rcu/tb_rx_packet
add wave -noupdate -expand -group rx_packet /tb_rx_rcu/check_output/expected_rx_packet
add wave -noupdate -expand -group rx_data /tb_rx_rcu/DUT/rx_data
add wave -noupdate -expand -group rx_data /tb_rx_rcu/tb_rx_data
add wave -noupdate -expand -group rx_data /tb_rx_rcu/check_output/expected_rx_data
add wave -noupdate /tb_rx_rcu/DUT/state
add wave -noupdate /tb_rx_rcu/tb_test_num
add wave -noupdate /tb_rx_rcu/tb_test_case
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {394725 ps} 0}
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
WaveRestoreZoom {0 ps} {414750 ps}
