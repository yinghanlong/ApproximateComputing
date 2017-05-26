# setup name of the clock in your design.
set clkname clock
#Yinghan: no clock in adder design
# set variable "modname" to the name of topmost module in design
set modname Adder

# set variable "RTL_DIR" to the HDL directory w.r.t synthesis directory
set RTL_DIR    ../../HDL/run_s

# set variable "type" to a name that distinguishes this synthesis run
set type tut1

#set the number of digits to be used for delay results
set report_default_significant_digits 4

set CLK_PER 10
