	

	read_verilog -rtl /home/pxs/ApproximateAdder/PR/run_f/Adder_routed.v 
	current_design Adder
	set clkname clock
	set CLK_PER 10
 	create_clock -name clock -period 10 -waveform "0 [expr 10 / 2]" clock
        source ../run_s/.synopsys_dc.setup
        source ./designenv.tcl	
	#report_power -hier -hier_level 3 -analysis_effort medium > Adder_pwr_base.rpt
	report_power -analysis_effort medium > Adder_pwr_base.rpt
	report_clock_tree_power > Adder_clock_pwr_base.rpt
	report_timing > Adder_timing_base.rpt

	read_saif -input /home/pxs/ApproximateAdder/SIMULATION/run_s/FPGAapproximateadder.saif -instance_name testbench/ADD0

	#report_power -hier -hier_level 3  -analysis_effort medium > Adder_pwr_pre_annotation.rpt
	report_power -analysis_effort medium > Adder_pwr_pre_annotation.rpt
	report_clock_tree_power > Adder_clock_pwr_pre_annotation.rpt
	report_timing > Adder_timing_pre_annotation.rpt

	read_parasitics /home/pxs/ApproximateAdder/PR/run_f/Adder.spef -net_cap_only -complete_with wlm
 
	#report_power -hier -hier_level 3 -analysis_effort medium  > Adder_pwr_post_annotation.rpt
	report_power -analysis_effort medium  > Adder_pwr_post_annotation.rpt
	report_clock_tree_power > Adder_clock_pwr_post_annotation.rpt
	report_timing > Adder_timing_post_annotation.rpt
	exit
