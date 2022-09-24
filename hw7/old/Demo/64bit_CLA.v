`timescale 1ns/1ps
module CLA_64bit(a,b,cin,sum,cout);
    input [63:0] a,b;
    input cin;
    output [63:0] sum;
    output cout;
	
    wire [63:0] p,g,c;
	wire [15:0] d;
	wire [15:0] gP,gG;
	
	wire [3:0] c4_c8_c12,gPP,gGG;
    //---Write down your design here---//
	gp_generator gp_geneator1(a[63:0],b[63:0],g[63:0],p[63:0]);
	
	carry_generator a0(g[3:0],p[3:0],d[0],c[3:0],gG[0],gP[0],);
	carry_generator a1(g[7:4],p[7:4],d[1],c[7:4],gG[1],gP[1],);
	carry_generator a2(g[11:8],p[11:8],d[2],c[11:8],gG[2],gP[2],);
	carry_generator a3(g[15:12],p[15:12],d[3],c[15:12],gG[3],gP[3],);
	carry_generator a4(g[19:16],p[19:16],d[4],c[19:16],gG[4],gP[4],);
	carry_generator a5(g[23:20],p[23:20],d[5],c[23:20],gG[5],gP[5],);
	carry_generator a6(g[27:24],p[27:24],d[6],c[27:24],gG[6],gP[6],);
	carry_generator a7(g[31:28],p[31:28],d[7],c[31:28],gG[7],gP[7],);
	carry_generator a8(g[35:32],p[35:32],d[8],c[35:32],gG[8],gP[8],);
	carry_generator a9(g[39:36],p[39:36],d[9],c[39:36],gG[9],gP[9],);
	carry_generator a10(g[43:40],p[43:40],d[10],c[43:40],gG[10],gP[10],);
	carry_generator a11(g[47:44],p[47:44],d[11],c[47:44],gG[11],gP[11],);
	carry_generator a12(g[51:48],p[51:48],d[12],c[51:48],gG[12],gP[12],);
	carry_generator a13(g[55:52],p[55:52],d[13],c[55:52],gG[13],gP[13],);
	carry_generator a14(g[59:56],p[59:56],d[14],c[59:56],gG[14],gP[14],);
	carry_generator a15(g[63:60],p[63:60],d[15],c[63:60],gG[15],gP[15],);
	
	carry_generator carry_geneator_c0(gG[3:0],gP[3:0],c4_c8_c12[0],d[3:0],gGG[0],gPP[0],);
	carry_generator carry_geneator_c1(gG[7:4],gP[7:4],c4_c8_c12[1],d[7:4],gGG[1],gPP[1],);
	carry_generator carry_geneator_c2(gG[11:8],gP[11:8],c4_c8_c12[2],d[11:8],gGG[2],gPP[2],);
	carry_generator carry_geneator_c3(gG[15:12],gP[15:12],c4_c8_c12[3],d[15:12],gGG[3],gPP[3],);
	
	carry_generator A(gGG[3:0],gPP[3:0],cin,c4_c8_c12[3:0],,,cout);
	
	sum_geneator ans(a[63:0],b[63:0],c[63:0],sum);
    //---------------------------------//
endmodule
module gp_generator(a,b,g,p);

    input [63:0] a,b;
    output [63:0] g,p;
    
    // g = a x b && p = a + b
    assign g = a & b;
    assign p = a | b;
endmodule


module carry_generator(g,p,cin,c,gG,gP,cout);

    input [3:0] g,p;
    input cin;
    output gG,gP;
    output [3:0] c;
    output cout;

    //create gG and gP
    assign gG = g[3] | (p[3] & g[2]) | (p[3] & p[2] & g[1]) | (p[3] & p[2] & p[1] & g[0]);
	assign gP = p[3] & p[2] & p[1] & p[0];
	
    assign c[0] = cin;
    //create carrys
    assign c[1] = g[0] | (p[0] & cin);
    assign c[2] = g[1] | (p[1] & g[0]) | (p[1] & p[0] & cin);
    assign c[3] = g[2] | (p[2] & g[1]) | (p[2] & p[1] & g[0]) | (p[2] & p[1] & p[0] & cin);

    //cout
    assign cout = g[3] | (p[3] & g[2]) | (p[3] & p[2] & g[1]) | (p[3] & p[2] & p[1] & g[0]) | (p[3] & p[2] & p[1] & p[0] & cin);

endmodule

module sum_geneator(a,b,c,sum);

    input [63:0] a,b;
    input [63:0] c;
    output [63:0] sum;

    //sum = a ^ b ^ c;
    assign sum = a ^ b ^ c;

endmodule