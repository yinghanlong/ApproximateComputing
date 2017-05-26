
module counter ( clock, in, latch, dec, zero );
  input [3:0] in;
  input clock, latch, dec;
  output zero;
  wire   \U4/DATA1_0 , \U4/DATA1_1 , \U4/DATA1_2 , \U4/DATA1_3 ,
         \sub_47_S2/A[0] , \sub_47_S2/A[1] , \sub_47_S2/A[2] ,
         \sub_47_S2/A[3] , n34, n35, n38, n39, n41, n42, n43, n45, n46, n47,
         n48, n49, n50, n51, n52, n53, n54, n56, n57, n58, n59;
  assign \U4/DATA1_0  = in[0];
  assign \U4/DATA1_1  = in[1];
  assign \U4/DATA1_2  = in[2];
  assign \U4/DATA1_3  = in[3];

  DFF_X1 \value_reg[0]  ( .D(n35), .CK(clock), .Q(\sub_47_S2/A[0] ) );
  DFF_X2 \value_reg[3]  ( .D(n54), .CK(clock), .Q(\sub_47_S2/A[3] ), .QN(n34)
         );
  DFF_X2 \value_reg[1]  ( .D(n53), .CK(clock), .Q(\sub_47_S2/A[1] ), .QN(n39)
         );
  DFF_X1 \value_reg[2]  ( .D(n56), .CK(clock), .Q(\sub_47_S2/A[2] ), .QN(n58)
         );
  OAI21_X1 U8 ( .B1(n41), .B2(n39), .A(n42), .ZN(n53) );
  AOI22_X1 U9 ( .A1(\U4/DATA1_1 ), .A2(latch), .B1(n43), .B2(n39), .ZN(n42) );
  AOI22_X1 U11 ( .A1(n47), .A2(n43), .B1(\U4/DATA1_2 ), .B2(latch), .ZN(n46)
         );
  NOR2_X1 U12 ( .A1(\sub_47_S2/A[2] ), .A2(\sub_47_S2/A[1] ), .ZN(n47) );
  OAI21_X1 U13 ( .B1(n48), .B2(n34), .A(n49), .ZN(n54) );
  NAND2_X1 U14 ( .A1(\U4/DATA1_3 ), .A2(latch), .ZN(n49) );
  AOI21_X1 U15 ( .B1(\sub_47_S2/A[2] ), .B2(n50), .A(n45), .ZN(n48) );
  OAI21_X1 U16 ( .B1(n38), .B2(n39), .A(n41), .ZN(n45) );
  AOI21_X1 U17 ( .B1(n50), .B2(\sub_47_S2/A[0] ), .A(n51), .ZN(n41) );
  AOI221_X1 U18 ( .B1(n51), .B2(\sub_47_S2/A[0] ), .C1(\U4/DATA1_0 ), .C2(
        latch), .A(n43), .ZN(n52) );
  NOR2_X1 U19 ( .A1(n38), .A2(\sub_47_S2/A[0] ), .ZN(n43) );
  NOR2_X1 U20 ( .A1(latch), .A2(n50), .ZN(n51) );
  NOR3_X1 U21 ( .A1(zero), .A2(latch), .A3(n59), .ZN(n50) );
  NOR4_X2 U23 ( .A1(\sub_47_S2/A[0] ), .A2(\sub_47_S2/A[1] ), .A3(
        \sub_47_S2/A[2] ), .A4(\sub_47_S2/A[3] ), .ZN(zero) );
  INV_X2 U24 ( .A(n50), .ZN(n38) );
  OAI21_X1 U25 ( .B1(n57), .B2(n58), .A(n46), .ZN(n56) );
  INV_X4 U26 ( .A(n45), .ZN(n57) );
  INV_X2 U27 ( .A(n52), .ZN(n35) );
  INV_X4 U28 ( .A(dec), .ZN(n59) );
endmodule

