module blocking_nonblocking();
    reg [2:0] a, b, c;
    initial begin
        a <= #2 2;
        b <= #5 4;
        c <= #7 6;
    end

    initial begin
        a = #1 1;
        b = #5 3;
        c = #7 5;
    end

    initial begin
        $monitor("Time: %g, A: %d, B: %d, C:%d", $time, a, b, c);

        $dumpfile("wv.vcd");
        $dumpvars(0, blocking_nonblocking);

        #100;
        $finish;
    end
endmodule
