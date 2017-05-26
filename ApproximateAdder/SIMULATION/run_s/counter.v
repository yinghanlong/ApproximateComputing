`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    19:11:23 11/27/2016 
// Design Name: 
// Module Name:    counter 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
/*======Declarations===============================*/

module counter (clock, in, latch, dec,  zero );


/*-----------Inputs--------------------------------*/

input       clock;  /* clock */
input [3:0] in;  /* input initial count */
input       latch;  /* `latch input' */
input       dec;   /* decrement */

/*-----------Outputs--------------------------------*/

output      zero;  /* zero flag */

/*----------------Nets and Registers----------------*/
/*---(See input and output for unexplained variables)---*/

reg [3:0] value;       /* current count value */ 
wire      zero;

// Count Flip-flops with input multiplexor 
always@(posedge clock)
  begin  // begin-end not actually need here as there is only one statement
    if (latch) value <= in;
    else if (dec && !zero) value <= value - 1'b1;  
  end 

// combinational logic for zero flag
assign zero = ~|value;

endmodule /* counter */



