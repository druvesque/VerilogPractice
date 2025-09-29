module tb;
    reg a, b;
    wire o;
    or_gate r1(.o(o), .a(a), .b(b));

    initial begin
        a = 1'b0; b = 1'b0;
        #10 a = 1'b0; b = 1'b1;
        #10 a = 1'b1; b = 1'b0;
        #10 a = 1'b1; b = 1'b1;
        #10 a = 1'b1; b = 1'bx;
        #10 a = 1'b1; b = 1'bz;
        #10 a = 1'b0; b = 1'bx;
        #10 a = 1'b0; b = 1'bz;
    end

    initial begin
        $monitor("Time: %t, A: %b, B: %b, Output: %b", $time, a, b, o);

        $dumpfile("wv.vcd");
        $dumpvars(0, tb);

        #200;
        $finish;
    end
endmodule
