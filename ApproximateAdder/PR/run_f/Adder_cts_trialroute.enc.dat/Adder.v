module approx_full_adder_3 (
	A, 
	B, 
	Sum, 
	Cout);
   input A;
   input B;
   output Sum;
   output Cout;

   // Internal wires
   wire n1;
   wire n3;

   INV_X4 U1 (.ZN(n1), 
	.A(A));
   INV_X4 U2 (.ZN(Cout), 
	.A(n1));
   INV_X4 U3 (.ZN(n3), 
	.A(B));
   INV_X4 U4 (.ZN(Sum), 
	.A(n3));
endmodule

module approx_full_adder_2 (
	A, 
	B, 
	Sum, 
	Cout);
   input A;
   input B;
   output Sum;
   output Cout;

   // Internal wires
   wire n1;
   wire n3;

   INV_X4 U1 (.ZN(n1), 
	.A(A));
   INV_X4 U2 (.ZN(Cout), 
	.A(n1));
   INV_X4 U3 (.ZN(n3), 
	.A(B));
   INV_X4 U4 (.ZN(Sum), 
	.A(n3));
endmodule

module approx_full_adder_1 (
	A, 
	B, 
	Sum, 
	Cout);
   input A;
   input B;
   output Sum;
   output Cout;

   // Internal wires
   wire n1;
   wire n3;

   INV_X4 U1 (.ZN(n1), 
	.A(A));
   INV_X4 U2 (.ZN(Cout), 
	.A(n1));
   INV_X4 U3 (.ZN(n3), 
	.A(B));
   INV_X4 U4 (.ZN(Sum), 
	.A(n3));
endmodule

module full_adder_2 (
	A, 
	B, 
	Cin, 
	Sum, 
	Cout);
   input A;
   input B;
   input Cin;
   output Sum;
   output Cout;

   // Internal wires
   wire n1;
   wire n3;

   XOR2_X1 U2 (.Z(Sum), 
	.B(n3), 
	.A(Cin));
   AOI22_X1 U3 (.ZN(n1), 
	.B2(Cin), 
	.B1(n3), 
	.A2(A), 
	.A1(B));
   XOR2_X1 U4 (.Z(n3), 
	.B(B), 
	.A(A));
   INV_X2 U1 (.ZN(Cout), 
	.A(n1));
endmodule

module full_adder_1 (
	A, 
	B, 
	Cin, 
	Sum, 
	Cout);
   input A;
   input B;
   input Cin;
   output Sum;
   output Cout;

   // Internal wires
   wire n1;
   wire n3;

   XOR2_X1 U2 (.Z(Sum), 
	.B(n3), 
	.A(Cin));
   AOI22_X1 U3 (.ZN(n1), 
	.B2(Cin), 
	.B1(n3), 
	.A2(A), 
	.A1(B));
   XOR2_X1 U4 (.Z(n3), 
	.B(B), 
	.A(A));
   INV_X2 U1 (.ZN(Cout), 
	.A(n1));
endmodule

module full_adder_3 (
	A, 
	B, 
	Cin, 
	Sum, 
	Cout);
   input A;
   input B;
   input Cin;
   output Sum;
   output Cout;

   // Internal wires
   wire n1;
   wire n3;

   XOR2_X1 U2 (.Z(Sum), 
	.B(n3), 
	.A(Cin));
   AOI22_X1 U3 (.ZN(n1), 
	.B2(Cin), 
	.B1(n3), 
	.A2(A), 
	.A1(B));
   XOR2_X1 U4 (.Z(n3), 
	.B(B), 
	.A(A));
   INV_X2 U1 (.ZN(Cout), 
	.A(n1));
endmodule

module full_adder_0 (
	A, 
	B, 
	Cin, 
	Sum, 
	Cout);
   input A;
   input B;
   input Cin;
   output Sum;
   output Cout;

   // Internal wires
   wire n2;
   wire n3;

   XOR2_X1 U2 (.Z(Sum), 
	.B(n2), 
	.A(Cin));
   AOI22_X1 U3 (.ZN(n3), 
	.B2(Cin), 
	.B1(n2), 
	.A2(A), 
	.A1(B));
   XOR2_X1 U4 (.Z(n2), 
	.B(B), 
	.A(A));
   INV_X2 U1 (.ZN(Cout), 
	.A(n3));
endmodule

module approx_full_adder_0 (
	A, 
	B, 
	Sum, 
	Cout);
   input A;
   input B;
   output Sum;
   output Cout;

   // Internal wires
   wire n1;
   wire n3;

   INV_X4 U1 (.ZN(n1), 
	.A(A));
   INV_X4 U2 (.ZN(Cout), 
	.A(n1));
   INV_X4 U3 (.ZN(n3), 
	.A(B));
   INV_X4 U4 (.ZN(Sum), 
	.A(n3));
endmodule

module Adder (
	Sum, 
	clock, 
	X, 
	Y, 
	Cin);
   output [8:0] Sum;
   input clock;
   input [7:0] X;
   input [7:0] Y;
   input Cin;

   // Internal wires
   wire clock__L2_N0;
   wire clock__L1_N0;
   wire [8:0] S;
   wire [6:0] C;

   INV_X4 clock__L2_I0 (.ZN(clock__L2_N0), 
	.A(clock__L1_N0));
   INV_X8 clock__L1_I0 (.ZN(clock__L1_N0), 
	.A(clock));
   approx_full_adder_0 a0 (.A(X[0]), 
	.B(Y[0]), 
	.Sum(S[0]));
   approx_full_adder_3 a1 (.A(X[1]), 
	.B(Y[1]), 
	.Sum(S[1]));
   approx_full_adder_2 a2 (.A(X[2]), 
	.B(Y[2]), 
	.Sum(S[2]));
   approx_full_adder_1 a3 (.A(X[3]), 
	.B(Y[3]), 
	.Sum(S[3]), 
	.Cout(C[3]));
   full_adder_0 a4 (.A(X[4]), 
	.B(Y[4]), 
	.Cin(C[3]), 
	.Sum(S[4]), 
	.Cout(C[4]));
   full_adder_3 a5 (.A(X[5]), 
	.B(Y[5]), 
	.Cin(C[4]), 
	.Sum(S[5]), 
	.Cout(C[5]));
   full_adder_2 a6 (.A(X[6]), 
	.B(Y[6]), 
	.Cin(C[5]), 
	.Sum(S[6]), 
	.Cout(C[6]));
   full_adder_1 a7 (.A(X[7]), 
	.B(Y[7]), 
	.Cin(C[6]), 
	.Sum(S[7]), 
	.Cout(S[8]));
   DFF_X2 Sum_reg_0_ (.Q(Sum[0]), 
	.D(S[0]), 
	.CK(clock__L2_N0));
   DFF_X2 Sum_reg_1_ (.Q(Sum[1]), 
	.D(S[1]), 
	.CK(clock__L2_N0));
   DFF_X2 Sum_reg_2_ (.Q(Sum[2]), 
	.D(S[2]), 
	.CK(clock__L2_N0));
   DFF_X2 Sum_reg_3_ (.Q(Sum[3]), 
	.D(S[3]), 
	.CK(clock__L2_N0));
   DFF_X2 Sum_reg_4_ (.Q(Sum[4]), 
	.D(S[4]), 
	.CK(clock__L2_N0));
   DFF_X2 Sum_reg_5_ (.Q(Sum[5]), 
	.D(S[5]), 
	.CK(clock__L2_N0));
   DFF_X2 Sum_reg_6_ (.Q(Sum[6]), 
	.D(S[6]), 
	.CK(clock__L2_N0));
   DFF_X2 Sum_reg_7_ (.Q(Sum[7]), 
	.D(S[7]), 
	.CK(clock__L2_N0));
   DFF_X2 Sum_reg_8_ (.Q(Sum[8]), 
	.D(S[8]), 
	.CK(clock__L2_N0));
endmodule

