module tb;
reg x, y;
wire [3:0] out;
decoder_2x4 d1(out, x, y);

initial begin
x = 0; y = 0;
#10;
x = 0; y = 1;
#10; 
x = 1; y = 0;
#10;
x = 1; y = 1;
end

initial begin
$monitor("Time: %d, x: %d, y: %d, Output: %b", $time, x, y, out);
end
initial begin
$dumpfile("decoder.vcd");
$dumpvars(0, tb);
end

initial begin
#200;
$finish;
end

endmodule
