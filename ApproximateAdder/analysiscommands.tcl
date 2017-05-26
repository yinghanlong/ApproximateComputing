#final step: use ModuleName.saif and ModuleName.spef to do power estimation
perl ./PAD_Flow.pl -mod counter -clkname clock -period 10 -op power -saif SIMULATION/run_f/count.saif -inst test_fixture/DUT
