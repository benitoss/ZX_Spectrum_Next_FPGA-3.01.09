set_global_assignment -entity "next_clocks" -library "lib_next_clocks" -name IP_TOOL_NAME "altera_pll"
set_global_assignment -entity "next_clocks" -library "lib_next_clocks" -name IP_TOOL_VERSION "17.0"
set_global_assignment -entity "next_clocks" -library "lib_next_clocks" -name IP_TOOL_ENV "mwpim"
set_global_assignment -library "lib_next_clocks" -name SPD_FILE [file join $::quartus(sip_path) "next_clocks.spd"]

set_global_assignment -library "lib_next_clocks" -name MISC_FILE [file join $::quartus(sip_path) "next_clocks_sim/next_clocks.vho"]
