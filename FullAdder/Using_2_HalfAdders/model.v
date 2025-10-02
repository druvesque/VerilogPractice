module half_adder(s, c, x, y);
    input x, y;
    output s, c;

    xor x1(s, x, y);
    and a1(c, x, y);
endmodule

module full_adder(sum, c_out, a, b, c_in);
    input a, b, c_in;
    output sum, c_out;
    wire w1, w2, w3;

    half_adder ha1(w1, w2, a, b);
    half_adder ha2(sum, w3, w1, c_in);
    or r1(c_out, w2, w3);
endmodule
