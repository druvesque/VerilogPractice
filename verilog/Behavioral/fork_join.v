module tb;
    reg a, b;
    initial 
        fork
            a = 1; b = 0;
            #10 a = 0;
            #10 b = 1;
            #15 a = 1;
            #15 b = 0;
        join

    initial begin
        $monitor("Time: %t, A: %b, B: %b", $time, a, b);

        $dumpfile("wv.vcd");
        $dumpvars(0, tb);

        #200;
        $finish;
    end
endmodule
