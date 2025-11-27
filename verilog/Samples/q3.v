module q3(q, d, clk);
input d, clk;
output reg q;
reg q0;

// For D1
always @(posedge clk)
    q0 <= d;

// For D2
always @(posedge clk)
    q <= q0;
endmodule

module tb;

endmodule
