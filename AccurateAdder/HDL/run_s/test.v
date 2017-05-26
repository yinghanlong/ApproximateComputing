`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2017/04/10 11:12:35
// Design Name: 
// Module Name: testbench
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module test;

            reg [8:0] S;
            reg [7:0] X;
            reg [7:0] Y;
            reg C;
            reg clock;


   Adder ADD0(
            .Sum(S),
            .clock(clock),
            .X(X),
            .Y(Y),
            .Cin(C)
            );
        
     always begin
        #5 clock = ~clock;
     end
     
     initial begin
    $dumpfile(“Adder.vcd”);
    $dumpvars; //which variable should be dumped
        A = 0;
        B = 0;
        Cin = 0;
        clock = 0;
        X=0; Y=0; C=0; 
        #10
        A= 0;
        B= 1;
        Cin = 0;
        X =8'hFF;
        Y =8'h1;
        #10
        A= 1;
        B= 1;
        Cin = 0;
        X= 8'h11;
        Y= 8'h11;
        #10
        A= 1;
        B= 1;
        Cin = 1;
        X = 8'hFF;
        Y = 8'h0;
        C = 8'h1;
     end   
endmodule
