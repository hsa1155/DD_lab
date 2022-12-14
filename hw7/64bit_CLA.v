module CLA_64bit(a,b,cin,sum);

    input [63:0] a,b;
    input cin;
    output [63:0] sum;
    
    wire [63:0] g,p;
    wire [63:1] c;
    wire [15:0] gG,gP;
    wire [3:0] GG,PP;
    //Write down your design here ---//
	
	  //generate g & p
    gp_generator gp1( a[3:0]   ,b[3:0]  ,g[3:0]  ,p[3:0]);
    gp_generator gp2( a[7:4]   ,b[7:4]  ,g[7:4]  ,p[7:4]);
    gp_generator gp3( a[11:8]  ,b[11:8] ,g[11:8] ,p[11:8]);
    gp_generator gp4( a[15:12] ,b[15:12],g[15:12],p[15:12]);
    gp_generator gp5( a[19:16] ,b[19:16],g[19:16],p[19:16]);
    gp_generator gp6( a[23:20] ,b[23:20],g[23:20],p[23:20]);
    gp_generator gp7( a[27:24] ,b[27:24],g[27:24],p[27:24]);
    gp_generator gp8( a[31:28] ,b[31:28],g[31:28],p[31:28]);
    gp_generator gp9( a[35:32] ,b[35:32],g[35:32],p[35:32]);
    gp_generator gp10( a[39:36],b[39:36],g[39:36],p[39:36]);
    gp_generator gp11( a[43:40],b[43:40],g[43:40],p[43:40]);
    gp_generator gp12( a[47:44],b[47:44],g[47:44],p[47:44]);
    gp_generator gp13( a[51:48],b[51:48],g[51:48],p[51:48]);
    gp_generator gp14( a[55:52],b[55:52],g[55:52],p[55:52]);
    gp_generator gp15( a[59:56],b[59:56],g[59:56],p[59:56]);
    gp_generator gp16( a[63:60],b[63:60],g[63:60],p[63:60]);
		
	  //generate gG & gP, generate carries c0, c4, c8, c12, ... , c60

	
    carry_generator c0( g[3:0]  ,p[3:0]  ,cin ,c[3:1]  ,gG[0],gP[0]);
	carry_generator c4( g[7:4]  ,p[7:4]  ,c[4] ,c[7:5]  ,gG[1],gP[1]);
	carry_generator c8( g[11:8] ,p[11:8] ,c[8] ,c[11:9] ,gG[2],gP[2]);
	carry_generator c12( g[15:12],p[15:12],c[12] ,c[15:13],gG[3],gP[3]);
	carry_generator c16( g[19:16],p[19:16],c[16] ,c[19:17],gG[4],gP[4]);
	carry_generator c20( g[23:20],p[23:20],c[20] ,c[23:21],gG[5],gP[5]);
	carry_generator c24( g[27:24],p[27:24],c[24] ,c[27:25],gG[6],gP[6]);
	carry_generator c28( g[31:28],p[31:28],c[28] ,c[31:29],gG[7],gP[7]);
	carry_generator c32( g[35:32],p[35:32],c[32] ,c[35:33],gG[8],gP[8]);
	carry_generator c36( g[39:36],p[39:36],c[36] ,c[39:37],gG[9],gP[9]);
	carry_generator c40( g[43:40],p[43:40],c[40],c[43:41],gG[10],gP[10]);
	carry_generator c44( g[47:44],p[47:44],c[44],c[47:45],gG[11],gP[11]);
	carry_generator c48( g[51:48],p[51:48],c[48],c[51:49],gG[12],gP[12]);
	carry_generator c52( g[55:52],p[55:52],c[52],c[55:53],gG[13],gP[13]);
	carry_generator c56 (g[59:56],p[59:56],c[56],c[59:57],gG[14],gP[14]);
	carry_generator c60( g[63:60],p[63:60],c[60],c[63:61],gG[15],gP[15]);


    carry_generator c4812( gG[3:0]  ,gP[3:0]  ,cin,{c[12],c[8],c[4]} ,GG[0],PP[0]);
	carry_generator c202428( gG[7:4]  ,gP[7:4]  ,c[16],{c[28],c[24],c[20]} ,GG[1],PP[1]);
	carry_generator c364044( gG[11:8] ,gP[11:8] ,c[32],{c[44],c[40],c[36]},GG[2],PP[2]);
	carry_generator c525660( gG[15:12],gP[15:12],c[48],{c[60],c[56],c[52]},GG[3],PP[3]);

    carry_generator c163248(GG[3:0],PP[3:0],cin,{c[48],c[32],c[16]}, , );

	  //generate all carries

		
	 sum_generator sum_gen1( a   ,b  ,cin,c[63:1]  ,sum);	
	    
  		
	  //generate sum

    
    //-------------------------------//

endmodule

module gp_generator(a,b,g,p);

    input [3:0] a,b;
    output [3:0] g,p;

    assign g = a & b;
    assign p = a | b;

endmodule

module carry_generator(g,p,cin,c,gG,gP);

    input [3:0] g,p;
    input cin;
    output gG,gP;
    output [3:1] c;

	assign gG = g[3] | (p[3] & g[2]) | (p[3] & p[2] & g[1]) | (p[3] & p[2] & p[1] & g[0]);
	assign gP = p[3] & p[2] & p[1] & p[0];

    assign c[1] = g[0] | (p[0] & cin);
    assign c[2] = g[1] | (p[1] & g[0]) | (p[1] & p[0] & cin);
    assign c[3] = g[2] | (p[2] & g[1]) | (p[2] & p[1] & g[0]) | (p[2] & p[1] & p[0] & cin);

endmodule

module sum_generator(a,b,cin,c,sum);

    input [63:0] a,b;
    input cin;
    input [63:1] c;
    output [63:0] sum;
	

    assign sum = a ^ b ^ {c,cin};

endmodule