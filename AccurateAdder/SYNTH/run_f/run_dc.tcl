
	# This is the command to read in the netlist 
	# Please ensure that the netlist name and the 
	# top level module name are correct 

	read_verilog -rtl ../.././SYNTH/run_s/Adder_final.v
	set current_design Adder

	# This command reports the total area of the 
	# design
	report_area > area_netlist.rpt
	exit
