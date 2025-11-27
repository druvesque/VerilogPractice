module tb;
reg [3:0] a, b;
reg c_in;
wire [3:0] sum;
wire c_out;

ripple_carry_adder_4bit r1(sum, c_out, a, b, c_in);

initial begin
	$monitor("Time: %t, A: %b, B: %b, C_in: %b, Sum: %b, C_out: %b", $time, a, b, c_in, sum, c_out);
	a = 9; b = 7; c_in = 0;
	#10 a = 5; b = 13; c_in = 1;
end

initial begin
	#200;
	$finish;
end

initial begin
	$dumpfile("wv.vcd");
	$dumpvars(0, tb);
end
endmodule
