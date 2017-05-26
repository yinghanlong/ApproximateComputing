#######################################################
#                                                     #
#  Encounter Command Logging File                     #
#  Created on Thu May 25 16:53:07 2017                #
#                                                     #
#######################################################

#@(#)CDS: First Encounter v08.10-p004_1 (32bit) 11/04/2008 14:34 (Linux 2.6)
#@(#)CDS: NanoRoute v08.10-p008 NR081027-0018/USR58-UB (database version 2.30, 67.1.1) {superthreading v1.11}
#@(#)CDS: CeltIC v08.10-p002_1 (32bit) 10/23/2008 22:04:14 (Linux 2.6.9-67.0.10.ELsmp)
#@(#)CDS: CTE v08.10-p016_1 (32bit) Oct 26 2008 15:11:51 (Linux 2.6.9-67.0.10.ELsmp)
#@(#)CDS: CPE v08.10-p009

loadConfig design.conf
commitConfig
floorPlan -s 10 10 40 40 40 40
addRing -spacing_bottom 10 -width_left 10 -width_bottom 10 -width_top 10 -spacing_top 10 -layer_bottom metal5 -width_right 10 -around core -center 1 -layer_top metal5 -spacing_right 10 -spacing_left 10 -layer_right metal6 -layer_left metal6 -nets { VSS VDD }
addStripe -set_to_set_distance 40 -spacing 5 -xleft_offset 20 -layer metal6 -width 5 -nets { VSS VDD }
placeDesign
sroute -connect padPin
specifyClockTree -clkfile clock.ctstch
ckSynthesis -rguide cts.rguide -report clock.ctsrpt
trialRoute -guide cts.rguide
setAnalysisMode -checkType setup -asyncChecks async -skew true -clockPropagation autoDetectClockTree
buildTimingGraph
setCteReport
timeDesign -prePlace -reportonly -numPaths 10 -outDir Adder_timing_trialroute
defOut -floorplan -placement -cutRow -routing Adder_cts_trialroute.def
saveDesign ./Adder_cts_trialroute.enc
setExtractRCMode -assumeMetFill
setDesignMode -process 45
extractRC
saveNetlist -excludeLeafCell Adder_routed.v
rcOut -spef Adder.spef
buildTimingGraph
setCteReport
timeDesign -postroute -reportonly -numPaths 10 -outDir Adder_timing_extracted_trialroute
