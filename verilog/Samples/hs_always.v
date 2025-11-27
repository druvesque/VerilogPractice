module half_sub(a, b, diff, borrow);
input a, b;
output reg diff, borrow;
always @(a, b)
begin
    diff = a^b;
    borrow = (~a)&b;
end
endmodule

module tb;
reg a, b;
wire diff, borrow;
half_sub h1(a, b, diff, borrow);

initial begin
    a = 1'b0; b = 1'b0;
    #10 a = 1'b0; b = 1'b1;
    #10 a = 1'b1; b = 1'b0;
    #10 a = 1'b1; b = 1'b1;
end

initial begin
    $dumpfile("wv.vcd");
    $dumpvars(0, tb);
end
endmodule
