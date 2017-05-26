//`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   19:12:39 11/27/2016
// Design Name:   counter
// Module Name:   D:/JI/Research/2016_fall/verilog/counter/test_fixture.v
// Project Name:  counter
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: counter
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module test_fixture;
	reg		clock100 = 0 ;
	reg		latch = 0; 
	reg 	dec = 0;
	reg		[3:0] in = 4'b1111;
	wire	zero;  
   reg value;	  
	
	initial	//following block executed only once
	  begin
		 $dumpfile("count.vcd"); // waveforms in this file.. 
  		 $dumpvars; // saves all waveforms
		#16 latch = 1;		// wait 16 ns 
		#10 latch = 0;		// wait 10 ns
		#10 dec = 1;
		#10000 $finish;		//finished with simulation
  	end
	always #5 clock100 = ~clock100;	// 10ns clock

	// instantiate modules -- call this counter u1
	 counter DUT(  .clock(clock100), .in(in), .latch(latch), .dec(dec), 	 		
	 			  .zero(zero) );
endmodule  /*test_fixture*/
