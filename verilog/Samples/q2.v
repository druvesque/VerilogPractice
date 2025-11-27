module q2(x1, x2, x3, clk, g1);
    input x1, x2, x3, clk;
    output reg g1;
    wire w1, w2;
    reg g2;

    and a1(w1, x1, x2);

    // For D1
    always @(posedge clk)
        g2 <= w1;

    or r1(w2, x3, g2);

    // For D2
    always @(posedge clk)
        g1 <= w2;
endmodule

module tb;
reg x1, x2, x3;
wire g1;
reg clk = 0;

q2 model(x1, x2, x3, clk, g1);

initial 
    forever #5 
endmodule
