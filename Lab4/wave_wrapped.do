onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /tb_flex_5bitcounter/DUT/clk
add wave -noupdate /tb_flex_5bitcounter/DUT/n_rst
add wave -noupdate /tb_flex_5bitcounter/DUT/clear
add wave -noupdate /tb_flex_5bitcounter/DUT/count_enable
add wave -noupdate /tb_flex_5bitcounter/check_output/expected_value
add wave -noupdate /tb_flex_5bitcounter/DUT/count_out
add wave -noupdate /tb_flex_5bitcounter/check_output/expected_roll
add wave -noupdate /tb_flex_5bitcounter/DUT/rollover_flag
add wave -noupdate /tb_flex_5bitcounter/tb_test_case
add wave -noupdate /tb_flex_5bitcounter/DUT/rollover_val
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {95438 ps} 0}
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
WaveRestoreZoom {78635 ps} {102086 ps}
