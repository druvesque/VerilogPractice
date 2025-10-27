primitive dff_reset_udp(q, d, clk, rst);
    output reg q;
    input clk, rst, d;
    
    initial 
        q = 0;

    table
        // d clk rst : q : q+
        ? ? 0 : ? : 0;
        0 r 1 : ? : 0;
        1 r 1 : ? : 1;
        ? n 1 : ? : -;
        * ? 1 : ? : -;
        ? ? p : ? : -;
    endtable
endprimitive

module tb;
    reg clk = 0;
    reg d, rst;
    wire q;

    dff_reset_udp d1(q, d, clk, rst);

    initial 
        forever #10 clk = ~clk;

    initial begin
        #25 rst = 1; d = 1;
        #10 d = 0;
        #20 rst = 0;
    end

    initial begin
        $monitor("Time: %g, D: %b, Q: %b Reset: %b", $time, d, q, rst);
        #100 $finish;
    end

endmodule
