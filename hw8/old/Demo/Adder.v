`include "FA.v"
`include "HA.v"
module adder(clk, a, b, sum);
    input clk;
    input [63:0] a, b;
    output [63:0] sum;
    wire [63:0]c;
    
    HA HA1(clk, a[0], b[0], sum[0], c[0]);
    FA FA1(clk, a[1], b[1], c[0], sum[1], c[1]);
	FA FA2(clk, a[2], b[2], c[1], sum[2], c[2]);
	FA FA3(clk, a[3], b[3], c[2], sum[3], c[3]);
	FA FA4(clk, a[4], b[4], c[3], sum[4], c[4]);
	FA FA5(clk, a[5], b[5], c[4], sum[5], c[5]);
	FA FA6(clk, a[6], b[6], c[5], sum[6], c[6]);
	FA FA7(clk, a[7], b[7], c[6], sum[7], c[7]);
	FA FA8(clk, a[8], b[8], c[7], sum[8], c[8]);
	FA FA9(clk, a[9], b[9], c[8], sum[9], c[9]);
	FA FA10(clk, a[10], b[10], c[9], sum[10], c[10]);
	FA FA11(clk, a[11], b[11], c[10], sum[11], c[11]);
	FA FA12(clk, a[12], b[12], c[11], sum[12], c[12]);
	FA FA13(clk, a[13], b[13], c[12], sum[13], c[13]);
	FA FA14(clk, a[14], b[14], c[13], sum[14], c[14]);
	FA FA15(clk, a[15], b[15], c[14], sum[15], c[15]);
	FA FA16(clk, a[16], b[16], c[15], sum[16], c[16]);
	FA FA17(clk, a[17], b[17], c[16], sum[17], c[17]);
	FA FA18(clk, a[18], b[18], c[17], sum[18], c[18]);
	FA FA19(clk, a[19], b[19], c[18], sum[19], c[19]);
	FA FA20(clk, a[20], b[20], c[19], sum[20], c[20]);
	FA FA21(clk, a[21], b[21], c[20], sum[21], c[21]);
	FA FA22(clk, a[22], b[22], c[21], sum[22], c[22]);
	FA FA23(clk, a[23], b[23], c[22], sum[23], c[23]);
	FA FA24(clk, a[24], b[24], c[23], sum[24], c[24]);
	FA FA25(clk, a[25], b[25], c[24], sum[25], c[25]);
	FA FA26(clk, a[26], b[26], c[25], sum[26], c[26]);
	FA FA27(clk, a[27], b[27], c[26], sum[27], c[27]);
	FA FA28(clk, a[28], b[28], c[27], sum[28], c[28]);
	FA FA29(clk, a[29], b[29], c[28], sum[29], c[29]);
	FA FA30(clk, a[30], b[30], c[29], sum[30], c[30]);
	FA FA31(clk, a[31], b[31], c[30], sum[31], c[31]);
	FA FA32(clk, a[32], b[32], c[31], sum[32], c[32]);
	FA FA33(clk, a[33], b[33], c[32], sum[33], c[33]);
	FA FA34(clk, a[34], b[34], c[33], sum[34], c[34]);
	FA FA35(clk, a[35], b[35], c[34], sum[35], c[35]);
	FA FA36(clk, a[36], b[36], c[35], sum[36], c[36]);
	FA FA37(clk, a[37], b[37], c[36], sum[37], c[37]);
	FA FA38(clk, a[38], b[38], c[37], sum[38], c[38]);
	FA FA39(clk, a[39], b[39], c[38], sum[39], c[39]);
	FA FA40(clk, a[40], b[40], c[39], sum[40], c[40]);
	FA FA41(clk, a[41], b[41], c[40], sum[41], c[41]);
	FA FA42(clk, a[42], b[42], c[41], sum[42], c[42]);
	FA FA43(clk, a[43], b[43], c[42], sum[43], c[43]);
	FA FA44(clk, a[44], b[44], c[43], sum[44], c[44]);
	FA FA45(clk, a[45], b[45], c[44], sum[45], c[45]);
	FA FA46(clk, a[46], b[46], c[45], sum[46], c[46]);
	FA FA47(clk, a[47], b[47], c[46], sum[47], c[47]);
	FA FA48(clk, a[48], b[48], c[47], sum[48], c[48]);
	FA FA49(clk, a[49], b[49], c[48], sum[49], c[49]);
	FA FA50(clk, a[50], b[50], c[49], sum[50], c[50]);
	FA FA51(clk, a[51], b[51], c[50], sum[51], c[51]);
	FA FA52(clk, a[52], b[52], c[51], sum[52], c[52]);
	FA FA53(clk, a[53], b[53], c[52], sum[53], c[53]);
	FA FA54(clk, a[54], b[54], c[53], sum[54], c[54]);
	FA FA55(clk, a[55], b[55], c[54], sum[55], c[55]);
	FA FA56(clk, a[56], b[56], c[55], sum[56], c[56]);
	FA FA57(clk, a[57], b[57], c[56], sum[57], c[57]);
	FA FA58(clk, a[58], b[58], c[57], sum[58], c[58]);
	FA FA59(clk, a[59], b[59], c[58], sum[59], c[59]);
	FA FA60(clk, a[60], b[60], c[59], sum[60], c[60]);
	FA FA61(clk, a[61], b[61], c[60], sum[61], c[61]);
	FA FA62(clk, a[62], b[62], c[61], sum[62], c[62]);
	FA FA63(clk, a[63], b[63], c[62], sum[63], c[63]);                 
endmodule