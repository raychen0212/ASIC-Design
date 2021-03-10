onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate -expand -group Control_unit /tb_fir_filter/DUT/control_unit/cnt_up
add wave -noupdate -expand -group Control_unit /tb_fir_filter/DUT/control_unit/clear
add wave -noupdate -expand -group Control_unit /tb_fir_filter/DUT/control_unit/modwait
add wave -noupdate -expand -group Control_unit /tb_fir_filter/DUT/control_unit/err
add wave -noupdate -expand -group Control_unit /tb_fir_filter/DUT/control_unit/op
add wave -noupdate -expand -group Control_unit /tb_fir_filter/DUT/control_unit/src1
add wave -noupdate -expand -group Control_unit /tb_fir_filter/DUT/control_unit/src2
add wave -noupdate -expand -group Control_unit /tb_fir_filter/DUT/control_unit/dest
add wave -noupdate -expand -group Control_unit /tb_fir_filter/DUT/control_unit/state
add wave -noupdate -expand -group Control_unit /tb_fir_filter/DUT/control_unit/nxt_state
add wave -noupdate -expand -group Control_unit /tb_fir_filter/DUT/control_unit/nxt_mod
add wave -noupdate /tb_fir_filter/DUT/fir_out
add wave -noupdate /tb_fir_filter/tb_expected_fir_out
add wave -noupdate /tb_fir_filter/DUT/countup/one_k_samples
add wave -noupdate /tb_fir_filter/DUT/countup/counting
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {425990 ps} 0}
quietly wave cursor active 1
configure wave -namecolwidth 150
configure wave -valuecolwidth 196
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
WaveRestoreZoom {86573 ps} {838246 ps}
