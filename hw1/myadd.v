module add (a,b,c,d,sum);

    input [3:0] a,b,c,d;
    output [5:0] sum;	
    assign sum=a+b+c+d;
    
endmodule