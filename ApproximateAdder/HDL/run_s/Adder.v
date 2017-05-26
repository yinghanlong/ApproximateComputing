`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2017/04/10 09:47:07
// Design Name: 
// Module Name: ApproxAdder
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


module Adder(
    output reg [8:0] Sum,
  //  output [8:0] approx,
    //output Cout, //S[8]
    input clock,
    input [7:0] X,
    input [7:0] Y,
    input Cin
    );
    wire [6:0] C;
    wire [8:0] S;
    
         approx_full_adder a0( .A(X[0]), .B(Y[0]),  .Sum(S[0]), .Cout(C[0]) );
        approx_full_adder a1( .A(X[1]), .B(Y[1]),  .Sum(S[1]), .Cout(C[1]) );
        approx_full_adder a2( .A(X[2]), .B(Y[2]),  .Sum(S[2]), .Cout(C[2]) );
        approx_full_adder a3( .A(X[3]), .B(Y[3]),  .Sum(S[3]), .Cout(C[3]) );
        full_adder a4( .A(X[4]), .B(Y[4]), .Cin(C[3]), .Sum(S[4]), .Cout(C[4]) );
        full_adder a5( .A(X[5]), .B(Y[5]), .Cin(C[4]), .Sum(S[5]), .Cout(C[5]) );
        full_adder a6( .A(X[6]), .B(Y[6]), .Cin(C[5]), .Sum(S[6]), .Cout(C[6]) );
        full_adder a7( .A(X[7]), .B(Y[7]), .Cin(C[6]), .Sum(S[7]), .Cout(S[8]) );

        always @(posedge clock) begin
            Sum <= S;
        end

endmodule

module full_adder(
    input A,
    input B,
    input Cin,
    output Sum,
    output Cout
    );
    wire G,P;
    assign P = A ^ B;
    assign G = A & B;
    assign Sum = P ^ Cin;
    assign Cout = (P & Cin) | G;

    
endmodule

module approx_full_adder(
    input A,
    input B,
    output Sum,
    output Cout
    );


    assign Sum = B; //Accuracy = 50%
    assign Cout = A; //Accuracy = 75%

    
endmodule
