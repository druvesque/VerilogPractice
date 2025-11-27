module tb;
reg i0, i1, i2, i3, s0, s1;
wire out;
//mux_41 m1(.out(out), .i0(i0), .i1(i1), .i2(i2), .i3(i3), .s0(s0), s1(s1));
mux_41 m1(out, i0, i1, i2, i3, s0, s1);
initial begin
i0 = 1; i1 = 0; i2 = 0; i3 = 0;
s1 = 0; s0 = 0;
#10;
i0 = 0; i1 = 1; i2 = 0; i3 = 0;
s1 = 0; s0 = 1;
#10;
i0 = 0; i1 = 0; i2 = 1; i3 = 0;
s1 = 1; s0 = 0;
#10; 
i0 = 0; i1 = 0; i2 = 0; i3 = 1;
s1 = 1; s0 = 1;
end


initial begin
$monitor("Time: %t, i0: %d, i1: %d, i2: %d, i3: %d, s0: %d, s1: %d, Output: %d", $time, i0, i1, i2, i3, s0, s1, out);
end

initial begin
$dumpfile("mux.vcd");
$dumpvars(0, tb);
end

initial begin
#400;
$finish;
end

endmodule
