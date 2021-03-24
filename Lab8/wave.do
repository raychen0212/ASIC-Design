onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /tb_apb_slave/DUT/data_read
add wave -noupdate /tb_apb_slave/DUT/pslverr
add wave -noupdate /tb_apb_slave/DUT/data_size
add wave -noupdate /tb_apb_slave/DUT/prdata
add wave -noupdate /tb_apb_slave/DUT/bit_period
add wave -noupdate /tb_apb_slave/tb_prdata
add wave -noupdate /tb_apb_slave/tb_expected_data_read
add wave -noupdate /tb_apb_slave/tb_expected_data_size
add wave -noupdate /tb_apb_slave/tb_expected_bit_period
add wave -noupdate /tb_apb_slave/tb_test_case
add wave -noupdate /tb_apb_slave/DUT/pwrite
add wave -noupdate /tb_apb_slave/DUT/psel
add wave -noupdate /tb_apb_slave/DUT/penable
add wave -noupdate /tb_apb_slave/DUT/write_sel
add wave -noupdate /tb_apb_slave/DUT/read_sel
add wave -noupdate /tb_apb_slave/DUT/nxt_reg_map
add wave -noupdate /tb_apb_slave/DUT/reg_map
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {451709 ps} 0}
quietly wave cursor active 1
configure wave -namecolwidth 192
configure wave -valuecolwidth 256
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
WaveRestoreZoom {0 ps} {818288 ps}
