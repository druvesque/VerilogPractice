module delay1(out, a, b, c);

output out;
input a, b, c;
wire w1, w2, w3, w4;
wire enable = 1;

and #1 a1(w1, a, b);
or #3 o1(w2, w1, c);
not #5 n1(w3, w2);
xor #6 x1(w4, w3, w1);
bufif1 #2 b1(out, w4, enable);
endmodule

module xortb;

reg a, b, c;
wire out;
delay1 d1(.out(out), .a(a), .b(b), .c(c));

initial begin
    #10 a = 1'b0; b = 1'b0; c = 1'b0;
    #10 a = 1'b0; b = 1'b0; c = 1'b1;
    #36 a = 1'b0; b = 1'b1; c = 1'b1;
    #40 a = 1'b1; b = 1'b1; c = 1'b1;
    #30 a = 1'b1; b = 1'b1; c = 1'b0;
    #30 a = 1'b1; b = 1'b0; c = 1'b1;
end

initial begin 
    $monitor("Outputs, Time: %t, A: %b, B: %b, C: %b, Output: %b \n", $time, a, b, c, out);

    $dumpfile("wv.vcd");
    $dumpvars(0, xortb);

    #200;
    $finish;
end
endmodule
