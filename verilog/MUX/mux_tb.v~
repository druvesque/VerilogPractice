module tb;
reg expr1, expr2, cond_expr;
wire out;
mux_2x1 m1(.out(out), .expr1(expr1), .expr2(expr2), .cond_expr(cond_expr));

initial begin
expr1 = 1; expr2 = 0;
cond_expr = 1;
#10;
cond_expr = 0;
end

initial begin
$monitor("Time: %t, Expr1: %d, Expr2: %d, Cond_Expr: %d, Output: %d", $time, expr1, expr2, cond_expr, out);
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
