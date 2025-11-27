module tb;
    reg load, enable, reset;
    initial begin
        load = 0; enable = 0; reset = 0;
        #10 reset = 1;
        #25 enable = 1;
        #100 load = 1;
    end

    initial begin
        $monitor("Time: %t, Load: %b, Enable: %b, Reset: %b", $time, load, enable, reset);

        $dumpfile("wv.vcd");
        $dumpvars(0, tb);

        #200;
        $finish;
    end
endmodule
