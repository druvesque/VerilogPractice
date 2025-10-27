primitive dff_udp(q, clk, d);
    output reg q;
    input clk, d;
    table
        // clk d : q : q+
        r 0 : ? : 0;
        r 1 : ? : 1;
        f ? : ? : -;
        ? * : ? : -;
    endtable
endprimitive

module tb;
    reg clk = 0;
    reg d;
    wire q;

    dff_udp d1(q, clk, d);

    initial 
        forever #10 clk = ~clk;

    initial begin
        #25 d = 1;
        #10 d = 0;
    end

    initial begin
        $monitor("Time: %g, D: %b, Q: %b", $time, d, q);
        #60 $finish;
    end

endmodule
