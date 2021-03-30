onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /tb_ahb_lite_slave/DUT/hrdata
add wave -noupdate /tb_ahb_lite_slave/DUT/hresp
add wave -noupdate /tb_ahb_lite_slave/DUT/data_ready
add wave -noupdate /tb_ahb_lite_slave/tb_expected_data_ready
add wave -noupdate /tb_ahb_lite_slave/DUT/sample_data
add wave -noupdate /tb_ahb_lite_slave/tb_expected_sample
add wave -noupdate /tb_ahb_lite_slave/DUT/new_coefficient_set
add wave -noupdate /tb_ahb_lite_slave/tb_expected_new_coeff_set
add wave -noupdate /tb_ahb_lite_slave/tb_expected_coeff
add wave -noupdate /tb_ahb_lite_slave/DUT/new_coefficient_set
add wave -noupdate /tb_ahb_lite_slave/tb_new_coeff_set
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {140000 ps} 0}
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
WaveRestoreZoom {0 ps} {336 ns}
