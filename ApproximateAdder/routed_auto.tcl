 #generate moudule_routed.v and module.spef 
perl ./PAD_Flow.pl -op analyze -mod Adder -clkname clock -period 10 -net ./SYNTH/run_s/Adder_final.v
