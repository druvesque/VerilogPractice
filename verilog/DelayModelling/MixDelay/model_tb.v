module xor1(out, a, b, c);
output reg out;
input a, b, c;

always @(a, b, c)
    #10 out = #6 (a^b^c);
endmodule

module xortb;
reg a, b, c;
wire out;

xor1 x1(.out(out), .a(a), .b(b), .c(c));

initial begin
    #10 a = 1'b0; b = 1'b0; c = 1'b0;
    #22 a = 1'b1; b = 1'b0; c = 1'b0;
    #36 a = 1'b0; b = 1'b1; c = 1'b1;
    #25 a = 1'b1; b = 1'b1; c = 1'b1;
end

initial begin
    $monitor("Time: %t, A: %b, B: %b, C: %b, Output: %b", $time, a, b, c, out);
    
    $dumpfile("wv.vcd");
    $dumpvars(0, xortb);

    #200;
    $finish;
end
endmodule
