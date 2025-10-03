module full_adder(a, b, c_in, sum, c_out);
    input a, b, c_in;
    output sum, c_out;
    wire w1, w2, w3;

    xor x1(w1, a, b);
    xor x2(sum, w1, c_in);
    and a1(w2, a, b);
    and a2(w3, w1, c_in);
    or r1(c_out, w2, w3);
endmodule 

module ripple_carry_adder_4_bit(a, b, c_in, sum, c_out);
    input [3:0] a, b;
    input c_in;
    output [3:0] sum;
    output c_out;

    wire w1, w2, w3, w4;
    
    full_adder fa1(a[0], b[0], c_in, sum[0], w1);
    full_adder fa2(a[1], b[1], w1, sum[1], w2);
    full_adder fa3(a[2], b[2], w2, sum[2], w3);
    full_adder fa4(a[3], b[3], w3, sum[3], c_out);
endmodule
