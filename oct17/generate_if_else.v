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

module generate_if_else(a, b, c, sum, c_out, diff, b_out);
    input a, b, c;
    output sum, c_out, diff, b_out;

    parameter m=11;

    generate
        if(m<10) begin: b1
            full_adder f1(sum, c_out, a, b, c);
        end: b1
        else begin: b2
            full_subtractor s1(diff, b_out, a, b, c);
        end: b2
    endgenerate
endmodule

module tb;
    reg a, b, c;
    wire sum, c_out, diff, b_out;

    generate_if_else g1(a, b, c, sum, c_out, diff, b_out);

    initial begin
        a = 0; b = 1; c = 0;
        #10;
        a = 1; b = 1; c = 1;
    end

    initial begin
        $monitor("Time: %g, A: %b, B: %b, C: %b, Sum: %b, C_out: %b, Diff: %b, B_out: %b", $time, a, b, c, sum, c_out, diff, b_out);
        #200 $finish;
    end
endmodule
