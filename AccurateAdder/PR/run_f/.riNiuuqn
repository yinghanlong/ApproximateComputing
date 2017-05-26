
module counter ( clock, in, latch, dec, zero );
  input [3:0] in;
  input clock, latch, dec;
  output zero;
  wire   sub_42_S2_A_0_, sub_42_S2_A_1_, sub_42_S2_A_2_, sub_42_S2_A_3_, n34,
         n35, n36, n37, n38, n39, n40, n41, n42, n43, n44, n45, n46, n47, n48,
         n49, n50, n51, n52, n53, n54;

  DFF_X1 value_reg_0_ ( .D(n35), .CK(clock), .Q(sub_42_S2_A_0_) );
  DFF_X1 value_reg_1_ ( .D(n53), .CK(clock), .Q(sub_42_S2_A_1_), .QN(n39) );
  DFF_X1 value_reg_2_ ( .D(n36), .CK(clock), .Q(sub_42_S2_A_2_) );
  DFF_X1 value_reg_3_ ( .D(n54), .CK(clock), .Q(sub_42_S2_A_3_), .QN(n34) );
  NOR2_X2 U7 ( .A1(sub_42_S2_A_2_), .A2(sub_42_S2_A_1_), .ZN(n47) );
  NAND2_X2 U9 ( .A1(in[3]), .A2(latch), .ZN(n49) );
  AOI221_X2 U13 ( .B1(latch), .B2(in[0]), .C1(sub_42_S2_A_0_), .C2(n51), .A(
        n43), .ZN(n52) );
  NOR2_X2 U14 ( .A1(n38), .A2(sub_42_S2_A_0_), .ZN(n43) );
  NOR2_X2 U15 ( .A1(latch), .A2(n50), .ZN(n51) );
  NOR3_X2 U16 ( .A1(zero), .A2(latch), .A3(n40), .ZN(n50) );
  NOR4_X2 U17 ( .A1(sub_42_S2_A_0_), .A2(sub_42_S2_A_1_), .A3(sub_42_S2_A_2_), 
        .A4(sub_42_S2_A_3_), .ZN(zero) );
  INV_X4 U18 ( .A(n52), .ZN(n35) );
  INV_X4 U19 ( .A(n44), .ZN(n36) );
  INV_X4 U20 ( .A(n46), .ZN(n37) );
  INV_X4 U21 ( .A(n50), .ZN(n38) );
  INV_X4 U22 ( .A(dec), .ZN(n40) );
  AOI21_X2 U23 ( .B1(n50), .B2(sub_42_S2_A_0_), .A(n51), .ZN(n41) );
  OAI21_X2 U24 ( .B1(n38), .B2(n39), .A(n41), .ZN(n45) );
  OAI21_X2 U25 ( .B1(n48), .B2(n34), .A(n49), .ZN(n54) );
  AOI21_X2 U26 ( .B1(sub_42_S2_A_2_), .B2(n50), .A(n45), .ZN(n48) );
  OAI21_X2 U27 ( .B1(n41), .B2(n39), .A(n42), .ZN(n53) );
  AOI22_X2 U28 ( .A1(in[1]), .A2(latch), .B1(n43), .B2(n39), .ZN(n42) );
  AOI21_X2 U29 ( .B1(n45), .B2(sub_42_S2_A_2_), .A(n37), .ZN(n44) );
  AOI22_X2 U30 ( .A1(n47), .A2(n43), .B1(in[2]), .B2(latch), .ZN(n46) );
endmodule

