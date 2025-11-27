module mux_41(out, i0, i1, i2, i3, s0, s1);
output out;
input i0, i1, i2, i3, s0, s1;

assign out = (s1 == 1'b0) ? ((s0 == 1'b0 ? i0: i1)) : ((s0 == 1'b0 ? i2 : i3));
endmodule
