module tb;
parameter width = 8;
reg [width - 1 : 0] a, b;
reg c_in;
wire [width - 1 : 0] sum;
wire c_out;

adder #(.width(width)) a1(sum, c_out, a, b, c_in);

initial begin
	a = 5; b = 8; c_in = 0;
	#10 a = 7; b = 9; c_in = 1;
end

initial begin
	$monitor("Time: %t, A: %b, B: %b, C_in: %b, Sum: %b, C_out: %b", $time, a, b, c_in, sum, c_out);
	$dumpfile("wv.vcd");
	$dumpvars(0, tb);
	#200; 
	$finish;
end
endmodule
