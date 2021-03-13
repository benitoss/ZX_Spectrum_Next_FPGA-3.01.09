set_time_format -unit ns -decimal_places 3

create_clock -name {clock_50_i} -period 20 [get_ports {clock_50_i}]

create_clock -name {CLK_3M5_CONT} -period 285.714

set_multicycle_path -to {*} -setup 2
set_multicycle_path -to {*} -hold 1

set_multicycle_path -setup -end -to [get_keepers {zxnext:zxnext|T80Na:cpu_mod|*}] 2
set_multicycle_path -hold -end -to [get_keepers {zxnext:zxnext|T80Na:cpu_mod|*}] 1


#set_multicycle_path -to {zxnext:zxnext|T80Na:cpu_mod|*} -setup 2
#set_multicycle_path -to {zxnext:zxnext|T80Na:cpu_mod|*} -hold 1

#set_multicycle_path -to {spi_sck} -setup 2
#set_multicycle_path -to {spi_sck} -hold 1



derive_pll_clocks
derive_clock_uncertainty