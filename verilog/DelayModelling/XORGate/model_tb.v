module xor_gate(out, a, b, c);
output out;
input a, b, c;

assign #10 out = a^b^c;
endmodule

module tb;
reg a, b, c;
wire out;

xor_gate x1(out, a, b, c);

initial begin
fork
#10 {a, b, c} = 3'b000;
#12 {a, b, c} = 3'b100;
#15 {a, b, c} = 3'b011;
#22 {a, b, c} = 3'b111;
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
