module xnor_gate(a, b, out);
input a, b;
output out;
xnor x1(out, a, b);

specify
    specparam no_rise = 5, no_fall = 6;
    specparam rise = 9, fall = 8;
    if (a)(b => out) = (rise, fall);
    if (b)(a => out) = (rise, fall);
    if (~a)(b=>out) = (no_rise, no_fall);
    if (~b)(a=>out) = (no_rise, no_fall);
endspecify
endmodule

module tb;
reg a, b;
wire out;
xnor_gate x1(a, b, out);

initial begin
    a = 0; b = 0;
    #30 a = 0; b = 1; 
    #30 a = 1; b = 0;
    #30 a = 1; b = 1;
end

initial begin
    $monitor("Time: %t, A: %b, B: %b, Output: %b", $time, a, b, out);

    $dumpfile("wv.vcd");
    $dumpvars(0, tb);

    #200;
    $finish;
end
endmodule
