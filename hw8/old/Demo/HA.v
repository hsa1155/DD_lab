module HA(clk, a, b, s, c);
    input clk;
    input a, b;
    output   s, c;
    assign    s =  a ^ b ;
    assign    c =  a & b ;
endmodule