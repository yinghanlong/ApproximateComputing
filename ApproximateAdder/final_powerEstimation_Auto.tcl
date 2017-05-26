 #generate moudule_routed.v and module.spef 
 perl ./PAD_Flow.pl -mod Adder -clkname clock -period 10 -op power -saif SIMULATION/run_s/Adder.saif -inst test/ADD0
