`timescale 1ns/1ps

module RCA_16bit(a,b,cin,sum,cout);

    input [15:0] a,b;
    input cin;
    output [15:0] sum;
    output cout;
    wire [14:0] c;
	// --- Write down your design here --- //
	fulladder A(a[0],b[0],cin,sum[0],c[0]);
	fulladder B(a[1],b[1],c[0],sum[1],c[1]);
	fulladder C(a[2],b[2],c[1],sum[2],c[2]);
	fulladder D(a[3],b[3],c[2],sum[3],c[3]);
	fulladder E(a[4],b[4],c[3],sum[4],c[4]);
	fulladder F(a[5],b[5],c[4],sum[5],c[5]);
	fulladder G(a[6],b[6],c[5],sum[6],c[6]);
	fulladder H(a[7],b[7],c[6],sum[7],c[7]);
	fulladder I(a[8],b[8],c[7],sum[8],c[8]);
	fulladder J(a[9],b[9],c[8],sum[9],c[9]);
	fulladder K(a[10],b[10],c[9],sum[10],c[10]);
	fulladder L(a[11],b[11],c[10],sum[11],c[11]);
	fulladder M(a[12],b[12],c[11],sum[12],c[12]);
	fulladder N(a[13],b[13],c[12],sum[13],c[13]);
	fulladder O(a[14],b[14],c[13],sum[14],c[14]);
	fulladder P(a[15],b[15],c[14],sum[15],cout);
	// ----------------------------------- //

endmodule

// FA module
module fulladder(a,b,cin,sum,cout);
	
	input a, b, cin;
    output sum,cout;
    wire x,y,z;

    xorgate xor1 (a,b,x);
	xorgate xor2(x,cin,sum);
	andgate and1(a,b,y);
	andgate and2(z,cin,q);
	orgate or1(a,b,z);
	orgate or2(y,q,cout);

	// --- Write down your design here --- //

	// ----------------------------------- //

endmodule

// xor gate
module xorgate (a,b,out);
	
	input a,b;
	output out;

	// --- Write down your design here --- //
	
	andgate and1 (a,~b,x);
	andgate and2 (~a,b,y);
	orgate or1 (x,y,out);

	// ----------------------------------- //


endmodule



// and gate
module andgate (a,b,out);
	
	input a, b;
	output reg out;

	always @ (*)  begin
		#10 out <= a & b; // #10ns 為 and gate's gate delay
	end

endmodule

// or gate
module orgate (a,b,out);
	
	input a, b;
	output reg out;

	always @ (*)  begin
		#4 out <= a | b; // #4ns 為 or gate's gate delay
	end

endmodule