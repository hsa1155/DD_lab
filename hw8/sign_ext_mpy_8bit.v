`include "FA.v"
`include "HA.v"
module MPY(clk, a, b, product);
    input clk;
    input [7:0] a, b;
    wire [15:0] ab0, ab1, ab2, ab3, ab4, ab5, ab6, ab7, ab8, ab9, ab10, ab11, ab12, ab13, ab14, ab15;
    // wire [7:0] add0, add1, add2, add3;
    // wire [7:0] ext0, ext1, ext2, ext3;
    wire [15:0] sum0, sum1, sum2, sum3, sum4, sum5, sum6, sum7, sum8, sum9, sum10, sum11, sum12, sum13;
	wire [15:0] ext_a, ext_b;
    output [15:0] product;
	
	assign ext_a = {{8{a[7]}}, a};
	assign ext_b = {{8{b[7]}}, b};

    arrand and0(ext_a, ext_b[0], ab0);
    arrand and1(ext_a, ext_b[1], ab1);
    arrand and2(ext_a, ext_b[2], ab2);
    arrand and3(ext_a, ext_b[3], ab3);
    arrand and4(ext_a, ext_b[4], ab4);
    arrand and5(ext_a, ext_b[5], ab5);
    arrand and6(ext_a, ext_b[6], ab6);
    arrand and7(ext_a, ext_b[7], ab7);
    arrand and8(ext_a, ext_b[8], ab8);
    arrand and9(ext_a, ext_b[9], ab9);
    arrand and10(ext_a, ext_b[10], ab10);
    arrand and11(ext_a, ext_b[11], ab11);
    arrand and12(ext_a, ext_b[12], ab12);
    arrand and13(ext_a, ext_b[13], ab13);
    arrand and14(ext_a, ext_b[14], ab14);
    arrand and15(ext_a, ext_b[15], ab15);


	adder adder1(clk, ab0, {ab1[14:0], 1'b0}, sum0);
	adder adder2(clk, sum0, {ab2[13:0], 2'b0}, sum1);
	adder adder3(clk, sum1, {ab3[12:0], 3'b0}, sum2);
	adder adder4(clk, sum2, {ab4[11:0], 4'b0}, sum3);
	adder adder5(clk, sum3, {ab5[10:0], 5'b0}, sum4);
	adder adder6(clk, sum4, {ab6[9:0], 6'b0}, sum5);
	adder adder7(clk, sum5, {ab7[8:0], 7'b0}, sum6);
    adder adder8(clk, sum6, {ab8[7:0], 8'b0}, sum7);
	adder adder9(clk, sum7, {ab9[6:0], 9'b0}, sum8);
	adder adder10(clk, sum8, {ab10[5:0], 10'b0}, sum9);
	adder adder11(clk, sum9, {ab11[4:0], 11'b0}, sum10);
	adder adder12(clk, sum10, {ab12[3:0], 12'b0}, sum11);
	adder adder13(clk, sum11, {ab13[2:0], 13'b0}, sum12);
	adder adder14(clk, sum12, {ab14[1:0], 14'b0}, sum13);
    adder adder15(clk, sum13, {ab15[0], 15'b0}, product);	

endmodule

module arrand(a, b, ab);
    input [15:0] a;
    input b;
    output [15:0] ab;

    assign ab[0] = a[0] & b;
    assign ab[1] = a[1] & b;
    assign ab[2] = a[2] & b;
    assign ab[3] = a[3] & b;
    assign ab[4] = a[4] & b;
    assign ab[5] = a[5] & b;
    assign ab[6] = a[6] & b;
    assign ab[7] = a[7] & b;
    assign ab[8] = a[8] & b;
    assign ab[9] = a[9] & b;
    assign ab[10] = a[10] & b;
    assign ab[11] = a[11] & b;
    assign ab[12] = a[12] & b;
    assign ab[13] = a[13] & b;
    assign ab[14] = a[14] & b;
    assign ab[15] = a[15] & b;
endmodule

module adder(clk, a, b, sum);
    input clk;
    input [15:0] a, b;
    output [15:0] sum;
    wire [15:0]c;
    
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

endmodule
