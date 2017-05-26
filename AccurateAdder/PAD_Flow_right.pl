#!/usr/bin/perl
#
# PAD_Flow.pl
# version 0.1

use strict;
use warnings;
use File::Path;
use POSIX;

my @dircontents;
my $readdirectory;
my $test_directory; 

my $helpplease;
my $infofile;
my $lineread; 

my $HDL_DIR;
my $SIM_DIR;
my $SYNTH_DIR;
my $RUN_DIR;
my $WORK_DIRECTORY;
my $POWER_DIR;
my $PANDR_DIR;

my $operation;
my $modname;	
my $netlist;	
my $setup_op;
my $clean_op;
my $analyze_op;
my $simulate_op;
my $synth_op;
my $power_op;
my $p_and_r_op;
my $libname;
my $libpath; 
my $memory_op;

my $memname;
my $topinst;
my $MEMDIR;
my $TOPFILE;

my $period;
my $clkname; 
my $backsaif;
my $instance;

my $tempdir2;
my $tempdir1;
my $placeroutearea; 
my $placeroutedim;

my $script; 
my $timelib;
my $leffile;

$setup_op = 0;
$clean_op = 0;
$analyze_op = 0;
$simulate_op = 0;
$synth_op = 0;
$power_op = 0;
$p_and_r_op = 0;
$memory_op = 0;

$WORK_DIRECTORY = `pwd`;

$HDL_DIR = "HDL";
$SIM_DIR = "SIMULATION";
$SYNTH_DIR = "SYNTH";
$PANDR_DIR = "PR";

$clkname = "clock";
$period = 10;

$operation = "setup";
$helpplease = 0;
$modname = "counter";
$backsaif = "./${SIM_DIR}/run_f/${modname}_back.saif";
$instance = "test_fixture/DUT";
$netlist = "./SYNTH/run_s/system_sto_8deg_final.v"; 
# If we change the directory to /run_s/system_sto_4deg_final.v, then maybe we should not copy it from /run_s/ to /run_f/
$libname = "NangateOpenCellLibrary_PDKv1_2_v2008_10_typical_conditional_nldm";
#$libpath = "/afs/eos.ncsu.edu/lockers/research/ece/wdavis/tech/nangate/NangateOpenCellLibrary_PDKv1_2_v2008_10/liberty/520";
$libpath = "/home/wangchen/synopsys/NANgate_library";
$memname = "MemGen_32_12";
$topinst = "top_inst";
$MEMDIR = "./MEMORY/";
$TOPFILE = "./top_with_mem.v";

$placeroutearea = 0;
$placeroutedim = 0;

chomp $WORK_DIRECTORY;
#$ENV{'WORKING_DIRECTORY'} = $WORK_DIRECTORY;
$infofile = "./info.file";

while (@ARGV) {
	#this means war!! 
	$_ = shift;
	if (/^-help$/) {
		$helpplease = 1;
	}
	elsif ( /^-op$/) {
		$operation = shift;	
	} 
	elsif ( /^-mod$/) {
		$modname = shift;	
	} 
	elsif ( /^-net$/) {
		$netlist = shift;	
	} 
	elsif ( /^-period$/) {
		$period = shift;	
	} 
	elsif ( /^-saif$/) {
		$backsaif = shift;	
	} 
	elsif ( /^-inst$/) {
		$instance = shift;	
	} 
	elsif ( /^-clkname$/) {
		$clkname = shift;	
	} 
	elsif ( /^-memdir$/) {
		$MEMDIR = shift;	
	} 
	elsif ( /^-topinst$/) {
		$topinst = shift;	
	} 
	elsif ( /^-memname$/) {
		$memname = shift;	
	} 
	elsif ( /^-topfile$/) {
		$TOPFILE = shift;	
	} 
	else {
		print "[ERROR] Incorrect arguments: Please type \">PAD_Flow.pl -help \" to see the help for this file\n";
		exit;
	}

}

if ($helpplease == 1) {
	print "[NOTE]: Please add modelsim to your path and compile the relavant executables before running the flow\n\n";
	print "[NOTE]: Ideally you need to do the following: \"add modelsim\", \"add synopsys\", \"add cadence2010\"\n";
	print "[NOTE]: This flow allows for the analysis of the synthesized netlist using post P&R manner\n";
	print "[NOTE]: To run this analysis the inputs needed are:\n";
	print "The Operation Type (-op) [DEFAULT:setup]: setup/analyze/power/memory\n";
	print "The Name of the top level module for synthesis (-mod) [DEFAULT: top]\n";
	print "The full path to the synthesized netlist (-net) [DEFAULT: ./SYNTH/top_netlist.v]\n";
	print "The name of the clock port in your design (-clkname) [DEFAULT: clock]\n";
	print "The clock period that is going to be used for analysis (-period) [DEFAULT: 10]\n";
	print "The full path to the backward saif file (-saif) [DEFAULT: ./SIMULATION/top_back.saif]\n";
	print "The Hierarchy to the design instance in your testbench (-inst) [DEFAULT: test_fixture/DUT]\n";
	print "\n\nFOR MEMORY BASED ANALYSIS WE HAVE THE FOLLOWING ADDITIONAL INPUTS.\n";
	print "PLEASE IGNORE THESE FOR NORMAL RUN\n\n";
	print "The Directory where the Memory Generator is run (-memdir) [DEFAULT: ./MEMORY/]\n";
	print "The full path to the memory + top integration (-topfile) [DEFAULT: ./HDL/top_with_mem.v]\n";
	print "The name of the instance of the top within the integration file (-topinst) [DEFAULT: top_inst]\n";
	print "The name of the memory generated by the Memory generator (-meminst) [DEFAULT: MemGen_32_12]\n";
	print "\n\n";
    print "ALL THE BEST !!!\n\n";
	
	exit;
}

#if ($#ARGV !=0) {
#	print "[ERROR] Usage is: MIMO_flow.pl <data_files directory>\n";
#	exit;
#}

######################################################################
# CONVERT THE DAT FILES FROM MATLAB INTO INT DAT FILES THAT CAN BE 
# READ INTO MODELSIM SIMULATIONS
######################################################################

print "\n\n";
print "######################## RUN INFORMATION #############################\n";
print "\n";

print "FLOW TO BE RUN WITH THE PARAMETERS:\n";
print "The Operation Type                                	(-op)      = $operation\n";
print "The Module Name                                    	(-mod)     = $modname\n";
print "The Netlist Name                                   	(-net)     = $netlist\n";
print "The Clock Name                                     	(-clkname) = $clkname\n";
print "The Clock Period                                   	(-period)  = $period\n";
print "The Backward SAIF file  	                          	(-saif)    = $backsaif\n";
print "The Hierarchical Instance of design in testbench   	(-inst)    = $instance\n";
print "The Directory where the Memory Generator is run 		(-memdir)  = $MEMDIR\n";
print "The full path to the memory + top integration 		(-topfile) = $TOPFILE\n";
print "The name of the instance of the top within the integration file (-topinst) = $topinst\n";
print "The name of the memory generated by the Memory generator (-memname) $memname\n";

print "\n";
print "######################## RUN INFORMATION #############################\n";
print "\n\n";

print "PRESENT WORKING DIRECTORY IS $WORK_DIRECTORY \n\n";

if ($operation =~ /[s|S]etup/) {
	$setup_op = 1;
}
elsif ($operation =~ /[a|A]nalyze/) {
	$analyze_op = 1;
}
elsif($operation =~ /[c|C]lean/) {
	$clean_op = 1;
}
elsif($operation =~ /[p|P]ower/) {
	$power_op = 1;
}
elsif($operation =~ /[m|M]emory/) {
	$memory_op = 1;
}
else {
	print "[ERROR] Invalid Operation. Please type >PAD_Flow.pl -help for information\n";
	exit;
}
######################################################################
# SAVE THE INFORMATION FOR THIS RUN IN A run.info file
######################################################################

$infofile="./info.file";
if($analyze_op == 1) {
	$infofile = ".info.analyze.file";
	open(SCRIPT,">$infofile") || die "ERROR: Could not open $infofile for writing";
	print SCRIPT <<EOM;

	######################## RUN INFORMATION #############################;

	FLOW TO BE RUN WITH THE PARAMETERS:
	The Operation Type                 (-op)          = $operation; 
	The Name of the top level module   (-mod)         = $modname;
	The full path to netist 		  (-net)         = $netlist;
	The Clock Name 	    			  (-clkname) 	   = $clkname;
	The Clock Period 					(-period) 	   = $period;

	PRESENT WORKING DIRECTORY IS: $WORK_DIRECTORY;
	######################## RUN INFORMATION #############################;

EOM
	close(SCRIPT);
}
elsif($power_op == 1) {
	$infofile = ".info.power.file";
	open(SCRIPT,">$infofile") || die "ERROR: Could not open $infofile for writing";
	print SCRIPT <<EOM;

	######################## RUN INFORMATION #############################;

	FLOW TO BE RUN WITH THE PARAMETERS:
	The Operation Type                 (-op)          = $operation; 
	The Name of the top level module   (-mod)         = $modname;
	The Name of the top level module   (-net)         = $netlist;
	The Clock Name 	    			  (-clkname) 	   	  = $clkname;
	The Clock Period 					(-period) 	   = $period;
	The Backward SAIF file				(-saif)    	   = $backsaif;
	The Hierarchical Instance of design in testbench			(-inst)    	   = $instance;

	PRESENT WORKING DIRECTORY IS: $WORK_DIRECTORY;
	######################## RUN INFORMATION #############################;

EOM
close(SCRIPT);
}
elsif($memory_op == 1) {
	$infofile = ".info.memory.file";
	open(SCRIPT,">$infofile") || die "ERROR: Could not open $infofile for writing";
	print SCRIPT <<EOM;

	######################## RUN INFORMATION #############################;

	FLOW TO BE RUN WITH THE PARAMETERS:
	The Operation Type                 (-op)          = $operation; 
	The Name of the top level module   (-mod)         = $modname;
	The Clock Name 	    			   (-clkname) 	  = $clkname;
	The Clock Period 					(-period) 	  = $period;
	The Hierarchical Instance of design in testbench			(-inst)    	   = $instance;
	The Directory where the Memory Generator is run 		(-memdir)  = $MEMDIR;
	The full path to the memory + top integration 		(-topfile) = $TOPFILE;
	The name of the instance of the top within the integration file (-topinst) = $topinst;
	The name of the memory generated by the Memory generator (-memname) $memname;

	PRESENT WORKING DIRECTORY IS: $WORK_DIRECTORY;
	######################## RUN INFORMATION #############################;

EOM
close(SCRIPT);
}




if($clean_op == 1) {
	print " REMOVING DIRECTORIES: ${SYNTH_DIR}, ${SIM_DIR}, ${HDL_DIR}, ${PANDR_DIR} \n";
	rmtree("./${SYNTH_DIR}/");
	rmtree("./${HDL_DIR}/");
	rmtree("./${SIM_DIR}/");
	rmtree("./${PANDR_DIR}/");
}

if ($setup_op == 1) { 
	#Determine if the Simulation directory is present 
	print " CREATING THE FOLLOWING DIRECTORIES IF NOT ALREADY PRESENT: \n";
	print " \t\t ./${SYNTH_DIR}\n";
	print " \t\t ./${SYNTH_DIR}/run_f\n";
	print " \t\t ./${SYNTH_DIR}/run_s\n";
	print " \t\t ./${HDL_DIR}\n";
	print " \t\t ./${HDL_DIR}/run_f\n";
	print " \t\t ./${HDL_DIR}/run_s\n";
	print " \t\t ./${SIM_DIR}\n";
	print " \t\t ./${SIM_DIR}/run_f\n";
	print " \t\t ./${SIM_DIR}/run_s\n";
	print " \t\t ./${PANDR_DIR}\n";
	print " \t\t ./${PANDR_DIR}/run_f\n";
	
	&createdirectory($SYNTH_DIR);
	$tempdir1 = "${SYNTH_DIR}/run_s";
	$tempdir2 = "${SYNTH_DIR}/run_f";
	&createdirectory($tempdir1);	
	&createdirectory($tempdir2);	
	
	&createdirectory($HDL_DIR);
	$tempdir1 = "${HDL_DIR}/run_s";
	$tempdir2 = "${HDL_DIR}/common";
	&createdirectory($tempdir1);	
	&createdirectory($tempdir2);	
	
	&createdirectory($SIM_DIR);
	$tempdir1 = "${SIM_DIR}/run_s";
	$tempdir2 = "${SIM_DIR}/run_f";
	&createdirectory($tempdir1);	
	&createdirectory($tempdir2);	
	
	&createdirectory($PANDR_DIR);
	$tempdir2 = "${PANDR_DIR}/run_f";
	&createdirectory($tempdir2);
		
	#system("cp /afs/eos.ncsu.edu/engrwww/sites/ece/asic/share/common/modelsim.ini ${SIM_DIR}/");
	#system("cp /afs/eos.ncsu.edu/engrwww/sites/ece/asic/share/common/modelsim.ini ${SIM_DIR}/");
	#system("cp /afs/eos.ncsu.edu/engrwww/sites/ece/asic/share/common/Library_fwd.saif ${SIM_DIR}/");
	#system("cp /afs/eos.ncsu.edu/engrwww/sites/ece/asic/share/Tut2/Constraints.tcl ${SYNTH_DIR}/");

}

# At this point we can assume that we have a synthesized netlist ready for 
# Placing, Routing and doing a post-PR Analysis 

#####################################################################################################
# The first step in this would be the reading of the netlist in the Synth							#
# Directory and creating an Area report. 															#	
# For this we should first have the correct .synopsys_dc.setup in the run_f							#
# Directory and the creation of the run_dc.tcl script to read the netlist and 							#
# report the area numbers. 																			#
#####################################################################################################

if ($analyze_op == 1) {
	open(SCRIPT,">${SYNTH_DIR}/run_f/.synopsys_dc.setup") || die "ERROR: Could not open ${SYNTH_DIR}/run_f/.synopsys_dc.setup for writing";
	print SCRIPT <<EOM;

	# set search path to the correct library. 
	set search_path "${libpath}" 

	# Library Variables 
	set target_library NangateOpenCellLibrary_PDKv1_2_v2008_10_typical_conditional_nldm.db
	set link_library   NangateOpenCellLibrary_PDKv1_2_v2008_10_typical_conditional_nldm.db

EOM
	close(SCRIPT);

	open(SCRIPT,">${SYNTH_DIR}/run_f/run_dc.tcl") || die "ERROR: Could not open ${SYNTH_DIR}/run_f/run_dc.tcl for writing";
	print SCRIPT <<EOM;

	# This is the command to read in the netlist 
	# Please ensure that the netlist name and the 
	# top level module name are correct 

	read_verilog -rtl ../../${netlist}
	set current_design ${modname}

	# This command reports the total area of the 
	# design
	report_area > area_netlist.rpt
	exit
EOM
	close(SCRIPT);

	print "##################################################################################\n\n";
	print "                    READING NETLIST TO FIND SYNTHESIZED AREA OF DESIGN            \n";
	print "                    View progress in file \"./${SYNTH_DIR}/run_f/dcshell_transcript.out\" \n\n";
	print "##################################################################################\n";
	
	chdir("./${SYNTH_DIR}/run_f/");
	system("/usr/synopsys/B-2008.09/bin/dc_shell -f run_dc.tcl > dcshell_transcript.out");
	chdir("../../");
	open(READFILE,"<${SYNTH_DIR}/run_f/area_netlist.rpt") || die "ERROR: Could not open ${SYNTH_DIR}/run_f/area_netlist.rpt for reading";
    	while ($lineread = <READFILE>) {
			if($lineread =~ /^\s*Total\s*cell\s*area:\s*(\d+)/) {				
				$placeroutearea = $1;
			}
		}
	close(READFILE);
	

















	######################################################################################################################
	# Here we make an assumption that the desing is going to be routed using 
	# a routing density of 0.90 and in a sqaure shape without considering mem. 
	######################################################################################################################
	
	$placeroutearea = $placeroutearea/0.9;
	$placeroutedim = sqrt($placeroutearea);
	# The next 2 steps are done to achieve a square which has 
	# dimensions that are a multiple of the standard cell height
	
	$placeroutedim = ceil($placeroutedim/10);
	$placeroutedim = $placeroutedim * 10;
	
	print "\n TOTAL AREA OF DESIGN TO BE ANALYZED (A): $placeroutearea\n";
	print " RESULTING DIMENSION OF CHIP (smallest multiple of 10 greater than sqrt(A)) = $placeroutedim\n\n";
	
	print "##################################################################################\n\n";
	print "             CREATING DESIGN SPECIFIC CONFIG FILES FOR ENCOUNTER TOOL             \n\n";
	print "##################################################################################\n";

	######################################################################################################################
	# We now have all the relevant information to create the setup files for 
	# doing a place and route. 
	######################################################################################################################
	
	$script="${PANDR_DIR}/run_f/design.conf";
	if (!open(SCRIPT,">$script")) {
    	die "ERROR: Could not open $script for writing\n";
	}

	$timelib = "${libpath}/NangateOpenCellLibrary_PDKv1_2_v2008_10_typical_conditional_nldm.lib";
	$leffile = "${libpath}/NangateOpenCellLibrary_PDKv1_2_v2008_10.lef";

	print SCRIPT <<EOM;


	################################################
	#                                              #
	#  FirstEncounter Input configuration file     #
	#                                              #
	################################################
	global rda_Input
	set rda_Input(ui_netlist) "${WORK_DIRECTORY}/${netlist}"
	set rda_Input(ui_netlisttype) "Verilog"
	set rda_Input(ui_ilmlist) ""
	set rda_Input(ui_settop) "1"
	set rda_Input(ui_topcell) "$modname"
	set rda_Input(ui_celllib) ""
	set rda_Input(ui_iolib) ""
	set rda_Input(ui_areaiolib) ""
	set rda_Input(ui_blklib) ""
	set rda_Input(ui_kboxlib) ""
	set rda_Input(ui_timelib) "$timelib"
	set rda_Input(ui_smodDef) ""
	set rda_Input(ui_smodData) ""
	set rda_Input(ui_dpath) ""
	set rda_Input(ui_tech_file) ""
	set rda_Input(ui_io_file) ""
	set rda_Input(ui_timingcon_file) "design.tc"
	set rda_Input(ui_buf_footprint) ""
	set rda_Input(ui_delay_footprint) ""
	set rda_Input(ui_leffile) "$leffile"
	set rda_Input(ui_core_cntl) "aspect"
	set rda_Input(ui_aspect_ratio) "1.0"
	set rda_Input(ui_core_util) "0.9"
	set rda_Input(ui_core_height) ""
	set rda_Input(ui_core_width) ""
	set rda_Input(ui_core_to_left) ""
	set rda_Input(ui_core_to_right) ""
	set rda_Input(ui_core_to_top) ""
	set rda_Input(ui_core_to_bottom) ""
	set rda_Input(ui_max_io_height) "0"
	set rda_Input(ui_row_height) ""
	set rda_Input(ui_isHorTrackHalfPitch) "0"
	set rda_Input(ui_isVerTrackHalfPitch) "1"
	set rda_Input(ui_ioOri) "R0"
	set rda_Input(ui_isOrigCenter) "0"
	set rda_Input(ui_exc_net) ""
	set rda_Input(ui_delay_limit) "1000"
	set rda_Input(ui_net_delay) "1000.0ps"
	set rda_Input(ui_net_load) "0.5pf"
	set rda_Input(ui_in_tran_delay) "120.0ps"
	set rda_Input(ui_captbl_file) ""
	set rda_Input(ui_cap_scale) "1.0"
	set rda_Input(ui_postRoute_res) "1.0"
	set rda_Input(ui_shr_scale) "1.0"
	set rda_Input(ui_time_unit) "none"
	set rda_Input(ui_cap_unit) ""
	set rda_Input(ui_pwrnet) {VDD}
	set rda_Input(ui_gndnet) {VSS}
	set rda_Input(flip_first) "1"
	set rda_Input(double_back) "1"
	set rda_Input(ui_pg_connections) [list \\
                        	PIN:VDD:: \\
                        	PIN:VSS:: \\
                            	  ]
	set rda_Input(PIN:VDD::) "VDD"
	set rda_Input(PIN:VSS::) "VSS"

EOM

	close(SCRIPT);
	
	
	$script = "${PANDR_DIR}/run_f/clock.ctstch";
	if (!open(SCRIPT,">$script")) {
    	die "ERROR: Could not open $script for writing";
	}

	print SCRIPT <<EOM;
	
	AutoCTSRootPin $clkname
	MaxDelay       ${period}ns # default value
	MinDelay       0ns   # default value
	MaxSkew        300ps # default value
	SinkMaxTran    400ps # default value
	BufMaxTran     400ps # default value
	Buffer         BUF_X2 BUF_X4 CLKBUF_X3 CLKBUF_X2 CLKBUF_X1 INV_X1 INV_X2 INV_X4 INV_X8 
	NoGating       NO
	DetailReport   YES
	RouteClkNet    NO
	PostOpt        YES
	#OptAddBuffer   NO
	#RouteType      specialRoute
	#LeafRouteType  regularRoute
	ExcludedPin
	END

EOM
	close(SCRIPT);

	$script = "${PANDR_DIR}/run_f/design.tc";
	if (!open(SCRIPT,">$script")) {
    	die "ERROR: Could not open $script for writing\n";
	}
	print SCRIPT "create_clock -name clock -period $period find(port,\"$clkname\")";
	close(SCRIPT);

	
	$script = "${PANDR_DIR}/run_f/run_encounter.tcl";
	if (!open(SCRIPT,">$script")) {
    	die "ERROR: Could not open $script for writing";
	}

	print SCRIPT <<EOM;

	loadConfig design.conf
	commitConfig
	puts "DEBUG MESSAGE  DONE COMMITING DESIGN"
	# Create Initial Floorplan
	floorplan -s $placeroutedim $placeroutedim 40 40 40 40

	# Create Power structures
	addRing -spacing_bottom 10 -width_left 10 -width_bottom 10 -width_top 10 -spacing_top 10 -layer_bottom metal5 -width_right 10 -around core -center 1 -layer_top metal5 -spacing_right 10 -spacing_left 10 -layer_right metal6 -layer_left metal6 -nets { VSS VDD }
	addStripe  -set_to_set_distance 40 -spacing 5 -xleft_offset 20 -layer metal6 -width 5 -nets { VSS VDD }

	puts "DEBUG MESSAGE  DONE ADDING POWER AND GND RINGS AND STRIPES"
	
	# Place standard cells
	placeDesign

	# Route power nets
	sroute -connect padPin

	puts "DEBUG MESSAGE  DONE WITH PLACEMENT AND SPECIAL ROUTE"
	
	specifyClockTree -clkfile clock.ctstch
    #ckSynthesis -rguide cts.rguide -report clock.ctsrpt
	ckSynthesis -rguide cts.rguide -report clock.ctsrpt

	puts "DEBUG MESSAGE  DONE WITH CLOCK TREE SYNTHESIS"
	
	# Perform trial route and get timing results
#	trialroute -mediumEffort -guide cts.rguide
#	setAnalysisMode -setup -async -skew -autoDetectClockTree
#	buildTimingGraph
#	setCteReport
#	reportTA -nworst  10 -net > ${modname}_timing_trialroute.rpt


#------------------------the following parts is commented for experiments --------------------------------

	trialroute -guide cts.rguide
	setAnalysisMode -clockPropagation autoDetectClockTree -checkType setup -asyncChecks async -skew true 
	#---- till here, it is correct	

	buildTimingGraph

	#---- till here, it is correct

	setCteReport

	#---- till here, it is correct

	timeDesign -prePlace -reportonly -numPaths 10 -outDir ${modname}_timing_trialroute

	#---- till here, it is correct : in the above line, -prePlace should be added!!!

	puts "DEBUG MESSAGE  DONE WITH TRIAL ROUTE AT MEDIUM EFFORT"
	
	defOut -floorplan -placement -cutRow -routing ${modname}_cts_trialroute.def
	saveDesign ./${modname}_cts_trialroute.enc
	
	puts "DEBUG MESSAGE  DESIGN SAVED AS DEF"

	#---- till here, it is correct
	
	#     Save SPEF value for analyzing effects of parasitics
	#setExtractRCMode -engine preRoute -effortLevel medium -assumeMetFill	
	setExtractRCMode -assumeMetFill
	# the rest commands in the above line is for beta user

	setDesignMode -process 45
    	extractRC
	puts "DEBUG MESSAGE  RC VALUES EXTRACTED"

	#---- till here, it is correct
	
	saveNetlist -excludeLeafCell ${modname}_routed.v
    	rcOut -spef ${modname}.spef
	puts "DEBUG MESSAGE  SPEF CREATED"
	
	#---- till here, it is correct

	buildTimingGraph
	setCteReport
    	#timeDesign -reportonly -numPaths  10 -outDir ${modname}_timing_extracted_trialroute
	timeDesign -postPlace -reportonly -numPaths  10 -outDir ${modname}_timing_extracted_trialroute	
	puts "DEBUG MESSAGE  ALL DONE!!"

#------------------------the above parts is commented for experiments --------------------------------

	exit 2


EOM

	close(SCRIPT);
	######################################################################################################################
	# We now move into the Place and Route directory and run the Encounter tool
	# to do a trial place and route and create the required Resistance and Capacitance 
	# network for the nets in the design in the SPEF (Standard Parasitic Exchange Format)
	# file. 
	######################################################################################################################
	
	print "##################################################################################\n\n";
	print "             RUNNING ENCOUNTER PLACE AND ROUTE TOOL              \n";
	print "             View progress in file \"./${PANDR_DIR}/run_f/encounter_transcript.out\" \n\n";
	print "##################################################################################\n";

	print "right!\n";

	chdir("./${PANDR_DIR}/run_f");
	system("encounter -overwrite -nowin -replay run_encounter.tcl > encounter_transcript.out");
	chdir("../../");
	print "Done!\n"
	
	######################################################################################################################
	# The next step is to run the netlist with the testbench to get the SAIF values. 
	# This is going to be done by the student manually
	######################################################################################################################

	
}


























if($power_op == 1 ) {
	######################################################################################################################
	# We can now finally integrate all of the analysis in design compiler where we can read in 
	# the final netlist, the SAIF and the SPEF file and get annotated timing and power values. 
	######################################################################################################################
	
	print "##################################################################################\n\n";
	print "             CREATING TCL SCRIPT FOR ANALYZING POWER OF DESIGN                    \n\n";
	print "##################################################################################\n";
	$script = "${SYNTH_DIR}/run_f/analysiscommands.tcl";
	if (!open(SCRIPT,">$script")) {
    	die "ERROR: Could not open $script for writing";
	}

	print SCRIPT <<EOM;
	

	read_verilog -rtl ${WORK_DIRECTORY}/${PANDR_DIR}/run_f/${modname}_routed.v 
	current_design ${modname}
	set clkname $clkname
	set CLK_PER $period
 	create_clock -name $clkname -period $period -waveform "0 [expr $period / 2]" $clkname
        source ../run_s/.synopsys_dc.setup
        source ./designenv.tcl	


	
	report_power -analysis_effort medium > ${modname}_pwr_base.rpt
	
	read_saif -input ${WORK_DIRECTORY}/${backsaif} -instance_name $instance
	
	#report_power -hier -hier_level 1 -analysis_effort medium > ${modname}_pwr_pre_annotation.rpt
	report_power -analysis_effort medium > ${modname}_pwr_pre_annotation.rpt
	
	report_clock_tree_power > ${modname}_clock_pwr_pre_annotation.rpt
	report_timing > ${modname}_timing_pre_annotation.rpt

	
	read_parasitics ${WORK_DIRECTORY}/${PANDR_DIR}/run_f/$modname.spef -net_cap_only -complete_with wlm
 

	#report_power -hier -hier_level 1 -analysis_effort medium  > ${modname}_pwr_post_annotation.rpt

	report_power -analysis_effort medium  > ${modname}_pwr_post_annotation.rpt
	
	report_clock_tree_power > ${modname}_clock_pwr_post_annotation.rpt
	report_timing > ${modname}_timing_post_annotation.rpt
	exit
EOM
	close(SCRIPT);

	print "##################################################################################\n\n";
	print "             RUNNING DESIGN COMPILER TO DETERMINE POWER AND TIMING              \n";
	print "             View progress in file \"./${SYNTH_DIR}/run_f/powertiming_transcript.out\" \n\n";
	print "##################################################################################\n";

	chdir("./${SYNTH_DIR}/run_f/");
	system("/usr/synopsys/B-2008.09/bin/dc_shell -f analysiscommands.tcl > powertiming_transcript.out ");
	chdir("../../");
}
if($memory_op == 1 ) {
	######################################################################################################################
	# We can now finally integrate all of the analysis in design compiler where we can read in 
	# the final netlist, the SAIF and the SPEF file and get annotated timing and power values. 
	######################################################################################################################
	
	print "##################################################################################\n\n";
	print "             CREATING TCL SCRIPT FOR ANALYZING POWER OF MEMORY + DESIGN           \n\n";
	print "##################################################################################\n";
	$script = "${SYNTH_DIR}/run_f/analysis_memory.tcl";
	if (!open(SCRIPT,">$script")) {
    	die "ERROR: Could not open $script for writing";
	}

	print SCRIPT <<EOM;
	
        set search_path [concat \$search_path ${WORK_DIRECTORY}/${MEMDIR}]
	set link_library [concat \$link_library ${memname}.db]
	read_verilog -rtl ${WORK_DIRECTORY}/${PANDR_DIR}/run_f/${modname}_routed.v
	read_verilog  ${WORK_DIRECTORY}/${TOPFILE}

	set clkname $clkname
	set CLK_PER $period
 	create_clock -name $clkname -period $period -waveform "0 [expr $period / 2]" $clkname
        source ../run_s/.synopsys_dc.setup
	source ./designenv.tcl 
		
	report_power -analysis_effort medium > ${modname}_pwr_base_mem.rpt
	
	read_saif -input ${WORK_DIRECTORY}/${backsaif} -instance_name $instance


        report_saif > top_with_mem_saif.rpt

	report_power -analysis_effort medium > ${modname}_pwr_pre_annotation_mem.rpt
	report_clock_tree_power > ${modname}_clock_pwr_pre_annotation_mem.rpt
	report_timing > ${modname}_timing_pre_annotation_mem.rpt

        read_parasitics ${WORK_DIRECTORY}/${PANDR_DIR}/run_f/top.spef -path ${topinst} -net_cap_only -complete_with wlm

	report_power -analysis_effort medium  > ${modname}_pwr_post_annotation_mem.rpt
	report_clock_tree_power > ${modname}_clock_pwr_post_annotation_mem.rpt
	report_timing > ${modname}_timing_post_annotation_mem.rpt

	exit
EOM
	close(SCRIPT);

	print "##################################################################################\n\n";
	print "             RUNNING DESIGN COMPILER TO DETERMINE POWER AND TIMING              \n";
	print "             View progress in file \"./${SYNTH_DIR}/run_f/memanalysis_transcript.out\" \n\n";
	print "##################################################################################\n";

	chdir("./${SYNTH_DIR}/run_f");
	system("/usr/synopsys/B-2008.09/bin/dc_shell -f analysis_memory.tcl > memanalysis_transcript.out ");
	chdir("../../");
}
sub createdirectory {
	my $temp_val = shift;
	print "DIRECTORY TO BE CREATED = $temp_val\n";	
	if(-e $temp_val && -d $temp_val) {
		print " \t\tPlace and Route run_f Directory Already Present \n";
	}
	else{
		system("mkdir ${temp_val}");
	}	
}

