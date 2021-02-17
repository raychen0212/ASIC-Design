onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /tb_flex_counter/DUT/NUM_CNT_BITS
add wave -noupdate /tb_flex_counter/DUT/clk
add wave -noupdate /tb_flex_counter/DUT/n_rst
add wave -noupdate /tb_flex_counter/DUT/clear
add wave -noupdate /tb_flex_counter/DUT/count_enable
add wave -noupdate /tb_flex_counter/DUT/rollover_val
add wave -noupdate /tb_flex_counter/DUT/count_out
add wave -noupdate /tb_flex_counter/DUT/rollover_flag
add wave -noupdate /tb_flex_counter/tb_test_case
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {49166 ps} 0}
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
WaveRestoreZoom {49050 ps} {50050 ps}
