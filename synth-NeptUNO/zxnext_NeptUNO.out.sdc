## Generated SDC file "zxnext_NeptUNO.out.sdc"

## Copyright (C) 2017  Intel Corporation. All rights reserved.
## Your use of Intel Corporation's design tools, logic functions 
## and other software and tools, and its AMPP partner logic 
## functions, and any output files from any of the foregoing 
## (including device programming or simulation files), and any 
## associated documentation or information are expressly subject 
## to the terms and conditions of the Intel Program License 
## Subscription Agreement, the Intel Quartus Prime License Agreement,
## the Intel MegaCore Function License Agreement, or other 
## applicable license agreement, including, without limitation, 
## that your use is for the sole purpose of programming logic 
## devices manufactured by Intel and sold by Intel or its 
## authorized distributors.  Please refer to the applicable 
## agreement for further details.


## VENDOR  "Altera"
## PROGRAM "Quartus Prime"
## VERSION "Version 17.0.0 Build 595 04/25/2017 SJ Lite Edition"

## DATE    "Fri Dec 04 15:41:52 2020"

##
## DEVICE  "EP4CE55F23C8"
##


#**************************************************************
# Time Information
#**************************************************************

set_time_format -unit ns -decimal_places 3



#**************************************************************
# Create Clock
#**************************************************************

create_clock -name {clock_50_i} -period 20.000 -waveform { 0.000 10.000 } [get_ports {clock_50_i}]
create_clock -name {CLK_3M5_CONT} -period 285.714 -waveform { 0.000 142.857 } 


#**************************************************************
# Create Generated Clock
#**************************************************************

create_generated_clock -name {clocks_inst|altpll_component|auto_generated|pll1|clk[0]} -source [get_pins {clocks_inst|altpll_component|auto_generated|pll1|inclk[0]}] -duty_cycle 50/1 -multiply_by 14 -divide_by 25 -master_clock {clock_50_i} [get_pins {clocks_inst|altpll_component|auto_generated|pll1|clk[0]}] 
create_generated_clock -name {clocks_inst|altpll_component|auto_generated|pll1|clk[1]} -source [get_pins {clocks_inst|altpll_component|auto_generated|pll1|inclk[0]}] -duty_cycle 50/1 -multiply_by 14 -divide_by 25 -phase 180.000 -master_clock {clock_50_i} [get_pins {clocks_inst|altpll_component|auto_generated|pll1|clk[1]}] 
create_generated_clock -name {clocks_inst|altpll_component|auto_generated|pll1|clk[2]} -source [get_pins {clocks_inst|altpll_component|auto_generated|pll1|inclk[0]}] -duty_cycle 50/1 -multiply_by 7 -divide_by 25 -master_clock {clock_50_i} [get_pins {clocks_inst|altpll_component|auto_generated|pll1|clk[2]}] 
create_generated_clock -name {clocks_inst|altpll_component|auto_generated|pll1|clk[3]} -source [get_pins {clocks_inst|altpll_component|auto_generated|pll1|inclk[0]}] -duty_cycle 50/1 -multiply_by 7 -divide_by 50 -master_clock {clock_50_i} [get_pins {clocks_inst|altpll_component|auto_generated|pll1|clk[3]}] 
create_generated_clock -name {clocks_inst|altpll_component|auto_generated|pll1|clk[4]} -source [get_pins {clocks_inst|altpll_component|auto_generated|pll1|inclk[0]}] -duty_cycle 50/1 -multiply_by 14 -divide_by 5 -master_clock {clock_50_i} [get_pins {clocks_inst|altpll_component|auto_generated|pll1|clk[4]}] 


#**************************************************************
# Set Clock Latency
#**************************************************************



#**************************************************************
# Set Clock Uncertainty
#**************************************************************

set_clock_uncertainty -rise_from [get_clocks {clock_50_i}] -rise_to [get_clocks {clocks_inst|altpll_component|auto_generated|pll1|clk[0]}] -setup 0.060  
set_clock_uncertainty -rise_from [get_clocks {clock_50_i}] -rise_to [get_clocks {clocks_inst|altpll_component|auto_generated|pll1|clk[0]}] -hold 0.090  
set_clock_uncertainty -rise_from [get_clocks {clock_50_i}] -fall_to [get_clocks {clocks_inst|altpll_component|auto_generated|pll1|clk[0]}] -setup 0.060  
set_clock_uncertainty -rise_from [get_clocks {clock_50_i}] -fall_to [get_clocks {clocks_inst|altpll_component|auto_generated|pll1|clk[0]}] -hold 0.090  
set_clock_uncertainty -rise_from [get_clocks {clock_50_i}] -rise_to [get_clocks {clocks_inst|altpll_component|auto_generated|pll1|clk[2]}] -setup 0.060  
set_clock_uncertainty -rise_from [get_clocks {clock_50_i}] -rise_to [get_clocks {clocks_inst|altpll_component|auto_generated|pll1|clk[2]}] -hold 0.090  
set_clock_uncertainty -rise_from [get_clocks {clock_50_i}] -fall_to [get_clocks {clocks_inst|altpll_component|auto_generated|pll1|clk[2]}] -setup 0.060  
set_clock_uncertainty -rise_from [get_clocks {clock_50_i}] -fall_to [get_clocks {clocks_inst|altpll_component|auto_generated|pll1|clk[2]}] -hold 0.090  
set_clock_uncertainty -rise_from [get_clocks {clock_50_i}] -rise_to [get_clocks {clocks_inst|altpll_component|auto_generated|pll1|clk[3]}] -setup 0.060  
set_clock_uncertainty -rise_from [get_clocks {clock_50_i}] -rise_to [get_clocks {clocks_inst|altpll_component|auto_generated|pll1|clk[3]}] -hold 0.090  
set_clock_uncertainty -rise_from [get_clocks {clock_50_i}] -fall_to [get_clocks {clocks_inst|altpll_component|auto_generated|pll1|clk[3]}] -setup 0.060  
set_clock_uncertainty -rise_from [get_clocks {clock_50_i}] -fall_to [get_clocks {clocks_inst|altpll_component|auto_generated|pll1|clk[3]}] -hold 0.090  
set_clock_uncertainty -fall_from [get_clocks {clock_50_i}] -rise_to [get_clocks {clocks_inst|altpll_component|auto_generated|pll1|clk[0]}] -setup 0.060  
set_clock_uncertainty -fall_from [get_clocks {clock_50_i}] -rise_to [get_clocks {clocks_inst|altpll_component|auto_generated|pll1|clk[0]}] -hold 0.090  
set_clock_uncertainty -fall_from [get_clocks {clock_50_i}] -fall_to [get_clocks {clocks_inst|altpll_component|auto_generated|pll1|clk[0]}] -setup 0.060  
set_clock_uncertainty -fall_from [get_clocks {clock_50_i}] -fall_to [get_clocks {clocks_inst|altpll_component|auto_generated|pll1|clk[0]}] -hold 0.090  
set_clock_uncertainty -fall_from [get_clocks {clock_50_i}] -rise_to [get_clocks {clocks_inst|altpll_component|auto_generated|pll1|clk[2]}] -setup 0.060  
set_clock_uncertainty -fall_from [get_clocks {clock_50_i}] -rise_to [get_clocks {clocks_inst|altpll_component|auto_generated|pll1|clk[2]}] -hold 0.090  
set_clock_uncertainty -fall_from [get_clocks {clock_50_i}] -fall_to [get_clocks {clocks_inst|altpll_component|auto_generated|pll1|clk[2]}] -setup 0.060  
set_clock_uncertainty -fall_from [get_clocks {clock_50_i}] -fall_to [get_clocks {clocks_inst|altpll_component|auto_generated|pll1|clk[2]}] -hold 0.090  
set_clock_uncertainty -fall_from [get_clocks {clock_50_i}] -rise_to [get_clocks {clocks_inst|altpll_component|auto_generated|pll1|clk[3]}] -setup 0.060  
set_clock_uncertainty -fall_from [get_clocks {clock_50_i}] -rise_to [get_clocks {clocks_inst|altpll_component|auto_generated|pll1|clk[3]}] -hold 0.090  
set_clock_uncertainty -fall_from [get_clocks {clock_50_i}] -fall_to [get_clocks {clocks_inst|altpll_component|auto_generated|pll1|clk[3]}] -setup 0.060  
set_clock_uncertainty -fall_from [get_clocks {clock_50_i}] -fall_to [get_clocks {clocks_inst|altpll_component|auto_generated|pll1|clk[3]}] -hold 0.090  
set_clock_uncertainty -rise_from [get_clocks {clocks_inst|altpll_component|auto_generated|pll1|clk[0]}] -rise_to [get_clocks {clocks_inst|altpll_component|auto_generated|pll1|clk[0]}]  0.030  
set_clock_uncertainty -rise_from [get_clocks {clocks_inst|altpll_component|auto_generated|pll1|clk[0]}] -fall_to [get_clocks {clocks_inst|altpll_component|auto_generated|pll1|clk[0]}]  0.030  
set_clock_uncertainty -rise_from [get_clocks {clocks_inst|altpll_component|auto_generated|pll1|clk[0]}] -rise_to [get_clocks {clocks_inst|altpll_component|auto_generated|pll1|clk[1]}]  0.020  
set_clock_uncertainty -rise_from [get_clocks {clocks_inst|altpll_component|auto_generated|pll1|clk[0]}] -fall_to [get_clocks {clocks_inst|altpll_component|auto_generated|pll1|clk[1]}]  0.020  
set_clock_uncertainty -rise_from [get_clocks {clocks_inst|altpll_component|auto_generated|pll1|clk[0]}] -rise_to [get_clocks {clocks_inst|altpll_component|auto_generated|pll1|clk[2]}]  0.030  
set_clock_uncertainty -rise_from [get_clocks {clocks_inst|altpll_component|auto_generated|pll1|clk[0]}] -fall_to [get_clocks {clocks_inst|altpll_component|auto_generated|pll1|clk[2]}]  0.030  
set_clock_uncertainty -rise_from [get_clocks {clocks_inst|altpll_component|auto_generated|pll1|clk[0]}] -rise_to [get_clocks {clocks_inst|altpll_component|auto_generated|pll1|clk[3]}]  0.030  
set_clock_uncertainty -rise_from [get_clocks {clocks_inst|altpll_component|auto_generated|pll1|clk[0]}] -fall_to [get_clocks {clocks_inst|altpll_component|auto_generated|pll1|clk[3]}]  0.030  
set_clock_uncertainty -rise_from [get_clocks {clocks_inst|altpll_component|auto_generated|pll1|clk[0]}] -rise_to [get_clocks {clocks_inst|altpll_component|auto_generated|pll1|clk[4]}]  0.020  
set_clock_uncertainty -rise_from [get_clocks {clocks_inst|altpll_component|auto_generated|pll1|clk[0]}] -fall_to [get_clocks {clocks_inst|altpll_component|auto_generated|pll1|clk[4]}]  0.020  
set_clock_uncertainty -fall_from [get_clocks {clocks_inst|altpll_component|auto_generated|pll1|clk[0]}] -rise_to [get_clocks {clocks_inst|altpll_component|auto_generated|pll1|clk[0]}]  0.030  
set_clock_uncertainty -fall_from [get_clocks {clocks_inst|altpll_component|auto_generated|pll1|clk[0]}] -fall_to [get_clocks {clocks_inst|altpll_component|auto_generated|pll1|clk[0]}]  0.030  
set_clock_uncertainty -fall_from [get_clocks {clocks_inst|altpll_component|auto_generated|pll1|clk[0]}] -rise_to [get_clocks {clocks_inst|altpll_component|auto_generated|pll1|clk[1]}]  0.020  
set_clock_uncertainty -fall_from [get_clocks {clocks_inst|altpll_component|auto_generated|pll1|clk[0]}] -fall_to [get_clocks {clocks_inst|altpll_component|auto_generated|pll1|clk[1]}]  0.020  
set_clock_uncertainty -fall_from [get_clocks {clocks_inst|altpll_component|auto_generated|pll1|clk[0]}] -rise_to [get_clocks {clocks_inst|altpll_component|auto_generated|pll1|clk[2]}]  0.030  
set_clock_uncertainty -fall_from [get_clocks {clocks_inst|altpll_component|auto_generated|pll1|clk[0]}] -fall_to [get_clocks {clocks_inst|altpll_component|auto_generated|pll1|clk[2]}]  0.030  
set_clock_uncertainty -fall_from [get_clocks {clocks_inst|altpll_component|auto_generated|pll1|clk[0]}] -rise_to [get_clocks {clocks_inst|altpll_component|auto_generated|pll1|clk[3]}]  0.030  
set_clock_uncertainty -fall_from [get_clocks {clocks_inst|altpll_component|auto_generated|pll1|clk[0]}] -fall_to [get_clocks {clocks_inst|altpll_component|auto_generated|pll1|clk[3]}]  0.030  
set_clock_uncertainty -fall_from [get_clocks {clocks_inst|altpll_component|auto_generated|pll1|clk[0]}] -rise_to [get_clocks {clocks_inst|altpll_component|auto_generated|pll1|clk[4]}]  0.020  
set_clock_uncertainty -fall_from [get_clocks {clocks_inst|altpll_component|auto_generated|pll1|clk[0]}] -fall_to [get_clocks {clocks_inst|altpll_component|auto_generated|pll1|clk[4]}]  0.020  
set_clock_uncertainty -rise_from [get_clocks {clocks_inst|altpll_component|auto_generated|pll1|clk[1]}] -rise_to [get_clocks {clocks_inst|altpll_component|auto_generated|pll1|clk[0]}]  0.020  
set_clock_uncertainty -rise_from [get_clocks {clocks_inst|altpll_component|auto_generated|pll1|clk[1]}] -fall_to [get_clocks {clocks_inst|altpll_component|auto_generated|pll1|clk[0]}]  0.020  
set_clock_uncertainty -rise_from [get_clocks {clocks_inst|altpll_component|auto_generated|pll1|clk[1]}] -rise_to [get_clocks {clocks_inst|altpll_component|auto_generated|pll1|clk[1]}]  0.020  
set_clock_uncertainty -rise_from [get_clocks {clocks_inst|altpll_component|auto_generated|pll1|clk[1]}] -fall_to [get_clocks {clocks_inst|altpll_component|auto_generated|pll1|clk[1]}]  0.020  
set_clock_uncertainty -rise_from [get_clocks {clocks_inst|altpll_component|auto_generated|pll1|clk[1]}] -rise_to [get_clocks {clocks_inst|altpll_component|auto_generated|pll1|clk[2]}]  0.020  
set_clock_uncertainty -rise_from [get_clocks {clocks_inst|altpll_component|auto_generated|pll1|clk[1]}] -fall_to [get_clocks {clocks_inst|altpll_component|auto_generated|pll1|clk[2]}]  0.020  
set_clock_uncertainty -rise_from [get_clocks {clocks_inst|altpll_component|auto_generated|pll1|clk[1]}] -rise_to [get_clocks {clocks_inst|altpll_component|auto_generated|pll1|clk[3]}]  0.020  
set_clock_uncertainty -rise_from [get_clocks {clocks_inst|altpll_component|auto_generated|pll1|clk[1]}] -fall_to [get_clocks {clocks_inst|altpll_component|auto_generated|pll1|clk[3]}]  0.020  
set_clock_uncertainty -fall_from [get_clocks {clocks_inst|altpll_component|auto_generated|pll1|clk[1]}] -rise_to [get_clocks {clocks_inst|altpll_component|auto_generated|pll1|clk[0]}]  0.020  
set_clock_uncertainty -fall_from [get_clocks {clocks_inst|altpll_component|auto_generated|pll1|clk[1]}] -fall_to [get_clocks {clocks_inst|altpll_component|auto_generated|pll1|clk[0]}]  0.020  
set_clock_uncertainty -fall_from [get_clocks {clocks_inst|altpll_component|auto_generated|pll1|clk[1]}] -rise_to [get_clocks {clocks_inst|altpll_component|auto_generated|pll1|clk[1]}]  0.020  
set_clock_uncertainty -fall_from [get_clocks {clocks_inst|altpll_component|auto_generated|pll1|clk[1]}] -fall_to [get_clocks {clocks_inst|altpll_component|auto_generated|pll1|clk[1]}]  0.020  
set_clock_uncertainty -fall_from [get_clocks {clocks_inst|altpll_component|auto_generated|pll1|clk[1]}] -rise_to [get_clocks {clocks_inst|altpll_component|auto_generated|pll1|clk[2]}]  0.020  
set_clock_uncertainty -fall_from [get_clocks {clocks_inst|altpll_component|auto_generated|pll1|clk[1]}] -fall_to [get_clocks {clocks_inst|altpll_component|auto_generated|pll1|clk[2]}]  0.020  
set_clock_uncertainty -fall_from [get_clocks {clocks_inst|altpll_component|auto_generated|pll1|clk[1]}] -rise_to [get_clocks {clocks_inst|altpll_component|auto_generated|pll1|clk[3]}]  0.020  
set_clock_uncertainty -fall_from [get_clocks {clocks_inst|altpll_component|auto_generated|pll1|clk[1]}] -fall_to [get_clocks {clocks_inst|altpll_component|auto_generated|pll1|clk[3]}]  0.020  
set_clock_uncertainty -rise_from [get_clocks {clocks_inst|altpll_component|auto_generated|pll1|clk[2]}] -rise_to [get_clocks {clocks_inst|altpll_component|auto_generated|pll1|clk[0]}]  0.030  
set_clock_uncertainty -rise_from [get_clocks {clocks_inst|altpll_component|auto_generated|pll1|clk[2]}] -fall_to [get_clocks {clocks_inst|altpll_component|auto_generated|pll1|clk[0]}]  0.030  
set_clock_uncertainty -rise_from [get_clocks {clocks_inst|altpll_component|auto_generated|pll1|clk[2]}] -rise_to [get_clocks {clocks_inst|altpll_component|auto_generated|pll1|clk[1]}]  0.020  
set_clock_uncertainty -rise_from [get_clocks {clocks_inst|altpll_component|auto_generated|pll1|clk[2]}] -fall_to [get_clocks {clocks_inst|altpll_component|auto_generated|pll1|clk[1]}]  0.020  
set_clock_uncertainty -rise_from [get_clocks {clocks_inst|altpll_component|auto_generated|pll1|clk[2]}] -rise_to [get_clocks {clocks_inst|altpll_component|auto_generated|pll1|clk[2]}]  0.030  
set_clock_uncertainty -rise_from [get_clocks {clocks_inst|altpll_component|auto_generated|pll1|clk[2]}] -fall_to [get_clocks {clocks_inst|altpll_component|auto_generated|pll1|clk[2]}]  0.030  
set_clock_uncertainty -rise_from [get_clocks {clocks_inst|altpll_component|auto_generated|pll1|clk[2]}] -rise_to [get_clocks {clocks_inst|altpll_component|auto_generated|pll1|clk[3]}]  0.030  
set_clock_uncertainty -rise_from [get_clocks {clocks_inst|altpll_component|auto_generated|pll1|clk[2]}] -fall_to [get_clocks {clocks_inst|altpll_component|auto_generated|pll1|clk[3]}]  0.030  
set_clock_uncertainty -fall_from [get_clocks {clocks_inst|altpll_component|auto_generated|pll1|clk[2]}] -rise_to [get_clocks {clocks_inst|altpll_component|auto_generated|pll1|clk[0]}]  0.030  
set_clock_uncertainty -fall_from [get_clocks {clocks_inst|altpll_component|auto_generated|pll1|clk[2]}] -fall_to [get_clocks {clocks_inst|altpll_component|auto_generated|pll1|clk[0]}]  0.030  
set_clock_uncertainty -fall_from [get_clocks {clocks_inst|altpll_component|auto_generated|pll1|clk[2]}] -rise_to [get_clocks {clocks_inst|altpll_component|auto_generated|pll1|clk[1]}]  0.020  
set_clock_uncertainty -fall_from [get_clocks {clocks_inst|altpll_component|auto_generated|pll1|clk[2]}] -fall_to [get_clocks {clocks_inst|altpll_component|auto_generated|pll1|clk[1]}]  0.020  
set_clock_uncertainty -fall_from [get_clocks {clocks_inst|altpll_component|auto_generated|pll1|clk[2]}] -rise_to [get_clocks {clocks_inst|altpll_component|auto_generated|pll1|clk[2]}]  0.030  
set_clock_uncertainty -fall_from [get_clocks {clocks_inst|altpll_component|auto_generated|pll1|clk[2]}] -fall_to [get_clocks {clocks_inst|altpll_component|auto_generated|pll1|clk[2]}]  0.030  
set_clock_uncertainty -fall_from [get_clocks {clocks_inst|altpll_component|auto_generated|pll1|clk[2]}] -rise_to [get_clocks {clocks_inst|altpll_component|auto_generated|pll1|clk[3]}]  0.030  
set_clock_uncertainty -fall_from [get_clocks {clocks_inst|altpll_component|auto_generated|pll1|clk[2]}] -fall_to [get_clocks {clocks_inst|altpll_component|auto_generated|pll1|clk[3]}]  0.030  
set_clock_uncertainty -rise_from [get_clocks {clocks_inst|altpll_component|auto_generated|pll1|clk[3]}] -rise_to [get_clocks {clocks_inst|altpll_component|auto_generated|pll1|clk[0]}]  0.030  
set_clock_uncertainty -rise_from [get_clocks {clocks_inst|altpll_component|auto_generated|pll1|clk[3]}] -fall_to [get_clocks {clocks_inst|altpll_component|auto_generated|pll1|clk[0]}]  0.030  
set_clock_uncertainty -rise_from [get_clocks {clocks_inst|altpll_component|auto_generated|pll1|clk[3]}] -rise_to [get_clocks {clocks_inst|altpll_component|auto_generated|pll1|clk[1]}]  0.020  
set_clock_uncertainty -rise_from [get_clocks {clocks_inst|altpll_component|auto_generated|pll1|clk[3]}] -fall_to [get_clocks {clocks_inst|altpll_component|auto_generated|pll1|clk[1]}]  0.020  
set_clock_uncertainty -rise_from [get_clocks {clocks_inst|altpll_component|auto_generated|pll1|clk[3]}] -rise_to [get_clocks {clocks_inst|altpll_component|auto_generated|pll1|clk[2]}]  0.030  
set_clock_uncertainty -rise_from [get_clocks {clocks_inst|altpll_component|auto_generated|pll1|clk[3]}] -fall_to [get_clocks {clocks_inst|altpll_component|auto_generated|pll1|clk[2]}]  0.030  
set_clock_uncertainty -rise_from [get_clocks {clocks_inst|altpll_component|auto_generated|pll1|clk[3]}] -rise_to [get_clocks {clocks_inst|altpll_component|auto_generated|pll1|clk[3]}]  0.030  
set_clock_uncertainty -rise_from [get_clocks {clocks_inst|altpll_component|auto_generated|pll1|clk[3]}] -fall_to [get_clocks {clocks_inst|altpll_component|auto_generated|pll1|clk[3]}]  0.030  
set_clock_uncertainty -fall_from [get_clocks {clocks_inst|altpll_component|auto_generated|pll1|clk[3]}] -rise_to [get_clocks {clocks_inst|altpll_component|auto_generated|pll1|clk[0]}]  0.030  
set_clock_uncertainty -fall_from [get_clocks {clocks_inst|altpll_component|auto_generated|pll1|clk[3]}] -fall_to [get_clocks {clocks_inst|altpll_component|auto_generated|pll1|clk[0]}]  0.030  
set_clock_uncertainty -fall_from [get_clocks {clocks_inst|altpll_component|auto_generated|pll1|clk[3]}] -rise_to [get_clocks {clocks_inst|altpll_component|auto_generated|pll1|clk[1]}]  0.020  
set_clock_uncertainty -fall_from [get_clocks {clocks_inst|altpll_component|auto_generated|pll1|clk[3]}] -fall_to [get_clocks {clocks_inst|altpll_component|auto_generated|pll1|clk[1]}]  0.020  
set_clock_uncertainty -fall_from [get_clocks {clocks_inst|altpll_component|auto_generated|pll1|clk[3]}] -rise_to [get_clocks {clocks_inst|altpll_component|auto_generated|pll1|clk[2]}]  0.030  
set_clock_uncertainty -fall_from [get_clocks {clocks_inst|altpll_component|auto_generated|pll1|clk[3]}] -fall_to [get_clocks {clocks_inst|altpll_component|auto_generated|pll1|clk[2]}]  0.030  
set_clock_uncertainty -fall_from [get_clocks {clocks_inst|altpll_component|auto_generated|pll1|clk[3]}] -rise_to [get_clocks {clocks_inst|altpll_component|auto_generated|pll1|clk[3]}]  0.030  
set_clock_uncertainty -fall_from [get_clocks {clocks_inst|altpll_component|auto_generated|pll1|clk[3]}] -fall_to [get_clocks {clocks_inst|altpll_component|auto_generated|pll1|clk[3]}]  0.030  
set_clock_uncertainty -rise_from [get_clocks {clocks_inst|altpll_component|auto_generated|pll1|clk[4]}] -rise_to [get_clocks {clocks_inst|altpll_component|auto_generated|pll1|clk[4]}]  0.020  
set_clock_uncertainty -rise_from [get_clocks {clocks_inst|altpll_component|auto_generated|pll1|clk[4]}] -fall_to [get_clocks {clocks_inst|altpll_component|auto_generated|pll1|clk[4]}]  0.020  
set_clock_uncertainty -fall_from [get_clocks {clocks_inst|altpll_component|auto_generated|pll1|clk[4]}] -rise_to [get_clocks {clocks_inst|altpll_component|auto_generated|pll1|clk[4]}]  0.020  
set_clock_uncertainty -fall_from [get_clocks {clocks_inst|altpll_component|auto_generated|pll1|clk[4]}] -fall_to [get_clocks {clocks_inst|altpll_component|auto_generated|pll1|clk[4]}]  0.020  


#**************************************************************
# Set Input Delay
#**************************************************************



#**************************************************************
# Set Output Delay
#**************************************************************



#**************************************************************
# Set Clock Groups
#**************************************************************



#**************************************************************
# Set False Path
#**************************************************************



#**************************************************************
# Set Multicycle Path
#**************************************************************

set_multicycle_path -setup -end -to [get_keepers {zxnext:zxnext|T80Na:cpu_mod|*}] 2
set_multicycle_path -hold -end -to [get_keepers {zxnext:zxnext|T80Na:cpu_mod|*}] 1


#**************************************************************
# Set Maximum Delay
#**************************************************************



#**************************************************************
# Set Minimum Delay
#**************************************************************



#**************************************************************
# Set Input Transition
#**************************************************************

