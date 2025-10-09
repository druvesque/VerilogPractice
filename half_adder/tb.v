module tb;

    reg a, b;
    wire sum, carry;
    half_adder ha(.sum(sum), .carry(carry), .a(a), .b(b));

    initial begin
        a = 1'b0; b = 1'b0;
        #10 a = 1'b0; b = 1'b1;
        #10 a = 1'b1; b = 1'b0;
        #10 a = 1'b1; b = 1'b1;
        #10 a = 1'bx; b = 1'b0;
        #10 a = 1'b1; b = 1'bx;
        #10 a = 1'bz; b = 1'b1;
        #10 a = 1'b0; b = 1'bz;
        #10 a = 1'bx; b = 1'bz;
    end

    initial begin
        $monitor("Time: %t, A: %b, B: %b, Sum: %b, Carry: %b", $time, a, b, sum, carry);

        $dumpfile("wv.vcd");
        $dumpvars(0, tb);

        #120;
        $finish;
    end
endmodule
