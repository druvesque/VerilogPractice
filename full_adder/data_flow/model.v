// DATA-FLOW MODELLING IMPLEMENTATION
module full_adder(sum, c_out, a, b, c_in);
    output sum, c_out;
    input a, b, c_in;

    assign {c_out, sum} = a + b + c_in;
endmodule
