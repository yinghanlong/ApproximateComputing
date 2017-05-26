module counter (
	clock, 
	in, 
	latch, 
	dec, 
	zero);
   input clock;
   input [3:0] in;
   input latch;
   input dec;
   output zero;

   // Internal wires
   wire clock__L2_N0;
   wire clock__L1_N0;
   wire sub_42_S2_A_0_;
   wire sub_42_S2_A_1_;
   wire sub_42_S2_A_2_;
   wire sub_42_S2_A_3_;
   wire n34;
   wire n35;
   wire n36;
   wire n37;
   wire n38;
   wire n39;
   wire n40;
   wire n41;
   wire n42;
   wire n43;
   wire n44;
   wire n45;
   wire n46;
   wire n47;
   wire n48;
   wire n49;
   wire n50;
   wire n51;
   wire n52;
   wire n53;
   wire n54;

   INV_X4 clock__L2_I0 (.ZN(clock__L2_N0), 
	.A(clock__L1_N0));
   INV_X8 clock__L1_I0 (.ZN(clock__L1_N0), 
	.A(clock));
   DFF_X1 value_reg_0_ (.Q(sub_42_S2_A_0_), 
	.D(n35), 
	.CK(clock__L2_N0));
   DFF_X1 value_reg_1_ (.QN(n39), 
	.Q(sub_42_S2_A_1_), 
	.D(n53), 
	.CK(clock__L2_N0));
   DFF_X1 value_reg_2_ (.Q(sub_42_S2_A_2_), 
	.D(n36), 
	.CK(clock__L2_N0));
   DFF_X1 value_reg_3_ (.QN(n34), 
	.Q(sub_42_S2_A_3_), 
	.D(n54), 
	.CK(clock__L2_N0));
   NOR2_X2 U7 (.ZN(n47), 
	.A2(sub_42_S2_A_1_), 
	.A1(sub_42_S2_A_2_));
   NAND2_X2 U9 (.ZN(n49), 
	.A2(latch), 
	.A1(in[3]));
   AOI221_X2 U13 (.ZN(n52), 
	.C2(n51), 
	.C1(sub_42_S2_A_0_), 
	.B2(in[0]), 
	.B1(latch), 
	.A(n43));
   NOR2_X2 U14 (.ZN(n43), 
	.A2(sub_42_S2_A_0_), 
	.A1(n38));
   NOR2_X2 U15 (.ZN(n51), 
	.A2(n50), 
	.A1(latch));
   NOR3_X2 U16 (.ZN(n50), 
	.A3(n40), 
	.A2(latch), 
	.A1(zero));
   NOR4_X2 U17 (.ZN(zero), 
	.A4(sub_42_S2_A_3_), 
	.A3(sub_42_S2_A_2_), 
	.A2(sub_42_S2_A_1_), 
	.A1(sub_42_S2_A_0_));
   INV_X4 U18 (.ZN(n35), 
	.A(n52));
   INV_X4 U19 (.ZN(n36), 
	.A(n44));
   INV_X4 U20 (.ZN(n37), 
	.A(n46));
   INV_X4 U21 (.ZN(n38), 
	.A(n50));
   INV_X4 U22 (.ZN(n40), 
	.A(dec));
   AOI21_X2 U23 (.ZN(n41), 
	.B2(sub_42_S2_A_0_), 
	.B1(n50), 
	.A(n51));
   OAI21_X2 U24 (.ZN(n45), 
	.B2(n39), 
	.B1(n38), 
	.A(n41));
   OAI21_X2 U25 (.ZN(n54), 
	.B2(n34), 
	.B1(n48), 
	.A(n49));
   AOI21_X2 U26 (.ZN(n48), 
	.B2(n50), 
	.B1(sub_42_S2_A_2_), 
	.A(n45));
   OAI21_X2 U27 (.ZN(n53), 
	.B2(n39), 
	.B1(n41), 
	.A(n42));
   AOI22_X2 U28 (.ZN(n42), 
	.B2(n39), 
	.B1(n43), 
	.A2(latch), 
	.A1(in[1]));
   AOI21_X2 U29 (.ZN(n44), 
	.B2(sub_42_S2_A_2_), 
	.B1(n45), 
	.A(n37));
   AOI22_X2 U30 (.ZN(n46), 
	.B2(latch), 
	.B1(in[2]), 
	.A2(n43), 
	.A1(n47));
endmodule

