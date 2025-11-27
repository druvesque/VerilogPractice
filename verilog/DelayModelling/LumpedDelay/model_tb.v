module M(out, a, b, c, d);
output out;
input a, b, c, d;
wire e, f;

and a1(e, a, b);
and a2(f, c, d);
and #11 a3(out, e, f);
endmodule

module tb;

reg a, b, c, d;
wire out;
M m1(out, a, b, c, d);

initial begin
    {a,b,c,d} = 4'b1111;
    #10 {a,b,c,d} = 4'b1110;
    #10 {a,b,c,d} = 4'b1111;
    #10 {a,b,c,d} = 4'b1101;
    #10 {a,b,c,d} = 4'b1111;
    #10 {a,b,c,d} = 4'b1011;
    #10 {a,b,c,d} = 4'b1111;
    #10 {a,b,c,d} = 4'b0111;
    #10 {a,b,c,d} = 4'b1111;
end
initial begin
    $monitor("Time: %t, A: %b, B: %b, C: %b, D:%b, Output: %b", $time, a, b, c, d, out);

    $dumpfile("wv.vcd");
    $dumpvars(0, tb);

    #200;
    $finish;
end
endmodule
