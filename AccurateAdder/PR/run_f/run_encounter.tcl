
	loadConfig design.conf
	commitConfig
	puts "commitConfig done!"
        #echo "DEBUG MESSAGE  DONE COMMITING DESIGN"
	# Create Initial Floorplan
	floorplan -s 10 10 40 40 40 40

	# Create Power structures
	addRing -spacing_bottom 10 -width_left 10 -width_bottom 10 -width_top 10 -spacing_top 10 -layer_bottom metal5 -width_right 10 -around core -center 1 -layer_top metal5 -spacing_right 10 -spacing_left 10 -layer_right metal6 -layer_left metal6 -nets { VSS VDD }
	addStripe  -set_to_set_distance 40 -spacing 5 -xleft_offset 20 -layer metal6 -width 5 -nets { VSS VDD }

	#echo "DEBUG MESSAGE  DONE ADDING POWER AND GND RINGS AND STRIPES"
	
	# Place standard cells
	placeDesign
	puts "placeDesign done!"	

	# Route power nets
	sroute -connect padPin

	#echo "DEBUG MESSAGE  DONE WITH PLACEMENT AND SPECIAL ROUTE"
	
	specifyClockTree -clkfile clock.ctstch
    ckSynthesis -rguide cts.rguide -report clock.ctsrpt
	

	#echo "DEBUG MESSAGE  DONE WITH CLOCK TREE SYNTHESIS"
	
	# Perform trial route and get timing results
#	trialroute -mediumEffort -guide cts.rguide
#	setAnalysisMode -setup -async -skew -autoDetectClockTree
#	buildTimingGraph
#	setCteReport
#	reportTA -nworst  10 -net > Adder_timing_trialroute.rpt

	trialroute -guide cts.rguide
	setAnalysisMode -checkType setup -asyncChecks async -skew true -clockPropagation autoDetectClockTree
	buildTimingGraph
	setCteReport
	#timeDesign -reportonly -numPaths  10 -outDir Adder_timing_trialroute
	timeDesign -prePlace -reportonly -numPaths  10 -outDir Adder_timing_trialroute

	#echo "DEBUG MESSAGE  DONE WITH TRIAL ROUTE AT MEDIUM EFFORT"
	
	defOut -floorplan -placement -cutRow -routing Adder_cts_trialroute.def
	saveDesign ./Adder_cts_trialroute.enc
	
	#echo "DEBUG MESSAGE  DESIGN SAVED AS DEF"
	
	# Save SPEF value for analyzing effects of parasitics
		 
	#setExtractRCMode -engine preRoute -effortLevel medium -assumeMetFill 
	setExtractRCMode  -assumeMetFill

		
	setDesignMode -process 45
        extractRC
	#echo "DEBUG MESSAGE  RC VALUES EXTRACTED"
	
	saveNetlist -excludeLeafCell Adder_routed.v
    rcOut -spef Adder.spef
	#echo "DEBUG MESSAGE  SPEF CREATED"
	
	buildTimingGraph
	setCteReport
	#timeDesign -reportonly -numPaths  10 -outDir Adder_timing_extracted_trialroute
    	timeDesign -postroute -reportonly -numPaths  10 -outDir Adder_timing_extracted_trialroute	
	#echo "DEBUG MESSAGE  ALL DONE!!"
	
	exit 2


