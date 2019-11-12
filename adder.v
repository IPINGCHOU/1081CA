module adder(
        a, // 1 bit source a (input)
        b, // 1 bit source b (input)
        c_in, // 1 bit carry in (input)
        sum, // 1 bit sum (output)
        c_out // 1 bit carry out (output)
);

input a,b,c_in;
output sum, c_out;

wire s1, c1, c2;
xor (s1, a, b);
xor (sum, s1, c_in);
and (c1, a,b);
and (c2, s1, c_in) ;
or (c_out, c2, c1) ;

endmodule
