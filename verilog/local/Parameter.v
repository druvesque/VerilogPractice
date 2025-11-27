module adder #(parameter size = 8, cnt = 100) (sum, c_out, a, b, c_in);

output [size - 1:0] sum;
output c_out;
input [size - 1:0] a, b;
input c_in;

assign {sum, c_out} = a + b + c_in;

endmodule

module adder_tb;

parameter size1 = 9, cnt1 = 100;
parameter size2 = 8, cnt2 = 11;

reg [size1 - 1:0] a1, b1;
reg [size2 - 1:0] a2, b2;
reg c1, c2;
wire [size1 - 1:0] sum1;
wire [size2 - 1:0] sum2;
wire carry1, carry2;

adder #(.size(size1), .cnt(cnt1)) adder1(sum1, carry1, a1, b1, c1);

initial begin
a1 = 23; b1 = 35; c1 = 1;
end

initial begin
$dumpfile("adder_wv.vcd");
$dumpvars(0, adder_tb);
end

initial begin
#300;
$finish;
end
endmodule
