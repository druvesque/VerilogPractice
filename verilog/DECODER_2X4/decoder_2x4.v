module decoder_2x4(out, x, y);
output [3:0] out;
input x, y;

assign out[0] = ~x & ~y;
assign out[1] = ~x & y;
assign out[2] = x & ~y;
assign out[3] = x & y;

endmodule
