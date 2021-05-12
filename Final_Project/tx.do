onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /tb_tx_db_wrapper/tb_test_num
add wave -noupdate /tb_tx_db_wrapper/tb_test_case
add wave -noupdate /tb_tx_db_wrapper/tb_clk
add wave -noupdate /tb_tx_db_wrapper/tb_n_rst
add wave -noupdate /tb_tx_db_wrapper/tb_TX_transfer_active
add wave -noupdate /tb_tx_db_wrapper/tb_TX_err
add wave -noupdate -color White /tb_tx_db_wrapper/tb_dplus_out
add wave -noupdate -color White /tb_tx_db_wrapper/tb_dminus_out
add wave -noupdate /tb_tx_db_wrapper/tb_TX_packet_data
add wave -noupdate /tb_tx_db_wrapper/tb_TX_packet
add wave -noupdate -color Gold /tb_tx_db_wrapper/DUT/TX/TX_TIMER/shift_enable
add wave -noupdate -color Gold /tb_tx_db_wrapper/DUT/TX/TX_TIMER/byte_sent
add wave -noupdate /tb_tx_db_wrapper/outBit
add wave -noupdate /tb_tx_db_wrapper/outByte
add wave -noupdate -color Blue /tb_tx_db_wrapper/outByteDecoded
add wave -noupdate /tb_tx_db_wrapper/DUT/TX/curr_proc
add wave -noupdate /tb_tx_db_wrapper/tb_buffer_occupancy
add wave -noupdate /tb_tx_db_wrapper/DUT/TX/TX_RCU/state
add wave -noupdate /tb_tx_db_wrapper/DUT/TX/CRC_TOKEN/crc
add wave -noupdate /tb_tx_db_wrapper/DUT/TX/TX_RCU/load_crc
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {1445951 ps} 0}
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
configure wave -timelineunits ns
update
WaveRestoreZoom {257462 ps} {3102422 ps}
