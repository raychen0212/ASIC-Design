onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /tb_apb_slave/DUT/data_read
add wave -noupdate /tb_apb_slave/DUT/pslverr
add wave -noupdate /tb_apb_slave/DUT/data_size
add wave -noupdate /tb_apb_slave/DUT/prdata
add wave -noupdate /tb_apb_slave/DUT/bit_period
add wave -noupdate /tb_apb_slave/tb_expected_data_read
add wave -noupdate /tb_apb_slave/tb_expected_data_size
add wave -noupdate /tb_apb_slave/tb_expected_bit_period
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {128182 ps} 0}
quietly wave cursor active 1
configure wave -namecolwidth 168
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
WaveRestoreZoom {0 ps} {285826 ps}
