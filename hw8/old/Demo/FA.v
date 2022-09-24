module FA(clk, a, b, cin, s, c);
    input clk;
    input a, b, cin;
    output  s, c;
    assign   s = (a ^ b ^ cin);
    assign   c = ( a & b ) + ( b & cin ) + ( cin & a );
endmodule