module xor1(out, a, b, c);
output out;
input a, b, c;

assign #10 out=a^b^c;
endmodule

module tb;
reg a, b, c;
wire out;

xor1 x1(out, a, b, c);

initial begin
fork 
#10 a = 1'b0; b = 1'b0; c = 1'b0;
#12 a = 1'b1; b = 1'b0; c = 1'b0;
#15 a = 1'b0; b = 1'b1; c = 1'b1;
#17 a = 1'b1; b = 1'b1; c = 1'b1;
join
end

initial begin
$monitor("Time: %t, A: %b, B: %b, C: %b, Output: %b", $time, a, b, c, out);
$dumpfile("wv.vcd");
$dumpvars(0, tb);
#200;
$finish;
end
endmodule
