transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vlog -sv -work work +incdir+C:/Users/este0/Desktop/Esteban/TEC/2019\ -\ II\ Semestre/Taller\ de\ Diseno\ Digital/TicTacToe {C:/Users/este0/Desktop/Esteban/TEC/2019 - II Semestre/Taller de Diseno Digital/TicTacToe/sprite_tb.sv}
vlog -sv -work work +incdir+C:/Users/este0/Desktop/Esteban/TEC/2019\ -\ II\ Semestre/Taller\ de\ Diseno\ Digital/TicTacToe {C:/Users/este0/Desktop/Esteban/TEC/2019 - II Semestre/Taller de Diseno Digital/TicTacToe/address_gen.sv}

