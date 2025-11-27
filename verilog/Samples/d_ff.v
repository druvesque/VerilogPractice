module d_ff(q, clk, d, resetn);
output reg q;
input clk, d, resetn;

always @(posedge clk, resetn)
    if(!resetn)
        q <= 0;
    else
        q <= d;
endmodule

module tb;
reg d, resetn;
reg clk = 0;
wire q;
d_ff d1(q, clk, d, resetn);

initial
    forever #5 clk = ~clk;

initial begin
    d = 0; 
    #3 resetn = 0; d = 1;
    #1 resetn = 1; d = 1;
    #5 d = 1;
    #5 d = 0;
    #5 d = 1'bx;
end

initial begin
    $monitor("Time: %g, D: %b, Q: %b, Reset: %b", $time, d, q, resetn);

    $dumpfile("wv.vcd");
    $dumpvars(0, tb);

    #100;
    $finish;
end

endmodule
