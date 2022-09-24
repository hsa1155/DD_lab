module CLA_64bit(a,b,cin,sum,cout);
    input [63:0] a,b;
    input cin;
    output [63:0] sum;
    output cout;
    
    //Write down your design here
    wire [3:0] GG,PP;
	wire [15:0] gG, gP;
	wire [63:0] g, p;
	wire [63:0] c;
    wire [15:0] c4x;
    wire [3:0] c16x;

	gp_generator gp_generate1( a[3:0]   ,b[3:0]  ,g[3:0]  ,p[3:0]);
    gp_generator gp_generate2( a[7:4]   ,b[7:4]  ,g[7:4]  ,p[7:4]);
    gp_generator gp_generate3( a[11:8]  ,b[11:8] ,g[11:8] ,p[11:8]);
    gp_generator gp_generate4( a[15:12] ,b[15:12],g[15:12],p[15:12]);
    gp_generator gp_generate5( a[19:16] ,b[19:16],g[19:16],p[19:16]);
    gp_generator gp_generate6( a[23:20] ,b[23:20],g[23:20],p[23:20]);
    gp_generator gp_generate7( a[27:24] ,b[27:24],g[27:24],p[27:24]);
    gp_generator gp_generate8( a[31:28] ,b[31:28],g[31:28],p[31:28]);
    gp_generator gp_generate9( a[35:32] ,b[35:32],g[35:32],p[35:32]);
    gp_generator gp_generate10( a[39:36],b[39:36],g[39:36],p[39:36]);
    gp_generator gp_generate11( a[43:40],b[43:40],g[43:40],p[43:40]);
    gp_generator gp_generate12( a[47:44],b[47:44],g[47:44],p[47:44]);
    gp_generator gp_generate13( a[51:48],b[51:48],g[51:48],p[51:48]);
    gp_generator gp_generate14( a[55:52],b[55:52],g[55:52],p[55:52]);
    gp_generator gp_generate15( a[59:56],b[59:56],g[59:56],p[59:56]);
    gp_generator gp_generate16( a[63:60],b[63:60],g[63:60],p[63:60]);
	
	carry_generator gGgP1_1( g[3:0]  ,p[3:0]  ,c4x[0] ,c[3:0]  ,gG[0],gP[0],);
	carry_generator gGgP1_2( g[7:4]  ,p[7:4]  ,c4x[1] ,c[7:4]  ,gG[1],gP[1],);
	carry_generator gGgP1_3( g[11:8] ,p[11:8] ,c4x[2] ,c[11:8] ,gG[2],gP[2],);
	carry_generator gGgP1_4( g[15:12],p[15:12],c4x[3] ,c[15:12],gG[3],gP[3],);
	carry_generator gGgP2_1( g[19:16],p[19:16],c4x[4] ,c[19:16],gG[4],gP[4],);
	carry_generator gGgP2_2( g[23:20],p[23:20],c4x[5] ,c[23:20],gG[5],gP[5],);
	carry_generator gGgP2_3( g[27:24],p[27:24],c4x[6] ,c[27:24],gG[6],gP[6],);
	carry_generator gGgP2_4( g[31:28],p[31:28],c4x[7] ,c[31:28],gG[7],gP[7],);
	carry_generator gGgP3_1( g[35:32],p[35:32],c4x[8] ,c[35:32],gG[8],gP[8],);
	carry_generator gGgP3_2( g[39:36],p[39:36],c4x[9] ,c[39:36],gG[9],gP[9],);
	carry_generator gGgP3_3( g[43:40],p[43:40],c4x[10],c[43:40],gG[10],gP[10],);
	carry_generator gGgP3_4( g[47:44],p[47:44],c4x[11],c[47:44],gG[11],gP[11],);
	carry_generator gGgP4_1( g[51:48],p[51:48],c4x[12],c[51:48],gG[12],gP[12],);
	carry_generator gGgP4_2( g[55:52],p[55:52],c4x[13],c[55:52],gG[13],gP[13],);
	carry_generator gGgP4_3( g[59:56],p[59:56],c4x[14],c[59:56],gG[14],gP[14],);
	carry_generator gGgP4_4( g[63:60],p[63:60],c4x[15],c[63:60],gG[15],gP[15],);
	
	carry_generator GGPPx1( gG[3:0]  ,gP[3:0]  ,c16x[0],c4x[3:0]  ,GG[0],PP[0],);
	carry_generator GGPPx2( gG[7:4]  ,gP[7:4]  ,c16x[1],c4x[7:4]  ,GG[1],PP[1],);
	carry_generator GGPPx3( gG[11:8] ,gP[11:8] ,c16x[2],c4x[11:8] ,GG[2],PP[2],);
	carry_generator GGPPx4( gG[15:12],gP[15:12],c16x[3],c4x[15:12],GG[3],PP[3],);

	carry_generator carry_c16x1(GG[3:0],PP[3:0],cin,c16x[3:0], , ,cout);
		
    sum_generator sum_gen1( a   ,b  ,c  ,sum);

endmodule

module gp_generator(a,b,g,p);

    input [3:0] a,b;
    output [3:0] g,p;

    assign g = a & b;
    assign p = a | b;

endmodule

module carry_generator(g,p,cin,c,gG,gP,cout);

    input [3:0] g,p;
    input cin;
    output gG,gP;
    output [3:0] c;
    output cout;

	assign gG = g[3] | (p[3] & g[2]) | (p[3] & p[2] & g[1]) | (p[3] & p[2] & p[1] & g[0]);
	assign gP = p[3] & p[2] & p[1] & p[0];

    assign c[0] = cin;
    assign c[1] = g[0] | (p[0] & cin);
    assign c[2] = g[1] | (p[1] & g[0]) | (p[1] & p[0] & cin);
    assign c[3] = g[2] | (p[2] & g[1]) | (p[2] & p[1] & g[0]) | (p[2] & p[1] & p[0] & cin);
    assign cout = g[3] | (p[3] & g[2]) | (p[3] & p[2] & g[1]) | (p[3] & p[2] & p[1] & g[0]) | (p[3] & p[2] & p[1] & p[0] & cin);

endmodule

module sum_generator(a,b,c,sum);

    input [63:0] a,b;
    input [63:0] c;
    output [63:0] sum;

    assign sum = a ^ b ^ c;

endmodule