onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /tb_data_buffer64/tb_test_num
add wave -noupdate /tb_data_buffer64/tb_test_case
add wave -noupdate /tb_data_buffer64/tb_mismatch
add wave -noupdate /tb_data_buffer64/tb_check
add wave -noupdate /tb_data_buffer64/tb_clk
add wave -noupdate /tb_data_buffer64/tb_n_rst
add wave -noupdate -group {WRITE signals} /tb_data_buffer64/DUT/w_sel
add wave -noupdate -group {WRITE signals} -radix hexadecimal /tb_data_buffer64/DUT/write_data
add wave -noupdate -radix decimal /tb_data_buffer64/tb_buffer_occupancy
add wave -noupdate -expand -group {from AHB} -color Blue /tb_data_buffer64/tb_store_TX_data
add wave -noupdate -expand -group {from AHB} -color Gold -radix unsigned /tb_data_buffer64/tb_TX_data
add wave -noupdate -expand -group {from RX} -color Blue /tb_data_buffer64/tb_store_RX_packet_data
add wave -noupdate -expand -group {from RX} -color Gold -radix unsigned /tb_data_buffer64/tb_RX_packet_data
add wave -noupdate -expand -group {to TX} -color Blue /tb_data_buffer64/tb_get_TX_packet_data
add wave -noupdate -expand -group {to TX} -color Gold -radix unsigned /tb_data_buffer64/tb_TX_packet_data
add wave -noupdate -expand -group {to AHB} -color Blue /tb_data_buffer64/tb_get_RX_data
add wave -noupdate -expand -group {to AHB} -color Gold -radix unsigned /tb_data_buffer64/tb_RX_data
add wave -noupdate -expand -group RESET /tb_data_buffer64/tb_clear
add wave -noupdate -expand -group RESET /tb_data_buffer64/tb_flush
add wave -noupdate -radix unsigned /tb_data_buffer64/tb_expected_data
add wave -noupdate -radix unsigned /tb_data_buffer64/tb_buffer_occupancy
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {2344027 ps} 0}
quietly wave cursor active 1
configure wave -namecolwidth 182
configure wave -valuecolwidth 101
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
configure wave -timelineunits ns
update
WaveRestoreZoom {2323551 ps} {2384103 ps}
