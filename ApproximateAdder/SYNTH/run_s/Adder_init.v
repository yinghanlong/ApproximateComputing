
module approx_full_adder_3 ( A, B, Sum, Cout );
  input A, B;
  output Sum, Cout;
  wire   n1, n3;

  INV_X4 U1 ( .A(A), .ZN(n1) );
  INV_X4 U2 ( .A(n1), .ZN(Cout) );
  INV_X4 U3 ( .A(B), .ZN(n3) );
  INV_X4 U4 ( .A(n3), .ZN(Sum) );
endmodule


module approx_full_adder_2 ( A, B, Sum, Cout );
  input A, B;
  output Sum, Cout;
  wire   n1, n3;

  INV_X4 U1 ( .A(A), .ZN(n1) );
  INV_X4 U2 ( .A(n1), .ZN(Cout) );
  INV_X4 U3 ( .A(B), .ZN(n3) );
  INV_X4 U4 ( .A(n3), .ZN(Sum) );
endmodule


module approx_full_adder_1 ( A, B, Sum, Cout );
  input A, B;
  output Sum, Cout;
  wire   n1, n3;

  INV_X4 U1 ( .A(A), .ZN(n1) );
  INV_X4 U2 ( .A(n1), .ZN(Cout) );
  INV_X4 U3 ( .A(B), .ZN(n3) );
  INV_X4 U4 ( .A(n3), .ZN(Sum) );
endmodule


module full_adder_3 ( A, B, Cin, Sum, Cout );
  input A, B, Cin;
  output Sum, Cout;
  wire   n1, n3;

  XOR2_X1 U2 ( .A(Cin), .B(n3), .Z(Sum) );
  AOI22_X1 U3 ( .A1(B), .A2(A), .B1(n3), .B2(Cin), .ZN(n1) );
  XOR2_X1 U4 ( .A(A), .B(B), .Z(n3) );
  INV_X2 U1 ( .A(n1), .ZN(Cout) );
endmodule


module full_adder_2 ( A, B, Cin, Sum, Cout );
  input A, B, Cin;
  output Sum, Cout;
  wire   n1, n3;

  XOR2_X1 U2 ( .A(Cin), .B(n3), .Z(Sum) );
  AOI22_X1 U3 ( .A1(B), .A2(A), .B1(n3), .B2(Cin), .ZN(n1) );
  XOR2_X1 U4 ( .A(A), .B(B), .Z(n3) );
  INV_X2 U1 ( .A(n1), .ZN(Cout) );
endmodule


module full_adder_1 ( A, B, Cin, Sum, Cout );
  input A, B, Cin;
  output Sum, Cout;
  wire   n1, n3;

  XOR2_X1 U2 ( .A(Cin), .B(n3), .Z(Sum) );
  AOI22_X1 U3 ( .A1(B), .A2(A), .B1(n3), .B2(Cin), .ZN(n1) );
  XOR2_X1 U4 ( .A(A), .B(B), .Z(n3) );
  INV_X2 U1 ( .A(n1), .ZN(Cout) );
endmodule


module full_adder_0 ( A, B, Cin, Sum, Cout );
  input A, B, Cin;
  output Sum, Cout;
  wire   n2, n3;

  XOR2_X1 U2 ( .A(Cin), .B(n2), .Z(Sum) );
  AOI22_X1 U3 ( .A1(B), .A2(A), .B1(n2), .B2(Cin), .ZN(n3) );
  XOR2_X1 U4 ( .A(A), .B(B), .Z(n2) );
  INV_X2 U1 ( .A(n3), .ZN(Cout) );
endmodule


module approx_full_adder_0 ( A, B, Sum, Cout );
  input A, B;
  output Sum, Cout;
  wire   n1, n3;

  INV_X4 U1 ( .A(A), .ZN(n1) );
  INV_X4 U2 ( .A(n1), .ZN(Cout) );
  INV_X4 U3 ( .A(B), .ZN(n3) );
  INV_X4 U4 ( .A(n3), .ZN(Sum) );
endmodule


module Adder ( Sum, clock, X, Y, Cin );
  output [8:0] Sum;
  input [7:0] X;
  input [7:0] Y;
  input clock, Cin;

  wire   [8:0] S;
  wire   [6:0] C;

  approx_full_adder_0 a0 ( .A(X[0]), .B(Y[0]), .Sum(S[0]) );
  approx_full_adder_3 a1 ( .A(X[1]), .B(Y[1]), .Sum(S[1]) );
  approx_full_adder_2 a2 ( .A(X[2]), .B(Y[2]), .Sum(S[2]) );
  approx_full_adder_1 a3 ( .A(X[3]), .B(Y[3]), .Sum(S[3]), .Cout(C[3]) );
  full_adder_0 a4 ( .A(X[4]), .B(Y[4]), .Cin(C[3]), .Sum(S[4]), .Cout(C[4]) );
  full_adder_3 a5 ( .A(X[5]), .B(Y[5]), .Cin(C[4]), .Sum(S[5]), .Cout(C[5]) );
  full_adder_2 a6 ( .A(X[6]), .B(Y[6]), .Cin(C[5]), .Sum(S[6]), .Cout(C[6]) );
  full_adder_1 a7 ( .A(X[7]), .B(Y[7]), .Cin(C[6]), .Sum(S[7]), .Cout(S[8]) );
  DFF_X2 \Sum_reg[0]  ( .D(S[0]), .CK(clock), .Q(Sum[0]) );
  DFF_X2 \Sum_reg[1]  ( .D(S[1]), .CK(clock), .Q(Sum[1]) );
  DFF_X2 \Sum_reg[2]  ( .D(S[2]), .CK(clock), .Q(Sum[2]) );
  DFF_X2 \Sum_reg[3]  ( .D(S[3]), .CK(clock), .Q(Sum[3]) );
  DFF_X2 \Sum_reg[4]  ( .D(S[4]), .CK(clock), .Q(Sum[4]) );
  DFF_X2 \Sum_reg[5]  ( .D(S[5]), .CK(clock), .Q(Sum[5]) );
  DFF_X2 \Sum_reg[6]  ( .D(S[6]), .CK(clock), .Q(Sum[6]) );
  DFF_X2 \Sum_reg[7]  ( .D(S[7]), .CK(clock), .Q(Sum[7]) );
  DFF_X2 \Sum_reg[8]  ( .D(S[8]), .CK(clock), .Q(Sum[8]) );
endmodule

