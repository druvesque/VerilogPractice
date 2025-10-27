primitive latch_udp(q, clk, data);
    output reg q;
    input clk, data;
    table 
        // clk data q q+
        0 1 : ? : 1;
        0 0 : ? : 0;
        1 ? : ? : -;
    endtable
endprimitive

module tb;
    reg clk = 0;
    reg data;
    wire q;

    latch_udp l1(q, clk, data);

    initial 
        forever #10 clk = ~clk;

    initial begin
        #20 data = 1;
        #10 data = 0;
    end

    initial begin
        $monitor("Time: %g, Data: %b, Q: %b", $time, data, q);
        #100 $finish;
    end
endmodule
