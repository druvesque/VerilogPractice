module full_adder(sum, c_out, a, b, c_in);
    input a, b, c_in;
    output sum, c_out;

    assign {c_out, sum} = a + b + c_in;
endmodule

module full_subtractor(diff, b_out, a, b, b_in);
    input a, b, b_in;
    output diff, b_out;

    assign {b_out, diff} = a - b - b_in;
endmodule

module parity_gen(parity, a, b, c);
    input a, b, c;
    output parity;

    assign parity = a^b^c;
endmodule

module generate_st(a, b, c, sum, c_out, diff, b_out, parity);
    input a, b, c;
    output sum, c_out, diff, b_out, parity;
    parameter select = 3;

    generate
        case(select)
            1: full_adder f1(sum, c_out, a, b, c);
            2: full_subtractor s1(diff, b_out, a, b, c);
            default: parity_gen p1(parity, a, b, c);
        endcase
    endgenerate
endmodule

module tb;
    reg a, b, c;
    wire sum, c_out, diff, b_out, parity;
    generate_st g1(a, b, c, sum, c_out, diff, b_out, parity);

    defparam g1.select=2;

    initial begin
        a = 1; b = 1; c = 0;
    end

    initial begin
        $monitor("Time: %g, A: %b, B: %b, C: %b, Sum: %b, C_out: %b, Diff: %b, B_out: %b, Parity: %b", $time, a, b, c, sum, c_out, diff, b_out, parity);
        #200 $finish;
    end
endmodule
