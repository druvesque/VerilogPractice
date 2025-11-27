module d_latch(q, d, en);
    input en, d;
    output reg q;
    always @(en, d)
        if(en)
            q <= d;
endmodule

module tb;
reg en, d;
wire q;
d_latch d1(q, d, en);

initial begin
    en = 0; d = 1;
    #5 en = 1; d = 0;
    #5 d = 1;
    #5 d= 1'bx;
    #5 d = 0;
end

initial begin
    $monitor("Time: %g, Enable: %b, D: %b", $time, en, d);

    $dumpfile("wv.vcd");
    $dumpvars(0, tb);

    #100;
    $finish;
end
endmodule
