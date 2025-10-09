module full_adder(sum, c_out, a, b, c_in);
    input a, b, c_in;
    output sum, c_out;
    wire w1, w2, w3;

    xor x1(w1, a, b);
    xor x2(sum, w1, c_in);
    and a1(w2, a, b);
    and a2(w3, w1, c_in);
    or r1(c_out, w2, w3);
endmodule
