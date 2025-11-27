module MUX2X1(A, B, Select, Enable, ZQ);
input [1:0] A, B;
input Select, Enable;
output [1:0] ZQ;

assign ZQ = ((Enable) ? (Select ? A:B) : 'bz);
endmodule

module tb;
reg [1:0] A, B;
reg Select, Enable;
output [1:0] ZQ;

MUX2X1 m1(A, B, Select, Enable, ZQ);

initial begin
$monitor("Time: %t, A: %b, B: %b, Select: %b, Enable: %b, Output: %b", $time, A, B, Select, Enable, ZQ);
Enable = 0; A = 2; B = 3; Select = 1; 
#10 Enable = 1; A = 2; B = 3; Select = 0; 
#10 Enable = 1; A = 2; B = 3; Select = 1;
end

initial begin
	$dumpfile("wv.vcd");
	$dumpvars(0, tb);
end
initial begin
	#200;
	$finish;
end
endmodule
