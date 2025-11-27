module mux_2x1(out, expr1, expr2, cond_expr);
output out;
input expr1, expr2, cond_expr;

assign out = (cond_expr) ? (expr1) : (expr2);
endmodule
